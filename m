From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 08:29:18 +0200
Message-ID: <20121018062918.GC24637@avionic-0098.mockup.avionic-design.de>
References: <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
 <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com>
 <20121017065547.GE21783@avionic-0098.mockup.avionic-design.de>
 <507ECCCD.7000600@wwwdotorg.org>
 <D6C615D3E4730340AE82D5BD856631C0A1DA306B31@HQMAIL02.nvidia.com>
 <20121017191240.GA22570@avionic-0098.mockup.avionic-design.de>
 <507F0A03.2050008@wwwdotorg.org>
 <D6C615D3E4730340AE82D5BD856631C0A1DA306B39@HQMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D6C615D3E4730340AE82D5BD856631C0A1DA306B39-QfAaPSPn5qZDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2012 at 01:08:24PM -0700, Jon Mayo wrote:
> > -----Original Message-----
> > From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> > Sent: Wednesday, October 17, 2012 12:42 PM
> > To: Thierry Reding
> > Cc: Jon Mayo; Peter De Schrijver; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Prashant
> > Gaikwad; Joseph Lo
> > Subject: Re: Tegra DRM with HDMI support (\o/)
> >=20
> > On 10/17/2012 01:12 PM, Thierry Reding wrote:
> > > On Wed, Oct 17, 2012 at 11:04:05AM -0700, Jon Mayo wrote:
> > >>> -----Original Message----- From: Stephen Warren
> > >>> [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org] Sent: Wednesday, October 17,
> > >>> 2012 8:21 AM To: Thierry Reding; Jon Mayo Cc: Peter De
> > >>> Schrijver; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Prashant Gaikwad;
> > >>> Joseph Lo Subject: Re: Tegra DRM with HDMI support (\o/)
> > >>>
> > >>> On 10/17/2012 12:55 AM, Thierry Reding wrote:
> > >>>> On Tue, Oct 16, 2012 at 11:28:27AM +0300, Peter De Schrijver
> > >>>> wrote:
> > >>>>>>
> > >>>>>> There are two ways this could work:
> > >>>>>>
> > >>>>>> 1)
> > >>>>>>
> > >>>>>> All clocks needed could be represented in the node of
> > >>>>>> that device (or perhaps in the DC node?) For example,
> > >>>>>> perhaps hdmi might contain:
> > >>>>>>
> > >>>>>> clocks =3D <&car TEGRA_CLK_PLL_D> <&car
> > >>>>>> TEGRA_CLK_PLL_D_OUT_0> <&car TEGRA_CLK_HDMI> ...;
> > >>>>>> clock-names =3D "pll_d", "pll_d_out_0", "hdmi", ...;
> > >>>>>>
> > >>>>>> That should work (I think) with pretty much no
> > >>>>>> modification to the current code, other than calling
> > >>>>>> clk_get(dev, "hdmi") rather than clk_get_sys(NULL,
> > >>>>>> "hdmi").
> > >>>>>>
> > >>>>>> However, I'm not sure this is the best way or not; this
> > >>>>>> still requires the HDMI driver to implement all the
> > >>>>>> clocking policy (e.g. is the HDMI clock a child of PLL_D,
> > >>>>>> PLL_C, PLL_P, ... and what rate should the parent PLL be
> > >>>>>> set to, etc.)
> > >>>>>>
> > >>
> > >> the output setup for HDMI should do setparent on hdmi and dc to
> > >> attach the proper pll and setup the divider (the divider is in
> > >> the DC HW and not in the clock, one of the unusual cases). A
> > >> default policy of always using pll_d2 / pll_d2_out_0 on T30 and
> > >> later for HDMI is going to cover every case we have today. Then
> > >> we can defer making it a configurable thing until someone
> > >> actually needs to do the esoteric configuration.
> > >
> > > I had been thinking about what Stephen mentioned earlier about
> > > sorting out probed modes for which the DC cannot generate an
> > > appropriate frequency. That won't work currently because the
> > > reparenting is done later than the mode probing. If using pll_d and
> > > pll_d2 on Tegra20 and Tegra30 respectively is a safe default we
> > > could actually set up the clock at module probe time so it will be
> > > properly configured when the modes are probed and a call to
> > > clk_round_rate() should be enough to verify that the required
> > > frequency can be set.
> > >
> > >> On T30, HDMI will work with pll_d, but I'm tipping my hand and
> > >> telling you that if you always use pll_d2 you won't have to mess
> > >> with this code in the next few chips. :)
> > >
> > > If we make this configurable in the device tree, we could provide
> > > both the "hdmi" and "base-clock" clocks, where base-clock defaults
> > > to pll_d or pll_d2 depending on the Tegra generation. If some board
> > > requires a more exotic setup it can override the clocks in the
> > > board DTS.
> >=20
> > I think if the parenting is going to be static, lets not have tegradrm
> > do it, but rather encode it into one of
> > arch/arm/mach-tegra/{common,board-dt-tegra[23]0}.c. Eventually, we
> > wish to replace the clock setup tables in those files with tables in
> > device tree, so they can differ easily per-board, which would also
> > handle the DSI situation well.
> >=20
>=20
> Well it's not entirely static. The clock parent should depend on the outp=
ut
> type. rather than on which display controller you are using. Each DC can =
be
> configured for various output types. The output types can be represented =
in
> device-tree if you wish to have them fixed (I'd interpret it as a default
> rather than a fixed setting).
>=20
> T30 and later:
> DSIA - pll_d
> HDMI - pll_d2
> DSIB - pll_d or pll_d2
> RGB(lcd/lvds) - pll_p or pll_d
>=20
> At one time I wanted to just fix pll_d to dc0 and pll_d2 dc1, and may have
> mentioned this to a few of you before. But now I've learned that fixing p=
lls
> to DCs isn't the best approach.
>=20
> Long term I'd like to see DCs that can be switch to different outputs
> dynamically. Our X driver has the hooks to do this, our hardware can do it
> and other DRM drivers support this capability.

