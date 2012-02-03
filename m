From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v2 3/4] ASoC: Tegra+ALC5632: Enable headsetautodetection on PAZ00 board.
Date: Fri, 03 Feb 2012 11:24 +0100
Message-ID: <4279358.jLYZpuDUmS@ax5200p>
References: <1328213618-15870-1-git-send-email-leon@leon.nu> <1328213618-15870-4-git-send-email-leon@leon.nu> <20120202224355.GD3112@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120202224355.GD3112-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 02 February 2012 22:44:02 Mark Brown wrote:
> On Thu, Feb 02, 2012 at 10:13:37PM +0200, Leon Romanovsky wrote:
> > This patch is adding device tree support of headset autodetection on
> > PAZ00 board.
> Applied, thanks.  I wonder if we ought to have a standard binding for
> GPIO based headset detect...  can be tricky, though, when it gets
> integrated with more advanced mechanisms.

arrr, I was too slow. Small nit below.

> diff --git a/sound/soc/tegra/tegra_alc5632.c
> b/sound/soc/tegra/tegra_alc5632.c index c0ba1e4..1794139 100644
> --- a/sound/soc/tegra/tegra_alc5632.c
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -18,6 +18,7 @@
> 
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/gpio.h>
> 
> +#include <linux/of_gpio.h>
> 
>  #include <sound/core.h>
>  #include <sound/jack.h>
> 
> @@ -34,9 +35,13 @@
> 
>  #define DRV_NAME "tegra-alc5632"
> 
> +#define GPIO_HP_DET     BIT(0)
> +
> 
>  struct tegra_alc5632 {
>  
>         struct tegra_asoc_utils_data util_data;
>         struct platform_device *pcm_dev;
> 
> +       int gpio_requested;
> +       int gpio_hp_det;
> 
>  };
>  
>  static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream
>  *substream,> 
> @@ -86,6 +91,13 @@ static struct snd_soc_jack_pin
> tegra_alc5632_hs_jack_pins[] = {> 
>         },
>  
>  };
> 
> +static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio = {
> +       .name = "Headset detection",
> +       .report = SND_JACK_HEADSET,
> +       .debounce_time = 150,
> +       .invert = 1,
> +};
> +
> 
>  static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
>  
>         SND_SOC_DAPM_SPK("Int Spk", NULL),
>         SND_SOC_DAPM_HP("Headset Stereophone", NULL),
> 
> @@ -114,6 +126,9 @@ static int tegra_alc5632_asoc_init(struct
> snd_soc_pcm_runtime *rtd)> 
>  {
>  
>         struct snd_soc_codec *codec = rtd->codec;
>         struct snd_soc_dapm_context *dapm = &codec->dapm;
> 
> +       struct device_node *np = codec->card->dev->of_node;
> +       struct tegra_alc5632 *machine =
> snd_soc_card_get_drvdata(codec->card); 
> +       int ret;

This one isn't used, but non critical (just creates a warning).

Marc
