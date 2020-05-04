From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 6/8] phy: tegra: xusb: Add support for charger detect
Date: Mon, 4 May 2020 17:50:29 +0200
Message-ID: <20200504155029.GB614153@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-7-git-send-email-nkristam@nvidia.com>
 <20200428105510.GH3592148@ulmo>
 <ea0f5906-4681-8b84-a55a-e959ce40aece@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ea0f5906-4681-8b84-a55a-e959ce40aece-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 02:32:51PM +0530, Nagarjuna Kristam wrote:
> >On 28-04-2020 16:25, Thierry Reding wrote:
> > > On Wed, Apr 15, 2020 at 01:55:06PM +0530, Nagarjuna Kristam wrote:
[...]
> > > diff --git a/drivers/phy/tegra/xusb-tegra-cd.c b/drivers/phy/tegra/xu=
sb-tegra-cd.c
> > > +static void tegra_xusb_padctl_utmi_pad_dcd(struct tegra_xusb_padctl =
*padctl,
> > > +					      u32 index)
> > > +{
> > > +	u32 value;
> > > +	int dcd_timeout_ms =3D 0;
> > > +	bool ret =3D false;
> > > +
> > > +	/* Turn on IDP_SRC */
> > > +	value =3D padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index=
));
> > > +	value |=3D OP_I_SRC_EN;
> > > +	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
> > > +
> > > +	/* Turn on D- pull-down resistor */
> > > +	value =3D padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index=
));
> > > +	value |=3D USBON_RPD_OVRD_VAL;
> > > +	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> > > +
> > > +	/* Wait for TDCD_DBNC */
> > > +	usleep_range(10000, 120000);
> >  From the comment this looks like we're waiting for some hardware
> > condition. Can we somehow obtain this rather than implementing a fixed
> > sleep? Especially since the range here is so large.
> >=20
> As per data sheet we need to wait for 10 micro seconds as settle time.

Okay, so TDCD_DBNC is a value that comes from a timing diagram in a
datasheet? Seems fine to leave it as-is then. Perhaps add parentheses
and mention which exact datasheet that's from, and perhaps which figure
so that people can more easily reference it. Provided there is a
publicly available datasheet, of course.

Actually, one other thing: If the data sheet says to wait 10 us, why do
you use an upper range of 120 us? Shouldn't a range of 10-20 us be good
enough?

> > > +	/* Wait for TVDPSRC_ON */
> > > +	msleep(40);
> > Again, is this a hardware condition that we can wait on by polling a
> > register?
> >=20
> It HW settle time before reading registers.

Again, perhaps link to the datasheet, or alternatively describe in the
comment what this is waiting for. That is, something like:

	/* wait for TVDPSRC_ON (wait for hardware to settle) */

or similar.

> > > +		if (tegra_xusb_padctl_utmi_pad_secondary_charger_detect(padctl,
> > > +									index))
> > > +			chrg_type =3D CDP_TYPE;
> > > +		else
> > > +			chrg_type =3D DCP_TYPE;
> > > +	} else {
> > > +		chrg_type =3D SDP_TYPE;
> > > +	}
> > > +
> > > +	dev_dbg(&port->dev, "charger detected of type %d", chrg_type);
> > Do we have a string representation of this?
> >=20
> No String representation available. Shall i add one for wasy reading ?

Yeah, I think that'd be nice.

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6wOcQACgkQ3SOs138+
s6Gczw/8DmZ+CrTXiEWQGprlWVnXJRhLbaMmN3d2ncl3kdUo2Me244NGxLhb2lvj
IsO26k9RgdiXF0gfwWIK1J7swxrrczwbR6Y4xqRcZ1uKL4qDj3WLSZXqRBZs2ZeX
T58TaRJDoN8CQcN+2EV0lLVL5nWYBxR8NJGsN6Gfh9T2DUeZ5Yyx10an/ircSPoY
wQuHi991cScgvK+y0poOFTs2p74T2/YRZ1fEFRmJLVzSuACpHLypBRbafUdz3wNE
NS4dgf+OE05fI2OfW4gugPirVzrxOl76WEQ5HGb/eYBXBT5EOp/dLxiJPf9T8zHj
L8qDO7BJY/Fwa1067zXsukpvTUTOoryRjXF3dwoHT3/Iix+WvU9Rq8pVc0zrxGYl
0vWPaPNtZ+r5C2iQZtfQO/IjGSPIo+DU/lQkjvUKSYyZCVWjiJnjiM674wbSNzVT
N3bPf3F7W4XXYYjVD5LzEBKPBEWXgfrocrcYf4rjzpm26UZd9mO52ASJiH4jvE4e
tYNSjE2FgJuR4ZRAfgsYTxiTlsx6Nh7hVaID9esAENxxHDl4hzVFnxJA2q5FhE+K
JVA+3dL5gL+WtQsRbUiu8aYttGKMUfJNUqrYGHDUklQwgzdXkot0thPLV8zHBu95
RsKP9+USnAiI3QYo89cZnnnkn5UXpE51rSVEh18RwCM7vpTfja0=
=j6Ma
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
