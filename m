From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/tegra: dc: Don't disable display power partition
Date: Fri, 12 Aug 2016 17:34:30 +0200
Message-ID: <20160812153430.GA26764@ulmo.ba.sec>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-2-git-send-email-jonathanh@nvidia.com>
 <20160812134622.GA25862@ulmo.ba.sec>
 <352741e6-a6ec-65cd-46ea-b734415e7c23@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <352741e6-a6ec-65cd-46ea-b734415e7c23-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 04:02:57PM +0100, Jon Hunter wrote:
>=20
> On 12/08/16 14:46, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Aug 02, 2016 at 11:34:26AM +0100, Jon Hunter wrote:
> >> Commit 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM") disables t=
he
> >> display power partition when probing and this causes the Tegra114
> >> Dalmore to hang during boot.
> >>
> >> The hang occurs when accessing the MIPI calibration registers (which a=
re
> >> accessed during the configuration of the DSI interface). Ideally the
> >> MIPI driver should manage the power partition itself to ensure it is on
> >> when needed. The problem is that the legacy PMC APIs used for managing
> >> the power partitions do not support reference counting and so this
> >> cannot be easily done currently. Long-term we will migrate devices to
> >> use generic PM domains and such scenarios will be easy to support. For
> >> now fix this by removing the code to turn off the display power
> >> partition when probing the DC and always keep the DC on so that the
> >> power partition is not turned off. This is consistent with how the pow=
er
> >> partition was managed prior to this commit.
> >>
> >> Please note that for earlier devices such as Tegra114 the MIPI
> >> calibration logic is part of the display power partition, where as for
> >> newer devices, such as Tegra124/210 it is part of the SOR power
> >> partition. Hence, in the long-term is makes more sense to handle such
> >> power partitions via the generic PM domain framework.
> >>
> >> Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
> >>
> >> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>
> >> Please note that the hang is only seen on Tegra114 with v4.8 if the
> >> patch "ARM: tegra: Correct polarity for Tegra114 PMIC interrupt" (2nd
> >> patch in series) is applied without this patch. Without the fix for the
> >> PMIC interrupt polarity the Palmas PMIC probe fails and the display
> >> probe also fails because the regulators are not found.
> >>
> >>  drivers/gpu/drm/tegra/dc.c | 21 ++++++++++++++-------
> >>  1 file changed, 14 insertions(+), 7 deletions(-)
> >=20
> > I don't think this fixes the problem at the root. After looking at the
> > code I think what you're seeing is caused by the tegra_mipi_power_up()
> > call that happens as part of the tegra_mipi_request() from the DSI
> > driver's ->probe().
>=20
> No it doesn't. It is more of a bandaid. I think that this issue has
> always been there but no exposed until the move to RPM for the DC. I
> can't say I was too happy with it!
>=20
> > Generally there shouldn't be a problem because the display controller
> > will always get enabled before the encoder (DSI) and hence the power
> > partition should be enabled when the actual calibration happens. The
> > fundamental problem in this case is that we're actually powering up
> > the MIPI calibration logic at the wrong time. So I think what we'll
> > want for a proper fix is to move all register accesses out of the
> > tegra_mipi_request() function and add tegra_mipi_enable() and
> > tegra_mipi_disable() functions that power up and power down the MIPI
> > calibration logic, respectively. That way we can move all the code
> > which relies on the power partition into the tegra_dsi_encoder_enable()
> > and tegra_dsi_encoder_disable() functions.
> >=20
> > Perhaps an even better place to call these new functions from would be
> > the DSI driver's ->suspend() and ->resume() functions.
> >=20
> > An added benefit of this will be that the MIPI calibration logic could
> > be powered off when DSI is disabled (provided no other user requires it
> > to be powered on), whereas currently it will remain powered even if the
> > DSI output is off, since the power on happens in ->probe().
> >=20
> > I'll go write a patch.
>=20
> Great! Thanks.

I was going to send this out, but EIMT reports that it's still failing.
I'll have to dig out the Dalmore and see what's going on.

Thierry

--- >8 ---
=46rom 325ffd78615e76f04b5225fc1e79921c32037c1f Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Fri, 12 Aug 2016 16:00:53 +0200
Subject: [PATCH] drm/tegra: dsi: Enhance runtime power management

The MIPI DSI output on Tegra SoCs requires some external logic to
calibrate the MIPI pads before a video signal can be transmitted. This
MIPI calibration logic requires to be powered on while the MIPI pads are
being used, which is currently done as part of the DSI driver's probe
implementation.

This is suboptimal because it will leave the MIPI calibration logic
powered up even if the DSI output is never used.

On Tegra114 and earlier this behaviour also causes the driver to hang
while trying to power up the MIPI calibration logic because the power
partition that contains the MIPI calibration logic will be powered on
by the display controller at output pipeline configuration time. Thus
the power up sequence for the MIPI calibration logic happens before
it's power partition is guaranteed to be enabled.

Fix this by splitting up the API into a request/free pair of functions
that manage the runtime dependency between the DSI and the calibration
modules (no registers are accessed) and a set of enable, calibrate and
disable functions that program the MIPI calibration logic at points in
time where the power partition is really enabled.

Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c | 14 ++++++++++
 drivers/gpu/host1x/mipi.c   | 63 ++++++++++++++++++++++-------------------=
----
 include/linux/host1x.h      |  2 ++
 3 files changed, 47 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3d228ad90e0f..39a34d1c4d6e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1593,6 +1593,12 @@ static int tegra_dsi_suspend(struct device *dev)
 	struct tegra_dsi *dsi =3D dev_get_drvdata(dev);
 	int err;
