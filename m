From: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ASoC: Allow device tree to specify a card's name
Date: Thu, 08 Dec 2011 19:17:05 +0000
Message-ID: <1323371825.9968.5.camel@odin>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323291510-22338-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 2011-12-07 at 13:58 -0700, Stephen Warren wrote:
> If a card's device was instantiated from device tree, and the device tree
> has a "user-visible-name" property, use that as the card's name.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: New patch implementing new functionality
> 
> Re: the binding documentation:
> * "SoC" here refers to the fact this is a binding oriented at System-on-
>   chip audio complexes, rather than having to do with "ASoC"; both names
>   were derived from the same root.
> * Do we need a compatible property for this "base class" binding at all?
>   I think it's a good idea, even though the code doesn't actually rely
>   on it.
> * Should the vendor field in the compatible property be "generic",
>   "linux", or absent? I've tried to make these bindings generic and
>   applicable to other OSs, so "linux," seems wrong.
> * Should the property "user-visible-name" have a "generic," prefix or
>   similar?
> 

Just had a quick look and 3 & 4 look mostly fine to me.

3 & 4

Acked-by: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>

It also seems that once 1 & 2 are applied, we would almost be able to
just have a generic "device tree" machine driver for some simple ASoC
machines that have DAPM and no other external logic atm. We would just
be missing some runtime configuration for the the DAIs though.

Liam
