From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: next/master boot: 296 boots: 62 failed, 230 passed with 4
 conflicts (next-20171113)
Date: Tue, 14 Nov 2017 17:10:05 +0000
Message-ID: <59af2937-78a1-7db6-12e4-28d6719efaed@collabora.com>
References: <5a09ec32.8190df0a.933bb.b974@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a09ec32.8190df0a.933bb.b974-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13/11/17 19:02, kernelci.org bot wrote:
> next/master boot: 296 boots: 62 failed, 230 passed with 4 conflicts (next-20171113)
>
> Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20171113/
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20171113/
>
> Tree: next
> Branch: master
> Git Describe: next-20171113
> Git Commit: c348a99ee55feac43b5b62a5957c6d8e2b6c3abe
> Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> Tested: 52 unique boards, 17 SoC families, 33 builds out of 213
>
> Boot Regressions Detected:
>
> arm:
>
[...]
>     multi_v7_defconfig:
[...]
>         tegra124-nyan-big:
>             lab-collabora: failing since 9 days (last pass: next-20171102 - first fail: next-20171103)


There are several things failing on the tegra124-nyan-big, at
least I've isolated one with my latest bisection run:

6c78935777d12ead2d32adf3eb525a24faf02d04 is the first bad commit
commit 6c78935777d12ead2d32adf3eb525a24faf02d04
Author: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date:   Fri Nov 10 16:34:52 2017 +0100

     video: fbdev: Convert timers to use timer_setup()


These boot tests are with multi_v7_defconfig with CONFIG_MODULES
and CONFIG_DRM_NOUVEAU disabled:

* the first one on the revision mentioned above, fails:
   https://lava.collabora.co.uk/scheduler/job/987651

* then the same but with the commit reverted, passes:
   https://lava.collabora.co.uk/scheduler/job/987652

This was found using the still experimental automated bisection
tool for kernelci.org, I'm not sure yet how reliable the results
are.  I think the manual check with these 2 boots proves it, but
I haven't really investigated further than that.

So I then did the same tests at the top of the branch, on the
next-20171113 tag:

* next-20171113, fails but differently:
   https://lava.collabora.co.uk/scheduler/job/987653

* next-20171113 with the commit reverted, still fails:
   https://lava.collabora.co.uk/scheduler/job/987654

It's hard to tell whether the commit I mentioned got fixed
in-between, I guess it would be best to not have any boot failure
in any case.

The next thing I'll try is start a bisection for the other
failure see on next-20171113 tag, with the commit above reverted
and see if it leads anywhere...

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
