From: B K Karthik <bkkarthik-c/eoPpTPil72fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] staging: nvec: changed coding style, line should not end
 with a (
Date: Thu, 25 Jun 2020 09:50:51 -0400
Message-ID: <20200625135051.msl37vuz5fbgiuz4@pesu-pes-edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rewokx577v3vntjb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rewokx577v3vntjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: B K Karthik <karthik.bk2000-EMRzualFZlQ@public.gmane.org>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 360ec0407740..16afbe1dfdeb 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -382,8 +382,8 @@ static void nvec_request_master(struct work_struct *wor=
k)
 		msg =3D list_first_entry(&nvec->tx_data, struct nvec_msg, node);
 		spin_unlock_irqrestore(&nvec->tx_lock, flags);
 		nvec_gpio_set_value(nvec, 0);
-		err =3D wait_for_completion_interruptible_timeout(
-				&nvec->ec_transfer, msecs_to_jiffies(5000));
+		err =3D wait_for_completion_interruptible_timeout(&nvec->ec_transfer,
+						msecs_to_jiffies(5000));
=20
 		if (err =3D=3D 0) {
 			dev_warn(nvec->dev, "timeout waiting for ec transfer\n");
--=20
2.20.1


--rewokx577v3vntjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl70q7oACgkQ471Q5AHe
Z2oxxQv+OOy01Ou3vqU5dN75Df6fs0uJzKJ4lacNDjmMVI7YZvO95FHX6uw2W2ZE
1QIRzE43pNJ9IGkAOr88VNZPddYk9YIf+pQ/0N5P8Ey1l6HpjfzXLsYmkJ7sh/kR
lYUZFLnlzHDSeQWN/GWyYm6is9AKCV7wz566vDg/8ttx7+XRgoyMurqYZeHLT+0B
EHaMLNbnW1HAS++UYxKyZ2+G2VwgTbM5Mb/k08C15t0Op19XwxAHTyEhPFPBYedR
i5oSli2HjK/zFOf8GfnztOtd0E65JNnsPkzlUxADw6OgAvpQlwVkhOb99qwTMQ7c
CZgoM0zhwGmnypFC5nFyMFjAyD8LjBfxU6JoJaWrEsILl+ZLNrG6ruCiZBfAaIwV
BVXKkTfSU7YKZeBVZM2rIvZOnUjWJSKXPd2mnrfvdv/1y0iFx3Dz/EP4l/NDr8sl
81r1GaaE/qwPF2GGPj7bHgTkL3vRZrrxsvYbucY+NQofp/qkbt7olHd4ic8eSE28
uZZcI5eN
=6J1G
-----END PGP SIGNATURE-----

--rewokx577v3vntjb--
