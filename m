From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 9/9] ASoC: tegra_sgtl5000: fix platform name vs.
 of_node assignement
Date: Wed, 17 Oct 2018 13:32:37 +0100
Message-ID: <35848cb7-36ee-6698-ff17-7f0e73567914@nvidia.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
 <20181016104730.4598-10-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016104730.4598-10-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-tegra@vger.kernel.org


On 16/10/2018 11:47, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following error as seen post commit daecf46ee0e5
> ("ASoC: soc-core: use snd_soc_dai_link_component for platform"):
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
> Changes in v2: New patch
> 
>  sound/soc/tegra/tegra_sgtl5000.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
> index 901457da25ec..eb702925cac3 100644
> --- a/sound/soc/tegra/tegra_sgtl5000.c
> +++ b/sound/soc/tegra/tegra_sgtl5000.c
> @@ -168,6 +168,11 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_fini_utils:
> +	if (tegra_sgtl5000_dai.platform) {
> +		devm_kfree(&pdev->dev, tegra_sgtl5000_dai.platform);
> +		tegra_sgtl5000_dai.platform = NULL;
> +	}
> +
>  	tegra_asoc_utils_fini(&machine->util_data);
>  err_put_cpu_of_node:
>  	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
>

Where is the above allocated? I don't see it allocated in this driver
AFAICT. If it is not then it does not seem right to free something that
we have not allocated in this driver. I would have assumed it was
allocated by snd_soc_init_platform() in which case it should not be
necessary to free because that function uses devm_kzalloc(). What am I
missing here?

Cheers
Jon

-- 
nvpublic
