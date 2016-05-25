From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 17:46:19 +0200
Message-ID: <20160525154618.GD13765@ulmo.ba.sec>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com>
 <57458693.3050700@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57458693.3050700@nvidia.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 12:03:47PM +0100, Jon Hunter wrote:
>=20
> On 25/05/16 11:58, Jon Hunter wrote:
>=20
> ...
>=20
> > Looking at this a bit more I am wondering if we should prevent the
> > battery for being polled before the registration has completed ...
> >=20
> > diff --git a/drivers/power/bq27xxx_battery.c
> > b/drivers/power/bq27xxx_battery.c
> > index 45f6ebf88df6..32649183ecd9 100644
> > --- a/drivers/power/bq27xxx_battery.c
> > +++ b/drivers/power/bq27xxx_battery.c
> > @@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
> > power_supply *psy,
> >         int ret =3D 0;
> >         struct bq27xxx_device_info *di =3D power_supply_get_drvdata(psy=
);
> >=20
> > -       mutex_lock(&di->lock);
> > -       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
> > -               cancel_delayed_work_sync(&di->work);
> > -               bq27xxx_battery_poll(&di->work.work);
> > +       if (di->bat) {
> > +               mutex_lock(&di->lock);
> > +               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
> > +                       cancel_delayed_work_sync(&di->work);
> > +                       bq27xxx_battery_poll(&di->work.work);
> > +               }
> > +               mutex_unlock(&di->lock);
> >         }
> > -       mutex_unlock(&di->lock);
>=20
> Alternatively, maybe the following is simpler ...
>=20
> diff --git a/drivers/power/bq27xxx_battery.c
> b/drivers/power/bq27xxx_battery.c
> index 45f6ebf88df6..8a713b52e9f6 100644
> --- a/drivers/power/bq27xxx_battery.c
> +++ b/drivers/power/bq27xxx_battery.c
> @@ -733,7 +733,8 @@ static void bq27xxx_battery_poll(struct work_struct
> *work)
>                         container_of(work, struct bq27xxx_device_info,
>                                      work.work);
>=20
> -       bq27xxx_battery_update(di);
> +       if (di->bat)
> +               bq27xxx_battery_update(di);

How about this, which should be the most minimal to fix it (though it's
completely untested) and still update the internal cache (it just won't
signal an supply change, which wouldn't work at this point anyway). The
patch makes up for the supply change notification by doing that instead
of a full bq27xxx_battery_update() at the end of ->probe(). This should
take care of always sending out a uevent on successful probe, whereas a
bq27xxx_battery_update() at the end of ->probe() may not send one if it
is presented with the same data.

Thierry
--- >8 ---
diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_batter=
y.c
index 45f6ebf88df6..df1b4cb2bbc2 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -717,7 +717,13 @@ void bq27xxx_battery_update(struct bq27xxx_device_info=
 *di)
 			di->charge_design_full =3D bq27xxx_battery_read_dcap(di);
 	}
=20
-	if (di->cache.capacity !=3D cache.capacity)
+	/*
+	 * This function ends up being called while the power supply is being
+	 * registered, hence di->bat will be NULL on the first call, causing
+	 * power_supply_changed() to oops. Avoid that by checking if we have
+	 * been registered already or not.
+	 */
+	if (di->bat && di->cache.capacity !=3D cache.capacity)
 		power_supply_changed(di->bat);
=20
 	if (memcmp(&di->cache, &cache, sizeof(cache)) !=3D 0)
@@ -984,7 +990,7 @@ int bq27xxx_battery_setup(struct bq27xxx_device_info *d=
i)
=20
 	dev_info(di->dev, "support ver. %s enabled\n", DRIVER_VERSION);
=20
-	bq27xxx_battery_update(di);
+	power_supply_changed(di->bat);
=20
 	return 0;
 }

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXRcjIAAoJEN0jrNd/PrOh8HEQALzJSiiQiDPk9ORMZjBE+YSG
huj3pp3It6vU+uiQ8AfsyEMQ3b9bRpq+E4o+Mbnwziby4FvGji8ulDwZp/J6+P/l
6M/7/+9E1ZrisFTWjWexsnAXFCl82OcqJBdcCkG6dSIzVlp4QT8j4oHxTVLk4OOd
9UyywIOBrVzytHs4M7fIJDe1nttM9JAQ1JvT9T+MEloiL9Vz90YbhazgQUJ2dTmd
oCC3eTzmRxdtm8ZmXQtElXHJNfX/cIkEqg7dVMANWC0CxA1CEeqXXnwe1PWEXPCW
z/WkUzoUREFPF7fJjOxXpvVgiY0p8ypSvm0drrvpAB7CA3I9XLohdSGYgqVyl/lB
v9+yuu3jrBAReLo8yGqFtuhxLM2wUZHL8v/YiBYDvgX27xbvi7pD5G4VREXX6X+9
09I489e2KunpQc8Gh0F0vgqxJ+x0LkVgzmAeEe5SVJCK9Ww0GHktV28drWuGB+Bo
oRy93GICQxOiyiLtmi9PlA5QrIlD4oDLYBx59tUpKLy3W8ZuBTOBJmhq8ZVQYgNx
aKP5UP2wdmETEFgIzcDmysA1KYSsIMiikHCuqkEHmYSTYghn+83nKp+SrH/EMipk
Nk85Iage9xAtBOIH6KZyfDF2l9zJ7+lL8tQix684RMd5zNQIr1YefI90MBnHUVlB
wWWove3Q67sITMkhHdmK
=YJHu
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
