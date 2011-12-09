From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ASoC: Allow device tree to specify a card's name
Date: Fri, 9 Dec 2011 11:17:47 +0800
Message-ID: <20111209031745.GA26952@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
 <1323371825.9968.5.camel@odin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323371825.9968.5.camel@odin>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 08, 2011 at 07:17:05PM +0000, Liam Girdwood wrote:

> It also seems that once 1 & 2 are applied, we would almost be able to
> just have a generic "device tree" machine driver for some simple ASoC
> machines that have DAPM and no other external logic atm. We would just
> be missing some runtime configuration for the the DAIs though.

The big problem being sidestepped here is clocks.
