From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] ARM: tegra: paz00: Fix board pinmux table.
Date: Tue, 18 Oct 2011 09:10:42 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CB3B@HQMAIL01.nvidia.com>
References: <1318691913-9597-1-git-send-email-leon@leon.nu>
 <201110151834.22732.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4A4@HQMAIL01.nvidia.com>
 <9849440.cSOtOCBmUT@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9849440.cSOtOCBmUT@ax5200p>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Tuesday, October 18, 2011 9:50 AM:
> On Monday 17 October 2011 08:29:01 Stephen Warren wrote:
> > Marc Dietrich wrote at Saturday, October 15, 2011 10:34 AM:
> > > Am Samstag 15 Oktober 2011, 17:18:33 schrieb Leon Romanovsky:
> > > > This fix updates the CDEV1 pinmux for the paz00 board to be as in the
> > > > Harmony board. Paz00 board is originally based on Harmony design.
> > >
> > > the fact that this patch makes sound work on paz00 does not necessary mean
> > > that this is the "right thing" to do.
> >
> > > First, the initial state should be
> > > TRISTATE, because sound layer should switch between NORMAL/TRISTATE
> > > automaticly to save some power.
> >
> > None of the other boards do that, and the drivers don't support it. I
> > believe the clock would need to be started as soon as the audio driver
> > module were loaded, and kept running as long as it was loaded, so there's
> > not much chance of optimizing power here at the moment.
> 
> Which driver?

The whole ASoC driver stack. It may depend on the codec, but I assume that
CDEV1 clock output should be running the whole time the ASoC codec driver
is active. Alsa-devel would be the best place to ask about that kind of
thing.

...
> > I don't know why there's a pull-down there in the Android kernel; there's
> > no need as far as I know, since it's a clock signal. I'd go so far as to
> > believe that a pull-down would distort the clock signal slightly.
> 
> Is there some docu somewhere about what PUPD_NORMAL and POPD_PULL_DOWN means?
> I know the meaning of TRISTATE and PULL_DOWN/UP from electronics, but
> that does not define what the NORMAL state is.

"NORMAL" means no pull-up or pull-down, or not tri-stated. It's badly
named.

> I also don't see why you can't get a nice clock signal out of a pull down pin.
> If inactive, the pin is high (e.g. +3.3V), while when active it is pulled to
> zero (ok, it's logical inverted).

Well, I may be wrong, but the pin will attempt to drive a nice symmetric
signal, yet with a pull-up/down, there will be some slight drive on the
wire that'll tend to pull the signal towards 0v/3.3v the whole time which
will distort it. Whether this is a problem for this particular signal,
pull-up/down strength, etc. is something I don't know. Certainly, the
pull isn't actually needed AFAIK, so it may as well be removed.

-- 
nvpublic
