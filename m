From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 3/8] ASoC: tegra: i2s: Add support for more
 than 2 channels
Date: Wed, 18 Sep 2019 11:12:28 +0100
Message-ID: <f7f01665b51a3758dcaf1c82f44a86d9@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-4-ben.dooks@codethink.co.uk>
 <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
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



On 2019-09-18 09:50, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> The CIF configuration and clock setting is currently hard coded for 2
>> channels. Since the hardware is capable of supporting 1-8 channels add
>> support for reading the channel count from the supplied parameters to
>> allow for better TDM support. It seems the original implementation of 
>> this
>> driver was fixed at 2 channels for simplicity, and not implementing 
>> TDM.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>  sound/soc/tegra/tegra30_i2s.h |  1 +
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index b5372839f672..40bcc05a9dbb 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -86,14 +86,17 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai 
>> *dai,
>>  		return -EINVAL;
>>  	}
>> 
>> +	i2s->is_tdm = false;
>>  	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>  	case SND_SOC_DAIFMT_DSP_A:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>>  		break;
>>  	case SND_SOC_DAIFMT_DSP_B:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>>  		break;
>> @@ -127,10 +130,13 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>  	struct device *dev = dai->dev;
>>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>  	unsigned int mask, val, reg;
>> -	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
>>  	struct tegra30_ahub_cif_conf cif_conf;
>> 
>> -	if (params_channels(params) != 2)
>> +	channels = params_channels(params);
>> +	if (channels > 8)
>> +		return -EINVAL;
>> +	if (channels != 2 && !i2s->is_tdm)
> 
> I don't think that this additional test is really necessary. I would
> just drop this 'is_tdm' variable.

I needed it elsewhere so would prefer to leave this here.
