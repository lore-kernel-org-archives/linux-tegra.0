From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Thu, 13 Jun 2019 15:13:21 +0200
Message-ID: <20190613131321.GA6370@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <20190612102458.liieiohnprfyyvs6@ninjato>
 <5841fe57-fe68-aab3-670c-26b40a5d46ae@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5841fe57-fe68-aab3-670c-26b40a5d46ae@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bitan Biswas <bbiswas@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Most of patches are coming from the downstream as part of upstream effort.
> Hence not reviewing explicitly.

It would help me a lot if you could ack the patches, then, once you are
fine with them. I am really relying on driver maintainers these days. An
ack or rev from them is kinda required and speeds up things
significantly.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CS+0ACgkQFA3kzBSg
Kba1RQ/9GWBeTxXEjL9VYaeijLQUznToGQszZUm59CLaUakBZ1U5zHv4Q1mXscqT
nS5W/g+jehr+iveA57dhlj5S+QftqasQ6gSUS6esF5Un6PIDfpty4mwWPda4Rq0n
DhPCALujwZD5BM4jSB4M2xLSypmMjOPpPQq1WfA1BhEJVLBW5hdf1lBbecBNcm4k
TE3s0VFdZmzVdLQQKNsKNPfct1TyQiD+RzELa22ptlHDpMOIMudT0EHWpmXUNyID
oN8ZGO6ygdlUjLDeCe3QgGLVJaEDndS8sgu4vPpRwnDHbOx5CLOT5zktN1YitupR
fFvSxH1JSWu8mHJ/rsbu7vYv/NfiFvubaUucFexHUFuVHCEbV7Su7Zjy3NebcJyo
RgHv3UtljdmL0QhOg4DoQJRQ3iMFEhRVDQ1iAcUubcr6mSpBF48/WpqvW0mOpEyd
rAO75Lf0uW9Hdhbdmdb7Sb/p4z5QfMBOXstBB/79OiQOp1c3C7jmL4bxrbbEAcKq
1hT/Q79CEm8snsH0vua4aQr37BTf+G7lMPKlGRfwd70Dk1P5gOBNdzZUb8PetReU
lMSiE7DjkwHe6b5+UVJg7AScWLl78opLyMqrvnpBhihEqrg4tvvhMCgqwKbJR8gm
pEq1e6OqggD9dsf4GU79FkqbgwX13ZJsDBRsndEMPEPxpk0zTiI=
=VgqH
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
