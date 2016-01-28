From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.5-rc1
Date: Thu, 28 Jan 2016 11:57:40 +0000
Message-ID: <56AA0234.7010903@nvidia.com>
References: <56AA0174.5030608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56AA0174.5030608-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 28/01/16 11:54, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.5-rc1.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.5-rc1/20160128033104/
> 
> 
> Test summary
> ------------
> 
> Build: zImage:
>     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig
> 
> Build: Image:
>     Pass: ( 1/ 1): defconfig
> 
> Boot to userspace: defconfig:
>     FAIL: ( 1/ 2): qemu-vexpress64

This is a known issue [0] and a fix is in the works [1].

Jon

[0] https://lkml.org/lkml/2015/12/23/462
[1] http://marc.info/?l=linux-arm-kernel&m=145269663127115&w=2
