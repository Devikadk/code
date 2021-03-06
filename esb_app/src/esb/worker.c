#include<stdio.h>

#include<stdlib.h>

#include<string.h>

#include <unistd.h>

#include "../DB-ACCESS/db_connection.h"

#include<mysql/mysql.h>

#include "../BMD/xml_header.h"

#include "../endpoint/transform.h"

#include <pthread.h>

pthread_mutex_t lock;

void * poll_database_for_new_requests(void * vargp) {
  sleep(9);
 // Step 1: Open a DB connection
  //thread set up a mutex lock before getting an esb request. If no request is there it ulock and sleep. If request found it sets its status to processing and then unlocks
  while (true) {
    pthread_mutex_lock(&lock);
    task_list * req = fetch_data1();
    if (req == NULL) {
      printf("no request\n");
      pthread_mutex_unlock(&lock);
      goto sleep;
    }

    if (req != NULL) {
      update_status("processing", req -> id);
      pthread_mutex_unlock(&lock);
      printf("processing  %d\n", req -> id);
     //gets route id and use it to get transport key , value and transform key , value
      int route_id = select_active_routes(req -> MessageType, req -> Sender, req -> Destination);
      char * data_location = req -> data_location;
      //printf("%s",b->payload);
      tp_data * n1 = get_tp_data(route_id);
      //tf_data* n2 = get_tf_data(route_id);
      char * transport_key = strdup(n1 -> config_k);
      char * transport_value = strdup(n1 -> config_v);
      printf("%s\n", n1 -> config_k);
      printf("%s\n", n1 -> config_v);
      free(n1);
      // printf("%s\n",n2->config_key);
      // printf("%s\n",n2->config_value);
      tf_data * n2 = get_tf_data(route_id);
      char * transform_key = strdup(n2 -> config_key);
      char * transform_value = strdup(n2 -> config_value);
      printf("%s", transform_key);
      printf("%s\n", transform_value);
      free(n2);
      

      char * fields[1]; //url

      printf("Applying transformation and transporting steps. \n");
     // applies transformation
      apply_transform(transform_key, transport_key, transport_value, data_location, fields);
     //if transport key is http, then send http request to the url and receive response  
      if (!strcmp(transport_key, "HTTP")) {
        printf("%d\n", strcmp(fields[0], "https://ifsc.razorpay.com/HDFC0CAGSBK"));
        char url2[100];
        strcpy(url2, fields[0]);
        printf("sending http request\n");
        printf("%s\n", url2);

        int httpres;
        httpres =  http_request(fields[0]);
        if (httpres == -1) {
          printf("Connection Failed");
          update_status("received", req -> id);
        } else {
          update_status("done", req -> id);
          printf("DONE\n");
        }

      }// if transport key is smtp then send mail to transport value i.e. mail id 
     else if (!strcmp(transport_key, "SMTP")) {

        int x = sendemail("devikakrishnan249@gmail.com", "/home/devika/Desktop/esb_app/data-Payload.json");
        if (x == 1) {
          printf("mail sent successfully.\n");
          update_status("done", req -> id);
          printf("DONE\n");
        } else printf("could not send mail");

      }

      
      printf("Applied transformation and transporting steps.\n");

    }
    sleep:
      printf("Sleeping for 7 seconds.\n");
      sleep(7);
  }
  return (void*)1;
}




