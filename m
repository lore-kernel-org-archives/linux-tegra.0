From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5 2/7] i2c: tegra: remove unnecessary variable init
Date: Wed, 12 Jun 2019 12:21:42 +0200
Message-ID: <20190612102141.p2dm53chv3d6sd5w@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-2-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cpx4mfhacgqsirus"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560250274-18499-2-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--cpx4mfhacgqsirus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:51:09AM -0700, Bitan Biswas wrote:
> Remove variable initializations in functions that
> are followed by assignments before use
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--cpx4mfhacgqsirus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0jUACgkQFA3kzBSg
KbaNcQ/+KpA29qjJEt9lo/rmTsTB76jUXW+YMwI+dtdIlDIuXv+yo7LDZJ4fVQ3q
z8dFKkKR0AIjyJmmqq7YTbVneBY+cyqx+WHtr+4GC92pwIP91AvbHYxjRUP9abty
u7QCWAeSggStsAt0emF5NGnkIf+VcPUu7LmdcF6cbfm3uzOOgKvgPr2ayl0Ot8Qk
XCVVZigOatokShqAKEApVyIvZURW5Kt+NHj7hMcIt3kYj538GNJv+gTDRvDaU2Bq
Z+CodjXHt5VU8tqaawcHJnbEDirBxWHcYIKG46T3qiNoZqUKEiBi5FhSjJghcK6x
d3bpL+u6OjJjGJagGFCiG6iKU8rKRMWaM9unUnSSQThhn/mm4J/ZyXNwro/KRCg/
f9sKv8DHIcV7JTyQgACBQB/dt0FJZHUdg1BkP/KpaMt9hPLRlyV9JxRclQfwxW/d
tX5QEfBySOH4OmtG3iTLZ/UnYXzSd5ec60p0heJw+CUq64+1xmmRjDd0URewfWXW
NjyIXwyXBSCwVu9b4Y5R6NCnEU/CMSGMMAfI83ComEZ4CM32tIpab4YFwmoFhvtT
2tWEHddqWJPruQunshb8eDia97jldi0GhaG4eY1fafw0Jv9WuQ3XQBY8ST6j0VPZ
rl9zOaMjBT1cO7jC4trIHtMbPh6XgM+8zC3Q2OzDbsN1ejkRoTc=
=cErD
-----END PGP SIGNATURE-----

--cpx4mfhacgqsirus--
