From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: Fix terminating condition
Date: Thu, 22 Nov 2018 09:50:22 +0100
Message-ID: <20181122085022.GB5741@ulmo>
References: <20181122075244.3909-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181122075244.3909-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-tegra@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 12:52:44AM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
> drivers/soc/tegra/common.c:27:16: error: address of array
> 'match->compatible' will always evaluate to 'true'
> [-Werror,-Wpointer-bool-conversion]
>         while (match->compatible) {
>         ~~~~~  ~~~~~~~^~~~~~~~~~
> 1 error generated.
>=20
> Whoops, we have an infinite loop and QEMU no longer boots...
>=20
> https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/1602429=
18
>=20
> Check that the first character of the string isn't null so that the loop
> properly terminates.
>=20
> Fixes: c57eff9503a5 ("soc/tegra: refactor soc_is_tegra()")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Wow... that's what I get from not testing this properly. Apologies for
the inconvenience.

Applied, thanks.

Thierry

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv2bc4ACgkQ3SOs138+
s6Fs7A/9G98aM8hd7heybEQYYqFxrRFU4eyO5SOqizrIZ528yHH5GfdiJhvd5vHq
VxOIB3w0W4A1KWOQ63VALeOTELxI6DTM6c551jJe3z4JK4zTx2KMEn2uxcUQ41Ns
4ZXZOrIIflBeWtSuob9AQQVpyNquyOS+FtHl7QrBSz844Dh+J2mpnnEKHBQDqo9Y
/79qXZaYkl8y/YV8/xMMTPRwHMwZpgqCRrQ5NxzvNV2mq/IjGBXEdL1QpXaAHOAz
FW+nnuSJEezPLoYxz7Ww9j1Ay9ilZ1VrB2a5Y03FyZPVOPmR3fpdUXjHGHon/6rH
gkr56kUePeclMCOTlnxBP52di7Ceh+NNOWmoYab3Dagy147c10zfGVId0rKd6SrL
RDQxZYGDYTu2EMv/x9uS5kd2RwldQwnCH7p5vqbFMGvm6cMMBpapNeg+WCUgdJed
SwuoQAhHYoMyes63YGGhpmR4R/YdYYfNaHJ2CdeJvLQJDQQ+eqD9skoAOKkAULRI
LaCNZ9n4x2bmXpZVOsidTGkeqYE8vMQyGxw3/eH7dCAdWHkXqlUhc+sSC6BPs6Ph
KgAhj1Im6uGzv+4EMHakNlFIEbePB2baBW0iRf2NEZYR+R3S7K8M5WYyBUfH7oWl
hS80sV+atlPEMMof+gVOMOszH2afuBXD0tJcCS5NwBhJ3IURd3o=
=7BpT
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
