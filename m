From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/11] tegrarcm: Add Tegra124 support
Date: Mon, 09 Sep 2013 15:38:47 -0600
Message-ID: <522E3FE7.8020503@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-5-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-5-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:15 PM, Allen Martin wrote:
> Add Tegra124 USB device id, miniloader, and chip SKU information.

> @@ -481,6 +491,11 @@ static void dump_platform_info(nv3p_platform_info_t *info)
>  		case TEGRA114_CHIP_SKU_T114: chip_name = "t114"; break;
>  		default: chip_name = "unknown"; break;
>  		}
> +	} else if (info->chip_id.id == 0x40) {
> +		switch (info->sku) {
> +		case TEGRA124_CHIP_SKU_T124: chip_name = "t124"; break;
> +		default: chip_name = "unknown"; break;
> +		}
>  	} else {
>  		chip_name = "unknown";
>  	}

Do we really need to care about the SKU here? For chips other than
Tegra20, can't we just switch on the chip ID and be done with it? The
reason I ask is that in U-Boot, there are some SKU IDs that haven't been
ported into tegrarcm, and I assume we should be keeping the two SKU ID
lists in sync. It'd be simpler if we just made tegrarcm not care about SKU.
