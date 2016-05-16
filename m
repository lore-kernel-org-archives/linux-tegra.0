From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.6-rc7
Date: Mon, 16 May 2016 13:13:20 +0100
Message-ID: <5739B960.2010202@nvidia.com>
References: <5739B846.8040106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5739B846.8040106-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 16/05/16 13:08, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.6-rc7.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.6-rc7/20160508150104/
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
>     Pass: ( 3/ 3): qemu-vexpress64, tegra132-norrin,
> 		   tegra210-p2371-0000
> 
> Boot to userspace: multi_v7_defconfig:
>     Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra20-trimslice, tegra30-beaver
> 
> Boot to userspace: tegra_defconfig:
>     Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra20-trimslice, tegra30-beaver
> 
> PM: System suspend: multi_v7_defconfig:
>     FAIL: ( 1/ 4): tegra30-beaver

This failure does not appear to be specific to v4.6. An SD card has been
inserted into this board and since then suspend fails sometimes.
Unfortunately, this appears to be an issue that has been around for a
long time (many kernel releases) and only seems to impact certain SD
cards. We are currently investigating this issue.

Jon

--
nvpublic
