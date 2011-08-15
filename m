From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH 06/12] arm/dt: Tegra: Add pinmux node
Date: Mon, 15 Aug 2011 09:41:20 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA2507E@HQMAIL01.nvidia.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
	<1313189697-21287-7-git-send-email-swarren@nvidia.com>
 <CAOesGMheuUfSe1uUA6LxZ71V0-DR3XX7bEJqhVxJ-ZqrWWa1bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMheuUfSe1uUA6LxZ71V0-DR3XX7bEJqhVxJ-ZqrWWa1bA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Sunday, August 14, 2011 1:25 AM:
> On Fri, Aug 12, 2011 at 3:54 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Add a pinmux node to tegra20.dtsi in order to instantiate the futur=
e
> > pinmux device. Add pinmux nodes to Harmony and Seaboard, which deta=
il
> > the entire default pinmux configuration. This configuration is iden=
tical
> > to that in board-harmony/seaboard-pinmux.c.
>=20
> Again, documentation for the binding is needed.

Yes. It should have been there, but I screwed up.

> Seeing the table coded up now though, I wonder if it could make sense
> to flip it around? The number of functions multiplexed out are fewer
> than the pin groups (and this would be even more true on platforms
> that have per-pin configurations and/or smaller groups).

There are 116 pin groups and 61 functions, so this certainly would redu=
ce
the size of the tree.

> I.e. something like:
>=20
>     sdio4 {
>             nvidia,pingroups =3D < DTA DTD >; // Not sure how to
> reference this though -- integers would be hard to read. DTA/DTD
> aren't valid values in the syntax.
>             nvidia,pull-up
>     },
>=20
> And any pingroups not covered by a function would be left alone

I'm personally inclined not to do this.

a) The HW registers are laid out such that each pingroup has various
properties, so the current binding represents that directly. That said,
inverting the table would contain exactly the same data, so this argume=
nt
is slightly tenuous/arbitrary, except that:

b) I think we'd still need tristate and pull properties per pin-group
either way; within a given special function, I see no reason for every
pingroup to need the same pull/tristate values (otherwise, I imagine th=
e
Tegra HW designers would have lumped all the pins into a single pingrou=
p
already). For example, an interface with data and control signals might
need pullups on control signals, but none on data.

c) Similar to that, a RSVD/NONE (or otherwise unused) function might be
used for a bunch of pingroups that are in fact used by GPIOs, and hence
only the pull/tristate values are relevant, since the GPIO controller
will actually control the data on the line. In this case, there's no=20
reason to assume that different pingroups that have the same function a=
re
related in any way, and hence should have the same pull/tristate.

Given, b/c, we'd need an array of pull/tristate values per pingroup wit=
hin
a given function, and I think the syntax for that would be sufficiently
complex that the binding in the current patchset makes more sense.

Do you agree?

> (one
> could easily define a few no-op functions to set pull up/down and
> tristate values on the unused groups).

The binding (and original pinmux code) does define RSVD1/2/3/4 function=
s
for the case where a pingroup should be programmed to an unused/quiesce=
nt
state. There's also a NONE function for the pingroups that don't suppor=
t
muxing, but just pullup/down and tristate.

> [...]
>=20
> > + =A0 =A0 =A0 pinmux: pinmux@70000000 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ATA {
>=20
> I would prefer seeing these in lower case (since device tree tends to
> be no-caps). Should be easy to switch to strcasecmp in the code.

Sure.

> [...]
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 CDEV2 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,function =3D "=
PLLP_OUT4";
>=20
> The string here is a bit unfortunate. It's really just used to map
> from the string to an integer anyway, with the reverse mapping being
> produced by the debugfs output. But especially if the function is
> flipped above, the different pingroups referenced might not use the
> same value for each function, so some sort of lookup will still be
> needed. Not much to do about, it seems. :(

I originally considered syntax like:

    nvidia,function =3D <33>; // PLLP_OUT4

However, I figured this was problematic because:

a) Calculating the integers would be problematic; pinmux.h doesn't
currently list the integer for each value in enum tegra_mux_func, altho=
ugh
I suppose it and the binding documentation could easily be modified to =
do
so.

b) With just an integer, it's much harder to know what the value means.

c) With both the integer and comment, they can get out of sync if
incorrectly edited.

I'd be much more included to use integers if the *.dts files wer run
though the pre-processor, and hence defines could be used. I do observe
that Documentation/devicetree/booting-without-of.txt says:

    It is also suggested that you pipe your source file through cpp (gc=
c
    preprocessor) so you can use #include's, #define for constants, etc=
=2E..

> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,pull =3D "down=
";
>=20
> This should be done by discrete properties instead: nvidia,pull-up,
> nvidia-pull-down (and omitted means normal), without values.

OK.

--=20
nvpublic
