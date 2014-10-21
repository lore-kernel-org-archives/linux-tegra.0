From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: Read and use the GPIO flags of the headphone
 detect
Date: Tue, 21 Oct 2014 10:14:41 -0600
Message-ID: <54468671.7060000@wwwdotorg.org>
References: <1413905609-23268-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413905609-23268-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/21/2014 09:33 AM, Alban Bedel wrote:
> The headphone detect was hardcoded to low-active, use the flags from
> DT to allow high-active as well.

> diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c

> @@ -44,6 +44,7 @@
>   struct tegra_rt5640 {
>   	struct tegra_asoc_utils_data util_data;
>   	int gpio_hp_det;
> +	enum of_gpio_flags gpio_hp_det_flags;

I have no idea why that's an enum if it's meant to be interpreted as a 
bit mask, but that's an issue with of_gpio.h, not this patch.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
