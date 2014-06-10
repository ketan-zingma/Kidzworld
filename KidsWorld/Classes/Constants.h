//
//  Constants.h
//  KidsWorld
//
//  Created by Pradnya Mankar on 29/10/12.
//  Copyright (c) 2012 Ketan Parekh. All rights reserved.
//

#ifndef KidsWorld_Constants_h
#define KidsWorld_Constants_h

#define PATH_WIDTH      30.0
#define LINE_WIDTH      20.0
#define TOUCH_WIDTH     40.0
#define MITER_LIMIT     80.0

#define TRACING_ANIMATION_DURATION     2

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#define ComparePoints( point1, point2 ) { \
  if( ( point1.x >= point2.x-30 && point1.x <= point2.x+30 ) && \
      ( point1.y >= point2.y-30 && point1.y <= point2.y+30 ) ) \
  { return YES; } \
  else  { return NO; } \
}

#endif
