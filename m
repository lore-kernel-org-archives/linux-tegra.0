From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 8/9] ASoC: tegra_sgtl5000: fix device_node refcounting
Date: Wed, 17 Oct 2018 11:57:53 +0100
Message-ID: <af707410-9954-b1a1-6d9b-5ad085604446@nvidia.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
 <20181016104730.4598-9-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016104730.4598-9-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-tegra@vger.kernel.org



On 16/10/2018 11:47, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Similar to the following:
> 
> commit 4321723648b0 ("ASoC: tegra_alc5632: fix device_node refcounting")
> 
> commit 7c5dfd549617 ("ASoC: tegra: fix device_node refcounting")
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2: New patch
> 
>  sound/soc/tegra/tegra_sgtl5000.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
> index 45a4aa9d2a47..901457da25ec 100644
> --- a/sound/soc/tegra/tegra_sgtl5000.c
> +++ b/sound/soc/tegra/tegra_sgtl5000.c
> @@ -149,14 +149,14 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev,
>  			"Property 'nvidia,i2s-controller' missing/invalid\n");
>  		ret = -EINVAL;
> -		goto err;
> +		goto err_put_codec_of_node;
>  	}
>  
>  	tegra_sgtl5000_dai.platform_of_node = tegra_sgtl5000_dai.cpu_of_node;
>  
>  	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
>  	if (ret)
> -		goto err;
> +		goto err_put_cpu_of_node;
>  
>  	ret = snd_soc_register_card(card);
>  	if (ret) {
> @@ -169,6 +169,13 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
>  
>  err_fini_utils:
>  	tegra_asoc_utils_fini(&machine->util_data);
> +err_put_cpu_of_node:
> +	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
> +	tegra_sgtl5000_dai.cpu_of_node = NULL;
> +	tegra_sgtl5000_dai.platform_of_node = NULL;
> +err_put_codec_of_node:
> +	of_node_put(tegra_sgtl5000_dai.codec_of_node);
> +	tegra_sgtl5000_dai.codec_of_node = NULL;
>  err:
>  	return ret;
>  }
> @@ -183,6 +190,12 @@ static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
>  
>  	tegra_asoc_utils_fini(&machine->util_data);
>  
> +	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
> +	tegra_sgtl5000_dai.cpu_of_node = NULL;
> +	tegra_sgtl5000_dai.platform_of_node = NULL;
> +	of_node_put(tegra_sgtl5000_dai.codec_of_node);
> +	tegra_sgtl5000_dai.codec_of_node = NULL;
> +
>  	return ret;
>  }
>  

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
