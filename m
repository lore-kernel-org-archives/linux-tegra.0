From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.14-rc3
Date: Mon, 2 Oct 2017 10:39:37 +0100
Message-ID: <c874cf3e-0f59-6922-fa68-40223cca7c13@nvidia.com>
References: <39a8ab29-1eda-674a-6f55-d4cf95eff223@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <39a8ab29-1eda-674a-6f55-d4cf95eff223-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 02/10/17 10:34, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.14-rc3.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.14-rc3/20171001153104/
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
>     Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver
> 
> Boot to userspace: tegra_defconfig:
>     Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver
> 
> PM: System suspend: multi_v7_defconfig:
>     FAIL: ( 3/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra30-beaver
>     Pass: ( 2/ 5): tegra124-nyan-big, tegra20-trimslice
> 
> PM: System suspend: tegra_defconfig:
>     FAIL: ( 3/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra30-beaver
>     Pass: ( 2/ 5): tegra124-nyan-big, tegra20-trimslice

The cause of the above suspend failure has been identified and a
candidate for fixing this is under review [0].

Cheers
Jon

[0] https://www.spinics.net/lists/linux-usb/msg161139.html

-- 
nvpublic
