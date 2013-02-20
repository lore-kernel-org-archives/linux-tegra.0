From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: unhandled interrupt from otg port
Date: Wed, 20 Feb 2013 14:29:45 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1B91F2BA@BGMAIL02.nvidia.com>
References: <1978166.seipGZS4QH@ax5200p> <4469776.MJZ64uWU3E@ax5200p>
 <5123FBAC.6010302@wwwdotorg.org>
 <2407399.sDvuQ1S2GC@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2407399.sDvuQ1S2GC-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> -----Original Message-----
> From: Marc Dietrich [mailto:marvin24-Mmb7MZpHnFY@public.gmane.org]
> Sent: Wednesday, February 20, 2013 2:21 PM
> To: Stephen Warren
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Venu Byravarasu
> Subject: Re: unhandled interrupt from otg port
> 
> Am Dienstag, 19. Februar 2013, 15:24:44 schrieb Stephen Warren:
> > On 02/19/2013 03:17 PM, Marc Dietrich wrote:
> > > On Tuesday 19 February 2013 23:12:53 Marc Dietrich wrote:
> > >> Stephen,
> > >>
> > >> On Tuesday 19 February 2013 10:03:47 Stephen Warren wrote:
> > >>> On 02/17/2013 04:48 AM, Marc Dietrich wrote:
> > >>>> Hi,
> > >>>>
> > >>>> I sometimes see unhandled irq from the otg port on my AC100 (kernel
> > >>>> 3.8.0-rc7). This happens randomly when the a cable is pluged into the
> > >>>> mini usb port. Seems the port generates an interrupt on probe which
> > >>>> isn't handled.
> > >>>
> > >>> Perhaps Venu can explain this; he is our USB expert.
> > >>>
> > >>>> Any ideas?
> > >>>
> > >>> I'm slightly confused by your description though; I assume this problem
> > >>> happens when you boot with a USB cable already plugged in, not when
> you
> > >>> first boot the system, then plug in a cable? Is the cable connected to a
> > >>> host PC, or to a device?
> > >>
> > >> the cable is connected to a host PC. It is not shown when connecting
> > >> after the system has booted. Unfortunately, I cannot generate the error
> > >> reproducible, e.g. I just tried 10 times and nothing was shown. Maybe
> > >> just forget it for now if no one has an obvious idea. I'll try to find
> > >> some reproducable situation and will report back.
> > >
> > > arr, just found it: it happens when you load an uboot image via tegrarcm
> > > first - so this could be a kernel or uboot problem.
> >
> > Ah, so that means that the Tegra boot ROM already initialized the USB
> > port in device mode to receive U-Boot. I assume you're not touching USB
> > in U-Boot at all, but loading the kernel/... from SD/eMMC. Then, the
> > kernel initializes/uses USB in host mode (since that's all we support so
> > far), and then you see the issue.
> 
> yes, sounds reasonable.
> 
> > I reproduced this on Harmony. I'll file a bug and assign it to Venu.
> 

Reproduced the issue on Ventana.
Debug is in progress.

Thanks,
Venu
 
> Thanks!
> 
> Marc
