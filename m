From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V3] i2c: tegra: Fix Maximum transfer size
Date: Thu, 3 Jan 2019 22:46:32 +0100
Message-ID: <20190103214632.GA1421@kunai>
References: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
 <20190103190552.tspqarvalqxlz7yu@ninjato>
 <BN7PR12MB28368BFA8C7DB877316960EFC28D0@BN7PR12MB2836.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BN7PR12MB28368BFA8C7DB877316960EFC28D0@BN7PR12MB2836.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2019 at 07:47:21PM +0000, Sowjanya Komatineni wrote:
>=20
> >> Tegra194 supports maximum 64K Bytes transfer per packet.
> >> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
> >>=20
> >> This patch fixes this payload difference between Tegra194 and prior=20
> >> tegra chipsets using separate i2c_adapter_quirks.
> >>=20
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >
> >  CC      drivers/i2c/busses/i2c-tegra.o
> >drivers/i2c/busses/i2c-tegra.c:171: warning: Function parameter or membe=
r 'quirks' not described in >'tegra_i2c_hw_feature'
> >
> Somehow I don't see this warning. Do I need to document somewhere on quir=
ks member of tegra_i2c_hw_feature?

Yes, the kerneldoc above tegra_i2c_hw_feature.


--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwugrQACgkQFA3kzBSg
KbbH1g//fPjvfw/VUoPuMWLpl9d3iJM9BOz6z3jzVyyCALiiDByFc0UbiXkkae4o
nf+RDEpYtP1Pa6UTIG0mB8TA3bN7suZ+piOmfVah7Y/rgQ2dsP0nY2Vp+u52Vudj
e4U+N9YsGb+UmVEMGgxhx94JW8q3Szvkq0b2Som78gQnWWkpmyI6NX35HWrLe7Rq
4Ic0iPb9TGZlys5J984hiRHIrW9Mcm0Ojffv9+YGrdlPiv57C8o0c5Jr+ERsOKo+
8/5wBAerRwI6oUBvamHKwFowgyrkzyLtnTDPssjQ7MafpUuele/svTloTSPI+WIv
QSWqMjgIxO87sHOwxQAaSFJzQmjJGWTjNOOsAl5782YNaXz8Y9Njux/TmTK3bcN4
UrpAwNl7wxNp33A+KOHcgI5UWyZ4eHAQxGkFPfUZPO+fsxbKSdllIsN/hNG5u3S0
bPC3Agn0kmsqqiTW/g19TgmPqq4QjujHVaMjnTUwKHQykfUtKKpsu72GAAx/MWc8
9bV3seS6I+hv0Cbu0K1yqLTvu18z3vZVHBqVo8aWkEUH9cQHZZ+/Hv7lm5WnNCEQ
STMRM4Kfy0tZbFUgJtfM1DZi1J1WR4clf10964mXBBdFK1fPwhC9THwzcZvashab
sBHNHPhBrbtJ6hr1d4pQXBC6zCnYo8F2Hatpj5F3vW2yRsiuv/Y=
=7KxF
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
