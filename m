From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 4/6] ASoC: Allow DAI links to be specified using
 device tree nodes
Date: Fri, 9 Dec 2011 14:03:40 +0800
Message-ID: <20111209060339.GE26952@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
 <1323291510-22338-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323291510-22338-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 01:58:28PM -0700, Stephen Warren wrote:
> DAI link endpoints and platform (DMA) devices are currently specified
> by name. When instantiating sound cards from device tree, it may be more
> convenient to refer to these devices by phandle in the device tree, and
> for code to describe DAI links using the "struct device_node *"
> ("of_node") those phandles map to.

I would've applied this but it depends on a previous patch so it won't
apply as-is.
