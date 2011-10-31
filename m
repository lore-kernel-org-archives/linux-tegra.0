From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 3/3] staging: nvec: add device tree support
Date: Mon, 31 Oct 2011 09:16:14 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB788@HQMAIL01.nvidia.com>
References: <cover.1319658296.git.marvin24@gmx.de>
 <1564609.ncycBzfDcY@fb07-iapwap2>
 <74CDBE0F657A3D45AFBB94109FB122FF173EDAB4D1@HQMAIL01.nvidia.com>
 <2542173.LWlOZpfLLJ@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2542173.LWlOZpfLLJ@ax5200p>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org" <devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Sunday, October 30, 2011 2:58 PM:
> On Friday 28 October 2011 09:56:41 you wrote:
> > Marc Dietrich wrote at Friday, October 28, 2011 5:02 AM:
> > > Am Donnerstag, 27. Oktober 2011, 12:17:25 schrieb Stephen Warren:
> > > > Marc Dietrich wrote at Wednesday, October 26, 2011 1:59 PM:
> > > > > This adds device tree support to the nvec driver. By using this
> > > > > method it is no longer necessary to specify platform data
> > > > > through a board file.
> >
> > ...
> >
> > > > > +/* Match table for of_platform binding */
> > > > > +static const struct of_device_id nvidia_nvec_of_match[]
> > > > > __devinitconst = { +	{ .compatible = "nvidia,nvec", },
...
> > I'd like to call this "nvidia,nvec-1.0" to version this compatible
> > property; that's the specification version in the latest document that
> > I saw. While we do seemed to have abandoned this approach, I want to
> > make sure this is extensible if someone suddenly decides to go back to
> > it and creates a 2.0 in the future. Does that seem reasonable?
> 
> mmh, I can't see why we should add it now. There is no V2 I can see in my
> limited view. If your company plans to expand the protocol you can either
> enhance our driver or create a new one (nvec2), which can add a nvidia,nvec-2
> compatibility property (we can also change ours to nvidia,nvec-1 at the same
> time, but that's not required).

We can't rename anything in DT once we've started using it; if we release
a new kernel that changes (rather than just adds to) the compatible values
it supports, that'd cause old DT files to cease to operate against the new
kernel.

I suppose nvidia,nvec is fine. We can always add nvidia,nvec2 if we do
rev the protocol, and have the existing unnumbered value implicitly be
version 1.

> > That said, there are apparently some OEMs who did change the protocol
> > and do something slightly different. I'm trying to confirm whether PAZ00
> > was one of them. I guess not if PAZ00 works with the standard driver that
> > you linked to.
> 
> There are so called OEM commands which we will move to a board specific nvec
> file (e.g. nvec_paz00.c). We haven't got the chance to test it on other boards
> using it yet (e.g. toshiba folio, advent vega, ...). The tablets are mostly
> using it for power control and maybe also leds/switches. I don't think any
> other board uses keyboard / mouse functions.

It sounded like some OEMS had used a completely different protocol rather
than just making use of the OEM commands. Still, it isn't entirely clear
whether that's true yet. I don't think it impacts this driver/board, so
we can just ignore this for now.

-- 
nvpublic
