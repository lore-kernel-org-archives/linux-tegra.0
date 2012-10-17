From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Wed, 17 Oct 2012 08:46:40 +0200
Message-ID: <20121017064640.GD21783@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
 <20121013204223.GA24354@avionic-0098.mockup.avionic-design.de>
 <507C35C6.20705@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507C35C6.20705-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2012 at 10:11:50AM -0600, Stephen Warren wrote:
> On 10/13/2012 02:42 PM, Thierry Reding wrote:
> > On Fri, Oct 12, 2012 at 03:17:04PM -0600, Stephen Warren wrote:
> >> On 10/11/2012 11:09 PM, Thierry Reding wrote:
> >>> On Thu, Oct 11, 2012 at 05:36:35PM -0600, Stephen Warren
> >>> wrote:
> > [...]
> >>>> The code in clock.c uses lots of clk_get_sys() calls with=20
> >>>> hard-coded clock names. We really should be using the common=20
> >>>> clock DT bindings for this instead of hard-coding names. This
> >>>> is especially true since the names differ on different SoCs,
> >>>> so there's a ton of
> >>>> of_device_is_compatible(output->dev->of_node,=20
> >>>> "nvidia,tegra30-hdmi") in this code.
> >>>=20
> >>> I don't quite see how that is supposed to work. Wouldn't that
> >>> mean that we needed to setup various entries in the clock
> >>> tables to be able to look the clocks up by generic names? Like
> >>> pll_d would need to be the "parent" clock of "tegra-hdmi" or
> >>> similar. In that case we could call clk_get(hdmi->dev,
> >>> "parent") instead. Is that what you had in mind?
> >>=20
> >> There are two ways this could work:
> >>=20
> >> 1)
> >>=20
> >> All clocks needed could be represented in the node of that device
> >> (or perhaps in the DC node?) For example, perhaps hdmi might
> >> contain:
> >>=20
> >> clocks =3D <&car TEGRA_CLK_PLL_D> <&car TEGRA_CLK_PLL_D_OUT_0>=20
> >> <&car TEGRA_CLK_HDMI> ...; clock-names =3D "pll_d", "pll_d_out_0",
> >> "hdmi", ...;
> >>=20
> >> That should work (I think) with pretty much no modification to
> >> the current code, other than calling clk_get(dev, "hdmi") rather
> >> than clk_get_sys(NULL, "hdmi").
> >=20
> > I thought DT support didn't work for Tegra yet. If that works we
> > should probably get rid of the DRM related entries in the clock
> > tables and put the information in the DT regardless of which of the
> > alternatives is implemented.
>=20
> Certainly, the Tegra clock driver itself doesn't support DT, i.e.
> isn't a DT clock provider. So, this won't work completely right now. I
> believe Prashant had patches to implement this though. Prashant,
> what's the status on those?
>=20
> It looks like the core common clock DT support did make it into 3.7,
> so any dependencies are probably contained within the Tegra tree.
>=20
> Still, perhaps this is something we can clean up later; we'd probably
> benefit more from having some form of tegra-drm in place earlier
> rather than having it later with perfect clock usage, although DT
> binding churn:-(

Yes, I agree. Unless of course if we can get the clock DT support ready
soon, then we might yet be able to fold support into tegra-drm.

Thierry

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQflRPAAoJEN0jrNd/PrOhZFIP/jaTO0sWlw3koCOlOwUR/39+
MLoabN6Ed+P9c8E6jBDhju/nUbyyCc/FCO/J6/vcZzB9vDvKe1U3hITelIVDmjVV
+RFuYmBinYNEwV3sWiSNZ8keI88zCUS6JpSOL1uiz8jEQFOOgMrgQXrHYLXsMEeY
ODUvv2ErwrDWhPaijeUU8Y4DbF82lwFN0cvgVIEx0Z1UM+nHa3hiWs+buTMeZLM3
dHcG08e1XGKNs8pT5kPPKKdrKWBDKGWgZ1ExmI0T619Ae4dI85/ONWJV4/ndHyUs
z4X2oK0IR8K0WxtbHwXhHuVoRdlXtzgjd9k61isBW2SFQEN9hMWnPY2oCzRoY+v/
yFOgDYq04SURKUkDwmTBylGQblY7LwxPzYCbkb+En0YVlJ8Mw1TBECsInlKnla6d
YebTHyhgWgLPm7waWsf8Zruo1kGqO48E/a34y+1QqP28cDquDNT06ptj5tSKJFuA
uhcGLgehBGypOXgMwfDwewPA3YNhFfg/j60T6LEj/IsIX52GEPdbvZlvoNeqps5G
oDdRrFZgjqPYY4CWc1KWduUuHU3BiQonu3/y4wbEtz4uXoyGNaYUPnAaW0kM0mh7
qLlKToOiW1Ckpa9g+GOOVqT4mYeozYDmF1b8NuTwlrQMAhTG269IUlTTbheBfoIn
VkrCbqJ2MmtnhOZgMWrD
=hIia
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
