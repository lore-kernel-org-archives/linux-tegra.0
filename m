From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: use pinctrl-utils APIs for mapping
Date: Tue, 20 Aug 2013 14:28:28 -0600
Message-ID: <5213D16C.40304@wwwdotorg.org>
References: <1377000758-3795-1-git-send-email-ldewangan@nvidia.com> <1377000758-3795-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377000758-3795-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/20/2013 06:12 AM, Laxman Dewangan wrote:
> Pin control utility functions provides the function for creating
> map lists.
> 
> In place of implementing APIs locally in Tegra pin control driver
> for creating map lists, use the utility functions. This reduces
> the code size and avoid duplication.

This patch looks fine, so assuming the issue in patch 1/2 is fixed, this
patch,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

One thought though:

> diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c

>  static const struct cfg_param {
>  	const char *property;
>  	enum tegra_pinconf_param param;
> @@ -212,12 +112,13 @@ static const struct cfg_param {
>  	{"nvidia,drive-type",		TEGRA_PINCONF_PARAM_DRIVE_TYPE},
>  };

If you add a new field to that struct that's a function pointer, which
parses the content of the property and gives back an unsigned log or
struct pinctrl_map, you could probably make most of
tegra_pinctrl_dt_subnode_to_map() be generic too...

But, that's certainly something for a separate patch if you want.
