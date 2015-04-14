From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL v2 1/2] ARM: tegra: Core code changes for v4.1-rc1
Date: Tue, 14 Apr 2015 10:30:30 +0200
Message-ID: <2204375.plVGQ25v9Q@wuerfel>
References: <1427710333-13472-1-git-send-email-thierry.reding@gmail.com> <201504140109.56537.arnd@arndb.de> <20150414070649.GA11715@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150414070649.GA11715@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 14 April 2015 09:06:50 Thierry Reding wrote:
> On Tue, Apr 14, 2015 at 01:09:56AM +0200, Arnd Bergmann wrote:
> > On Saturday 11 April 2015, Michael Turquette wrote:
> > > > Tomeu Vizoso (8):
> > > >       of: Document long-ram-code property in nvidia,tegra20-apbmisc
> > > >       of: Document timings subnode of nvidia,tegra-mc
> > > >       memory: tegra: Disable ARBITRATION_EMEM interrupt
> > > >       of: document new emc-timings subnode in nvidia,tegra124-car
> > > >       of: document external-memory-controller property in tegra124-car
> > > >       clk: Expose clk_hw_reparent() to providers
> > > 
> > > ... this patch! I'd prefer to not do this. Let's see if
> > > .set_rate_and_parent solve the problem for you.
> > 
> > Not pulling this for 4.1 then. Even without the objections, it was basically
> > too late for the amount of changes now.
> 
> For my education, when do you expect pull requests with "this amount of
> changes" to be sent?

Generally speaking, we want large patch series to come early after -rc1,
followed by smaller subsequent updates. We often don't get around to
applying stuff before -rc3, which is a problem on our side, but it helps
to have patches available by then.

Also, if you have a large series (100+ patches) early on, we'd be more
likely to take a 20-patch series later than if the 20-patch series comes
at rc6 and is the first thing we see from you: after around rc5 or rc6,
what we want to see are mostly patches that directly result from work
that we merged earlier for the same merge window, like regression fixes
or wrapping up a larger series that was started but incomplete at -rc2.

	Arnd
