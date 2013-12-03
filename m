From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra: Header file for pinctrl constants
Date: Tue, 03 Dec 2013 13:06:42 -0700
Message-ID: <529E39D2.9000705@wwwdotorg.org>
References: <1385992502-12771-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385992502-12771-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/02/2013 06:55 AM, Laxman Dewangan wrote:
> Defines pincontrol constants to use from Tegra's DTS file
> for tegra pincontrol properties option.

> diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra.h b/include/dt-bindings/pinctrl/pinctrl-tegra.h

> +/* Pull up/down/normal */
> +#define TEGRA_PIN_PUPD_NORMAL				0
> +#define TEGRA_PIN_PUPD_PULL_DOWN			1
> +#define TEGRA_PIN_PUPD_PULL_UP				2

... and s/NORMAL/NONE/ here too, I think. Some people might consider
some other value e.g. pull-up as normal:-)
