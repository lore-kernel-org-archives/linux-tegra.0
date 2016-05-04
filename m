From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: Avoid getting the same reset twice
Date: Wed, 4 May 2016 16:29:05 +0200
Message-ID: <20160504142905.GA30512@ulmo.ba.sec>
References: <1462298755-20857-1-git-send-email-thierry.reding@gmail.com>
 <Pine.LNX.4.44L0.1605031512430.1163-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1605031512430.1163-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 03:16:56PM -0400, Alan Stern wrote:
> On Tue, 3 May 2016, Thierry Reding wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Starting with commit 0b52297f2288 ("reset: Add support for shared reset
> > controls") there is a reference count for reset control assertions. The
> > goal is to allow resets to be shared by multiple devices and an assert
> > will take effect only when all instances have asserted the reset.
> >=20
> > In order to preserve backwards-compatibility, all reset controls become
> > exclusive by default. This is to ensure that reset_control_assert() can
> > immediately assert in hardware.
> >=20
> > However, this new behaviour triggers the following warning in the EHCI
> > driver for Tegra:
>=20
> ...
>=20
> > The reason is that the EHCI implements three ports, each with a separate
> > reset line. However the first port's reset also serves as a means to
> > reset the UTMI pad for all ports. There is special code in the driver to
> > assert and deassert this shared reset at probe time. It needs to do this
> > regardless of which port is probed first. Unfortunately this means that
> > if the first port is probed first, it will request its own reset line
> > and subsequently request the same reset line again (temporarily) to
> > perform the reset. This used to work fine before the above-mentioned
> > commit, but now triggers the new WARN.
> >=20
> > Work around this by making sure we reuse the port's reset if it happens
> > to be the same as the UTMI pad reset.
> >=20
> > Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Possibly related to the problems you are still seeing, I noticed=20
> something odd about the patch.
>=20
> > --- a/drivers/usb/host/ehci-tegra.c
> > +++ b/drivers/usb/host/ehci-tegra.c
> > @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platfo=
rm_device *pdev)
> >  	struct usb_hcd *hcd =3D platform_get_drvdata(pdev);
> >  	struct tegra_ehci_hcd *tegra =3D
> >  		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
> > +	bool has_utmi_pad_registers =3D false;
> > =20
> >  	phy_np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
> >  	if (!phy_np)
> >  		return -ENOENT;
> > =20
> > +	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
> > +		has_utmi_pad_registers =3D true;
>=20
> I would have writte simply:
>=20
> 	has_utmi_pad_registers =3D of_property_read_bool(phy_np,=20
> 			"nvidia,has-utmi-pad-registers");

I wrote it that way specifically because all variants with direct
assignment that I could come up with looked ugly if I wanted the lines
to fit within 80 columns.

> Regardless, notice that has_utmi_pad_registers gets set to true if the=20
> OF property value is true.
>=20
> ...
>=20
> > -	if (!of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers")) {
> > +	if (has_utmi_pad_registers) {
>=20
> But down here the sense of the test is reversed.  Now the conditional=20
> block gets executed if the property is true, whereas the original code=20
> executed it if the property was false.

Good catch! Unfortunately this doesn't help getting rid of the WARN_ON.
However I finally tracked this down, though it took me an embarrassingly
long time because I kept looking at the wrong place.

The reason why this patch doesn't fix it is because the original code is
requesting the wrong reset control in the first place. It's requesting
the control named "usb" to reset the UTMI pads registers where is really
should be requesting the one named "utmi-pads". So the above patch only
works if the first controller ends up being probed first (because that's
when both resets are the same). In any other case the "usb" reset will
still be requested twice.

I've sent out a new patch that should fix all the warnings. I ran it
through the same test system I sent these yesterday and I don't see any
warnings anymore.

Thierry

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKgcuAAoJEN0jrNd/PrOhFOQQAJeIxVCMLm54TLxi4KuVr1Yr
/2RFDWX/S1e4+EeTDpRLkWK3Mz7RMkvgBD7dKIsEIzhj5yN80PZEK2BYT5p62XlY
QzEUDRQ7AF2o8WI8gL6hsJpG5qdXjD9kOtRBC9R/5OoV0A+42wBvpFZxtrZDU4sD
D3u3QlngPkekU92Iah4TRgrUksKYpOUzJg+ImCD8aeL8zXmJAx31jwj4cDQzAvpK
YIifCzhPJ8Bs6lnZjNZFKz+HY/fQJ21RdEYwk0AISuuAadSE9J2+Eo+/Ftv9f47r
kAdrHiPgYxQkjXkth9oSq5CKVAoG0AhGd0QIdZMeo3GCg+Slz9FeKSNKv27sj/qg
fjQoMidGg5WC6tlLf/qmvoSjo0e5Rs9kCpuGJ7Xaf4JMPWzNZIv/WEM6nR1j2dZS
ZfOIYYpXbxPKoSAV8R/BU8vr3UveaA7LU7IMgp9cWFfTpabBHYfJbiLtZCOXKCcx
RcNssPWgNVPMAIH0rDGpbeQAJdYvCrOyZiDlNnKvyrtRvTsjfsJR0jVwl096eFat
potJATlAO3jGD/mvJeoVY0GEdQF4O4kJcCPdECfUBf9z3AK2T7cQkFLh6xU+oUFg
1LxVEf0MBdsMwCQ51VuR126zkkeyFX29mvqDz1kpNeqEa1Z7DeLRni3IGY8fL5Me
vZhaVpWyJtU57/21ncsF
=KsO5
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
