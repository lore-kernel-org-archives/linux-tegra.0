From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] ASoC: Tegra: Implement SPDIF CPU DAI
Date: Tue, 5 Jul 2011 12:25:06 -0700
Message-ID: <20110705192505.GA8642@opensource.wolfsonmicro.com>
References: <1309884927-8437-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1309884927-8437-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 05, 2011 at 10:55:27AM -0600, Stephen Warren wrote:
> This is a minimal driver for the Tegra SPDIF controller.
> 
> In hardware, the SPDIF output signal is always routed to any active HDMI
> display controllers, and may also be routed to external pins on Tegra
> using the pinmux.

Applied, thanks.
