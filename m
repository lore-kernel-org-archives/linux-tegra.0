From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name vs. of_node
 assignement
Date: Fri, 19 Oct 2018 11:22:46 +0100
Message-ID: <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018111829.27056-4-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-tegra@vger.kernel.org


On 18/10/2018 12:18, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following error as seen post commit daecf46ee0e5
> ("ASoC: soc-core: use snd_soc_dai_link_component for platform") on
> Apalis TK1 after initial probe deferral:
> 
> tegra-snd-sgtl5000 sound: ASoC: Both platform name/of_node are set for
>  sgtl5000
> tegra-snd-sgtl5000 sound: ASoC: failed to init link sgtl5000
> tegra-snd-sgtl5000 sound: snd_soc_register_card failed (-22)
> tegra-snd-sgtl5000: probe of sound failed with error -22
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v1:
> - Split from the Tegra series as suggested by Mark.
> - Fix issue in soc-core rather than working around it in tegra_sgtl5000.
> 
>  sound/soc/soc-core.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 6ddcf12bc030..b97624005976 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2733,7 +2733,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  int snd_soc_register_card(struct snd_soc_card *card)
>  {
>  	int i, ret;
> -	struct snd_soc_dai_link *link;
> +	struct snd_soc_dai_link *link = NULL;
>  
>  	if (!card->name || !card->dev)
>  		return -EINVAL;
> @@ -2744,7 +2744,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
>  		if (ret) {
>  			dev_err(card->dev, "ASoC: failed to init link %s\n",
>  				link->name);
> -			return ret;
> +			goto err;
>  		}
>  	}
>  
> @@ -2763,7 +2763,17 @@ int snd_soc_register_card(struct snd_soc_card *card)
>  	mutex_init(&card->mutex);
>  	mutex_init(&card->dapm_mutex);
>  
> -	return snd_soc_bind_card(card);
> +	ret = snd_soc_bind_card(card);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	if (link && link->platform)
> +		link->platform = NULL;

Looking at snd_soc_init_platform(), it seems that the platform pointer
can be allocated by the machine driver and so if it is not allocated by
the core, then I don't think we should clear it here. Seems we need a
way to determine if this was allocated by the core.

Furthermore, it seems that it is possible that there is more than one
link that might be to be cleared.

Cheers
Jon

-- 
nvpublic
