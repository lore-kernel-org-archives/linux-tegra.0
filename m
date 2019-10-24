From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 4/7] ASoC: tegra: disable rx_fifo after
	disable stream
Date: Thu, 24 Oct 2019 17:12:54 +0100
Message-ID: <d108c4e4-5e74-0f33-0665-e6b0f9910523@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-5-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-5-ben.dooks@codethink.co.uk>
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
> We see odd FIFO overruns with this, we assume the best thing to do is
> to disable the RX I2S frontend first, and then disable the FIFO that
> is using it.
> 
> This also fixes an issue where using multi-word frames (TDM) have
> partial samples stuck in the FIFO which then get read out when the
> next capture is started.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index fc77e65a3646..3839e3d955a8 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -236,9 +236,9 @@ static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
>  
>  static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
>  {
> -	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
>  			   TEGRA30_I2S_CTRL_XFER_EN_RX, 0);
> +	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
>  }
>  
>  static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
