From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 0/3] Tegra30 clockframework
Date: Wed, 4 Jan 2012 14:28:17 +0200
Message-ID: <20120104122817.GI32619@tbergstrom-lnx.Nvidia.com>
References: <1325517486-22458-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F1220@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F1220-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 04, 2012 at 12:03:30AM +0100, Stephen Warren wrote:
> Peter De Schrijver wrote at Monday, January 02, 2012 8:18 AM:
> > This patchset introduces the tegra30 clockframework. Clocks which require
> > voltage scaling are not included in this version. The implementation doesn't
> > use the generic clock code yet. It's the intention to move to it, once the
> > semantics are fully clarified.
> 
> I'm not particularly familiar with Tegra's clocks, but nothing really
> stood out as wrong with this patch on a quick look-through. It'd be great
> if someone like Colin could look this over.
> 
> A couple thoughts below. You've probably thought about some of these
> already, but I just wanted to make sure:-)
> 
> * Are we following the common clock stuff so we can move over once it's
> ready?
> 

I think we can use the same approach then OMAP4 to convert this to the common
clock stuff.

> * Are Tegra20 and Tegra30 so different we can't re-use any of the code
> in tegra2_clocks.c for Tegra30?
> 

Apart from some small functions (such as clk_measure_input_freq()), it's not
easy to share code between both.

> * The device names in the peripheral clock table might benefit from a
> review to make sure they match tegra2_clocks.c for the drivers we've
> actually upstreamed at least.

Good point. I should check that...

Cheers,

Peter.