=20
+	err =3D tegra_mipi_disable(dsi->mipi);
+	if (err < 0) {
+		dev_err(dev, "failed to disable MIPI calibration: %d\n", err);
+		return err;
+	}
+
 	if (dsi->rst) {
 		err =3D reset_control_assert(dsi->rst);
 		if (err < 0) {
@@ -1644,8 +1650,16 @@ static int tegra_dsi_resume(struct device *dev)
 		}
 	}
=20
+	err =3D tegra_mipi_enable(dsi->mipi);
+	if (err < 0) {
+		dev_err(dev, "failed to enable MIPI calibration: %d\n", err);
+		goto assert_reset;
+	}
+
 	return 0;
=20
+assert_reset:
+	reset_control_assert(dsi->rst);
 disable_clk_lp:
 	clk_disable_unprepare(dsi->clk_lp);
 disable_clk:
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 52a6fd224127..e00809d996a2 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -242,20 +242,6 @@ struct tegra_mipi_device *tegra_mipi_request(struct de=
vice *device)
 	dev->pads =3D args.args[0];
 	dev->device =3D device;
=20
-	mutex_lock(&dev->mipi->lock);
-
-	if (dev->mipi->usage_count++ =3D=3D 0) {
-		err =3D tegra_mipi_power_up(dev->mipi);
-		if (err < 0) {
-			dev_err(dev->mipi->dev,
-				"failed to power up MIPI bricks: %d\n",
-				err);
-			return ERR_PTR(err);
-		}
-	}
-
-	mutex_unlock(&dev->mipi->lock);
-
 	return dev;
=20
 put:
@@ -270,29 +256,42 @@ EXPORT_SYMBOL(tegra_mipi_request);
=20
 void tegra_mipi_free(struct tegra_mipi_device *device)
 {
-	int err;
+	platform_device_put(device->pdev);
+	kfree(device);
+}
+EXPORT_SYMBOL(tegra_mipi_free);
=20
-	mutex_lock(&device->mipi->lock);
+int tegra_mipi_enable(struct tegra_mipi_device *dev)
+{
+	int err =3D 0;
=20
-	if (--device->mipi->usage_count =3D=3D 0) {
-		err =3D tegra_mipi_power_down(device->mipi);
-		if (err < 0) {
-			/*
-			 * Not much that can be done here, so an error message
-			 * will have to do.
-			 */
-			dev_err(device->mipi->dev,
-				"failed to power down MIPI bricks: %d\n",
-				err);
-		}
-	}
+	mutex_lock(&dev->mipi->lock);
=20
-	mutex_unlock(&device->mipi->lock);
+	if (dev->mipi->usage_count++ =3D=3D 0)
+		err =3D tegra_mipi_power_up(dev->mipi);
+
+	mutex_unlock(&dev->mipi->lock);
+
+	return err;
=20
-	platform_device_put(device->pdev);
-	kfree(device);
 }
-EXPORT_SYMBOL(tegra_mipi_free);
+EXPORT_SYMBOL(tegra_mipi_enable);
+
+int tegra_mipi_disable(struct tegra_mipi_device *dev)
+{
+	int err =3D 0;
+
+	mutex_lock(&dev->mipi->lock);
+
+	if (--dev->mipi->usage_count =3D=3D 0)
+		err =3D tegra_mipi_power_down(dev->mipi);
+
+	mutex_unlock(&dev->mipi->lock);
+
+	return err;
+
+}
+EXPORT_SYMBOL(tegra_mipi_disable);
=20
 static int tegra_mipi_wait(struct tegra_mipi *mipi)
 {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index d2ba7d334039..1ffbf2a8cb99 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -304,6 +304,8 @@ struct tegra_mipi_device;
=20
 struct tegra_mipi_device *tegra_mipi_request(struct device *device);
 void tegra_mipi_free(struct tegra_mipi_device *device);
+int tegra_mipi_enable(struct tegra_mipi_device *device);
+int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
=20
 #endif
--=20
2.9.0


--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXreyDAAoJEN0jrNd/PrOh3OAP/Rj/sfOjKvBrKztdhJpBVinW
Jh5HFvaosWHwNbq83yEcgjxM3aSFLqVJv2dIY8nXMH/occeqGDC9C6ZxW8DPP43z
FTUgBUWIi0hfCUfaBQlO07BwH1GMcNmjrvTJxYIxD7f6nUxyTHo+bygJ5beaNolO
40ewgxVDS7eT7Hk4z5YSme/ONcUwqdcq+lfYDKWOTRzeLpVOvzvvKKakFNn0OQpR
8S+tSp9wXDHs8lbGt2WiulN4kKDKsTQsH+l6QEfmcRZXuTdNW+L0pbii05hKJDa8
osQqIl9yGi2EDSBieYmqsIJEXrNg9PA0esuEnUqUs7QcmHoSd7ULanwtaSqTMTxI
eY4RsmZgBUzsXLgjve4z7FTvQ30rxyoffUI1m6iyLEFSATxgJf/kvx+xL+XzT0Ne
JpnShFGnYEKhj01KpK5o4eJIRZGDZPxQEwbH8ivliFUXYPOXLkXZsnoibCB26IH5
JoXcZissdV5zkgKOyPQJwbgfqZO8RD5sD1OJCHU5qI6JFeRQjIJtn2SmhQ+hd14/
mSCbPkOcYszWGLSeVz4aRH+L87uppefv+yoocXQlYj8/Mf9J46e3lv7j4npuaM/a
ltXAEOjwbexOfqPLiohnqJ8i5Z8vv0UwxGLolGwSvyCpWBZ4hrs+Pxd3VrJ0RSl7
u2cw8GKOnS7l6HxClqrG
=/KvO
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
