From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: utils : add support to pass config type
 in generic util APIs
Date: Tue, 20 Aug 2013 14:25:09 -0600
Message-ID: <5213D0A5.7000504@wwwdotorg.org>
References: <1377000758-3795-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377000758-3795-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/20/2013 06:12 AM, Laxman Dewangan wrote:
> Add support to pass the config type like GROUP or PIN when using
> the utils or generic pin configuration APIs. This will make the
> APIs more generic.

I think passing in the type parameter to the *_to_map APIs makes sense,
but I don't think you need to have separate free functions; the way to
free any kind of map entry is always known, so you don't have to limit
the code to only freeing one type.

> diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c

> -void pinctrl_utils_dt_free_map(struct pinctrl_dev *pctldev,
> -	      struct pinctrl_map *map, unsigned num_maps)
> +void pinctrl_utils_dt_free_map_config(struct pinctrl_dev *pctldev,
> +		struct pinctrl_map *map, unsigned num_maps,
> +		enum pinctrl_map_type type)
>  {
>  	int i;
>  
>  	for (i = 0; i < num_maps; i++)
> -		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
> +		if (map[i].type == type)
>  			kfree(map[i].data.configs.configs);

In other words, replace that if with:

switch (maps[i].type) {
case PIN_MAP_TYPE_CONFIGS_PIN:
case PIN_MAP_TYPE_CONFIGS_GROUP:
	kfree(map[i].data.configs.configs);
	break;
default:
	break;
}
