From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: Tegra: wm8903 machine driver: Drop Ventana support
Date: Wed, 24 Aug 2011 10:33:33 +0100
Message-ID: <20110824093332.GD15687@opensource.wolfsonmicro.com>
References: <1314119788-23000-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1314119788-23000-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 23, 2011 at 11:16:28AM -0600, Stephen Warren wrote:
> Board file support for Ventana is not yet mainlined, and probably won't
> ever be given the move to Device-Tree. Consequently, the Ventana entry
> is being removed from arch/arm/tools/mach-types in the next merge window,
> since it was registered over a year ago.

Applied, thanks.
