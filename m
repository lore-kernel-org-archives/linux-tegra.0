From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: tegra: select CPU_FREQ_TABLE
Date: Thu, 1 Mar 2012 12:05:37 -0800
Message-ID: <CAOesGMiFbggUz6_GH-5htzFJuaXzeYhXpTfHafy-LSPAEmkQnw@mail.gmail.com>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
	<1330630010-11241-4-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330630010-11241-4-git-send-email-alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Mar 1, 2012 at 11:26 AM, Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> The tegra cpufreq implementation relies on the cpu_freq_table
> code, so make sure that this is always there when needed.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/Kconfig | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfi=
g
> index 373652d..b2a038e 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -10,6 +10,7 @@ config ARCH_TEGRA_2x_SOC
> =A0 =A0 =A0 =A0select USB_ARCH_HAS_EHCI if USB_SUPPORT
> =A0 =A0 =A0 =A0select USB_ULPI if USB_SUPPORT
> =A0 =A0 =A0 =A0select USB_ULPI_VIEWPORT if USB_SUPPORT
> + =A0 =A0 =A0 select CPU_FREQ_TABLE if CPU_FREQ

The corresponding chance is needed for T30 as well.

(the cpufreq driver should probably be moved out to drivers/cpufreq
and given its own but that's a separate issue)


-Olof
