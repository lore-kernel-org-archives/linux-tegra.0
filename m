From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] sound: tegra_alc5632: remove HP detect GPIO inversion
Date: Sun, 26 Aug 2012 21:55:49 +0200
Message-ID: <3199962.US3JxCkD1s@ax5200p>
References: <1345864815-19539-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345864815-19539-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Friday 24 August 2012 21:20:15 Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Both the schematics and practical testing show that the HP detect GPIO
> is high when the headphones are plugged in. Hence, the snd_soc_jack_gpio
> should not specify to invert the signal.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.4 v3.5

I tested it and evtest gives back the right stuff with your patch. Can't test 
more because I have no headphone/mic here (I just inserted a screwdriver, 
grr). On 3.1 kernels, we also have no pin inversion, so unless Leon or Andrey 
(cc'ed) have different opinions, this can go through. Just give them a week...

Thanks!

Marc

> ---
>  sound/soc/tegra/tegra_alc5632.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_alc5632.c
> b/sound/soc/tegra/tegra_alc5632.c index e463529..76cb1b3 100644
> --- a/sound/soc/tegra/tegra_alc5632.c
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -89,7 +89,6 @@ static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio
> = { .name = "Headset detection",
>  	.report = SND_JACK_HEADSET,
>  	.debounce_time = 150,
> -	.invert = 1,
>  };
> 
>  static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
