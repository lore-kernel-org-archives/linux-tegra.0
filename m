From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] ASOC: tegra: fix matching of AC97 components
Date: Tue, 23 Jul 2013 09:49:59 -0700
Message-ID: <51EEB437.5030805@wwwdotorg.org>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de> <1374442132-24040-3-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-3-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/21/2013 02:28 PM, Lucas Stach wrote:
> Matching works completely based on the cpu of_node.

> diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c

>  static struct snd_soc_dai_link tegra_wm9712_dai = {
>  	.name = "AC97 HiFi",
>  	.stream_name = "AC97 HiFi",
> -	.cpu_dai_name = "tegra20-ac97",
>  	.codec_dai_name = "wm9712-hifi",
>  	.codec_name = "wm9712-codec",

Shouldn't codec_of_node be used in preference to codec_name too?
