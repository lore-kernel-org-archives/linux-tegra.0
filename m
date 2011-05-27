From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH] ASoC: Tegra: Enable Kaen HP_MUTE at boot
Date: Fri, 27 May 2011 10:19:39 +0100
Message-ID: <4DDF6CAB.2080409@ti.com>
References: <1306435610-27810-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1306435610-27810-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>
List-Id: linux-tegra@vger.kernel.org

On 26/05/11 19:46, Stephen Warren wrote:
> We want the default state of the HP_MUTE signal to be asserted, so that
> the headphones are muted before the first audio playback. Without this,
> the headphones are left unmuted until shortly after the first audio
> playback completes.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  sound/soc/tegra/tegra_wm8903.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
> index 0d6738a..a42e9ac 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -267,7 +267,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
>  		}
>  		machine->gpio_requested |= GPIO_HP_MUTE;
>  
> -		gpio_direction_output(pdata->gpio_hp_mute, 0);
> +		gpio_direction_output(pdata->gpio_hp_mute, 1);
>  	}
>  
>  	if (gpio_is_valid(pdata->gpio_int_mic_en)) {

Acked-by: Liam Girdwood <lrg@ti.com>
