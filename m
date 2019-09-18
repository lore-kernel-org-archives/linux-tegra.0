From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
Date: Wed, 18 Sep 2019 11:11:03 +0100
Message-ID: <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2019-09-18 09:42, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 
>> 'platform'
>> driver.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index ac6983c6bd72..d36b4662b420 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct 
>> snd_pcm_substream *substream, int cmd,
>>  	return 0;
>>  }
>> 
>> +/*
>> + * Set up TDM
>> + */
>> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>> +			       unsigned int tx_mask, unsigned int rx_mask,
>> +			       int slots, int slot_width)
>> +{
>> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> +	unsigned int mask = 0, val = 0;
>> +
>> +	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x 
>> "
> 
> dev_dbg() please. Also I don't think it is necessary to print both the
> function name and 'setting TDM', the function name should be 
> sufficient.

Yes, already sorted from previous review.

>> +		 "slots: 0x%08x " "width: %d\n",
> 
> Why are there extra quotes here?

No idea, I'll remove these later.

>> +		 __func__, tx_mask, rx_mask, slots, slot_width)> +
>> +	/* Set up slots and tx/rx masks */
>> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
>> +
>> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
>> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>> +
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +
>> +	/* Set FSYNC width */
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
>> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
>> +		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
> 
> What happens if there is only one slot? The fsync will be the width of
> the slot. Typically, TDM is used with DSP-A/B formats and although the
> driver does not appear to program the fsync width, it probably should
> during the tegra30_i2s_set_fmt() depending on the format used rather
> than here.

Hmm, should we check.

The work was done to keep as close to the original client's 2.6 kernel
as possible which set the fsync field to a whole data word. We could try
and just set this to say 2 here and have a much shorter frame-sync 
pulse.

I'll add a check for slots < 2 and set the fsync width to 2.

Thanks for the review.


> 
> Cheers
> Jon
