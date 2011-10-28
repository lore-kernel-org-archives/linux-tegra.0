From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: RE: [PATCH v2 3/3] staging: nvec: add device tree support
Date: Fri, 28 Oct 2011 09:56:41 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB4D1@HQMAIL01.nvidia.com>
References: <cover.1319658296.git.marvin24@gmx.de>
 <48050ec08d248a2a10b4f5faf6cac6b214041ebe.1319658296.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B498B@HQMAIL01.nvidia.com>
 <1564609.ncycBzfDcY@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1564609.ncycBzfDcY@fb07-iapwap2>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org" <devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Friday, October 28, 2011 5:02 AM:
> Am Donnerstag, 27. Oktober 2011, 12:17:25 schrieb Stephen Warren:
> > Marc Dietrich wrote at Wednesday, October 26, 2011 1:59 PM:
> > > This adds device tree support to the nvec driver. By using this method
> > > it is no longer necessary to specify platform data through a board
> > > file.
...
> > > +/* Match table for of_platform binding */
> > > +static const struct of_device_id nvidia_nvec_of_match[] __devinitconst = {
> > > +	{ .compatible = "nvidia,nvec", },
> >
> > I'm not sure that nvidia,nvec is the right value, but need a little more
> > background.
> >
> > It's my understanding that how this works is a little micro-controller
> > exists on the board, handles various devices like the keyboard, and sends
> > data to Tegra by making I2C master transactions. Isn't it the case that
> > the micro-controller (or at least the SW running on it) is board-specific,
> > and the same for the I2C protocol? If so, nvidia,nvec is a little generic;
> > we probably need to name it compal,paz00-ec or something like that?
> 
> The firmware (for the 8051 mc inside the keyboard controller) is likely made by
> Compal, but as Julian already said, the EC protocol definition is very likely from
> NVIDIA itself. Compal just implemented it for the master. You may refer to
> <http://nv-
> tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=commitdiff;h=12114faf442a8c6aac81a9702712077364db0e82>
> Also this protocol is not board specific as many first generation boards/device use
> it, so "nvidia,nvec" should be correct here.
> 
> > Either way, we should probably include some kind of version number in
> > the compatible property so we can support upgrades to the protocol if
> > needed.
> 
> You may ask your colleagues on that topic, but it seems that the protocol is dead
> already, e.g. it wasn't implemented for the new-world kernels (>= .36) anymore.

OK, I asked internally and it sounds like this is /probably/ standardized.

That said, there are apparently some OEMs who did change the protocol
and do something slightly different. I'm trying to confirm whether PAZ00
was one of them. I guess not if PAZ00 works with the standard driver that
you linked to.

So the good news is that there's an internal specification for this
protocol, and we might be able to release it. I'll let you know if/when
there are updates on this.

I'd like to call this "nvidia,nvec-1.0" to version this compatible
property; that's the specification version in the latest document that
I saw. While we do seemed to have abandoned this approach, I want to
make sure this is extensible if someone suddenly decides to go back to
it and creates a 2.0 in the future. Does that seem reasonable?

-- 
nvpublic
