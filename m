From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 1/4] i2c: tegra: implement slave mode
Date: Mon, 20 Jul 2015 11:50:49 +0200
Message-ID: <20150720095049.GD2551@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <1427745615-5428-2-git-send-email-danindrey@mail.ru>
 <20150403194626.GB2016@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150403194626.GB2016@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2015 at 09:46:26PM +0200, Wolfram Sang wrote:
> > +static void tegra_i2c_slave_write(struct tegra_i2c_dev *i2c_dev, u32 v=
al)
> > +{
> > +	i2c_writel(i2c_dev, val, I2C_SL_RCVD);
> > +
> > +	/*
> > +	 * TODO: A correct fix needs to be found for this.
> > +	 *
> > +	 * We experience less incomplete messages with this delay than without
> > +	 * it, but we don't know why. Help is appreciated.
> > +	 */
>=20
> Uh oh. So I assume this is another reason for staging?

I think we can live with this upstream, no need for staging.

> > +	if (!i2c_dev->slave || !i2c_dev->slave->slave_cb)
> > +		return -EINVAL;
>=20
> The core checks for slave_cb being valid.
>=20
> > +		i2c_slave_event(i2c_dev->slave, I2C_SLAVE_STOP, &dummy);
>=20
> You could use value here, too, or?
>=20
> > +	if (!tegra_i2c_slave_isr(irq, i2c_dev))
> > +		return IRQ_HANDLED;
>=20
> Minor nit: I'd prefer =3D=3D 0 here, since it reads "if not slave_isr ret=
urn
> handled".
>=20
> > +	if (slave->addr > 0x7F)
> > +		addr2 =3D (slave->addr >> 7) | I2C_SL_ADDR2_TEN_BIT_MODE;
>=20
> Nope. There are 10 bit encodings of addresses 0x000-0x07f, too. So, you
> need to check for the flag (slave->flags & I2C_CLIENT_TEN).

If you'd fix up these and resend, I'll happily include this patch for 4.3
already.

Thanks,

   Wolfram


--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrMR5AAoJEBQN5MwUoCm29gYP/jk9qWhTjLu3Vyfixpw19nJp
Wu3I2+mYowNVxjD27rIihYYAc2NBhxaD/0tXld/vGdDTba0fnfxw+y2APLigsqhh
arH/05ae2VVQMVHgOWuA5Ux4Jt/LHbJ2VTY2NXM92iDZgP7pqRBc/qA43YxBYgdA
+2PWyf/TAotud+xMZyn3SQjA+Q8LIpLHOYo/txigeQ+irT6AplL9OfWKq3smI3W7
5wyUR9zoYJJu+6OCERU7PXU0IWE4Mw8EXs6STobkd4XIzeBB9stGqyNruGeoK42F
3encICz8cdW7sO9DXEJOJUcag0tyQ0sQE5klwd8QwBjdN4ZJry9v1LVpyYWBdLQ+
vIL0xVPv/lpmoVIONN7pp7EIZbzN6glHDRg6H+MfstWTRfyUIGoNGFicoryCPDsK
SvzDlV+4qP65+zhlWbI1u816dhvtKsz9C4T3rFOtva3dZK4Dm3DxJaHzulo5HBzG
hXMUZrqNtFu9KPq3oJHIRk4Sm8Fioq0gWAdlvT3XSc4a9G3NEfzhmXiEP0H8ldkm
GxWHviF1mPFqjbu5akmV2su531TXvpw3A2nXyC4c7lchyIRCP0T5+9RFOV9gPXVI
u39lFNk9hcfqEwdBQX3WKa6uHVZMZOql9Iweb3VE86fNHaJbfapBnHfr+Na4X5QO
LT/RMWeGywvHgNh04b6g
=2IuQ
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
