From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: next/master boot: 210 boots: 35 failed, 174 passed with 1
 conflict (next-20171115)
Date: Thu, 16 Nov 2017 14:42:56 +0000
Message-ID: <a21b88b2-663d-49fc-527a-87494a23087f@collabora.com>
References: <5a0c2169.c6a2df0a.13ea3.9c02@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a0c2169.c6a2df0a.13ea3.9c02-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15/11/17 11:13, kernelci.org bot wrote:
> next/master boot: 210 boots: 35 failed, 174 passed with 1 conflict (next-20171115)
>
> Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20171115/
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20171115/
>
> Tree: next
> Branch: master
> Git Describe: next-20171115
> Git Commit: 63fb091c80188ec51f53514d07de907c1dd3d61d
> Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> Tested: 35 unique boards, 16 SoC families, 30 builds out of 213
>
> Boot Regressions Detected:
>
> arm:
[...]
>     multi_v7_defconfig:
>         tegra124-nyan-big:
>             lab-collabora: failing since 11 days (last pass: next-20171102 - first fail: next-20171103)

I've run another automated bisection with some tweaks to remove
known failures and found this breaking change:

   commit 859eb05676f67d4960130dff36d3368006716110
   Author: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
   Date:   Fri Sep 8 13:50:11 2017 -0700

       platform/chrome: Use proper protocol transfer function


The bisection was run with CONFIG_MODULES and CONFIG_DRM_NOUVEAU
disabled and d89e2378a97fafdc74cbf997e7c88af75b81610a ("drivers:
flag buses which demand DMA configuration") reverted in each
iteration as these things are known to cause other boot failures.
See the full log here (from staging.kernelci.org Jenkins):

   https://people.collabora.com/~gtucker/kernelci/bisections/20171116-nyan-big-next.txt

As the kernelci.org automated bisection tool is still
experimental, I then did a couple of checks to confirm whether
this commit was still an issue:

   * 859eb056 with MODULES and DRM_NOUVEAU disabled, failed:
     https://lava.collabora.co.uk/scheduler/job/992002

   * same as above but with 859eb056 reverted in-place, passes:
     https://lava.collabora.co.uk/scheduler/job/992003

   * next-20171115 with MODULES and DRM_NOUVEAU disabled, and
     d89e2378 reverted, fails:
     https://lava.collabora.co.uk/scheduler/job/992004

   * same as above but with 859eb056 reverted on top, passes:
     https://lava.collabora.co.uk/scheduler/job/992005

So this shows the commit found by the bisection seems to be still
causing problems on tegra124-nyan-big.  I haven't investigated
any further, I don't know if other platforms show the same
symptoms.  At least this should narrow things down a bit.

Note: With this in mind, another possible bisection would be to
enable DRM_NOUVEAU again while reverting the 2 known breaking
commits and try to find what is actually causing the issue in
that driver.  I'm not planning to do this right now though...

Hope this helps!

Guillaume

> ---
> For more info write to <info-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>
>
>
>
> _______________________________________________
> Kernel-build-reports mailing list
> Kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> https://lists.linaro.org/mailman/listinfo/kernel-build-reports
>
