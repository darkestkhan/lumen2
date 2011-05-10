with Lumen.Window;
with Lumen.Events;
with Lumen.Events.Animate;
with GL;
with GLU;

procedure Lesson04 is

   The_Window : Lumen.Window.Handle;

   Triangle_Rotation : GL.GLfloat := 0.0;
   Quad_Rotation     : GL.GLfloat := 0.0;

   Program_Exit : Exception;

   -- simply exit this program
   procedure Quit_Handler (Event : in Lumen.Events.Event_Data) is
   begin
      raise Program_Exit;
   end;

   -- Resize the scene
   procedure Resize_Scene (Width, Height : in Natural) is
      use GL;
      use GLU;
   begin

      -- reset current viewport
      glViewport (0, 0, GLsizei(Width), GLsizei(Height));

      -- select projection matrix and reset it
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;

      -- calculate aspect ratio
      gluPerspective(45.0, GLdouble(Width)/GLdouble(Height), 0.1, 100.0);

      -- select modelview matrix and reset it
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
   end Resize_Scene;

   procedure Init_GL is
      use GL;
      use GLU;
   begin
      -- smooth shading
      glShadeModel (GL_SMOOTH);

      -- black background
      glClearColor (0.0, 0.0, 0.0, 0.0);

      -- depth buffer setup
      glClearDepth (1.0);
      -- enable depth testing
      glEnable (GL_DEPTH_TEST);
      -- type of depth test
      glDepthFunc (GL_LEQUAL);

      glHint (GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
  end Init_GL;

   -- Resize and Initialize the GL window
   procedure Resize_Handler (Event : in Lumen.Events.Event_Data) is
      Height : Natural := Event.Resize_Data.Height;
      Width  : Natural := Event.Resize_Data.Width;
   begin
      -- prevent div by zero
      if Height = 0 then
         Height := 1;
      end if;

      Resize_Scene (Width, Height);
   end;

   procedure Draw is
      use GL;
   begin
      -- clear screen and depth buffer
      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
      -- reset current modelview matrix
      glLoadIdentity;
      -- move to the left half of the screen
      glTranslatef (-1.5, 0.0, -6.0);
      -- rotate the Triangle
      glRotatef (Triangle_Rotation, 0.0, 1.0, 0.0);
      -- draw triangle
      glBegin (GL_TRIANGLES);
         glColor3f (1.0, 0.0, 0.0);
         glVertex3f ( 0.0,  1.0, 0.0);
         glColor3f (0.0, 1.0, 0.0);
         glVertex3f (-1.0, -1.0, 0.0);
         glColor3f (0.0, 0.0, 1.0);
         glVertex3f ( 1.0, -1.0, 0.0);
      glEnd;

      -- reset current modelview matrix
      glLoadIdentity;
      -- move to the right half of the screen
      glTranslatef (1.5, 0.0, -6.0);
      -- rotate the Quad
      glRotatef (Quad_Rotation, 1.0, 0.0, 0.0);
      -- draw square
      glColor3f (0.5, 0.5, 1.0);
      glBegin (GL_QUADS);
         glVertex3f (-1.0,  1.0, 0.0);
         glVertex3f ( 1.0,  1.0, 0.0);
         glVertex3f ( 1.0, -1.0, 0.0);
         glVertex3f (-1.0, -1.0, 0.0);
      glEnd;

      Triangle_Rotation := Triangle_Rotation + 0.2;
      Quad_Rotation := Quad_Rotation - 0.15;
   end Draw;

   procedure Frame_Handler (Frame_Delta : in Duration) is
   begin
      Draw;
      Lumen.Window.Swap (The_Window);
   end Frame_Handler;

begin

   Lumen.Window.Create (Win => The_Window, Name   => "NeHe Lesson 4",
                                      Width  => 640,
                                      Height => 480,
                                      Events => (Lumen.Window.Want_Key_Press => True,
                                                 Lumen.Window.Want_Exposure  => True,
                                                 others => False));

   Resize_Scene (640, 480);
   Init_GL;

   Lumen.Events.Animate.Select_Events (Win   => The_Window,
                                       FPS   => Lumen.Events.Animate.Flat_Out,
                                       Frame => Frame_Handler'Unrestricted_Access,
                                       Calls => (Lumen.Events.Resized       => Resize_Handler'Unrestricted_Access,
                                                 Lumen.Events.Close_Window  => Quit_Handler'Unrestricted_Access,
                                                 others => Lumen.Events.No_Callback));

exception
   when Program_Exit =>
      null; -- normal termination
end Lesson04;