From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: "drm: Add reference counting to blob properties" breaks Tegra124
 Jetson TK1 in linux-next
Date: Mon, 11 May 2015 22:00:37 -0600
Message-ID: <55517AE5.30700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi folks

Tegra124 Jetson TK1 hangs during boot in next-20150508 and beyond:

http://nvt.pwsan.com/experimental/linux-next/testlogs/test_next-20150508/20150508101018/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt 

http://nvt.pwsan.com/experimental/linux-next/testlogs/test_next-20150511/20150511004533/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt 


Reverting commit 672cb1d6aec7da2799afd1b529d5136d84ed2561 ("drm: Add 
reference counting to blob properties") gets it booting again:

http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150511204703_3838232431c2636ff539f2354c630c0ca3d4b7ad/20150511204703/boot/tegra124-jetson-tk1/tegra124-jetson-tk1/tegra_defconfig_log.txt

I'm not a DRM expert but maybe one of you knows what's going on here?


- Paul


commit 672cb1d6aec7da2799afd1b529d5136d84ed2561
Author: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Date:   Mon Apr 20 19:22:55 2015 +0100

     drm: Add reference counting to blob properties

     Reference-count drm_property_blob objects, changing the API to
     ref/unref.

     Signed-off-by: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
     Reviewed-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
     Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>


--
nvpublic
