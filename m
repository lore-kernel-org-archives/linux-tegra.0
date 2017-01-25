From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: tegra: nyan-blaze: Proper pinmux for TPM i2c
Date: Wed, 25 Jan 2017 12:09:33 +0100
Message-ID: <20170125110933.GG9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-6-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-6-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Jerome Coste <jerome.coste-liENgnZMlIJGWvitb5QawA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:53PM +0100, Paul Kocialkowski wrote:
> From: Jerome Coste <jerome.coste-liENgnZMlIJGWvitb5QawA@public.gmane.org>
>=20
> This corrects the pinmux for accessing the TPM over the i2c line.
> Thus, it allows correctly probing the module, that previously failed with=
 i2c
> errors.

This is missing a Signed-off-by: from Jerome and you (since you
forwarded the patch). I've added those since I assume that that was
intended and your both willing to provide it.

Other than that, same substitution for "i2c" -> "I2C" as on 5/6, and
please also make sure this change gets into the pinmux configurations.

Thanks,
Thierry

--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIh2wACgkQ3SOs138+
s6GtwBAAmwILPIQ7TOVrUMtiFi3KaAOp9diBE0ebpUtYTRfUGpy8ieRWZa9Mv42a
L0o0iUqox1OHNDZ1iECI3qcHDVhxT0amCpZbGzVcOqbFqaqnA/8SvY5WageGIsQF
NLOw6p2eV02H+/JVIQdnjeCQAxK7TC3J4l8mveoDyl3UlBJETsfTea+UHzc/1XrZ
SxJAfeK9CWrQQw115WG7jcEEiQiLQX/GuUOeDx1PofNkdByz+8Csj/erT7L7U+EM
mMD2g32iHG+QZbzSkq71yVvmQh0DCTGXqk9jbQsq0FXQOvkWZJIJb+7YQp/+ByOa
PXOwHgkscegAcf93v5oTYQSxYANol4G2j9k6GzRi1blf1HlPnymt/fbc7AZk66Nt
o/LFcvsKn/C0IuLeDC+2qmq+xEhgQn32OzqJTqcm22CpTW57Ye+50UTt8SPX7Yht
hHmBBDjdVoXmctCAt+qnpet0fJ9YOj1oZSMVMmhvEMPE2OYGSX+2AyzarVJnwSr2
FhYSTvhiHtKocyOZY6sQum+PXI64HnZkLleP6F5AM9OU6vcDoKwOPt6ZPG0f/mno
tZx+EYqt3zpeeDyv5hkY/8E2O0xeHzjZ0yvnsXCl4HVGNy4XA8yZLU9qWb1Tfd0e
+4RDPdNVxduynrUkLfLoEmSOsl6d6QE7S2uopSfMWGMjq9mkPTY=
=lvG+
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
