From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: l2x0: fix compile error on !CONFIG_USE_OF
Date: Thu, 17 Nov 2011 21:41:20 +0800
Message-ID: <CAGsJ_4yrHqzXeBbG6AKyzsqPjt7VLBiStqBi0wnCvFauPbuERw@mail.gmail.com>
References: <1320864823-5015-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320864823-5015-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

2011/11/10 Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>:
> fae2b89ab1 (ARM: l2x0: add empty l2x0_of_init) adds a static inline
> function that returns -ENODEV, but at least on tegra cache-l2x0.h is
> included without errno.h being pulled in first, resulting in compile
> errors if OF isn't enabled:
>
> In file included from arch/arm/mach-tegra/common.c:26:
> arch/arm/include/asm/hardware/cache-l2x0.h: In function 'l2x0_of_init=
':
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: 'ENODEV' undec=
lared (first use in this function)
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: (Each undeclar=
ed identifier is reported only once
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: for each funct=
ion it appears in.)
>
> Add errno.h to the include file to make it self-contained.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Acked-by: Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>

> ---
> =C2=A0arch/arm/include/asm/hardware/cache-l2x0.h | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/include/asm/hardware/cache-l2x0.h b/arch/arm/in=
clude/asm/hardware/cache-l2x0.h
> index 1db1143..7df239b 100644
> --- a/arch/arm/include/asm/hardware/cache-l2x0.h
> +++ b/arch/arm/include/asm/hardware/cache-l2x0.h
> @@ -20,6 +20,8 @@
> =C2=A0#ifndef __ASM_ARM_HARDWARE_L2X0_H
> =C2=A0#define __ASM_ARM_HARDWARE_L2X0_H
>
> +#include <linux/errno.h>
> +
> =C2=A0#define L2X0_CACHE_ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x000
> =C2=A0#define L2X0_CACHE_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x004
> =C2=A0#define L2X0_CTRL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x100
> --
> 1.7.5.4
>
>
