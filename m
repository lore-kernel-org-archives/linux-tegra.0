From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in
 device tree
Date: Thu, 8 Dec 2011 12:31:50 +0800
Message-ID: <20111208043149.GA31372@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
 <1323291510-22338-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323291510-22338-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 01:58:26PM -0700, Stephen Warren wrote:

> +	audio-routing =
> +		"Headphone Jack", "HPOUTR",
> +		"Headphone Jack", "HPOUTL",
> +		"Int Spk", "ROP",
> +		"Int Spk", "RON",
> +		"Int Spk", "LOP",
> +		"Int Spk", "LON",
> +		"Mic Jack", "MICBIAS",
> +		"IN1L", "Mic Jack";

Before we do this we first need to come up with a way of specifying the
DAPM nodes.  For the CODEC pins I'm fairly comfortable with just
documenting the fact that we want to use the pins as labelled on the
CODEC datsheet but for other objects on the board we need to come up
with something.  The tricky bit here is jacks - we need to be able to
express headsets, translate them into the separate input and output
widgets that DAPM uses while coping with multiple biases and custom
detection methods.
