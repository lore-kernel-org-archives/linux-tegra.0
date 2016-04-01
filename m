From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] regulator: core: Use parent voltage from the supply when
 bypassed
Date: Fri, 1 Apr 2016 18:58:37 +0200
Message-ID: <20160401165837.GA17032@ulmo.nvidia.com>
References: <1459359124-22436-1-git-send-email-broonie@kernel.org>
 <56FD33EE.6030109@nvidia.com>
 <20160331175527.GP2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160331175527.GP2350@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 10:55:27AM -0700, Mark Brown wrote:
> On Thu, Mar 31, 2016 at 03:27:58PM +0100, Jon Hunter wrote:
> > On 30/03/16 18:32, Mark Brown wrote:
>=20
> > > +		if (bypassed) {
> > > +			if (rdev->supply) {
> > > +				ret =3D _regulator_get_voltage(rdev->supply->rdev);
>=20
> > Should this be a return here?
>=20
> Gnargh, yes.
>=20
> > I gave this a quick test on tegra124 having populated the
> > get/set_bypass() operators for the as3722. In this case, there is still
> > a problem because _regulator_get_voltage() is called during regulator
> > registration when set_machine_constraints() is called, which is before
> > we have called regulator_register_resolve_supply(). Therefore, it seems
> > to me that we still need to resolve the supply before we call
> > set_machine_constraints().
>=20
> OK, we need to change the code there to defer probe in the case where
> the device is in bypass mode as well.

The following on top of your patch here and Jon's two patches to add
bypass support for the LDO6 on AS3722 make Jetson TK1 boot fine for me
again.

I can turn this into a proper commit if you want, or perhaps it might be
worth splitting this into several patches, one rearranging the supply
resolution vs. constraints application and another fixing up the bypass
patch you sent earlier (probably best to fold it into your original).

Thierry

--- >8 ---
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6e5085034b77..23c8c4c86389 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3125,11 +3125,11 @@ static int _regulator_get_voltage(struct regulator_=
dev *rdev)
 		if (ret < 0)
 			return ret;
 		if (bypassed) {
-			if (rdev->supply) {
-				ret =3D _regulator_get_voltage(rdev->supply->rdev);
-			} else {
+			/* if bypassed the regulator must have a supply */
+			if (!rdev->supply)
 				return -EINVAL;
-			}
+
+			return _regulator_get_voltage(rdev->supply->rdev);
 		}
 	}
=20
@@ -3986,18 +3986,27 @@ regulator_register(const struct regulator_desc *reg=
ulator_desc,
=20
 	dev_set_drvdata(&rdev->dev, rdev);
=20
+	if (init_data && init_data->supply_regulator)
+		rdev->supply_name =3D init_data->supply_regulator;
+	else if (regulator_desc->supply_name)
+		rdev->supply_name =3D regulator_desc->supply_name;
+
+	/*
+	 * set_machine_constraints() needs the supply to be resolved in order
+	 * to support querying the current voltage in bypass mode. Resolve it
+	 * here to more easily handle deferred probing.
+	 */
+	ret =3D regulator_resolve_supply(rdev);
+	if (ret < 0)
+		goto scrub;
+
 	/* set regulator constraints */
 	if (init_data)
 		constraints =3D &init_data->constraints;
=20
 	ret =3D set_machine_constraints(rdev, constraints);
 	if (ret < 0)
-		goto scrub;
-
-	if (init_data && init_data->supply_regulator)
-		rdev->supply_name =3D init_data->supply_regulator;
-	else if (regulator_desc->supply_name)
-		rdev->supply_name =3D regulator_desc->supply_name;
+		goto tumble;
=20
 	/* add consumers devices */
 	if (init_data) {
@@ -4024,7 +4033,13 @@ regulator_register(const struct regulator_desc *regu=
lator_desc,
=20
 unset_supplies:
 	unset_regulator_supplies(rdev);
+tumble:
+	if (rdev->supply) {
+		if (_regulator_is_enabled(rdev))
+			regulator_disable(rdev->supply);
=20
+		_regulator_put(rdev->supply);
+	}
 scrub:
 	regulator_ena_gpio_free(rdev);
 	device_unregister(&rdev->dev);

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW/qi5AAoJEN0jrNd/PrOhkv0P/3V+tET5mS/hp48flCT5L+5N
45z6allq8crgG0bAa9+H8SpqkHUPfc/B6xgIrqZEp+T3E8E8RF+ZRdZxX5NPTcxt
mXE/I9xrRA2RPzR082LswXiD3HBaVVaSyGzP6OscXO11IOWpaaPBD+FVb/xeqmBO
3zOrHSNRgV1UlXRJ9EtUhdYGuslKKprtErdhsrFG8K81oRWEvXI4iU7nfEgCrcXO
GjQOYoFUX5DeRYxbsenlisv//NqQR0KyBG4kz19I6DHaV06eHp+zu72bI1JLBKTF
7AvjDf460NPxVIDNiCGFHu7/Ta1SWwPXoolJWRz3GlRZf41ZQ14gXNWDU35rUr61
C90B+x+rz2LXjUkyVl6Cwe0gyVzZvwziUu4uHWhFB8r3Ga7NS76zIJ8Hfja4lIYX
4NyJL1gr0iWMuYPh/dFqEu8p/uBY9sS9NqSYkXBHBG7mjSUKUXn6nHi9KI++Yr8L
AFcQjbtj1OweYjiUJohtp0nktsIf1ZKZRheU1Z/ber4jxzZdKNDYRgVnNvxxH0WT
dsA5C+F4pP3HXZP4USUtQfipgfXiIOpf7XGrbNwSi5N6/aeCnlqMwiPnyrXOy+1c
kjbSCj9G5rsmqBSQ4T/9eK76RBUU6CSPhLV08focMWmxGTHHamjPv8VF3z/zGw60
ssTKZtSztJ35GlFZYcKa
=8489
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
