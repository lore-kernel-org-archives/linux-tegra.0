From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Mon, 28 Jan 2019 09:08:15 +0100
Message-ID: <20190128080815.GD18124@ulmo>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <844544bc-10ac-a236-8c7d-17a09288fe5d@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1651563139=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <844544bc-10ac-a236-8c7d-17a09288fe5d@gmx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tristan Bastian <tristan-c.bastian@gmx.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1651563139==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 26, 2019 at 01:37:34PM +0100, Tristan Bastian wrote:
> Am 25.01.19 um 14:11 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If an I2C adapter doesn't match the provided device tree node, also try
> > matching the parent's device tree node. This allows finding an adapter
> > based on the device node of the parent device that was used to register
> > it.
> >=20
> > This fixes a regression on Tegra124-based Chromebooks (Nyan) where the
> > eDP controller registers an I2C adapter that is used to read to EDID.
> > After commit 993a815dcbb2 ("dt-bindings: panel: Add missing .txt
> > suffix") this stopped working because the I2C adapter could no longer
> > be found. The approach in this patch fixes the regression without
> > introducing the issues that the above commit solved.
> >=20
> > Fixes: 17ab7806de0c ("drm: don't link DP aux i2c adapter to the hardwar=
e device node")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - check for both device and parent device tree nodes for each device
> >    instead of looping through the list of devices twice
> >=20
> >   drivers/i2c/i2c-core-of.c | 14 +++++++++++++-
> >   1 file changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > index 6cb7ad608bcd..0f01cdba9d2c 100644
> > --- a/drivers/i2c/i2c-core-of.c
> > +++ b/drivers/i2c/i2c-core-of.c
> > @@ -121,6 +121,17 @@ static int of_dev_node_match(struct device *dev, v=
oid *data)
> >   	return dev->of_node =3D=3D data;
> >   }
> > +static int of_dev_or_parent_node_match(struct device *dev, void *data)
> > +{
> > +	if (dev->of_node =3D=3D data)
> > +		return 1;
> > +
> > +	if (dev->parent)
> > +		return dev->parent->of_node =3D=3D data;
> > +
> > +	return 0;
> > +}
> > +
> >   /* must call put_device() when done with returned i2c_client device */
> >   struct i2c_client *of_find_i2c_device_by_node(struct device_node *nod=
e)
> >   {
> > @@ -145,7 +156,8 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(str=
uct device_node *node)
> >   	struct device *dev;
> >   	struct i2c_adapter *adapter;
> > -	dev =3D bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
> > +	dev =3D bus_find_device(&i2c_bus_type, NULL, node,
> > +			      of_dev_or_parent_node_match);
> >   	if (!dev)
> >   		return NULL;
>=20
> I've tested this and can confirm that this fixes the issue on the nyan-big
> chromebook.

Excellent, thanks for testing! Typically if you've tested a patch and
verified that it fixes the problem that you were seeing, it's good to
send this on a line by itself along with your reply:

Tested-by: Tristan Bastian <tristan-c.bastian@gmx.de>

Patchwork will pick this up and it will become part of the commit
message when the patch is applied. This gives you the credit you deserve
for going through the trouble of testing the change.

> Is this fix going to be applied to the LTS kernels too?

The "Fixes:" line in the commit message should ensure that this does get
backported to relevant stable kernels.

Thierry

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxOuG8ACgkQ3SOs138+
s6FjYxAAu76qnBHq2KGz736pxX9gSC7quGIxJ/+V9Bm6pv7NV0OP2wt7GV34Vs5m
CmHXUIBT3k99lW8xkgyxUZCOezAAMCZdW7Zp3qnro/0XwVuJmNqf4P39swW3BFra
HOC0Y2IsTmQQvxsYk0fiJIxebxwWEDcIhT3BvTzn2luvhTlNA/9/m66/m40RF2eq
xp2jBLBVht9xKD+eqIA/SUIE/lIdR4JcTze6AE2IN/XylrT8c/k3e0W/U29bHTvf
wb80166FSU1qr4+39sZkQRf3HxmRmLY0NFjt9+Unq+vU3NNueb8OdWPN7JL0gmDu
qFSFJGndQpD8IUA1Fgnwo1eFBrsdsXprAbqnezRf3ZODiEIHLvi74AcVAHH8WPaR
S84w1y8c7cu7I66VZnFyDdxE8GWGVKLi75fqGKO3FVKOhkB1ck7QVx6cDB/x+D7g
kAdglHhqwc47eu8AZ1/1mR4OWXU/qIAbVaY2q3okVKD7BpaRziT19qX3i7+tJGcf
x1qdl1bPAEKwzY2XtfRnKrXNQ9DTuG62XTv6clllGUeQpYGBn9uKESHC8INr3tCf
oMvbaPE1skihq6L15yc8Jup1BKxWw3N1qo4W8otP5DvvknJ0dy2a63jYzxHwCHLU
4gkjHCQLGyf05CdEJSLdFyke7AcaI7v/PyVnJmBUDsU0ky5m3/Q=
=GYZC
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--

--===============1651563139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1651563139==--
