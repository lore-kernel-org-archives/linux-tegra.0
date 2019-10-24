From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
Date: Thu, 24 Oct 2019 17:12:21 +0100
Message-ID: <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-4-ben.dooks@codethink.co.uk>
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
> The CIF configuration and clock setting is currently hard coded for 2
> channels. Since the hardware is capable of supporting 1-8 channels add
> support for reading the channel count from the supplied parameters to
> allow for better TDM support. It seems the original implementation of this
> driver was fixed at 2 channels for simplicity, and not implementing TDM.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
> [ben.dooks@codethink.co.uk: merge edge control into set-format]
> [ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
> - fix the lrclk for dsp-b format
> ---
>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 063f34c882af..fc77e65a3646 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask = 0, val = 0;
> +	unsigned int ch_mask, ch_val = 0;
>  
>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>  	case SND_SOC_DAIFMT_NB_NF:
> @@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> +	ch_mask = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK;
>  	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>  	case SND_SOC_DAIFMT_CBS_CFS:
> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_DSP_A:
> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

Sorry, I just saw the feedback on the previous iteration. I don't think
we want to set the polarity but based upon the format that is passed ...

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=24cf3b55326f687aded22b91182df41c5ae188ac;hb=703aa948d2c92b87fd84f367f43a07778ed098b5#l333

Cheers
Jon

-- 
nvpublic
