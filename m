From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Wed, 17 Jul 2013 21:24 +0200
Message-ID: <2335952.AzgfRvEkyz@ax5200p>
References: <2572002.IOA8y0azF4@ax5200p> <1371308577.2480.6.camel@localhost.localdomain> <20130717043939.GB11359@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130717043939.GB11359@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 17 July 2013 06:39:41 Thierry Reding wrote:
> On Sat, Jun 15, 2013 at 05:02:57PM +0200, Thomas Meyer wrote:
> > Am Samstag, den 15.06.2013, 11:43 +0200 schrieb Thierry Reding:
> > > On Sat, Jun 15, 2013 at 11:37:46AM +0200, Thomas Meyer wrote:
> > > > Am Freitag, den 14.06.2013, 23:26 +0200 schrieb Thierry Reding:
> > > > > On Fri, Jun 14, 2013 at 10:59:00PM +0200, Thomas Meyer wrote:
> > > > > > Am 14.06.2013 um 22:37 schrieb Thierry Reding 
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > > > > [...]
> > > > > 
> > > > > > > I think I've seen a similar issue
> > > > > > > when that's not loaded, in which case DRM will turn off all
> > > > > > > outputs
> > > > > > > because there's nothing to display. Alternatively you could try
> > > > > > > to run
> > > > > > > an X server using the xf86-video-opentegra or
> > > > > > > xf86-video-modesetting
> > > > > > > drivers. That should definitely get you output on HDMI.
> > > > > > 
> > > > > > I did login blindly on tty2 and started xfce using the open tegra
> > > > > > driver,
> > > > > > but still no hdmi output. I can send you the Xorg log file if you
> > > > > > want
> > > > > > to.
> > > > > 
> > > > > Yes, Xorg output would be good. Additionally, dmesg output might
> > > > > help.
> > > > > Don't forget to pass drm.debug=0xf on the kernel command-line.
> > > > > 
> > > > > > Xfce seems to run correctly, as far as I can see all necessary
> > > > > > processes
> > > > > > are running. The monitor I connect to the hdmi is an dvi monitor
> > > > > > using
> > > > > > an dvi to hdmi adapter, so no sound is connected. But that
> > > > > > shouldn't be
> > > > > > a problem.
> > > > 
> > > > btw. switching the mode with
> > > > $ xrandr  -d :0 --output HDMI-0 --mode 1680x1050
> > > > 
> > > > makes the external monitor output the display correctly...
> > > > 
> > > > also switching to the highest possible resolution works after the
> > > > first
> > > > mode switch:
> > > > $ xrandr  -d :0 --output HDMI-0 --mode 1920x1080
> > > 
> > > So perhaps the default configuration chosen at startup isn't one that
> > > tegra-drm can properly deal with. Can you provide the output of
> > > 
> > > 	$ xrandr --query
> > > 
> > > run immediately after booting (that is with the default configuration
> > > before you make it work by setting a 1680x1050 mode).
> > 
> > sorry, I wasn't able to get the infos. xrandr refused to connect to the
> > X server spawned by lightdm but I don't know why. Maybe some missing
> > Xauthority or something like that.
> > 
> > But I got these infos, after a fresh boot:
> > 
> > $ fbset -i
> > 
> > mode "1920x1080"
> > 
> >     geometry 1920 1080 1920 1080 32
> >     timings 0 0 0 0 0 0 0
> >     accel true
> >     rgba 8/16,8/8,8/0,0/0
> > 
> > endmode
> > 
> > Frame buffer device information:
> >     Name        :
> >     Address     : 0x1a100000
> >     Size        : 8294400
> >     Type        : PACKED PIXELS
> >     Visual      : TRUECOLOR
> >     XPanStep    : 1
> >     YPanStep    : 1
> >     YWrapStep   : 0
> >     LineLength  : 7680
> >     Accelerator : No
> > 
> > $ fbset -i -fb /dev/fb1
> > 
> > mode "1024x768"
> > 
> >     geometry 1024 768 1024 768 16
> >     timings 0 0 0 0 0 0 0
> >     accel true
> >     rgba 5/11,6/5,5/0,0/0
> > 
> > endmode
> > 
> > Frame buffer device information:
> >     Name        : udldrmfb
> >     Address     : 0xe0dbc000
> >     Size        : 1572864
> >     Type        : PACKED PIXELS
> >     Visual      : TRUECOLOR
> >     XPanStep    : 1
> >     YPanStep    : 1
> >     YWrapStep   : 0
> >     LineLength  : 2048
> >     Accelerator : No
> > 
> > When I add the boot option "video=HDMI-A-1:1680x1050" I get a working fb
> > console even while booting up. Later on I can start X manually and then
> > X switches to 1920x1080 and everything works okay.
> 
> Hi Thomas,
> 
> This fell off the table. I discussed a similar issue with Marc on IRC
> today. The issue, IIUC, seems to be that with HDMI connected, the system
> comes up and when X starts it tries to find the best match amongst the
> various combinations of video modes on all existing heads in an attempt
> to clone the desktop to all outputs. It turns out that this causes the
> HDMI output to be configured with a resolution we don't support on Tegra
> because the clock can't provide the right frequency.
> 
> There may be reasons (which I'm not aware of) for X to behave the way it
> does. It also points to an issue that we should be more clever within
> the kernel to flag as bad all the modes for which we can't provide a
> proper clock. I will have to look into that.
> 
> In the meantime I think Marc had some success setting up a more useful
> output configuration using xrandr. Perhaps he can provide more
> information on exactly what he had to do to make this work and you
> (Thomas) can try to reproduce whether that gets you a usable system.
> 

I got dualhead working by using the following xorg.conf entries:

Section "Device"                                                                
    Identifier "gpu"                                                            
    Driver "opentegra"                                                          
EndSection                                                                      
                                                                                
Section "Monitor"                                                               
    Identifier "LVDS-0"                                                         
EndSection                                                                      
                                                                                
Section "Monitor"                                                               
    Identifier "HDMI-0"                                                         
    Option "LeftOf" "LVDS-0"                                                    
EndSection                                                                      
                                                                                
Section "Screen"                                                                
    Identifier "Screen0"                                                        
    Device "gpu"                                                                
    Monitor "HDMI-0"                                                            
    SubSection "Display"                                                        
        Modes "1920x1200"                                                       
    EndSubSection                                                               
EndSection 

HDMI is the primary screen in this case.

I hope this helps.

Marc
