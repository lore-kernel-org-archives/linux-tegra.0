From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: correct playback_dma_data setup
Date: Sat, 20 Jul 2013 21:55:26 -0600
Message-ID: <51EB5BAE.2070306@wwwdotorg.org>
References: <1374374049-30732-1-git-send-email-rizhao@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374374049-30732-1-git-send-email-rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/20/2013 08:34 PM, Richard Zhao wrote:
> The errors were caused by copy/paste mistake in below commit
> since v3.10:
> 3489d50 ASoC: tegra: Use common DAI DMA data struct
> 
> It also corrects slave_id initialization in tegra20_ac97 driver.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hmm, that's what I get for only testing I2S and not SPDIF or AC'97 (not
that I can test the latter).
