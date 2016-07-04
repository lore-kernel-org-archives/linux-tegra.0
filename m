From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.7-rc2
Date: Mon, 4 Jul 2016 14:44:42 +0100
Message-ID: <577A684A.9070301@nvidia.com>
References: <577A66C1.1010307@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577A66C1.1010307-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 04/07/16 14:38, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.7-rc2.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.7-rc2/20160605150104/
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
>     Pass: ( 4/ 4): qemu-vexpress64, tegra132-norrin,
> 		   tegra210-p2371-0000, tegra210-smaug
> 
> Boot to userspace: multi_v7_defconfig:
>     FAIL: ( 1/ 5): tegra20-trimslice
>     Pass: ( 4/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra30-beaver

After 4.7-rc1 the tegra20-trimslice start failing to boot occasionally.
Typically 1 in 10 boots would fail. Seems to be a lock-up around the twd
frequency change. Interestingly, I don't see this issue any more after
v4.7-rc3, but bisecting so far has been fruitless. Nevertheless I am
still trying to track this down.

> Boot to userspace: tegra_defconfig:
>     Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver
> 
> PM: System suspend: multi_v7_defconfig:
>     FAIL: ( 1/ 5): tegra30-beaver
>     Pass: ( 4/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice
> 
> PM: System suspend: tegra_defconfig:
>     FAIL: ( 1/ 5): tegra30-beaver
>     Pass: ( 4/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice

These tegra30-beaver suspends issues are related to sdhci and can be
worked-around by populating the voltage regulator for the sdhci [0].

Sorry this is a bit late, but got very behind!

Jon

[0] http://marc.info/?l=linux-tegra&m=146730073503388&w=2

-- 
nvpublic
