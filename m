From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ASOC: tegra: fix AC97 clock handling
Date: Mon, 18 Nov 2013 16:15:14 -0700
Message-ID: <528A9F82.3070606@wwwdotorg.org>
References: <1384370243-17178-1-git-send-email-dev@lynxeye.de> <1384370243-17178-3-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384370243-17178-3-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 12:17 PM, Lucas Stach wrote:
> This corrects the Tegra AC97 clock handling to be in line with
> the devicetree. Audio PLL is controlled by the machine driver, only
> AC97 host controller clock remains to be independent.

> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c

> @@ -353,7 +352,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
>  				       of_dma, 2) < 0) {
>  		dev_err(&pdev->dev, "No DMA resource\n");
>  		ret = -ENODEV;
> -		goto err_clk_put;
> +		goto err;
>  	}

That's going to conflict (admittedly very slightly) with the patch I
sent on Friday to convert to the standard DT DMA bindings[1] since that
block of code is removed.

Perhaps you could remove the removal of label err_clk_put from this
patch, and keep the rest? Then, I think there won't be any conflict at
all. You can send the s/err_clk_put/err/ conversion later; it's
logically a separate cleanup anyway, right?

[1] http://www.spinics.net/lists/arm-kernel/msg286785.html

Aside from that and Thierry's comment,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
