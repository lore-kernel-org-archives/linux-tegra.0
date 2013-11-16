From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 15/31] ASoC: dmaengine: add custom DMA config
 to snd_dmaengine_pcm_config
Date: Sat, 16 Nov 2013 11:43:29 +0100
Message-ID: <52874C51.30807@metafoo.de>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-16-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-16-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/15/2013 09:54 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add fields to struct snd_dmaengine_pcm_config to allow custom:
> 
> - DMA channel names.
> 
>   This is useful when the default "tx" and "rx" channel names don't
>   apply, for example if a HW module supports multiple channels, each
>   having different DMA channel names. This is the case with the FIFOs
>   in Tegra's AHUB. This new facility can replace
>   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME.
> 
> - DMA device
> 
>   This allows requesting DMA channels for a device other than the device
>   which is registering the "PCM" driver. This is quite unusual, but is
>   currently useful on Tegra. In much HW, and in Tegra20, each DAI HW
>   module contains its own FIFOs which DMA writes to. However, in Tegra30,
>   the DMA FIFOs were split out AHUB HW module, which then routes the data
>   through a cross-bar, and into the DAI HW modules. However, the current
>   ASoC driver structure does not expose this detail, and acts as if the
>   FIFOs are still part of the DAI HW modules. Consequently, the "PCM"
>   driver is registered with the DAI HW module, yet the DMA channels must
>   be looked up in the AHUB HW module's device tree node. This new config
>   field allows that to happen. Eventually, the Tegra drivers will be
>   reworked to fully expose the AHUB, and this config field can be
>   removed.
> 
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
