From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] ASoC: tegra: probe deferral error reporting
Date: Wed, 15 Aug 2018 17:02:39 +0100
Message-ID: <930b05df-c502-192e-3cb9-9e1874701cce@nvidia.com>
References: <20180814140145.12212-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814140145.12212-1-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-tegra@vger.kernel.org


On 14/08/18 15:01, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Actually report the error codes from of_get_named_gpio() resp.
> devm_gpio_request_one() upon trying to get the codec reset resp. sync
> GPIOs unless it is just a probe deferral.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2:
> - Silence probe deferral as suggested by Stefan.
> - Fix line over 80 characters as reported by checkpatch.
> 
>  sound/soc/tegra/tegra20_ac97.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
> index 682ef33afb5f..2ac6b2d73980 100644
> --- a/sound/soc/tegra/tegra20_ac97.c
> +++ b/sound/soc/tegra/tegra20_ac97.c
> @@ -351,18 +351,31 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
>  		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
>  					    GPIOF_OUT_INIT_HIGH, "codec-reset");
>  		if (ret) {
> -			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&pdev->dev,
> +					"could not get codec-reset GPIO: %d\n",
> +					ret);
> +
>  			goto err_clk_put;
>  		}
>  	} else {
> -		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
> +		ret = ac97->reset_gpio;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"no codec-reset GPIO supplied: %d\n",
> +				ret);
> +
>  		goto err_clk_put;
>  	}
>  
>  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
>  					    "nvidia,codec-sync-gpio", 0);
>  	if (!gpio_is_valid(ac97->sync_gpio)) {
> -		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
> +		ret = ac97->sync_gpio;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n",
> +				ret);
> +
>  		goto err_clk_put;
>  	}

Thanks, looks good to me. However, I wonder why we don't request the
'sync_gpio' in the probe like we do for the reset? Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
