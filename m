From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 3/8] dt: bindings: Move tegra20-emc binding to
 memory-controllers directory
Date: Thu, 25 Oct 2018 16:27:10 +0200
Message-ID: <20181025142710.GF21521@ulmo>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183052.32023-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:30:47PM +0300, Dmitry Osipenko wrote:
> Move tegra20-emc binding to the memory-controllers directory for
> consistency with the other Tegra memory bindings.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../{arm/tegra =3D> memory-controllers}/nvidia,tegra20-emc.txt      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/tegra =3D> memory-controll=
ers}/nvidia,tegra20-emc.txt (100%)

Applied to for-4.21/dt-bindings, thanks.

Thierry

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR0r4ACgkQ3SOs138+
s6HOQw//Rjp6kXA9/91adpOJlPQf6ZwFMIUiCvtFHMZHKh8HlkGBv5Ts5vm57/Bs
LZN3rJHkDRt6/dlGU5Vy1F9jsytOGI1H7tYF1nFWwMssvHLFw7jQFQVDh8CHBtge
TLXQY3a3VjIzoXD6LChDapBVVZDLl27xitMx84K3KTCjvAnv2HbNwLVBOwWuTcQD
tL9geOa1IOygm/04SD0Rj0Lv7Gsk1KfJz5W9PU+ubDD6C+IIvDd0oeo7iMc1xTFl
YgEImPJD+cjYS9i7Qkuq4pRbd1g2bC7pQ3XaUFFtMp4kB/8mYSH5PGSOvVkPjQRH
K+XY5TphuykXpNXd/PwQQtjPfLCdqrEIIcDr/A3OSkdW3hr8/M1sKikuKdN3+0JM
aQCw6P/8M/3uhbd4bwmbs6cB/2tK7IIh0780dZQK/LJ+PtdLlSitU+QxwW7E5NiO
P8hjEffgJIOTe1WtStTtyd6Sfdelgdy9JbNHcPiNdT3H/Lc3ulAtr0lgqu6BR4bi
zaImCb7r1KC2nIU44jahL/t8hemL6hVsHcrwSRgDtbG6+ERYpTdUBdu8vd3u7DUb
fL7pFeF7q1wyBgfQ3n7oayuZ3GxvIejZS1vSsCm9BuwoYK/g056BImQYbXP8wM31
fpugoHbY3ufglZJQVyE3RtjHRab0JN9PETFXA6NeHyG6HqBHjeg=
=XhpH
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
