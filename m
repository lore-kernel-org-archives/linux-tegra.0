From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: Tegra: Harmony: Support both
	int and ext mics
Date: Wed, 9 Feb 2011 12:15:57 +0000
Message-ID: <20110209121555.GA27669@sirena.org.uk>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com> <1296766578-13988-6-git-send-email-swarren@nvidia.com> <20110203225235.GD4586@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF0310C8EB68@HQMAIL01.nvidia.com> <20110207111310.GA31475@sirena.org.uk> <74CDBE0F657A3D45AFBB94109FB122FF0310F5FFAC@HQMAIL01.nvidia.com> <20110208205848.GA23844@sirena.org.uk> <74CDBE0F657A3D45AFBB94109FB122FF0310F60084@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310F60084-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 08, 2011 at 03:32:00PM -0800, Stephen Warren wrote:

> Well, one other option is to completely ignore (and disable) the internal
> mic, and just support the external mic (jack). Then, mic detection could
> be implemented. The advantage here is similarity to other boards without
> the mic bias sharing issue. Plus, the jack is probably far more useful
> than the internal mic on this board:

> I honestly don't know how many boards (if any) actually have anything
> plugged into the internal mic header on the board. Mine certainly
> didn't originally; I used a PC speaker I stole from somewhere else as
> the internal mic;-)

That's certainly a sensible option if we don't know that many systems
were shipped with the internal mic connected.  We could do something
like what the AT91SAM9G20 platform does with ifdefed code for the mic
(in that case there's no mic support in the hardware but the CODEC is
in a low density package so it's relatively common for users to lift
pins to flying wire in a mic) I guess.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
