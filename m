From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 5/8] ASoC: tegra: set edge mode for TDM
	correctly
Date: Wed, 18 Sep 2019 11:15:49 +0100
Message-ID: <3438cecb8ed89a96cfb30127dbd5e770@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-6-ben.dooks@codethink.co.uk>
 <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
 <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
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
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2019-09-18 10:02, Jon Hunter wrote:
> On 18/09/2019 09:54, Jon Hunter wrote:
>> 
>> On 17/09/2019 19:12, Ben Dooks wrote:
>>> In TDM, use the negative edge to drive data and the positive edge to 
>>> sample
>>> data.
>>> 
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>> 
>>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>>> b/sound/soc/tegra/tegra30_i2s.c
>>> index 4222839b63bd..d75ce12fe177 100644
>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai 
>>> *dai,
>>>  	}
>>> 
>>>  	pm_runtime_get_sync(dai->dev);
>>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
>>> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>>>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>>>  	pm_runtime_put(dai->dev);
>> 
>> I would rather set this in the case statement above where the format 
>> is
>> parsed and again drop this 'is_tdm' variable.
> 
> Actually, this should be implemented as shown in the following ...
> 
> https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=ee482f27ed2e4710e5e7446918887f8f8ef31285;hb=a960d522a5486aee27605f890034869c4f49d94a#l362
> 
> Jon

Ok, will look at that.

Note, nv-tegra.nvidia.com seems to have a security problem .
