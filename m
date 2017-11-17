From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: mainline/master boot: 559 boots: 63 failed, 477 passed with 12
 offline, 7 conflicts (v4.14-9357-g2bf16b7a73ca)
Date: Fri, 17 Nov 2017 13:13:28 +0000
Message-ID: <cd15e8ec-1c91-654c-bd7e-422d600f7f66@collabora.com>
References: <5a0e0f76.52bf1c0a.3b738.a646@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a0e0f76.52bf1c0a.3b738.a646-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Escande <thierry.escande-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16/11/17 22:21, kernelci.org bot wrote:
> mainline/master boot: 559 boots: 63 failed, 477 passed with 12 offline, 7 conflicts (v4.14-9357-g2bf16b7a73ca)
>
> Full Boot Summary: https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.14-9357-g2bf16b7a73ca/
> Full Build Summary: https://kernelci.org/build/mainline/branch/master/kernel/v4.14-9357-g2bf16b7a73ca/
>
> Tree: mainline
> Branch: master
> Git Describe: v4.14-9357-g2bf16b7a73ca
> Git Commit: 2bf16b7a73caf3435f782e4170cfe563675e10f9
> Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> Tested: 102 unique boards, 24 SoC families, 36 builds out of 211
>
> Boot Regressions Detected:
>
> arm:
[...]
>     multi_v7_defconfig:
[...]
>         tegra124-nyan-big:
>             lab-collabora: failing since 1 day (last pass: v4.14-3308-g670ffccb2f91 - first fail: v4.14-3453-ge37e0ee01900)

It seems like the automatic bisection job on staging.kernelci.org
found what might have caused this failure.  It's still an
experimental tool but hopefully it will eventually be useful and
save time when looking for the root cause of boot failures...

Here's what it found:

   commit 7313cfa4f6e30384fa04083698d1e865cf812a6a
   Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
   Date:   Wed Nov 1 03:56:19 2017 +1000

       drm/nouveau/bar: move bar1 initialisation into its own function
     
       BAR2 being done for practical reasons, this is just for consistency.
     
       Flushes have been added after the write to bind the instance block,
       as later commits will reveal the need for them.
     
       Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


Kernel error:

[    2.402977] nouveau 57000000.gpu: gr: failed to load fuc409c
[    2.456166] Unable to handle kernel NULL pointer dereference at virtual address 00000000


It looks like the same DRM driver issue that was found previously
on linux-next (CC Jon Hunter).  I would be interested to know if
this is actually the commit that introduced the problem, hoping
it can help getting it fixed but also to collect results from the
new bisection tool.  It would be great if you could please let me
know if you find out, and apologies if it isn't.


The full bisection job log:

   https://people.collabora.com/~gtucker/kernelci/bisections/20171117-tegra124-nyan-big-mainline-1513.txt

All the LAVA jobs for this bisection, for the full kernel logs:

   https://lava.collabora.co.uk/scheduler/alljobs?length=25&search=lava-bisect-v2-b-1513#table

The boot results can also be found here by searching for "lava-bisect-v2-b-1513":

   https://staging.kernelci.org/boot/


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
