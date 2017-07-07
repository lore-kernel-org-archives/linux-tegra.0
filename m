From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: regression? no hdmi output on tegra124 (kernel 4.12)
Date: Fri, 7 Jul 2017 14:28:14 +0100
Message-ID: <97b04d3a-a969-a23b-9414-4937dd2f2ef6@nvidia.com>
References: <CAHMsQjVGGF-QFzccok0--22DzOEspULSYRLt+0aatO-0=D1jqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHMsQjVGGF-QFzccok0--22DzOEspULSYRLt+0aatO-0=D1jqw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 05/07/17 21:31, Anthony Eden wrote:
> I no longer have any HDMI output from either my Jetson TK1
> (tegra124-jetson-tk1) or Acer Chromebook 13 CB5-311
> (tegra124-nyan-big) in Linux 4.12. In 4.11 I had no problem starting
> up X server.
> 
> Lightdm tries to start on boot and /var/log/Xorg.0.log contains:
> 
> ...
> 
> [    10.723] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
> [    10.723] (II) modeset(0): using drv /dev/dri/card0
> [    10.724] (II) modeset(0): Creating default Display subsection in
> Screen section
>         "Default Screen Section" for depth/fbbpp 24/32
> [    10.724] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
> [    10.724] (==) modeset(0): RGB weight 888
> [    10.724] (==) modeset(0): Default visual is TrueColor
> [    10.724] (II) Loading sub module "glamoregl"
> [    10.724] (II) LoadModule: "glamoregl"
> [    10.724] (II) Loading /usr/lib/xorg/modules/libglamoregl.so
> [    10.726] (II) Module glamoregl: vendor="X.Org Foundation"
> [    10.726]    compiled for 1.19.3, module version = 1.0.0
> [    10.726]    ABI class: X.Org ANSI C Emulation, version 0.4
> [    10.726] (II) glamor: OpenGL accelerated X.org driver based.
> [    10.920] (II) glamor: EGL version 1.4 (DRI2):
> [    10.924] (II) modeset(0): glamor initialized
> [    10.924] (WW) modeset(0): No outputs definitely connected, trying again...
> [    10.925] (WW) modeset(0): Unable to find connected outputs -
> setting 1024x768 initial framebuffer
> [    10.925] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
> [    10.925] (EE) modeset(0): No modes.
> [    10.957] (II) UnloadModule: "modesetting"
> [    10.957] (II) UnloadSubModule: "glamoregl"
> [    10.957] (II) Unloading glamoregl
> [    10.957] (EE) Screen(s) found, but none have a usable configuration.
> [    10.957] (EE)
> Fatal server error:
> [    10.957] (EE) no screens found(EE)
> [    10.957] (EE)
> Please consult the The X.Org Foundation support
>          at http://wiki.x.org
>  for help.
> [    10.957] (EE) Please also check the log file at
> "/var/log/Xorg.0.log" for additional information.
> [    10.957] (EE)
> [    10.957] (EE) Server terminated with error (1). Closing log file.
> 
> ...
> 
> I am running the ArchLinuxARM linux-armv7 kernel (.config is
> attached), along with the ALARM userspace.
> 
> I've attached dmesg's from my Jetson TK1 and Chromebook. How can I
> help to debug this further?

Thanks for the report. I am seeing this too. Bisect is point to the
following commit, hopefully, Thierry and Mikko can comment ...

commit 404bfb78daf3bedafb0bfab24947059575cbea3d
Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Wed Dec 14 13:16:14 2016 +0200

    gpu: host1x: Add IOMMU support

Cheers
Jon

-- 
nvpublic
