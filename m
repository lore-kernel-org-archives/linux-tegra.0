From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ASoC: Allow device tree to specify a card's name
Date: Thu, 8 Dec 2011 01:31:47 +0000
Message-ID: <20111208013147.GE5748@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323291510-22338-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 01:58:25PM -0700, Stephen Warren wrote:

> +sound {
> +	compatible = "nvidia,tegra-audio-wm8903",
> +		     "generic,soc-audio-complex";
> +	user-visible-name = "tegra-wm8903-harmony";

That user visible name is idiomatic for device tree but it's not
idiomatic for humans I fear :)

I'd be tempted to use embedded or something indicating that it's for the
use of discrete components rather than SoC.  Not had a chance to look at
the actual code yet, sorry.
