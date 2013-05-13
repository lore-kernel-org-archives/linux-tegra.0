From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra20: create a DT header defining CLK IDs
Date: Mon, 13 May 2013 10:47:13 -0600
Message-ID: <51911911.2000107@wwwdotorg.org>
References: <1368443225-16978-1-git-send-email-hdoyu@nvidia.com> <1368443225-16978-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368443225-16978-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/13/2013 05:07 AM, Hiroshi Doyu wrote:
> To replace magic number in tegra_car:
> 
> -               clocks = <&tegra_car 28>;
> +               clocks = <&tegra_car CLK_HOST1X>;

> @@ -172,7 +26,7 @@ Example SoC include file:
>  	};
>  
>  	usb@c5004000 {
> -		clocks = <&tegra_car 58>; /* usb2 */
> +		clocks = <&tegra_car TEGRA20_CLK_USB2>; /* usb2 */

I forgot to mention: That comment isn't useful any more, since it's
obvious this represents the USB2 clock now that the actual cell data
uses a define.