I specifically wrote the driver to support this kind of setup. Though it
is actually a builtin feature of the DRM framework, which allows each
output to be configured with a mask of compatible CRTCs (DCs). While
this should work I have never tested this kind of setup before.

As for the clock setup, what you said above confirms that we can do the
reparenting at output module load time. That would allow us to use the
defaults unless otherwise specified by the device tree.

> > If tegradrm does later gain the ability to dynamically fiddle with the
> > clock parenting, we can add entries in the (DT) list of clocks that
> > the DCs or ORs needs; when just 1 is specified it's e.g. the "hdmi"
> > clock and tegradrm never does any reparenting, whereas in the future
> > we could allow 3 to be specified; "hdmi", parent-a, parent-b, and
> > "unlock" any reparenting support.
> >=20
> > >> for T20, you'll want to use pll_d for HDMI, unless you need DSI,
> > >> then you'll have to use pll_c for HDMI. That might be where the
> > >> configuration comes in handy. If you want, you can pretend that
> > >> DSI-based T20 devices aren't important enough to support now.
> > >
> > > I think we can safely ignore DSI for now since the driver doesn't
> > > support it yet anyway. The driver is just a dummy that doesn't do
> > > anything useful right now. But as I mentioned above, it should be
> > > straightforward to override the clock setup on a per-board basis.
> >=20
> > We definitely don't want to preclude DSI from working, so we should
> > consider it. We do support Whistler upstream, and that has a DSI
> > panel, and there were some noises about getting it working sometime.
> >=20
>=20
> DSI should work, just not at the same time as HDMI. Getting both to work =
at
> the same time is a real pain in the neck. I think it is fair to draw a li=
ne
> in the sand and say, at this time, you cannot operate both DSI and HDMI on
> a Tegra2 device with this new driver.

I wasn't saying that we shouldn't support DSI, all I was saying is that
we currently don't have any code to make it work. That's mainly because
I don't have any hardware to test it on and therefore wasn't very
motivated to port the 3000+ lines of code from the downstream driver.

> If someone wants to work out some special cases where it does work for a
> particular product, then great. But I would leave that support out of an
> upstreamable tegradrm driver.

Agreed.

> So a "feature" I would like is that we handle DSI xor HDMI operation.
> dynamically switching between the two. Either by changing the SOR outputs
> for an individual DC (and thus only present a single /dev/fbX device).

We should be able to make this work with the standard Xrandr interface.
If you use the xf86-video-modesetting driver on top of tegra-drm it,
then xrandr will be able to list all the configured outputs and allow
them to be enabled or disabled at will. Again I haven't tested any
setups with two concurrent outputs yet, but I have at least seen xrandr
successfully switch modes for the HDMI output or turn it off altogether.

Also with modern DRM the /dev/fbX interface is really just for legacy
purposes. Everything else can be done using the new DRM interfaces,
which basically allow you to allocate a buffer of a given size and make
it the framebuffer of a given output. So while there is still a /dev/fb0
that can be accessed for legacy purposes, the actual framebuffers aren't
visible as device files any longer but rather as buffer objects to the
owning application (and with the appropriate driver support shareable
using DMA-BUF).

