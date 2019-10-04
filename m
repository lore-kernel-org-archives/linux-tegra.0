From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v3 6/7] ASoC: tegra: config fifos on
	hw_param changes
Date: Fri, 4 Oct 2019 18:03:39 +0100
Message-ID: <faed4e1f-0e67-88b1-e276-80a8a5cd4b3e@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-7-ben.dooks@codethink.co.uk>
 <3a65d828-8430-9739-7973-10e0df360767@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <3a65d828-8430-9739-7973-10e0df360767@nvidia.com>
Content-Language: en-GB
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org

On 30/09/2019 22:08, Jon Hunter wrote:
> 
> On 30/09/2019 17:51, Ben Dooks wrote:
>> If the hw_params uses a different bit or channel count, then we
>> need to change both the I2S unit's CIF configuration as well as
>> the APBIF one.
>>
>> To allow changing the APBIF, add a call to reconfigure the RX or
>> TX FIFO without changing the DMA or allocation, and get the I2S
>> driver to call it once the hw params have been calculate.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   sound/soc/tegra/tegra30_ahub.c | 114 ++++++++++++++++++---------------
>>   sound/soc/tegra/tegra30_ahub.h |   5 ++
>>   sound/soc/tegra/tegra30_i2s.c  |   2 +
>>   3 files changed, 69 insertions(+), 52 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
>> index 952381260dc3..58e05ceb86da 100644
>> --- a/sound/soc/tegra/tegra30_ahub.c
>> +++ b/sound/soc/tegra/tegra30_ahub.c
>> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>> +			       struct tegra30_ahub_cif_conf *cif_conf)
>> +{
>> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
>> +	u32 reg, val;
>> +
>> +	pm_runtime_get_sync(ahub->dev);
>> +
>> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> +	val = tegra30_apbif_read(reg);
>> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
>> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> +	tegra30_apbif_write(reg, val);
>> +
>> +	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
>> +
>> +	reg = TEGRA30_AHUB_CIF_RX_CTRL +
>> +	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
>> +	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
>> +
>> +	pm_runtime_put(ahub->dev);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
>> +
>>   int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>>   				  char *dmachan, int dmachan_len,
>>   				  dma_addr_t *fiforeg)
>>   {
>>   	int channel;
>> -	u32 reg, val;
>>   	struct tegra30_ahub_cif_conf cif_conf;
>>   
>>   	channel = find_first_zero_bit(ahub->rx_usage,
>> @@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>>   	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
>>   		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
>>   
>> -	pm_runtime_get_sync(ahub->dev);
>> +	memset(&cif_conf, 0, sizeof(cif_conf));
>>   
>> -	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> -	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> -	val = tegra30_apbif_read(reg);
>> -	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
>> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
>> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> -	tegra30_apbif_write(reg, val);
>> -
>> -	cif_conf.threshold = 0;
>>   	cif_conf.audio_channels = 2;
>>   	cif_conf.client_channels = 2;
>>   	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>   	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>> -	cif_conf.expand = 0;
>> -	cif_conf.stereo_conv = 0;
>> -	cif_conf.replicate = 0;
>> -	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
>> -	cif_conf.truncate = 0;
>> -	cif_conf.mono_conv = 0;
>> -
>> -	reg = TEGRA30_AHUB_CIF_RX_CTRL +
>> -	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
>> -	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
>> -
>> -	pm_runtime_put(ahub->dev);
>>   
>> -	return 0;
>> +	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);
> 
> It seems a bit odd, that you still configure some of the cif_conf
> members and then call tegra30_ahub_setup_rx_fifo() here. Why not just
> allocate it and then move all the programming to
> tegra30_ahub_setup_rx_fifo()?

I was trying to keep the behaviour the same, IIRC the original is first
called before the format information is known.

>>   }
>>   EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_rx_fifo);
>>   
>> @@ -186,12 +191,40 @@ int tegra30_ahub_free_rx_fifo(enum tegra30_ahub_rxcif rxcif)
>>   }
>>   EXPORT_SYMBOL_GPL(tegra30_ahub_free_rx_fifo);
>>   
>> +int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
>> +			       struct tegra30_ahub_cif_conf *cif_conf)
>> +{
>> +	int channel = txcif - TEGRA30_AHUB_TXCIF_APBIF_TX0;
>> +	u32 reg, val;
>> +
>> +	pm_runtime_get_sync(ahub->dev);
>> +
>> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> +	val = tegra30_apbif_read(reg);
>> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
>> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
>> +	tegra30_apbif_write(reg, val);
>> +
>> +	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
>> +
>> +	reg = TEGRA30_AHUB_CIF_TX_CTRL +
>> +	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
>> +	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
>> +
>> +	pm_runtime_put(ahub->dev);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_tx_fifo);
>> +
>>   int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
>>   				  char *dmachan, int dmachan_len,
>>   				  dma_addr_t *fiforeg)
>>   {
>>   	int channel;
>> -	u32 reg, val;
>>   	struct tegra30_ahub_cif_conf cif_conf;
>>   
>>   	channel = find_first_zero_bit(ahub->tx_usage,
>> @@ -206,37 +239,14 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
>>   	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_TXFIFO +
>>   		   (channel * TEGRA30_AHUB_CHANNEL_TXFIFO_STRIDE);
>>   
>> -	pm_runtime_get_sync(ahub->dev);
>> -
>> -	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> -	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> -	val = tegra30_apbif_read(reg);
>> -	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
>> -		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
>> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
>> -	tegra30_apbif_write(reg, val);
>> -
>> -	cif_conf.threshold = 0;
>> +	memset(&cif_conf, 0, sizeof(cif_conf));
>>   	cif_conf.audio_channels = 2;
>>   	cif_conf.client_channels = 2;
>>   	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>   	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>> -	cif_conf.expand = 0;
>> -	cif_conf.stereo_conv = 0;
>> -	cif_conf.replicate = 0;
>>   	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
>> -	cif_conf.truncate = 0;
>> -	cif_conf.mono_conv = 0;
>> -
>> -	reg = TEGRA30_AHUB_CIF_TX_CTRL +
>> -	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
>> -	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
>>   
>> -	pm_runtime_put(ahub->dev);
>> -
>> -	return 0;
>> +	return tegra30_ahub_setup_tx_fifo(*txcif, &cif_conf);
>>   }
>>   EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_tx_fifo);
>>   
>> diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
>> index 6889c5f23d02..26120aee64b3 100644
>> --- a/sound/soc/tegra/tegra30_ahub.h
>> +++ b/sound/soc/tegra/tegra30_ahub.h
>> @@ -490,6 +490,11 @@ void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
>>   void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
>>   			   struct tegra30_ahub_cif_conf *conf);
>>   
>> +extern int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
>> +				      struct tegra30_ahub_cif_conf *cif_conf);
>> +extern int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif,
>> +				      struct tegra30_ahub_cif_conf *cif_conf);
>> +
>>   struct tegra30_ahub_soc_data {
>>   	u32 mod_list_mask;
>>   	void (*set_audio_cif)(struct regmap *regmap,
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index a03692b0afc3..19ac49df6cc8 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -202,9 +202,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>>   
>>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>   		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> 
> You set the direction here and then set it again in
> tegra30_ahub_setup_tx_fifo(). It only needs to be done once.

ok, will fix that.

>> +		tegra30_ahub_setup_tx_fifo(i2s->playback_fifo_cif, &cif_conf);
>>   		reg = TEGRA30_I2S_CIF_RX_CTRL;
>>   	} else {
>>   		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
>> +		tegra30_ahub_setup_rx_fifo(i2s->capture_fifo_cif, &cif_conf);
>>   		reg = TEGRA30_I2S_CIF_TX_CTRL;
>>   	}
>>   
>>
> 
> Cheers
> Jon
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
