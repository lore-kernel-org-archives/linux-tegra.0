From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] ASoC: Tegra: WM8903: Allow re-insertion of module
Date: Wed, 10 Aug 2011 00:38:03 +0900
Message-ID: <20110809153802.GI15861@opensource.wolfsonmicro.com>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
 <1312497884-1599-2-git-send-email-swarren@nvidia.com>
 <20110809004346.GA22795@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04A068726C@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04A068726C-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 09, 2011 at 08:36:36AM -0700, Stephen Warren wrote:
> Mark Brown wrote at Monday, August 08, 2011 6:44 PM:

> > I've applied all three but please be a bit clearer with your patch
> > descriptions - this isn't a patch for WM8903 at all, it's a patch for
> > the tegra-wm8903 machine driver.

> OK, but what's the correct tag then? I explicitly wrote Tegra in the
> commit subject and not just WM8903...

Something like "Fix reload of Tegra WM8903 machine driver".
