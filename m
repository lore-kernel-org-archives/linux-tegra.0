From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Mon, 23 Jan 2012 11:16:13 -0700
Message-ID: <20120123181613.GA21122@ponder.secretlab.ca>
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
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 20, 2012 at 11:32:04PM -0800, Olof Johansson wrote:
> Hi,
>=20
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
> >>
> >> Hmm. I'd prefer to just ditch the notion of "clock-names" in the c=
ases
> >> where it isn't strictly necessary. Just because some vendors don't=
 want
> >> to define an order between their clocks doesn't mean it's a good i=
dea
> >> for everybody to use that model. In this case, just declaring that=
 the
> >> two clocks refs have to be to those two clocks in that order shoul=
d
> >> be sufficient.
> >
> > OK, that seems reasonable. I'm happy using of_clk_get() rather than
> > of_clk_get_by_name(). I guess that means we should just avoid any
> > discussion of clock-output-names too.
>=20
> Sounds good to me. Let's make sure Grant is OK with it too though.

Yes, I agree.

g.
