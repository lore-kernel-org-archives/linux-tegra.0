From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Mon, 23 Jan 2012 08:18:37 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81A90@HQMAIL01.nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
	<1326932212-30346-1-git-send-email-swarren@nvidia.com>
	<20120119053143.GA27447@quad.lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF1780DAB0CA@HQMAIL01.nvidia.com>
 <CAOesGMh=i3EED-XhOpwGj8Vuma3xA0WehRL1iK1LSZfEuetP6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh=i3EED-XhOpwGj8Vuma3xA0WehRL1iK1LSZfEuetP6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Saturday, January 21, 2012 12:32 AM:
> On Thu, Jan 19, 2012 at 9:17 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Olof Johansson wrote at Wednesday, January 18, 2012 10:32 PM:
> >> On Wed, Jan 18, 2012 at 05:16:52PM -0700, Stephen Warren wrote:
> >> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegr=
a20-car.txt
> >> > +* NVIDIA Tegra20 Clock And Reset Controller
> >> > +
> >> > +This binding uses the common clock binding:
> >> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> > +
> >> > +The CAR (Clock And Reset) Controller on Tegra is the HW module =
responsible
> >> > +for muxing and gating Tegra's clocks, and setting their rates.
> >> > +
> >> > +Required properties :
> >> > +- compatible : Should be "nvidia,<chip>-car"
> >> > +- reg : Should contain CAR registers location and length
> >> > +- clocks : Should contain phandle and clock specifiers for two =
clocks:
> >> > + =A0the 32 KHz "32k_in", and the board-specific oscillator "osc=
".
> >> > +- clock-names : Should contain a list of strings, with values "=
32k_in",
> >> > + =A0and "osc".
=2E..
> >> > +Example:
> >> > +
> >> > +clocks {
> >> > + =A0 clk_32k: oscillator@0 {
> >>
> >> If it has a unit addres (@<x>) it needs a reg property with the sa=
me base
> >> address.
> >
> > I thought everything needed a unit address period? Is the rule more=
 like
> > the unit address is optional, but if present must match reg, so I c=
an
> > simply remove @0 and @1 here? I guess that makes a lot more sense.
>=20
> Nope, you only need a unit address to make a node unique, i.e. if you
> have more than one with the same name. It's not something that's been
> followed very well on ARM dts files, I have even seen review comments
> asking for explicit unit IDs when none are needed.
>=20
> So you can't remove @0 and @1 here, since there are two oscillator su=
bnodes.

If I keep the unit address, then I need to add a reg property per Mitch=
's
response. But, then I need #address-cells and #size-cells in the clock
node too. Yuck, since this isn't an addressable bus.

Instead, is it acceptable to simply rename the nodes to e.g.:

clk_32k: clock {...};
osc: crystal {...};

In the long term, I believe that osc/crystal is going to continue to
be a top-level object, but clk_32k is actually an output from the PMU
chip, and hence there won't be any naming conflict here anyway...

--=20
nvpublic
