From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] memory: tegra30-emc: Poll EMC-CaR handshake
 instead of waiting for interrupt
Date: Wed, 6 May 2020 18:44:14 +0200
Message-ID: <20200506164414.GB2723987@ulmo>
References: <20200319193648.8810-1-digetx@gmail.com>
 <20200319193648.8810-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200319193648.8810-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 10:36:48PM +0300, Dmitry Osipenko wrote:
> The memory clock-rate change could be running on a non-boot CPU, while the
> boot CPU handles the EMC interrupt. This introduces an unnecessary latency
> since boot CPU should handle the interrupt and then notify the sibling CPU
> about clock-rate change completion. In some rare cases boot CPU could be
> in uninterruptible state for a significant time (like in a case of KASAN +
> NFS root), it could get to the point that completion timeouts before boot
> CPU gets a chance to handle interrupt. The solution is to get rid of the
> completion and replace it with interrupt-status polling.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 116 +++++++++++------------------
>  1 file changed, 44 insertions(+), 72 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6V4ACgkQ3SOs138+
s6FiGxAAuOcRnU09W1bffEluFV80U1jhAPJP4VpwtjyuVwY7NfgJ1Au3jdhKXXsS
XCFh+I1aVL9NvC6HEvYdYdrKLxMSlfs/VG19/wU8lqa2enYnJyYeTQBiw/21C/gF
pomxj/SYq4yopkWKdEFasndS7RNIqVj2771agc07uOIw+vcQ1gvYmY4ef6xQ/Alr
iOk9Juuyxlxt+jCkGbklMgVqGFfF4P9iBstPiI/N8b/PYMppzRKy+jyyApT2G/Vd
iqTGb/JHkaJMh9F4OWe/qMzRHISch5SvhVSGM3ueSOZ7T7iSw0kIFo3MCHIjLL46
tM0pKocAwCnCgSRUx944aCJMQUHT8GtuwdUV5IKWKClyMlBpBxnUMhm+gDcXK1ro
vOP+nBS8Vr7iqEjVj86ItwJpD2zyrB5biK8FU2MhdpPvtSX4fY7ZHxptWckrP0rs
Q9uuoyn7VuweT/rVWOmUlKOEbvzSpqd0+hk6xw1HHLQ77r3SQtxn06iz7qmz64kl
SccWii5omSMWkart042lY0oCptG+qfHkg/6iUaP1lJgtNtGyvuemwzf4nY1KIx5b
kFdpp5ticnCyJRxBH/o1LfUyeV72zkIbSnM3uI0ML1E48pHbTIim+t++qEwJ/KTJ
tsBin2pURNEjo12YgmihIa0LoSV8UwceBxKC2b6zd9iPbYtEa1o=
=pb27
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
