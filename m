From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
Date: Mon, 23 Sep 2019 11:37:43 -0500
Message-ID: <ef013678-01b7-cae6-72f4-a619be428ad5@linux.intel.com>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-3-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190923162026.14882-3-ben.dooks@codethink.co.uk>
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
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, Edward Cragg <edward.cragg@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org


> @@ -283,6 +294,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>   		(1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
>   	pm_runtime_put(dai->dev);
>   
> +	pm_runtime_put(dai->dev);
>   	return 0;
>   }

git squash/merge issue here?
