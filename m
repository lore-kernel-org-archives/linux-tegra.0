From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: tegra: USB_ULPI needs USB
Date: Sun, 4 Mar 2012 10:40:15 -0800
Message-ID: <20120304184015.GE31064@quad.lixom.net>
References: <1330721919-8800-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1330721919-8800-1-git-send-email-alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 02, 2012 at 03:58:39PM -0500, Alan Ott wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> The USB_ULPI driver is selected by tegra, but can only be
> built if at least one of USB or USB_GADGET is enabled.
> The kernel fails to link if both are off.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 60f3e4b..9bb8a37 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -10,6 +10,7 @@ config ARCH_TEGRA_2x_SOC
>  	select USB_ARCH_HAS_EHCI if USB_SUPPORT
>  	select USB_ULPI if USB_SUPPORT
>  	select USB_ULPI_VIEWPORT if USB_SUPPORT
> +	select USB_GADGET if USB_SUPPORT && !USB
>  	select CPU_FREQ_TABLE if CPU_FREQ
>  	help
>  	  Support for NVIDIA Tegra AP20 and T20 processors, based on the

This is another patch that needs the same change for T30.


-Olof