> Or have a mechanism that crosses multiple device instances and refuses to
> allow them to be enabled at the same time. (that's how the Android/L4T
> driver works, but I don't like that way so much)

What DRM/xf86-video-modesetting implements is a mix of both of the
above. You can dynamically enable or disable any of the outputs. I'm not
certain how errors are propagated in case a certain combination cannot
be handled by the DRM, but I don't think that would be a major blocker.

> > Considering a system with dual HDMI outputs and no built-in panel, and
> > with mode timings on both outputs that could both be derived from a
> > single clock, wouldn't using the same PLL for both outputs save power
> > since the second PLL can be shut down? I'm not sure how much power
> > this would save though; perhaps the power savings of a PLL aren't that
> > important vs. the power savings from clock-gating or power-gating the
> > logic that's clocked by the PLL.
> >=20
>=20
> HDMI/CEA modes can be done by setting one pll to 297MHz. Then each DC can
> div-by-2 for 148.5MHz (1080p50/60, 720p60-3d, 1080p30-3d-fp, 1080p60-3d-s=
bs,
> ..) or div-by-4 for 74.25MHz (720p50/60, ...). Thus allowing you to conne=
ct
> any two HDMI TVs and use only one pll.

I think the majority of use-cases will be either LVDS only, HDMI only or
LVDS with HDMI, all of which can be covered using the clock setups that
we've been discussing.

> But most systems with two HDMI outputs will be newer tegras with lots of
> PLLs, so it might not be too worthwhile to consider.

According to the TRM, both the Tegra20 and the Tegra30 have only a
single HDMI output. Is that information wrong or are you talking about
newer generations?

> If you want to do VESA modes, you need dedicated PLLs. as they have lots
> of different unrelated clock rates.

Some of the TV sets that I've been testing on claim to support various
exotic VESA modes. One set even has a preferred mode of 1360x768. But it
doesn't even work properly. You have to switch it to 1366x768 to make it
look acceptable. Again I think if we support all of the HDMI/CEA modes a
lot of ground is covered.

> > > Stephen, what do you think?
> >=20
> > Overall though, a static clock setup, at least initially, sounds
> > reasonable to me.
>=20
> Great, if needed, we can extend it later. I'm satisfied this will cover
> some good use cases, and we can avoid some messy complications.

I suspect that once the driver has made it into mainline and more people
start using it, we'll likely get many bug reports about various modes
not working properly and whatnot. But I think it would be unrealistic to
expect the first version to be perfect.

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQf6G+AAoJEN0jrNd/PrOhrIoP/Aik6tu1TNWhu2/PsNMI2BnK
4iINNpsigmjmPAyBYZZ5hGt2AxvJB6AJN7lEt2U23NfZZG7OlKg5CKBcROi0KG+d
iZV2z2RLurU4EnbZu8bHDhGgBco79AaLWU5YFnpOoZp/CAGkED6c5ycVxxxjoIfz
RYoC7bQzXbNBKXRK+oo0kpUxI8q6feP7NcUBC9BJl4DdfCypzMunJ/501dZ4d+5V
JHoK9eh6/zVTvBIx+P2fvjB1H1FvIOsbgQ9uFh30JkiMSe9HGnsUnYxFytcZDbtG
PQ/CMJqm9UY1AZvxwYa+Htg+5p2AjMGCMrMrVrqEjZvFSOf/H/S4ypllDwa4flEp
b1udC5SiDhzm+XFnJJF3jxiwIs9NDNDnnXRanTCP/q2X0l1v0GJWA7jEWs0FlKi2
Ov7Yff9wDYfLgpk/frWoFAc6txtKT6DGsn4KEhzMbZN095PwjoDFcLU79HW5LHyT
yjpakngI9G/8oS3arNhIZGi89xtI6WWXuKXxBiZs2ZwlOtLe6Jml/VQc2H9U2A7j
vgOc1Zw9rPTDLmEY6op3E4nkXUtUGoP6MOSs7Q2oVIV0a5tEoKbOXGqGGMu1rE5P
U29ZAPMvqVTI4yHfm3FtfEWWHtHhB39zzYgFS1pFV5Pq2sROYumugy+eXGt3EKfL
HMNLl9eBuhdky4K0qlHL
=uMyz
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
