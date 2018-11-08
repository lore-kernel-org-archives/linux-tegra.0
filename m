From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/4] thermal: tegra: remove unnecessary warnings
Date: Thu, 8 Nov 2018 13:47:16 +0100
Message-ID: <20181108124716.GE1340@ulmo>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-3-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541410354-19090-3-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 05:32:32PM +0800, Wei Ni wrote:
> Convert warnings to info as not all platforms may
> have all the thresholds and sensors enabled.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This seems overly generalized to me. Shouldn't we be checking in a more
fine-grained way for the absence of thresholds and/or sensors?

Otherwise, how are going to make the difference between the sensor not
being enabled or the device tree just missing the information?

Thierry

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvkMFQACgkQ3SOs138+
s6F4jg//eykG4e686ZgdA9mjgaTVyiWazRPnNRZltx4cwNrs88mrv6otJIpB0Zja
r0OfWP0r4Qrd5VU65jTCBar82zcwd0KCfji/tUuHUjuTJY8qDSTLYZgVOQlC6g4b
bKbyllgzM9SHm4QbPtntAst5FFXaTncS8Kcf9yypj7GNKV6N/BSYdjl1w8uDUlLf
ZIYCQSEhpBTgKNZLz6RFsYRpwO2VDMVZyanU4YiqyEx+Lb/QTyKsgiT1RQguYmZb
mgZM8TmDjtsr9gPQ756ukKScsHBZIef6ZwI4DnTjDHok3CSZ6Gwmf7SuspZMd95e
FK1ZIH4bjvxLuSy2i3sXVS6flkk/+wJfTcqN0Bn6fR7oIO2LojdNaqFS2ZGEBzQP
B/G58yGG1x7+oRXT9WD0pm/bmGO1kHIuyyGdXsiQYonbN+qBS0neUVEDuqpFC4MW
PUzOCTeBk+mdtjXlpFwWhszBOdpksEKO6gRPqtCg9ntL78PwV60of9GP2ke3/L/N
B/IM+42p17PajGduP2j5md8zUtdOxunZaOSUeTzv+tIz/dKuhMglSv2VIpdQJ+w8
bAkSICsj6wMGn2+VEuoFqv0VD8jZh+7JWdJ1uSIPnleBM/t677BWEcvB+4idVY9J
E2gLQzXto0uNx6k0w+V6NhTBmpHzw152KouCrLHjMjiA74jFG78=
=R2u5
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
