From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.9-rc1
Date: Wed, 2 Nov 2016 13:54:58 +0000
Message-ID: <78f0138e-e447-f777-bdcb-3c39fcccf335@nvidia.com>
References: <ff60cb86-a8e3-dc25-ac86-b6e3ccf7ea17@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ff60cb86-a8e3-dc25-ac86-b6e3ccf7ea17-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 02/11/16 13:39, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.9-rc1.
> Logs and other details at:
>
>     https://nvtb.github.io//linux/test_v4.9-rc1/20161102045959/
>
>
> Test summary
> ------------
>
> Build: zImage:
>     FAIL: ( 1/ 2): multi_v7_defconfig

This issue was exposed by commit 3f0958d8aea7 ("ARM: multi_v7_defconfig: 
enable CONFIG_EFI") because our builder is using an older version on 
bin-utils. This has been fixed by commit b0dddf6c147e ("efi/arm: Fix 
absolute relocation detection for older toolchains").

>     Pass: ( 1/ 2): tegra_defconfig
>
> Build: Image:
>     Pass: ( 1/ 1): defconfig
>
> Boot to userspace: defconfig:
>     Pass: ( 4/ 4): qemu-vexpress64, tegra132-norrin,
> 		   tegra210-p2371-0000, tegra210-smaug
>
> Boot to userspace: tegra_defconfig:
>     Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver
>
> PM: System suspend: tegra_defconfig:
>     FAIL: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
> 		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

These failures are not true/hard failures as suspend is still working. 
Commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing 
continuation lines") exposed a issue with one of the messages seen in 
suspend (which we look for when testing suspend) and caused the suspend 
test to report a failure. This has been fixed by commit 1adb469b9b76 
("PM / suspend: Fix missing KERN_CONT for suspend message").

Jon

-- 
nvpublic
