From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
Date: Thu, 24 Oct 2019 16:54:18 +0100
Message-ID: <3914d620-ee0e-436f-1375-dfa0fba11273@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, Edward Cragg <edward.cragg@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org



On 18/10/2019 16:48, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> The tegra3 audio can support 24 and 32 bit sample sizes so add the
> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
> formats when requested.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> 
> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> ---
>  sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 73f0dddeaef3..063f34c882af 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct device *dev = dai->dev;
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val, reg;
> -	int ret, sample_size, srate, i2sclock, bitcnt;
> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	if (params_channels(params) != 2)
> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	switch (params_format(params)) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  		sample_size = 16;
>  		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
> +		sample_size = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
> +		sample_size = 32;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
> -	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> +	cif_conf.audio_bits = audio_bits;
> +	cif_conf.client_bits = audio_bits;
>  	cif_conf.expand = 0;
>  	cif_conf.stereo_conv = 0;
>  	cif_conf.replicate = 0;
> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.capture = {
>  		.stream_name = "Capture",
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.ops = &tegra30_i2s_dai_ops,
>  	.symmetric_rates = 1,

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic
