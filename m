From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 6/6] ASoC: Tegra: Harmony: Support both int and ext mics
Date: Fri, 4 Feb 2011 09:20:26 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310C8EB68@HQMAIL01.nvidia.com>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
 <1296766578-13988-6-git-send-email-swarren@nvidia.com>
 <20110203225235.GD4586@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110203225235.GD4586-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Thursday, February 03, 2011 3:53 PM:
> On Thu, Feb 03, 2011 at 01:56:18PM -0700, Stephen Warren wrote:
> 
> > At present, I'm not sure how best to resolve this. Downstream drivers
> > directly tweaked the wm8903's registers so that both ADCs processed the
> > same input channel.
> 
> The CODEC driver needs to have support for routing the left and right
> channels like things like the WM8993 do.
> 
> >  	{"IN1L", NULL, "Mic Jack"},
> > +	{"IN1R", NULL, "Mic Jack"},
> 
> This looks odd - I'd expect to see separate widgets for the internal
> microphone rather than using the same widget.

Yes, separate widgets would make sense.

However, I wonder how this interacts with mic detection using micbias current.
There is only one mic bias signal, routed to a subset of the mics using the
two per-mic enable GPIOs. Should I just hook up the mic bias detection to
both jacks somehow, or is the only option to just punt on jack detection?

There are no physical plug detection mechanisms on this board.

> This would greatly simplify the driver code without really impacting the
> level of configuration applications need to do (and allowing them to use
> both simultaneously if they want to).

I guess you could, although even with L/R routing implemented for the
single-mic case, I think the only option for dual-mic would be to capture
each mic on its own channel, which seems like an unlikely use case to me.
But who knows, maybe it could be useful for e.g. noise-cancelling in SW?

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
