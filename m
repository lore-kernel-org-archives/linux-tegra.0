From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 17/17] ASoC: Tegra+WM8903 machine: Add device tree binding
Date: Wed, 23 Nov 2011 11:26:08 +0000
Message-ID: <20111123112608.GI21073@opensource.wolfsonmicro.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
 <1322011285-4002-18-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-18-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2011 at 06:21:25PM -0700, Stephen Warren wrote:

This looks basically fine, a few comments and obviously it depends on
the other patches in the series.

> +	nvidia,routing =
> +		"Headphone Jack", "HPOUTR",
> +		"Headphone Jack", "HPOUTL",
> +		"Int Spk", "ROP",
> +		"Int Spk", "RON",
> +		"Int Spk", "LOP",
> +		"Int Spk", "LON",

Hrm, I'm thinking we should generalise this for use by other systems -
at least OMAP has a similar stuff in mainline and a lot of phone vendors
who spin many devices from a platform design have broadly the same
pattern of a core reference design with per board wiring differences
that need to be represented in their code.  We'll need to work out what
to do about the board defined widgets, though.

We should also add a standard property or other mechanism for setting a
display name for the card.

> +		"Mic Bias", "Mic Jack",
> +		"IN1R", "Mic Bias";

Before we merge this we should refactor the WM8903 mic bias to a supply
widget, this stuff is both nasty and very Linux specific.

> +	pdata = &machine->pdata;
> +	np = card->dev->of_node;
> +
> +	if (card->dev->platform_data) {
> +		*pdata = *(struct tegra_wm8903_platform_data *)
> +						card->dev->platform_data;

I'd go through a local variable or use memcpy() rather than having this
long code.

> +	} else if (np) {
> +		/*
> +		 * This part must be in init() rather than probe() in order to
> +		 * guarantee that the WM8903 has been probed, and hence its
> +		 * GPIO controller registered, which is a pre-condition for
> +		 * of_get_named_gpio() to be able to map the phandles in the
> +		 * properties to the controller node. Given this, all
> +		 * pdata & OF handling is in init() for consistency.
> +		 */

I wonder how the probe retry stuff is getting on...

> +	if (np) {
> +		card->num_dapm_routes =
> +			of_property_count_strings(np, "nvidia,routing");
> +		if (card->num_dapm_routes & 1) {
> +			dev_err(card->dev,
> +				"Property 'nvidia,routing's length is odd\n");
> +			return -EINVAL;

I'd say "not even" for clarity here.
