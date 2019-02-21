From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] reset: add acquired/released state for exclusive
 reset controls
Date: Thu, 21 Feb 2019 16:28:58 +0100
Message-ID: <20190221152858.GA8652@ulmo>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190221152557.8534-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 04:25:53PM +0100, Thierry Reding wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> There are cases where a driver needs explicit control over a reset line
> that is exclusively conneted to its device, but this control has to be
> temporarily handed over to the power domain controller to handle reset
> requirements during power transitions.
> Allow multiple exclusive reset controls to be requested in 'released'
> state for the same physical reset line, only one of which can be
> acquired at the same time.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/reset/core.c  | 139 ++++++++++++++++++++++++++++++++++++++----
>  include/linux/reset.h |  93 ++++++++++++++++++++++------
>  2 files changed, 200 insertions(+), 32 deletions(-)

Hi Philipp,

the bulk of this is unchanged relative to what you had posted
originally. I squashed in the few things that we had already discussed
earlier (EINVAL -> EPERM) and a couple of minor fixes for issues that I
found while working with this.

Attached is my fixup patch which contains all the changes I made on top
of your version and that I squashed into this.

Thierry

--- >8 ---
commit aa618d0b63eec676d9ea8db91a4c5fdc9330fc6b
Author: Thierry Reding <treding@nvidia.com>
Date:   Mon Feb 18 11:32:46 2019 +0100

    fixup! reset: add acquired/released state for exclusive reset controls

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index c6a7a4474142..1e8a42b16f23 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -65,6 +65,17 @@ struct reset_control_array {
 	struct reset_control *rstc[];
 };
=20
+static const char *rcdev_name(struct reset_controller_dev *rcdev)
+{
+	if (rcdev->dev)
+		return dev_name(rcdev->dev);
+
+	if (rcdev->of_node)
+		return rcdev->of_node->full_name;
+
+	return NULL;
+}
+
 /**
  * of_reset_simple_xlate - translate reset_spec to the reset line number
  * @rcdev: a pointer to the reset controller device
@@ -276,7 +287,7 @@ int reset_control_reset(struct reset_control *rstc)
 			return 0;
 	} else {
 		if (!rstc->acquired)
-			return -EINVAL;
+			return -EPERM;
 	}
=20
 	ret =3D rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
@@ -340,8 +351,11 @@ int reset_control_assert(struct reset_control *rstc)
 		if (!rstc->rcdev->ops->assert)
 			return -ENOTSUPP;
=20
-		if (!rstc->acquired)
-			return -EINVAL;
+		if (!rstc->acquired) {
+			WARN(1, "reset %s (ID: %u) is not acquired\n",
+			     rcdev_name(rstc->rcdev), rstc->id);
+			return -EPERM;
+		}
 	}
=20
 	return rstc->rcdev->ops->assert(rstc->rcdev, rstc->id);
@@ -378,8 +392,11 @@ int reset_control_deassert(struct reset_control *rstc)
 		if (atomic_inc_return(&rstc->deassert_count) !=3D 1)
 			return 0;
 	} else {
-		if (!rstc->acquired)
-			return -EINVAL;
+		if (!rstc->acquired) {
+			WARN(1, "reset %s (ID: %u) is not acquired\n",
+			     rcdev_name(rstc->rcdev), rstc->id);
+			return -EPERM;
+		}
 	}
=20
 	/*
@@ -417,15 +434,43 @@ int reset_control_status(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_status);
=20
+/**
+ * reset_control_acquire() - acquires a reset control for exclusive use
+ * @rstc: reset control
+ *
+ * This is used to explicitly acquire a reset control for exclusive use. N=
ote
+ * that exclusive resets are requested as acquired by default. In order fo=
r a
+ * second consumer to be able to control the reset, the first consumer has=
 to
+ * release it first. Typically the easiest way to achieve this is to call =
the
+ * reset_control_get_exclusive_released() to obtain an instance of the res=
et
+ * control. Such reset controls are not acquired by default.
+ *
+ * Consumers implementing shared access to an exclusive reset need to foll=
ow
+ * a specific protocol in order to work together. Before consumers can cha=
nge
+ * a reset they must acquire exclusive access using reset_control_acquire(=
).
+ * After they are done operating the reset, they must release exclusive ac=
cess
+ * with a call to reset_control_release(). Consumers are not granted exclu=
sive
+ * access to the reset as long as another consumer hasn't released a reset.
+ *
+ * See also: reset_control_release()
+ */
 int reset_control_acquire(struct reset_control *rstc)
 {
 	struct reset_control *rc;
=20
-	if (!rstc || rstc->acquired)
+	if (!rstc)
 		return 0;
=20
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
 	mutex_lock(&reset_list_mutex);
=20
+	if (rstc->acquired) {
+		mutex_unlock(&reset_list_mutex);
+		return 0;
+	}
+
 	list_for_each_entry(rc, &rstc->rcdev->reset_control_head, list) {
 		if (rstc !=3D rc && rstc->id =3D=3D rc->id) {
 			if (rc->acquired) {
@@ -435,13 +480,28 @@ int reset_control_acquire(struct reset_control *rstc)
 		}
 	}
=20
+	rstc->acquired =3D true;
+
 	mutex_unlock(&reset_list_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reset_control_acquire);
=20
+/**
+ * reset_control_release() - releases exclusive access to a reset control
+ * @rstc: reset control
+ *
+ * Releases exclusive access right to a reset control previously obtained =
by a
+ * call to reset_control_acquire(). Until a consumer calls this function, =
no
+ * other consumers will be granted exclusive access.
+ *
+ * See also: reset_control_acquire()
+ */
 void reset_control_release(struct reset_control *rstc)
 {
+	if (!rstc || WARN_ON(IS_ERR(rstc)))
+		return;
+
 	rstc->acquired =3D false;
 }
 EXPORT_SYMBOL_GPL(reset_control_release);

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxuw7cACgkQ3SOs138+
s6GgyhAAhIkiSeceruxbdmifWOFBuY/+zCpKpWTxK/nT1Dmbin3QAGm5OT9XkLw/
t2t9ttsWYLyM+IXbAzu32ORPmc//Nybzea+sTw9kKa4DPaSfk5SIawFk4N2NyLfc
uEfGcaMHA0EkvyXcg63r0nyZdRsqq3zL3fWobmUr1yZ6GUHZQbIZzhZjd7Xi6zLT
NVqu42BoysZTyjiToXJH/sUDhYBbh7MQmVDPtc9pb1wvJgY9FjZQ5ZSrBzr/0KKy
ZcPhwJoypNfFVhtD5w46fxMQzpQp2Z/HyORSETbxcWFW3my7jNs8o4/P5Ge71hUr
R1g5iUezHYpC6lbjJn8MAouzIcMiycnmLlrWwnHQg/8GEKWfz5ZhdlQrNEoVraem
NBuplJmTNRcJGH8pp/GXY4GaTQGHOebprqw2mdPYnPlQ0GrRhKjL3Wjgw9tmFFlM
umHLRc1qfViFkYu3Af7WIUTFVkZzDY02ke965Mzms9nDnG4I/+u73WPubLKOm9Is
6VHUa0YTEM+wKqe9MYbARmBmfhZ2HiU/ZlqGjc3gTCCNmaK6Km2VeqMCDNz7ZHE9
4hsMtDRYceEZo/SwK6DP4bmJJYUe+43y/9bd5gekbLXbXgXw0ineInd87eKakI6v
RsUd1FOBb2t4SRePNSv05pmHNqAyUJ1RaZUVG9RZGEOcBXC5S/8=
=Yueq
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
