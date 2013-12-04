From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: tegra: Add header file for pinctrl constants
Date: Wed, 04 Dec 2013 10:03:32 -0700
Message-ID: <529F6064.3010300@wwwdotorg.org>
References: <1386076567-14283-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386076567-14283-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 06:16 AM, Laxman Dewangan wrote:
> This new header file defines pincontrol constants for Tegra to
> use from Tegra's DTS file for pincontrol properties option.

> diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra.h b/include/dt-bindings/pinctrl/pinctrl-tegra.h

> +#define TEGRA_PIN_DISABLE				0
> +#define TEGRA_PIN_ENABLE				1

That needs a comment re: which properties the defines can be used with,
since the properties are no longer related to the defines by name.

> +/* Pull up/down/normal */
> +#define TEGRA_PIN_PULL_NONE				0
> +#define TEGRA_PIN_PULL_DOWN				1
> +#define TEGRA_PIN_PULL_UP				2

Whereas that comment seems unnecessary, since it's obvious from the
define names.

> +/* Low power mode */
> +#define TEGRA_PIN_LP_DRIVE_DIV_8			0
> +#define TEGRA_PIN_LP_DRIVE_DIV_4			1
> +#define TEGRA_PIN_LP_DRIVE_DIV_2			2
> +#define TEGRA_PIN_LP_DRIVE_DIV_1			3
