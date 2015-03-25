From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: "ARM: multi_v7_defconfig: Enable shmobile platforms" breaks
 Tegra20 multi_v7_defconfig boot
Date: Wed, 25 Mar 2015 11:28:03 -0700
Message-ID: <CANMBJr7ibVCxQRUG47OT0meNntMjEoVqL7kiEK9DtCfp5NXPgg@mail.gmail.com>
References: <alpine.DEB.2.02.1503251740130.13341@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1503251740130.13341-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Paul,

On 25 March 2015 at 11:03, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hello Geert,
>
> Looks like commit 4a3a6f86693922b29cf829c63f652b057f14619e ("ARM:
> multi_v7_defconfig: Enable shmobile platforms") breaks Tegra20
> multi_v7_defconfig boot.
>
> Boot log before:
>
> http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150325105514_6af714b069dc278d5d8e1b7afc13568f71d9aba8/20150325105514/boot/tegra20-trimslice/tegra20-trimslice/multi_v7_defconfig_log.txt
>
> Boot log after:
>
> http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150325105350_4a3a6f86693922b29cf829c63f652b057f14619e/20150325105350/boot/tegra20-trimslice/tegra20-trimslice/multi_v7_defconfig_log.txt
>
>
> Any ideas?  Stephen Warren thinks there might be an initcall that might
> not check to see what kind of device it's running on.

Can you try to shift your kernel load address around a bit? From
experience with the boards from kernelci.org we find that as the multi
v7 kernel size increases they can clobber memory when they get
decompressed.

>
>
> - Paul
>
> commit 4a3a6f86693922b29cf829c63f652b057f14619e
> Author: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Date:   Tue Feb 24 15:14:45 2015 +0100
>
>     ARM: multi_v7_defconfig: Enable shmobile platforms
>
>     Enable support for shmobile platforms that became multi-platform aware.
>     Several non-critical drivers and subsystems are built as modules, to keep
>     kernel size reasonable.
>
>     Tested on:
>       - r8a73a4/ape6evm:
>           - U-Boot fails with "Error: unrecognized/unsupported machine ID",
>           - kexec works.
>       - r8a7740/armadillo:
>           - Hermit boot loader fails (larger image, more memory corruption),
>           - kexec works.
>       - r8a7791/koelsch,
>       - sh73a0/kzm9g:
>           - zImage+DTB from U-Boot needs CONFIG_ARM_ATAG_DTB_COMPAT=n,
>           - kexec works.
>       - am335x/boneblack.
>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>     Acked-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
>     Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Cheers,

Tyler
