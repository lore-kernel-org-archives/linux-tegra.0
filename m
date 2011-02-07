From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: Tegra: Harmony: Support both
	int and ext mics
Date: Mon, 7 Feb 2011 11:13:10 +0000
Message-ID: <20110207111310.GA31475@sirena.org.uk>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com> <1296766578-13988-6-git-send-email-swarren@nvidia.com> <20110203225235.GD4586@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF0310C8EB68@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310C8EB68-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 04, 2011 at 09:20:26AM -0800, Stephen Warren wrote:

> However, I wonder how this interacts with mic detection using micbias current.
> There is only one mic bias signal, routed to a subset of the mics using the
> two per-mic enable GPIOs. Should I just hook up the mic bias detection to
> both jacks somehow, or is the only option to just punt on jack detection?

> There are no physical plug detection mechanisms on this board.

That's a fairly unusual hardware design, it really needs explaining in
the code - it wasn't at all obvious that you were controlling a FET
reading the patch (and I'm still not entirely clear how exactly things
are wired up).  The simplest way to handle this is probably with a
conditional DAPM route (look at how WM8994 handles SYSCLK for an example
of this), though you'll need to faff around a bit.

Ideally you want the micbias to be enabled all the time for detection of
jack insertion, only flipping the bias over to the internal mic when the
internal mic is being used for recording, and also disable the detection
when the internal microphone is in use.  I'm not sure that this is worth
the bother.

> > This would greatly simplify the driver code without really impacting the
> > level of configuration applications need to do (and allowing them to use
> > both simultaneously if they want to).

> I guess you could, although even with L/R routing implemented for the
> single-mic case, I think the only option for dual-mic would be to capture
> each mic on its own channel, which seems like an unlikely use case to me.
> But who knows, maybe it could be useful for e.g. noise-cancelling in SW?

Most likely would seem to be using the mic jack as a line input for some
purpose and combining it with the results of the internal microphone.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
