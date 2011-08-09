From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] ASoC: Tegra: WM8903: Allow re-insertion of module
Date: Tue, 9 Aug 2011 09:43:48 +0900
Message-ID: <20110809004346.GA22795@opensource.wolfsonmicro.com>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
 <1312497884-1599-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312497884-1599-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 04, 2011 at 04:44:43PM -0600, Stephen Warren wrote:
> Two issues were preventing module snd-soc-tegra-wm8903.ko from being
> removed and re-inserted:

I've applied all three but please be a bit clearer with your patch
descriptions - this isn't a patch for WM8903 at all, it's a patch for
the tegra-wm8903 machine driver.
