From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Wed, 28 Nov 2018 10:15:13 +0100
Message-ID: <20181128091513.GB17419@ulmo>
References: <20181123150104.27336-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181123150104.27336-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, jonathanh@nvidia.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 10:01:04AM -0500, Yangtao Li wrote:
> Use macro to simplify the code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+XKAACgkQ3SOs138+
s6H78g//eWqXRVmqbexbcbiZ8amJmllm9PsvDFGa8CjpSJgRw8h6a0gC1PqGGZ4p
kvRwnl77ymRCPgJNd2z5lRu2o5VDa7gPlmtOQKjwyrtcvWneoEkznRsWt3LQ7Lw3
p2a2w9GA/k+EUuwEa+X0b+sjOeb4s2dmY97b3QK7+tjwFPgxR3RN3/+OqjhHJlOm
7yosUtTdyjsdvjOj4IVYG8xs1RvpEd0IwDLQTly7o9d9qAyA8lr7+9PNEuqwwCq2
x4KlSa5svB8w1UGlTiBaXWfMhYMZ/OVQE7gFxq7X1t93qOk+c4B8XvzvU1aIuSQz
5O+s4jNgwm9B63Hat1Ya0Ez7PPciwOz1kM7mPkintRYGmI3ANweN0f+7dXXxOgO6
YF94POXmZDbwgdifCjWJ0BFqfMQlxZPTEAKbHmAagBkWBLMV+nnyj9BOhGLBxWng
k7BBUyM+2wFfGBTaOWYo9mgpgfrxWUDDU/7J+BQZJGVIxNJZc0mtbC20/Wuj1K2U
CHMIwH7IqUdc6XI8VqXyn6Hc0mO0pGn235uWQpeCkuVoJtWR7EDDIPmWyyVwBtt8
O861cu+kzURbURKcbn6Bez8YcYStLRnGODRS071sSDT28YYHSDKo6ky5lZ+2YoRx
qj/Ha/DJCD3od1B616Daq7gQX2xPNickpWiL2mz9Nq0PIl28i50=
=zZQo
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
