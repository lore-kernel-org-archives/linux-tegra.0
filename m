From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: RE: [PATCH v1] clocksource: tegra: Add nvidia,tegra30-timer compat
Date: Tue, 4 Feb 2014 21:22:50 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1402042122320.24986@ionos.tec.linutronix.de>
References: <1391203779-5676-1-git-send-email-achew@nvidia.com> <52EFC652.9000209@linaro.org> <643E69AA4436674C8F39DCC2C05F763863199852C7@HQMAIL03.nvidia.com> <alpine.DEB.2.02.1402042004000.24986@ionos.tec.linutronix.de>
 <643E69AA4436674C8F39DCC2C05F76386319985620@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76386319985620-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 4 Feb 2014, Andrew Chew wrote:

> > > > On 01/31/2014 10:29 PM, Andrew Chew wrote:
> > > > > There are some differences between tegra20's timer registers and
> > > > > tegra30's (and later).  For one thing, the watchdogs don't seem to
> > > > > be present in tegra20.
> > > >
> > > > "don't seem", so it is an assumption ?
> > >
> > > No, this is not an assumption.  It has been verified by other NVIDIA
> > > engineers since I proposed this change.
> > 
> > So why is your changelog saying "don't seem to be" ?
> 
> I updated the commit message (see V2 of this patch).  I hope the new
> commit message satisfies the concerns:
> 
> "There are some differences between tegra20's timer registers and tegra30's
> (and later).  For example, tegra30 has more timers.  In addition, watchdogs are
> not present in tegra20.
> 
> Add this compatibility string in order to be able to distinguish whether the
> additional timers and watchdogs are there or not."

Yup, that's way more understandable.
 
