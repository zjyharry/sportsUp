package com.example.demo;
import java.util.*;

import com.example.model.*;

import java.io.*;
public class DataBase {
	 static int total_event_id = 0;
	 static int total_stadium_id= 0;
	
     static public class UserInfo{
      public User user;
      public Set<Integer> eventSet;
      public UserInfo(User user, Set<Integer> eventSet) {
    	  	super();
    	  	this.user = user;
    	  	this.eventSet = eventSet;
      }
      public UserInfo() {
    	  super();
    	  eventSet = new HashSet();
      }      
     }
     // key: userId,  value: UserInfo
     public static Map<String, UserInfo> userMap = new HashMap();
     
     public static class EventInfo{
      public Event event;
      public Set<String> userSet;
      public EventInfo(Event event, Set<String> userSet) {
    	  	super();
    	  	this.event = event;
    	  	this.userSet = userSet;
      }
      public EventInfo() {
    	  	super();
    	  	userSet = new HashSet();
      }      
     }
     // key: eventId, value EventInfo
     public static Map<Integer, EventInfo> eventMap = new HashMap();
     
     public static class StadiumInfo {
      public Stadium stadium;
      public Set<Integer> eventSet;
      public StadiumInfo() {
    	  	super();
    	  	eventSet = new HashSet();
      }
      public StadiumInfo(Stadium stadium, Set<Integer> eventSet) {
    	  	super();
    	  	this.stadium = stadium;
    	  	this.eventSet = eventSet;
      }
     }
     //key : stadium
     public static Map<Integer, StadiumInfo> stadiumMap = new HashMap();
     
     static {
    	// public User(String name, int gender, String userId, String email, String password) {
          userMap.put( "tianyou", new UserInfo(new User("tianyou",0, "tianyou","tianyou@163.com","123456"), new HashSet<>()));
          userMap.put( "jiabin", new UserInfo(new User("jiabin",0, "jiabin","jiabin@163.com","123456"), new HashSet<>()));
          userMap.put( "jiawei" , new UserInfo(new User("jiawei",0, "jiawei","jiawei@163.com","123456"), new HashSet<>()));
        //Event(String eventName, String startTime, 
		//	String descr, String classification, String endTime, int eventId, int location,
		//	int capacity)
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("basketball game", "2017-12-20T09:47:50", "","basketball","2017-12-25T09:47:50",total_event_id,1,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("Soccer game", "2017-12-25T09:47:50", "","soccer","2017-12-27T09:47:50",total_event_id,2,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("Syracuse Football game", "2018-1-25T09:47:50", "","football","2018-1-30T09:47:50",total_event_id,3,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("NCAA game", "2018-2-25T09:47:50", "","basketball","2018-2-25T09:47:50",total_event_id,4,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("NFL game", "2018-4-25T09:47:50", "","football","2018-4-25T09:47:50",total_event_id,5,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("Super Cup game", "2018-1-20T09:47:50", "","football","2018-1-28T09:47:50",total_event_id,6,2)
        		  ,new HashSet<>())); 
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("World Cup game", "2017-12-29T09:47:50", "","soccer","2018-1-25T09:47:50",total_event_id,3,2)
        		  ,new HashSet<>()));
          eventMap.put(++total_event_id, new EventInfo(
        		  new Event("NBA final game 1", "2017-12-6T09:47:50", "","basketball","2017-12-15T09:47:50",total_event_id,2,2)
        		  ,new HashSet<>()));
          
          DataBase.eventMap.get(1).userSet.add("tianyou");
          DataBase.eventMap.get(1).userSet.add("jiabin");
          DataBase.eventMap.get(1).userSet.add("jiawei");
          
          
          
     //Stadium(int stadiumId, String location, String descr, 
          //double longtitude, double latitute,int capacity) 
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"Staples Center","Officially stylized as STAPLES Center, "
          		+ "is a multi-purpose sports arena in Downtown Los Angeles. Adjacent to the L.A. Live development, "
          		+ "it is located next to the Los Angeles Convention Center complex along Figueroa Street. "
          		+ "The arena opened on October 17, 1999, and is one of the major sporting facilities"
          		+ " in the Greater Los Angeles Area.", -118.267254, 34.043017, 10), new HashSet()));
          
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"Oracle Arena","Oracle Arena is an indoor arena located in Oakland, California, United States, and is the home of the Golden State Warriors of the National Basketball Association (NBA). The arena opened in 1966 and is the oldest arena in the NBA. From its"
          		+ " opening until 1996 it was known as the Oakland-Alameda County Coliseum Arena. ",-122.203049,37.750292, 2), new HashSet()));
          
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"Toyota Center","Toyota Center is an indoor arena located in downtown Houston, Texas. It is named after the Japanese automobile manufacturer Toyota. The arena is home to the Houston Rockets of the National Basketball Association, and the former home of "
          		+ "the Houston Aeros of the American Hockey League.",-95.3621,29.750760, 10), new HashSet()));
            
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"TD Garden","TD Garden, often called Boston Garden and \"The Garden\", is a multi-purpose arena in Boston, Massachusetts. It is named after its sponsor, TD Bank, a subsidiary of Canada's Toronto-Dominion Bank. It opened in 1995 as a replacement for the "
          		+ "original Boston Garden and has been known as Shawmut Center, FleetCenter, and TD Banknorth Garden. The arena is located directly"
          		+ " above the MBTA's North Station.", -71.062146,42.366198, 10), new HashSet()));
          
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"Quicken Loans Arena","Quicken Loans Arena, commonly[citation needed] known as \"The Q\", is a multi-purpose arena in downtown Cleveland, Ohio, United States. The building is the home of the Cleveland Cavaliers of the National Basketball Association (NBA), "
          		+ "the Cleveland Monsters of the American Hockey League,"
          		+ " and the Cleveland Gladiators of the Arena Football League."
          		+ " It also serves as a secondary arena for Cleveland State Vikings men's and "
          		+ "women's basketball.",  -81.688213,41.496480, 10), new HashSet()));
          
          stadiumMap.put(++total_stadium_id, new StadiumInfo(new Stadium(total_stadium_id,"Madison Square Garden","Madison Square Garden, often called \"MSG\" or simply \"The Garden\", is a multi-purpose indoor arena in the New York City borough of Manhattan. Located in Midtown Manhattan between 7th and 8th Avenues from 31st to 33rd Streets,"
          		+ " it is situated atop Pennsylvania Station. It is the fourth venue to bear the name \"Madison Square Garden\", the first two (1879 and 1890) were located on Madison Square, on East 26th Street and Madison Avenue, with the third Madison Square Garden (1925) further uptown at Eighth Avenue and 50th Street. The Garden is used for"
          		+ " professional basketball and ice hockey, as well as boxing, concerts, ice shows, "
          		+ "circuses, professional wrestling and other forms of sports and entertainment."
          		+ " It is close to other midtown Manhattan landmarks, including the Empire State Building, Koreatown,"
          		+ " and Macy's at Herald Square. It is home to the New York Rangers of the National Hockey League (NHL),"
          		+ " the New York Knicks of the National Basketball Association (NBA), and since 1997, "
          		+ "the New York Liberty (WNBA).",-73.993439,40.750504, 10), new HashSet()));
              
          
          
          
         
     }
}
