From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 05/10] ARM: tegra: rework Tegra secondary CPU core bringup
Date: Mon, 20 Feb 2012 15:04:57 -0800
Message-ID: <CAMbhsRRkkjfymL=uDt+phM2sLunbypQRUhjZ=DHSO4y9Ko4NJA@mail.gmail.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
	<1328831277-21002-6-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328831277-21002-6-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 9, 2012 at 3:47 PM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Prepare the Tegra secondary CPU core bringup code for other Tegra var=
iants.
> The reset handler is also generalized to allow for future introductio=
n of
> powersaving modes which turn off the CPU cores.
>
> Based on work by:
>
> Scott Williams <scwilliams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Chris Johnson <cwj-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
<snip>

> diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/head=
smp.S
> index b5349b2..7973f1c 100644
> --- a/arch/arm/mach-tegra/headsmp.S
> +++ b/arch/arm/mach-tegra/headsmp.S

<snip>

> @@ -47,15 +64,116 @@ ENTRY(v7_invalidate_l1)
> =A0 =A0 =A0 =A0 mov =A0 =A0 pc, lr
> =A0ENDPROC(v7_invalidate_l1)
>
> +
> =A0ENTRY(tegra_secondary_startup)
> - =A0 =A0 =A0 msr =A0 =A0 cpsr_fsxc, #0xd3
> =A0 =A0 =A0 =A0 bl =A0 =A0 =A0v7_invalidate_l1
> - =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r0, c0, c0, 5
> - =A0 =A0 =A0 =A0and =A0 =A0r0, r0, #15
> - =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D0x6000f100
> - =A0 =A0 =A0 =A0str =A0 =A0 r0, [r1]
> -1: =A0 =A0 =A0ldr =A0 =A0 r2, [r1]
> - =A0 =A0 =A0 =A0cmp =A0 =A0 r0, r2
> - =A0 =A0 =A0 =A0beq =A0 =A0 1b
> + =A0 =A0 =A0 mov32 =A0 r0, 0xC5ACCE55
> + =A0 =A0 =A0 mcr =A0 =A0 p14, 0, r0, c7, c12, 6

One minor nit, you should comment that this is enabling coresight.
