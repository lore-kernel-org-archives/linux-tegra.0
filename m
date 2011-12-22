From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V5] ASoC: Allow DAI links to be specified using device
 tree nodes
Date: Thu, 22 Dec 2011 11:00:54 +0000
Message-ID: <20111222110053.GD4546@opensource.wolfsonmicro.com>
References: <1324489259-17483-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324489259-17483-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 21, 2011 at 10:40:59AM -0700, Stephen Warren wrote:
> DAI link endpoints and platform (DMA) devices are currently specified
> by name. When instantiating sound cards from device tree, it may be more
> convenient to refer to these devices by phandle in the device tree, and

Applied, thanks.
