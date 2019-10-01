From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v3 1/7] ASoC: tegra: add a TDM
	configuration callback
Date: Tue, 1 Oct 2019 18:03:20 +0100
Message-ID: <7f9cc620-b3d0-c417-724d-3198055aca82@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-2-ben.dooks@codethink.co.uk>
 <1488a5a8-5c55-5643-1956-0cd9d9c90644@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1488a5a8-5c55-5643-1956-0cd9d9c90644@nvidia.com>
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
Cc: linux-kernel@lists.codethink.co.uk, Edward Cragg <edward.cragg@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

On 01/10/2019 14:40, Jon Hunter wrote:
> 
> On 30/09/2019 17:51, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>
>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
>> driver.
>>
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: merge fix for power management]
>> [ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index ac6983c6bd72..7f9ef6abeae2 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -254,6 +254,38 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Set up TDM
>> + */
>> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>> +			       unsigned int tx_mask, unsigned int rx_mask,
>> +			       int slots, int slot_width)
>> +{
>> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> +	unsigned int mask, val;
>> +
>> +	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
>> +		 __func__, tx_mask, rx_mask, slots, slot_width);
>> +
>> +	/* Set up slots and tx/rx masks */
>> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
>> +
>> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
>> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>> +
>> +	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +	// set the fsync width to minimum of 1 clock width
> 
> Please make sure you are consistent with your commenting style and you
> adhere to the kernel coding style.
> 
> Also, I see a lot of ...
> 
> ERROR: trailing whitespace
> #197: FILE: sound/soc/tegra/tegra30_i2s.c:258:
> + * Set up TDM^M$
> 
> ERROR: DOS line endings
> #198: FILE: sound/soc/tegra/tegra30_i2s.c:259:
> + */^M$

ok, for me I am getting:

> $ ./scripts/checkpatch.pl ./patches/0001-ASoC-tegra-add-a-TDM-configuration-callback.patch 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #6: 
> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
> 
> total: 0 errors, 1 warnings, 45 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.

I don't see any warnings about the line-endings

I will remove the comment about the function, it is fairly self explanatory.



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
