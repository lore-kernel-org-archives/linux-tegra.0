From: Marc Dietrich <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: Force PORT_TEGRA as the UART type
Date: Tue, 9 Aug 2011 20:26:02 +0200
Message-ID: <201108092026.04726.marc.dietrich@ap.physik.uni-giessen.de>
References: <1312837265-11984-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312837265-11984-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Am Montag 08 August 2011, 23:01:05 schrieb Stephen Warren:
> 8250.c recently gained an explicit PORT_TEGRA port type. Specifically
> request this in all Tegra boards' UART platform data.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tested the paz00 part and found no issues. So for board-paz00:

Acked-By: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
> NOTE: This depends on "[PATCH 1/5] ARM: tegra: paz00: add support serial
> port on JP1", which was recently posted by Marc Dietrich, since that added
> one of the platform data array entries being modified by this patch.
> 
>  arch/arm/mach-tegra/board-harmony.c   |    3 ++-
>  arch/arm/mach-tegra/board-paz00.c     |    6 ++++--
>  arch/arm/mach-tegra/board-seaboard.c  |    3 ++-
>  arch/arm/mach-tegra/board-trimslice.c |    3 ++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
> index f528a5a..987dab5 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -49,7 +49,8 @@ static struct plat_serial8250_port debug_uart_platform_data[] = {
>  		.membase	= IO_ADDRESS(TEGRA_UARTD_BASE),
>  		.mapbase	= TEGRA_UARTD_BASE,
>  		.irq		= INT_UARTD,
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
> +		.type		= PORT_TEGRA,
>  		.iotype		= UPIO_MEM,
>  		.regshift	= 2,
>  		.uartclk	= 216000000,
> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
> index b7494c2..c6a6d82 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -49,7 +49,8 @@ static struct plat_serial8250_port debug_uart_platform_data[] = {
>  		.membase	= IO_ADDRESS(TEGRA_UARTA_BASE),
>  		.mapbase	= TEGRA_UARTA_BASE,
>  		.irq		= INT_UARTA,
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
> +		.type		= PORT_TEGRA,
>  		.iotype		= UPIO_MEM,
>  		.regshift	= 2,
>  		.uartclk	= 216000000,
> @@ -58,7 +59,8 @@ static struct plat_serial8250_port debug_uart_platform_data[] = {
>  		.membase	= IO_ADDRESS(TEGRA_UARTD_BASE),
>  		.mapbase	= TEGRA_UARTD_BASE,
>  		.irq		= INT_UARTD,
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
> +		.type		= PORT_TEGRA,
>  		.iotype		= UPIO_MEM,
>  		.regshift	= 2,
>  		.uartclk	= 216000000,
> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
> index 237a94a..25446df 100644
> --- a/arch/arm/mach-tegra/board-seaboard.c
> +++ b/arch/arm/mach-tegra/board-seaboard.c
> @@ -44,7 +44,8 @@
>  static struct plat_serial8250_port debug_uart_platform_data[] = {
>  	{
>  		/* Memory and IRQ filled in before registration */
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
> +		.type		= PORT_TEGRA,
>  		.iotype		= UPIO_MEM,
>  		.regshift	= 2,
>  		.uartclk	= 216000000,
> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
> index 89a6d2a..91875b9 100644
> --- a/arch/arm/mach-tegra/board-trimslice.c
> +++ b/arch/arm/mach-tegra/board-trimslice.c
> @@ -46,7 +46,8 @@ static struct plat_serial8250_port debug_uart_platform_data[] = {
>  		.membase	= IO_ADDRESS(TEGRA_UARTA_BASE),
>  		.mapbase	= TEGRA_UARTA_BASE,
>  		.irq		= INT_UARTA,
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
> +		.type		= PORT_TEGRA,
>  		.iotype		= UPIO_MEM,
>  		.regshift	= 2,
>  		.uartclk	= 216000000,
> 
