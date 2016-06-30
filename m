From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] ASoC: tegra: add tegra sgtl5000 machine driver
Date: Thu, 30 Jun 2016 08:46:23 -0500
Message-ID: <20160630134623.GA12979@rob-hp-laptop>
References: <1466298002-12576-1-git-send-email-marcel.ziswiler@toradex.com>
 <1466298002-12576-2-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466298002-12576-2-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 19, 2016 at 03:00:00AM +0200, Marcel Ziswiler wrote:
> This binding and driver describe/support playback to headphones, and
> capture from line-in and microphone.
> 
> This driver is useful for the Toradex Apalis T30, Apalis TK1 and
> Colibri T30 modules.
> 
> Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> Changes in v4:
> - simple-audio-card does still not allow for more advanced use cases
>   like Tegra SoCs
> - further platform drivers have been accepted since my last attempt
>   (e.g. rt5677 one)
> - relevance for one further board the new Toradex Apalis TK1
> - drop unused sound/jack.h include
> - in tegra_sgtl5000_driver_remove() pass return value of
>   snd_soc_unregister_card() on to caller
> - no longer set owner property in platform_driver to THIS_MODULE
> - re-based/resend
> 
> Changes in v3:
> - revert to not using simple-audio-card being incompatible with tegra
> - rebased to for-next
> 
> Changes in v2:
> - using simple-audio-card as suggested by Fabio
> 
>  .../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |  42 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  sound/soc/tegra/Kconfig                            |  11 ++
>  sound/soc/tegra/Makefile                           |   2 +
>  sound/soc/tegra/tegra_sgtl5000.c                   | 212 +++++++++++++++++++++
>  4 files changed, 267 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
>  create mode 100644 sound/soc/tegra/tegra_sgtl5000.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
