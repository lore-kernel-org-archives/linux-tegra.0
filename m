From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error reporting
Date: Thu, 26 Jul 2018 10:34:30 +0200
Message-ID: <2203d95715a9c73daa07c30ae37b095f@agner.ch>
References: <20180720080424.31505-1-marcel@ziswiler.com>
 <20180720080424.31505-2-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720080424.31505-2-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.07.2018 10:04, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Actually report the error codes from of_get_named_gpio() resp.
> devm_gpio_request_one() upon trying to get the codec reset resp. sync
> GPIOs which may as well just be a probe deferrals.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  sound/soc/tegra/tegra20_ac97.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
> index 682ef33afb5f..4875512f0732 100644
> --- a/sound/soc/tegra/tegra20_ac97.c
> +++ b/sound/soc/tegra/tegra20_ac97.c
> @@ -351,18 +351,21 @@ static int tegra20_ac97_platform_probe(struct
> platform_device *pdev)
>  		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
>  					    GPIOF_OUT_INIT_HIGH, "codec-reset");
>  		if (ret) {
> -			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
> +			dev_err(&pdev->dev, "could not get codec-reset GPIO: "
> +					    "%d\n", ret);
>  			goto err_clk_put;
>  		}
>  	} else {
> -		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
> +		ret = ac97->reset_gpio;
> +		dev_err(&pdev->dev, "no codec-reset GPIO supplied: %d\n", ret);
>  		goto err_clk_put;
>  	}
>  
>  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
>  					    "nvidia,codec-sync-gpio", 0);
>  	if (!gpio_is_valid(ac97->sync_gpio)) {
> -		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
> +		ret = ac97->sync_gpio;
> +		dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n", ret);
>  		goto err_clk_put;

This will still print an error on defer, which is not really nice. I
suggest to suppress defer errors completely, e.g. by:

		if (ret != -EPROBE_DEFER)
			dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n", ret);

The driver framework provides debug level prints if debugging of
deferred probing is required.

--
Stefan


>  	}
