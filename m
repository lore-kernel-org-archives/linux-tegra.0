From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 02/10] ARM: tegra: export Tegra chipid
Date: Mon, 20 Feb 2012 15:13:10 -0800
Message-ID: <CAMbhsRT-ZTh7WQ1E0NUjX8FOMGAvx5zNnB-VYD=j8sWhM-9j+A@mail.gmail.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
	<1328831277-21002-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328831277-21002-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 9, 2012 at 3:47 PM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The powergating and reset handling code needs to differentiate betwee=
n Tegra
> variants. Therefore we export the chipid here.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/fuse.c | =A0 =A02 +-
> =A0arch/arm/mach-tegra/fuse.h | =A0 =A01 +
> =A02 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
> index 032a936..3298880 100644
> --- a/arch/arm/mach-tegra/fuse.c
> +++ b/arch/arm/mach-tegra/fuse.c
> @@ -34,7 +34,7 @@
> =A0int tegra_sku_id;
> =A0int tegra_cpu_process_id;
> =A0int tegra_core_process_id;
> -static int tegra_chip_id;
> +int tegra_chip_id;
> =A0enum tegra_revision tegra_revision;
>
> =A0/* The BCT to use at boot is specified by board straps that can be=
 read
> diff --git a/arch/arm/mach-tegra/fuse.h b/arch/arm/mach-tegra/fuse.h
> index c554572..d2107b2 100644
> --- a/arch/arm/mach-tegra/fuse.h
> +++ b/arch/arm/mach-tegra/fuse.h
> @@ -41,6 +41,7 @@ enum tegra_revision {
> =A0extern int tegra_sku_id;
> =A0extern int tegra_cpu_process_id;
> =A0extern int tegra_core_process_id;
> +extern int tegra_chip_id;
> =A0extern enum tegra_revision tegra_revision;
>
> =A0extern int tegra_bct_strapping;

Other platforms use accessors for this (cpu_is_xxx(), although
soc_is_xxx() is probably more appropriate).
