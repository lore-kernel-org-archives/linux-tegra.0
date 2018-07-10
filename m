From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] memory: tegra: Correct driver probe order
Date: Tue, 10 Jul 2018 17:30:11 +0200
Message-ID: <20180710153011.GA8492@ulmo>
References: <20180526142035.21741-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180526142035.21741-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 26, 2018 at 05:20:35PM +0300, Dmitry Osipenko wrote:
> The Reset Controller should be registered in the end of probe, otherwise
> Memory Controller device goes away if IRQ requesting fails and the Reset
> Controller stays registered. To avoid having to unwind the MC probing in
> a case of SMMU probe failure, let's simply print the error message without
> failing the MC probe. This allows us to just move the Reset Controller
> registering before the SMMU registration, reducing code churning. Also
> let's not fail MC probe in a case of Reset Controller registration failure
> as it doesn't prevent the MC driver to work.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Applied, thanks.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltE0QAACgkQ3SOs138+
s6EXNQ//TmjEdaaaK+ErK3EnaTZ9oPy2xDpGGCQ1x/CW0uMT9WsRsN/r79fBcDdO
CD5dTxZCn/n9tB1EkhdftIRZH44KA5UKnHEqZsjFRP4+gCXjuj1lSjY/eNPSRC+k
4aJWsCEB/YT0YLsk74BT7Md56vSobQmH6575RYDbur8EE9AhHtkfX72HToZX8oRs
3V9LEdyeCcB9wJlqTBCWvBqmqHTwqSclcNpSt38NpJ802TgQznydhGyaGmvXNdAV
+ZnXf91y0S/kOnQLM4/axy37X7j06W+bAmgmnjADkbm5nKzTzog0eBbeo3qytyUo
r1ge3Lnh6V/2Klmj233Gzx7jRSiEFi1EQfEOIARCGkQQGQY6pNynVzQXPLlxfk6J
8blpAw00vlzkUMSN0tgvy8T7XhYEfKs7V90Ab3/a37IWSLObGMETA04BgEWFcwVw
mn9BYDVYMtkLKeIbZawEaIBa3O7WrGB0tR3xWlHP+Uro4aWePnnBsGsRAhRqQxYu
GQYnZiaL1mAWDDiAVccBcFw3rKVexu3WDbBQzvsX9BBkwqhgYsac1TMo/5OC1m15
ITRBr2YT8y5ctW8pgrSkKu3qbQmjAYDNYDM6eV+L2fdezfrFpmWyb6phPl8opm2a
TEywKPjQ/k5dc6zGXxvzdfjsqtT4uBZ19Z33NxeQBPkH9u2152o=
=Sgid
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
