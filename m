From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/3] NVIDIA Tegra30 EMC driver improvements
Date: Fri, 10 Jan 2020 15:46:14 +0100
Message-ID: <20200110144614.GH2233456@ulmo>
References: <20191220020849.11175-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNpeiK4tTqhYOExY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191220020849.11175-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--PNpeiK4tTqhYOExY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 05:08:46AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> I took a refreshed look at the driver's code and spotted few things that
> could be improved. No critical fixes here, just improvements. Please
> review and apply, thanks in advance!
>=20
> Changelog:
>=20
> v2: - Now using WRITE/READ_ONCE() in the "Firm up hardware programming
>       sequence" patch for interrupt handler interactions, to firm driver
>       even further.
>=20
> Dmitry Osipenko (3):
>   memory: tegra30-emc: Firm up suspend/resume sequence
>   memory: tegra30-emc: Firm up hardware programming sequence
>   memory: tegra30-emc: Correct error message for timed out auto
>     calibration
>=20
>  drivers/memory/tegra/tegra30-emc.c | 179 +++++++++++++++++------------
>  1 file changed, 104 insertions(+), 75 deletions(-)

Applied to for-5.6/memory, thanks.

Thierry

--PNpeiK4tTqhYOExY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YjjUACgkQ3SOs138+
s6HihQ/7BoT7ElvPG4frfgK9JBo3hJ8xRh9OUfByjYrQMhMpZhkKix8HxH2JF63g
mWZ/ph/Zn28GXaGRxIBnYrcjfus/8NY5fRpdpZrvbEYFSlBVutEnUgLhlSAKffdr
q8SOmaUPSrlrbpc8to4JAMnXYnWK4XFuBPaKQywIkL9wYfonctHuLgFCbbk4QB9h
Uq0+qjuIx6F2HACK1/qEhM/otH0wR7ExIXsP58w6ZDWp0LdC8/qZ2fawRrk3lGG7
4wofzHGjgeQXNg95DinEqLeYcnfJseo6h206QSsEcZoZAVs1bCYy2B54QWw48/7j
vHihF72VhMOm9oe42EvDtP651vZrycAB/PTp85F9NMftoxZ7G+0OWQnyoSPUu+uB
j7eiw8PBQrn/1f/nzcjmNpw23cpeTMeN07w0voqEohlNcTJftcfXAC6DOljkCex4
1VloC30lvPlqOpqFShzV44BeCPUXZAgszNaCB09G9eOvOqZb8YeBRU2jnRZJ8pqF
xe6Bav0/Zo15ZtaNS4UGR5XZ36NEb9jEQxMirbT755vz0vI0nKM94vPu6PQ9PpJ+
QAJv1C9rK/RiV9LO2/+k8HyGQS59mQVaxMO2ADxhZEtdNYwrdmkVGlqjK3o4z1Bk
asArwOQlUlxrLYRnw+4+bDugu3s/SlArUCGruXhRu7a6cNYhFKQ=
=QEPV
-----END PGP SIGNATURE-----

--PNpeiK4tTqhYOExY--
