From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Wed, 6 Apr 2016 19:26:16 +0200
Message-ID: <20160406172616.GB28843@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
 <5705047E.4050700@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5705047E.4050700@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2016 at 06:13:42PM +0530, Kishon Vijay Abraham I wrote:
> On Friday 04 March 2016 09:49 PM, Thierry Reding wrote:
[...]
> > +struct tegra124_xusb_fuse_calibration {
> > +	u32 hs_curr_level[3];
> > +	u32 hs_iref_cap;
> > +	u32 hs_term_range_adj;
> > +	u32 hs_squelch_level;
> > +};
>=20
> All these calibration data can come from dt and a generic PHY function to=
 set
> these data to registers.

This calibration data is actually read from fuses within the chip. As I
understand it the process is that these values are characterized during
chip development and written to the fuses at the fab (or perhaps they
are characterized even as late as at the fab). There should be no need
to read these from DT.

> > +static const char * const tegra124_ulpi_functions[] =3D {
> > +	"snps",
> > +	"xusb",
> > +};
> > +
> > +static const struct tegra_xusb_lane_soc tegra124_ulpi_lanes[] =3D {
> > +	TEGRA124_LANE("ulpi-0", 0x004, 12, 0x1, ulpi),
> > +};
> > +
> > +static struct tegra_xusb_lane *
> > +tegra124_ulpi_lane_probe(struct tegra_xusb_pad *pad, struct device_nod=
e *np,
> > +			 unsigned int index)
> > +{
> > +	struct tegra_xusb_ulpi_lane *ulpi;
> > +	int err;
> > +
> > +	ulpi =3D kzalloc(sizeof(*ulpi), GFP_KERNEL);
> > +	if (!ulpi)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	INIT_LIST_HEAD(&ulpi->base.list);
> > +	ulpi->base.soc =3D &pad->soc->lanes[index];
> > +	ulpi->base.index =3D index;
> > +	ulpi->base.pad =3D pad;
> > +	ulpi->base.np =3D np;
> > +
>=20
> ulpi PHY's can be found dynamically right? Should this use the ulpi
> phy library?

I don't think that would work here. The registered accessed by this code
are all very Tegra specific as far as I can tell. I doubt that any kind
of generic library would work here.

Perhaps you can point me at the exact code you're thinking of. I only
found drivers/phy/ulpi_phy.h and drivers/usb/common/ulpi.c in a quick
search, neither of which seem to provide anything that would be useful
in this context. The former contains a couple of small helpers that I
don't think are appropriate here, whereas the latter seems to want the
driver to implement a ULPI interface, something which the Tegra XUSB pad
controller doesn't expose.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXBUa1AAoJEN0jrNd/PrOhHvkP/2+uuOuKuLW6VaECcXqc/oe8
w14/4rE2AUCO24MNimrP8NOenMk1abO+7aN8VCXmmks0PSC8FJ6/CKHxDGG0Lqkk
49RDcbbvabTn3ayJ7/QZyJNiJTdJtJQD38INC8dV4lPH0JN9IVf2TVpN1wwqAnBh
VGUHWGmMkUOs0F0ql3CBy+Gu/uyxOww7mAombFrK+gJEHdn8MYLWd/hHU5C+OEQA
dNKFcvrcUBry0RN557Zuw2rZm+xoLS6Ug4e+vNsDPCRgNjn3kF/DKc7sUW5VnfsZ
lkofyVi4MSJ3LXoIlcPE7/MAv8g3Yljhfv2IyQ1egOIjM5x/NMbB+oFZ/r5J/0ZV
GUHvdfcxRZ00odpzAdqQmvA/Nb4p7FYX3J62Alu4XmvdWSI+JfdJxlGFvc3lDl/b
iweqISBKdP14kovDlnkGx86+mycS9IwfjIdq50BrdUvgQ1j/sS9tNNUb4P/t8AF9
4wvyBDSmInAQr5wcC2w3FlM+A+BK5qV1llRO68/vi7NZ6yy/uaXVSGehfoMyyeGp
Tgcvls5M3Pb1skMN54PXRL9oOBbRbcal1Sf0BL5Fj8GPxq7nk54zXS/epFnKqwDV
o9+tO9se2v5CstlJvhR/A+VyoAAm3VtdGNPA2Mv2g87ZjPZFhejquTJXyxpfSn8Y
/G/d1b9OSwBwmhJsx8i1
=Jkak
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
