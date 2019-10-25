From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 7/7] ASoC: tegra: take packing settings
 from the audio cif_config
Date: Fri, 25 Oct 2019 09:47:35 +0100
Message-ID: <ab8211ea-d4ed-85dc-51f4-ab9c2e134378@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-8-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-8-ben.dooks@codethink.co.uk>
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
> If the CIF is not configured as 16 or 8 bit, then the
> packing for 8/16 bits should not be enabled as the
> hardware only supports 8 or 16 bit packing.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 24bc03428b45..0768c6b6dc25 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
> +
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> @@ -203,10 +210,16 @@ int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_8_4;
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
> 

Looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
