From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 03/16] PM / devfreq: tegra: Replace write memory
 barrier with the read barrier
Date: Tue, 4 Jun 2019 12:56:25 +0200
Message-ID: <20190604105625.GC16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:02AM +0300, Dmitry Osipenko wrote:
> The write memory barrier isn't needed because the BUS buffer is flushed
> by read after write that happens after the removed wmb(), we will also
> use readl() instead of the relaxed version to ensure that read is indeed
> completed.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2TlkACgkQ3SOs138+
s6H9PhAAjyyQ3koVZYH/hahMlqPEixyEjfbN26+C7gkROXuFYnQQZupAVw1l69RQ
6yxAwwLOrmabKNH7xdqGJaTNHc+7WF7kJQATGndqDIUhAOyoicu/yUlT7SGKQam1
t2mtSOYPHDkB7v0xRFlagPLzzzYEiYkBv+2KnkSqQBvw1q4Hof6NbbFLcyzFN39X
tcAgRQ851lZz+51r1ip2CEeFXrTt7c3Lb1ZbcpN9oMyiby/DQhT/IkRtI/mTw+jd
LKGDNV5xXLGADtea4yyzyttGNaJxaVKa0ZIBnmSxoeUlXnSlJfpYvkK/xnFSx+m3
az9WhqvkAu3zYM8XsZMjuXIwMOwHvEP8dARBd6pR8HtdtDR9AXUOtgwQImQtWAUc
7gDccXxkUtx0k7Y33izZMS/qnPSHWYyw+9+6bHdgvgGkvw9na8eVIj7FPXX+BEo/
BrQBF7AfQ035H21h3qhjXZeUkgADMeKgxlizvNSvcfm+UeNP+kK3Wo2MnXHqZiJp
K9rcqJOkaxtt9mDoHkMLkmrSe7ykYelMnTu/Su9aOPC+oDVSnOoLQatQmKzt5c9K
Vu7uizim3K/RCQRaowMILmT1/CHzjoW1LGTdKmF8gPYdt6n9DTdkMzhoCo3jTNyP
FdDj2FVrBhZemfZYiOpXbNAQh2pvWpwr+TFNFoEDH0RI50eMr1Q=
=l/Ef
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
