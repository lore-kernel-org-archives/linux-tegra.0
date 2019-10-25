From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 6/7] ASoC: tegra: config fifos on
	hw_param changes
Date: Fri, 25 Oct 2019 09:18:48 +0100
Message-ID: <c88664c5-74ac-d03f-02b4-477f10a27401@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-7-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-7-ben.dooks@codethink.co.uk>
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
Cc: linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
> If the hw_params uses a different bit or channel count, then we
> need to change both the I2S unit's CIF configuration as well as
> the APBIF one.
> 
> To allow changing the APBIF, add a call to reconfigure the RX or
> TX FIFO without changing the DMA or allocation, and get the I2S
> driver to call it once the hw params have been calculate.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 115 ++++++++++++++++++---------------
>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>  3 files changed, 69 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 952381260dc3..24bc03428b45 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
> +			       struct tegra30_ahub_cif_conf *cif_conf)
> +{
> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
> +	u32 reg, val;
> +
> +	pm_runtime_get_sync(ahub->dev);
> +
> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> +	val = tegra30_apbif_read(reg);
> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	tegra30_apbif_write(reg, val);
> +
> +	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> +
> +	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> +	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> +	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
> +
> +	pm_runtime_put(ahub->dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
> +
>  int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  				  char *dmachan, int dmachan_len,
>  				  dma_addr_t *fiforeg)
>  {
>  	int channel;
> -	u32 reg, val;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	channel = find_first_zero_bit(ahub->rx_usage,
> @@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
>  		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
>  
> -	pm_runtime_get_sync(ahub->dev);
> +	memset(&cif_conf, 0, sizeof(cif_conf));
>  
> -	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> -	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> -	val = tegra30_apbif_read(reg);
> -	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> -	tegra30_apbif_write(reg, val);
> -
> -	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
>  	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.expand = 0;
> -	cif_conf.stereo_conv = 0;
> -	cif_conf.replicate = 0;
> -	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> -	cif_conf.truncate = 0;
> -	cif_conf.mono_conv = 0;
> -
> -	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> -	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> -	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
> -
> -	pm_runtime_put(ahub->dev);
>  
> -	return 0;
> +	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);

I am not sure why it is necessary to call this here now because this is
called everytime you call hw_params() right? It seems redundant to me.

Cheers
Jon

-- 
nvpublic
