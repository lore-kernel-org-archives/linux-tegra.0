From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 1/7] ASoC: tegra: Add a TDM
	configuration callback
Date: Tue, 24 Sep 2019 10:26:54 +0100
Message-ID: <8d62a19b-4e8d-d933-b364-3357388a6051@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-2-ben.dooks@codethink.co.uk>
 <b0574569-8586-87eb-b4ec-6e3445acfc41@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <b0574569-8586-87eb-b4ec-6e3445acfc41@nvidia.com>
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

>> +	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
>> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
>> +		(1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
> 
> So this is just 0, so it would be simpler just to write 0. Feel free to
> add a comment.
> 
> Cheers
> Jon

Ok, will consider setting this to "0". Thanks.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
