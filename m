From: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: "drm: Add reference counting to blob properties" breaks Tegra124 Jetson TK1 in linux-next
Date: Tue, 12 May 2015 07:33:04 +0100
Message-ID: <5DC9157B-3CE7-4794-B77A-865C609DFB05@collabora.com>
References: <55517AE5.30700@nvidia.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55517AE5.30700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "<maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "<daniel.vetter-/w4YWyX8dFk@public.gmane.org>" <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "<airlied-cv59FeDIM0c@public.gmane.org>" <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Paul,

> On 12 May 2015, at 5:00 am, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> Hi folks
> 
> Tegra124 Jetson TK1 hangs during boot in next-20150508 and beyond:
> 
> http://nvt.pwsan.com/experimental/linux-next/testlogs/test_next-20150508/20150508101018/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt 
> http://nvt.pwsan.com/experimental/linux-next/testlogs/test_next-20150511/20150511004533/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt 

Weirdly enough, it seems to work in kernelci:
http://kernelci.org/boot/tegra124-jetson-tk1_rootfs:nfs/job/next/kernel/next-20150511/defconfig/tegra_defconfig/lab/lab-khilman/?_id=5550ef6259b5147b64e060b4

Though maybe it's just good fortune that Kevin doesn't have a display plugged into his TK1.

> Reverting commit 672cb1d6aec7da2799afd1b529d5136d84ed2561 ("drm: Add reference counting to blob properties") gets it booting again:
> 
> http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150511204703_3838232431c2636ff539f2354c630c0ca3d4b7ad/20150511204703/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt
> 
> I'm not a DRM expert but maybe one of you knows what's going on here?

Thanks for the catch. I have a Nyan-Big Chromebook here, so will try to work it out locally and let you know.

Sorry for the inconvenience!

Cheers,
Daniel
