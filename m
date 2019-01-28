From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Mon, 28 Jan 2019 09:10:55 +0100
Message-ID: <20190128081055.GE18124@ulmo>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <844544bc-10ac-a236-8c7d-17a09288fe5d@gmx.de>
 <20190128080815.GD18124@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0046235882=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190128080815.GD18124@ulmo>
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


--===============0046235882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 09:08:15AM +0100, Thierry Reding wrote:
> On Sat, Jan 26, 2019 at 01:37:34PM +0100, Tristan Bastian wrote:
> > Am 25.01.19 um 14:11 schrieb Thierry Reding:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > If an I2C adapter doesn't match the provided device tree node, also t=
ry
> > > matching the parent's device tree node. This allows finding an adapter
> > > based on the device node of the parent device that was used to regist=
er
> > > it.
> > >=20
> > > This fixes a regression on Tegra124-based Chromebooks (Nyan) where the
> > > eDP controller registers an I2C adapter that is used to read to EDID.
> > > After commit 993a815dcbb2 ("dt-bindings: panel: Add missing .txt
> > > suffix") this stopped working because the I2C adapter could no longer
> > > be found. The approach in this patch fixes the regression without
> > > introducing the issues that the above commit solved.
> > >=20
> > > Fixes: 17ab7806de0c ("drm: don't link DP aux i2c adapter to the hardw=
are device node")
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - check for both device and parent device tree nodes for each device
> > >    instead of looping through the list of devices twice
> > >=20
> > >   drivers/i2c/i2c-core-of.c | 14 +++++++++++++-
> > >   1 file changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > > index 6cb7ad608bcd..0f01cdba9d2c 100644
> > > --- a/drivers/i2c/i2c-core-of.c
> > > +++ b/drivers/i2c/i2c-core-of.c
> > > @@ -121,6 +121,17 @@ static int of_dev_node_match(struct device *dev,=
 void *data)
> > >   	return dev->of_node =3D=3D data;
> > >   }
> > > +static int of_dev_or_parent_node_match(struct device *dev, void *dat=
a)
> > > +{
> > > +	if (dev->of_node =3D=3D data)
> > > +		return 1;
> > > +
> > > +	if (dev->parent)
> > > +		return dev->parent->of_node =3D=3D data;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /* must call put_device() when done with returned i2c_client device=
 */
> > >   struct i2c_client *of_find_i2c_device_by_node(struct device_node *n=
ode)
> > >   {
> > > @@ -145,7 +156,8 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(s=
truct device_node *node)
> > >   	struct device *dev;
> > >   	struct i2c_adapter *adapter;
> > > -	dev =3D bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_matc=
h);
> > > +	dev =3D bus_find_device(&i2c_bus_type, NULL, node,
> > > +			      of_dev_or_parent_node_match);
> > >   	if (!dev)
> > >   		return NULL;
> >=20
> > I've tested this and can confirm that this fixes the issue on the nyan-=
big
> > chromebook.
>=20
> Excellent, thanks for testing! Typically if you've tested a patch and
> verified that it fixes the problem that you were seeing, it's good to
> send this on a line by itself along with your reply:
>=20
> Tested-by: Tristan Bastian <tristan-c.bastian@gmx.de>

Oh my... that was stupid. I think patchwork might now pick this up...

This also made me realize that I should've credited both Tristan and
Vlado as reporters in the commit message. I'll resend this.

Tristan, is it okay if I include your Tested-by: tag in the v2?

Thierry

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxOuQ8ACgkQ3SOs138+
s6FedhAAj+2zblAP8XKEcSZ2xNWX4zVHjL+wmnrZGicGatq9CFV+1LM+8Jmj1hJC
jpl8xf0Pl+VDKs2juHsZ6UfA1PrQkqj+T11kdaE6JeekZzF+Ee9oHJPopvNhgj4x
9L++KWjl+LuAUnbUMpyBpeg7fnOPQS+QpDWKXEkpkmmtYdSexThPZZ25RI3L1fZI
aj0bGn7uGszHDi7l4QfzJqWJ7W+PxMZbOtf5PlhHz9Lf6tTwbGYGKx/NzdRzqH7h
HJV2o7MjvVF1LWWOpzOnt/8Y99Dj95sPg4OvUxn5kH28DRxohz+X0kwkpCv4gr4Y
8qg4PeYIE/ZcCDAtYYs3uKOtva8D/9qCTASaSfMO37d0atQs3YBYSmImWMV1sK+e
ONZoNp+K0FfppWN9OdPUZCSBjTacpC/eGzuOqmCFTywPpbE4IzNSo7vHddhgfUCF
zBLY3H2GpmI6tKlWA6xcKaytCrNluuWMedQJHnPrr10d2T63pGlK3+jCdoCDPNrZ
WDLvatI3wEVawOci56iCg9u1OUXg5+vJiL5wx+ZK3Gsf0LvExi4k1ibqWgLCw/F5
p85PxpJLMcwqqfPEcaeFg2btQ7jxINZMgDN8tavca30jNXs4r2FHg8P7ulXjThni
4M47kObwzbSCOIlCVRd0ORrsg+bNqlUxyTNa4T1pq9i+tcSDUws=
=RlUb
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--

--===============0046235882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0046235882==--
