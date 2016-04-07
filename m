From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] soc: Add support for Parked bits for
 Tegra210
Date: Thu, 7 Apr 2016 14:35:01 -0600
Message-ID: <5706C475.7010102@wwwdotorg.org>
References: <1460060143-25086-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460060143-25086-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/07/2016 02:15 PM, Rhyland Klein wrote:
> Tegra210 has a parked bit for each pin. Add code to express
> this by updating the kernel driver MACROs to add in parked_*
> fields so that the kernel can handle them as it sees fit.

I'd expect that wrapped around 74 characters. Our internal git 
auto-review thing's 50-character limit is a bit odd (I think it's only 
meant to apply to the synopsis not the full description but is either 
buggy or just doesn't make that clear).

> diff --git a/configs/tegra114.soc b/configs/tegra114.soc

> +soc_pins_have_parked = False
>   soc_drv_reg_base = 0x868
>   soc_einput_b = 5
>   soc_odrain_b = 6
> +soc_parked_bank = 0
> +soc_parked_bit = 0

For SoCs with soc_pins_have_parked == False, can we simply omit the 
bank/bit values from the config file?

Other than that, I think this looks good. Thanks for taking the time to 
update it.
