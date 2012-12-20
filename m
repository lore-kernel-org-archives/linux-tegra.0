From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/7] ASoC: tegra:  add ac97 host controller to device
 tree
Date: Thu, 20 Dec 2012 12:47:51 -0700
Message-ID: <50D36B67.3090402@wwwdotorg.org>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de> <1355959056-6009-6-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-6-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 04:17 PM, Lucas Stach wrote:
> This adds the DT bindings and a default entry for the Tegra 2x
> AC97 host controller.

Everything here except the .dtsi file should be part of the previous patch.

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt

> +- nvidia,codec-sync-gpio : The Tegra GPIO controller's phandle and the number
> +  of the GPIO corresponding with the AC97 DAP _FS line

Hmm, for I2S at least, FS (frame sync I assume) definitely is something
that the audio controller itself drives. Are you absolutely sure that
this should be represented as a GPIO here?

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> +	tegra_ac97: ac97@70002000 {

There's only 1 node named ac97, so you can leave out the unit address
since it's not required to generate a unique node name. In other words
just "ac97".
