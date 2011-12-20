From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: boards: more __init/__initdata annotations
Date: Tue, 20 Dec 2011 08:26:41 +0000
Message-ID: <20111220082641.GQ14542@n2100.arm.linux.org.uk>
References: <1324353802-31774-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324353802-31774-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 19, 2011 at 08:03:22PM -0800, Olof Johansson wrote:
> Silence a bunch of section warnings, and mark some of the init functions as
> __init.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-harmony-pinmux.c   |    8 ++++----
>  arch/arm/mach-tegra/board-paz00-pinmux.c     |    8 ++++----
>  arch/arm/mach-tegra/board-seaboard-pinmux.c  |   16 ++++++++--------
>  arch/arm/mach-tegra/board-trimslice-pinmux.c |    4 ++--
>  4 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/mach-tegra/board-harmony-pinmux.c
> index 465808c..84cfbef 100644
> --- a/arch/arm/mach-tegra/board-harmony-pinmux.c
> +++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
> @@ -25,7 +25,7 @@
>  #include "board-harmony.h"
>  #include "board-pinmux.h"
>  
> -static struct tegra_pingroup_config harmony_pinmux[] = {
> +static __initdata struct tegra_pingroup_config harmony_pinmux[] = {

__initdata goes at the end of the declaration - just before the '='.
