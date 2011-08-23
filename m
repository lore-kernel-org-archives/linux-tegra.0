From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH] ASoC: Tegra: wm8903 machine driver: Drop
	Ventana support
Date: Tue, 23 Aug 2011 20:26:59 +0100
Message-ID: <4E53FF03.1030100@ti.com>
References: <1314119788-23000-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1314119788-23000-1-git-send-email-swarren@nvidia.com>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 23/08/11 18:16, Stephen Warren wrote:
> Board file support for Ventana is not yet mainlined, and probably won't
> ever be given the move to Device-Tree. Consequently, the Ventana entry
> is being removed from arch/arm/tools/mach-types in the next merge window,
> since it was registered over a year ago.
> 
> This will also remove function machine_is_ventana(), which is used by
> the ASoC Tegra WM8903 machine driver. This will cause compilation
> failures. Drop Ventana support to resolve this.
> 
> Hopefully, in the not-too-distant future, tegra_wm8903.c will be able to
> configure itself from Device-Tree, and hence we'll be able to re-instate
> Ventana support just by creating a .dts file for the board.
> 
> Also note that Aebl support is in a similar boat. However, that board
> isn't scheduled for deprecation for at least another 5 months, and
> perhaps we will have completely removed non-Device-Tree support from
> tegra_wm8903.c by then and/or adjusted mach-types policy.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Acked-by: Liam Girdwood <lrg@ti.com>

> ---
>  sound/soc/tegra/tegra_wm8903.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
> index 661373c..be27f1d 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -319,7 +319,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
>  	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
>  
>  	/* FIXME: Calculate automatically based on DAPM routes? */
> -	if (!machine_is_harmony() && !machine_is_ventana())
> +	if (!machine_is_harmony())
>  		snd_soc_dapm_nc_pin(dapm, "IN1L");
>  	if (!machine_is_seaboard() && !machine_is_aebl())
>  		snd_soc_dapm_nc_pin(dapm, "IN1R");
> @@ -395,7 +395,7 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, card);
>  	snd_soc_card_set_drvdata(card, machine);
>  
> -	if (machine_is_harmony() || machine_is_ventana()) {
> +	if (machine_is_harmony()) {
>  		card->dapm_routes = harmony_audio_map;
>  		card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
>  	} else if (machine_is_seaboard()) {
