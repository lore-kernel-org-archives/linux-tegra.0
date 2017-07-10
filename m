From: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
Subject: Re: regression? no hdmi output on tegra124 (kernel 4.12)
Date: Mon, 10 Jul 2017 00:50:37 -0400
Message-ID: <CAHMsQjVNY61gzbH1pvQ9ixMW+ffhOe_xZV1ofo=kRRik1ivjBA@mail.gmail.com>
References: <CAHMsQjVGGF-QFzccok0--22DzOEspULSYRLt+0aatO-0=D1jqw@mail.gmail.com>
 <97b04d3a-a969-a23b-9414-4937dd2f2ef6@nvidia.com> <1499615706.1355.1.camel@paulk.fr>
 <1499617611.1355.3.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499617611.1355.3.camel-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Patched the Arch 4.12 kernel and working thus far!

Cheers,
-Anthony

On Sun, Jul 9, 2017 at 12:26 PM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrote:
> Le dimanche 09 juillet 2017 à 18:55 +0300, Paul Kocialkowski a écrit :
>> Le vendredi 07 juillet 2017 à 14:28 +0100, Jon Hunter a écrit :
>> > On 05/07/17 21:31, Anthony Eden wrote:
>> > > I no longer have any HDMI output from either my Jetson TK1
>> > > (tegra124-jetson-tk1) or Acer Chromebook 13 CB5-311
>> > > (tegra124-nyan-big) in Linux 4.12. In 4.11 I had no problem
>> > > starting
>> > > up X server.
>> > >
>> > > Lightdm tries to start on boot and /var/log/Xorg.0.log contains:
>> > >
>> > > ...
>> > >
>> > > [    10.723] (II) modesetting: Driver for Modesetting Kernel
>> > > Drivers: kms
>> > > [    10.723] (II) modeset(0): using drv /dev/dri/card0
>> > > [    10.724] (II) modeset(0): Creating default Display subsection
>> > > in
>> > > Screen section
>> > >         "Default Screen Section" for depth/fbbpp 24/32
>> > > [    10.724] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
>> > > [    10.724] (==) modeset(0): RGB weight 888
>> > > [    10.724] (==) modeset(0): Default visual is TrueColor
>> > > [    10.724] (II) Loading sub module "glamoregl"
>> > > [    10.724] (II) LoadModule: "glamoregl"
>> > > [    10.724] (II) Loading /usr/lib/xorg/modules/libglamoregl.so
>> > > [    10.726] (II) Module glamoregl: vendor="X.Org Foundation"
>> > > [    10.726]    compiled for 1.19.3, module version = 1.0.0
>> > > [    10.726]    ABI class: X.Org ANSI C Emulation, version 0.4
>> > > [    10.726] (II) glamor: OpenGL accelerated X.org driver based.
>> > > [    10.920] (II) glamor: EGL version 1.4 (DRI2):
>> > > [    10.924] (II) modeset(0): glamor initialized
>> > > [    10.924] (WW) modeset(0): No outputs definitely connected,
>> > > trying again...
>> > > [    10.925] (WW) modeset(0): Unable to find connected outputs -
>> > > setting 1024x768 initial framebuffer
>> > > [    10.925] (==) modeset(0): Using gamma correction (1.0, 1.0,
>> > > 1.0)
>> > > [    10.925] (EE) modeset(0): No modes.
>> > > [    10.957] (II) UnloadModule: "modesetting"
>> > > [    10.957] (II) UnloadSubModule: "glamoregl"
>> > > [    10.957] (II) Unloading glamoregl
>> > > [    10.957] (EE) Screen(s) found, but none have a usable
>> > > configuration.
>> > > [    10.957] (EE)
>> > > Fatal server error:
>> > > [    10.957] (EE) no screens found(EE)
>> > > [    10.957] (EE)
>> > > Please consult the The X.Org Foundation support
>> > >          at http://wiki.x.org
>> > >  for help.
>> > > [    10.957] (EE) Please also check the log file at
>> > > "/var/log/Xorg.0.log" for additional information.
>> > > [    10.957] (EE)
>> > > [    10.957] (EE) Server terminated with error (1). Closing log
>> > > file.
>> > >
>> > > ...
>> > >
>> > > I am running the ArchLinuxARM linux-armv7 kernel (.config is
>> > > attached), along with the ALARM userspace.
>> > >
>> > > I've attached dmesg's from my Jetson TK1 and Chromebook. How can I
>> > > help to debug this further?
>> >
>> > Thanks for the report. I am seeing this too. Bisect is point to the
>> > following commit, hopefully, Thierry and Mikko can comment ...
>> >
>> > commit 404bfb78daf3bedafb0bfab24947059575cbea3d
>> > Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > Date:   Wed Dec 14 13:16:14 2016 +0200
>> >
>> >     gpu: host1x: Add IOMMU support
>>
>> Thanks! I have investigated a bit further and can pinpoint it to
>> iommu_attach_device returning -ENODEV in drivers/gpu/host1x/dev.c's
>> host1x_probe.
>>
>> I'll keep investigating to find out what's going on with the IOMMU
>> code.
>
> I have a fix for it now and display is back to life. Hooray!
>
> Will submit the patch ASAP, I'm not sure it's the exactly right way to
> do it, but it does work.
>
> Cheers,
>
> --
> Paul Kocialkowski,
>
> developer of free digital technology and hardware support
>
> Website: https://www.paulk.fr/
> Coding blog: https://code.paulk.fr/
> Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
