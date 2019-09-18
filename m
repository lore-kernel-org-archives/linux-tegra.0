From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 8/8] ASoC: tegra: take packing settings
 from the audio cif_config
Date: Wed, 18 Sep 2019 10:16:26 +0100
Message-ID: <09346757-7643-f014-f054-35d981daad63@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-9-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190917181233.534-9-ben.dooks@codethink.co.uk>
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
Cc: linux-kernel@lists.codethink.co.uk, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 17/09/2019 19:12, Ben Dooks wrote:
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
> index 58e05ceb86da..c2f2e29dd32e 100644
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
Ah maybe this is what I am missing from the previous patch. So the last
patch was a preparatory patch for this one.

Sameer, how is this handled in the case of Tegra210?

Cheers
Jon

-- 
nvpublic
