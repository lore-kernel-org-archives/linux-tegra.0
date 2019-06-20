From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
Date: Thu, 20 Jun 2019 12:30:26 +0200
Message-ID: <20190620103026.GC28703@ulmo>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 04:09:42AM -0700, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 47 +++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 39 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LYEIACgkQ3SOs138+
s6HbJg/+NQD27bmKZrCzUK7vAXwuLegaM2bwf05Oef7h97iDtPkokkYDCRqeIlyh
9DK5MnHOAesPTgJBnrAB5+5zcI0EVthgi1QGRcQ5FmAuUElJBtbImnUVC0ky6Mxx
349RLIaYMPWskOxiPLLo6hiuVqe4h1KaQq0yKrLFk4UjvhHGIRa2OvLXMpUgnmSz
jGcjnSI0wNXDOkiuGLMHsAeL/UDHvj+r+omJLz4N5rcD62p7d+JUJ+0h5FZSNutj
T+eepY98x3DVy8Kafc7UJeddwHlaggYtGx4neX4LKKUwxle06lkWZqpz8kp1MD3D
I7I47AuY+YdqMb1FS6+dAl2FGfd+H5qSkjzn//2TLS2rco3oZR+tABcRC/KqSNxB
oXihIrV80rhVm7PRyZLyTs+rsOrQP/GKZf4AeLRbJECgNSldocqkLvDCAWnY1KTy
woXVGlVco9mihisM0gflVv/9EcGWuV+wmObhTYbxYL4QhWOe57BGqDXkCqcu3AGU
C2TVTloPFg3vmB5lZFoE33A5fC1Q2mIzBqi9nEFHEbVRiYfVm81lSGf4Zof2Zslq
DR/tv+RqDJ4bzwIpruVYj6sZY99VEodvTUTqxqTlijbPYY6pdJVkD++zypnFj7tx
jY/H2lDmTTVX4SBzCec6QIZ+VPsdBrAh9xAJwAEyvRmxtoTCdUc=
=i6uB
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
