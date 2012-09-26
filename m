From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] ARM: move ICEDCC uncompress.h to common location
Date: Wed, 26 Sep 2012 23:56:51 +0200
Message-ID: <20120926215651.GA20405@glitch>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
 <1348613212-21897-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348613212-21897-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 25, 2012 at 04:46:50PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Create a common location for uncompress.h, and select the included debug
> macro file using config option.
> 
> This does the same for uncompress.h as a recent patch for debug-macro.S,
> which was based on a suggestion by Russell King and implemented by Rob
> Herring.
> 
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug                     |   10 ++++
>  arch/arm/boot/compressed/misc.c            |   64 +---------------------------
>  arch/arm/include/debug/icedcc-uncompress.h |   61 ++++++++++++++++++++++++++
>  arch/arm/include/debug/none-uncompress.h   |    3 +
>  4 files changed, 75 insertions(+), 63 deletions(-)
>  create mode 100644 arch/arm/include/debug/icedcc-uncompress.h
>  create mode 100644 arch/arm/include/debug/none-uncompress.h
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index b0f3857..0daec3d 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -420,6 +420,16 @@ config DEBUG_LL_INCLUDE
>  		DEBUG_VEXPRESS_UART0_CA9 || DEBUG_VEXPRESS_UART0_RS1
>  	default "mach/debug-macro.S"
>  
> +config UNCOMPRESS_INCLUDE
> +	string
> +	default "debug/icedcc-uncompress.h" if DEBUG_ICEDCC
> +	default "debug/none-uncompress.h" if ARCH_MULTIPLATFORM || \
> +		DEBUG_HIGHBANK_UART || DEBUG_MVEBU_UART || \
> +		DEBUG_PICOXCELL_UART || DEBUG_SOCFPGA_UART || \
> +		DEBUG_VEXPRESS_UART0_DETECT || DEBUG_VEXPRESS_UART0_CA9 || \
> +		DEBUG_VEXPRESS_UART0_RS1

I would ask to add DEBUG_LL_UART_NONE to the or-ed list, which fixes the
build of platforms without mach/uncompress.h and mach/debug-macro.S in
case NONE is selected, but I'm not sure.

If I got the point of Russel right, uncompress.h is not a debug trace and
maybe should not depend on any DEBUG_LL* option?

Regards,
Domenico
