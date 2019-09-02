From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: remove unused variable
Date: Mon, 2 Sep 2019 09:48:08 +0200
Message-ID: <20190902074808.GC930@ulmo>
References: <1567394159-22572-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567394159-22572-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 11:15:59AM +0800, Chunfeng Yun wrote:
> The local variable @priv is set but not used, can be removed
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 3 ---
>  1 file changed, 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1syTgACgkQ3SOs138+
s6Ggyg/+JTfKlub2rlBotR8tVq+WnX4mOXHTpdHY2C6sec6x8dSNg7ASmQ8mPheO
kvlojh5AYFPZAeunSAE28f6WmKLTL1mOp4QvipmBfuNgzf9o0gDJqlAAXxffiCG3
1nUDkM6x8/83lYLC5oF0ML4XbDsemDC7rnbBtsu79F7A1ETPX2N6EF8QM9y4FPzz
VAP7hNjOHI07c9zPuseEz5TrC3Ts/jH22/x9hefRwTmRlt+DmCjujz5zAKd0Nc4S
5In8xmT9WSDDDPf+ENjwZA1gASFyLEPKFM8qsqp3DpY/qH9ik9qszey+WHdAhNSy
dGdBiQI3C2MHQG6ZGB/7etLnp2kGN4334KU0Df282/gcW9kQuW4/2niqgH1dgYve
2cIuN6N0Tn14hUl/VgOcMG/S8C0ykZ6Z/ghuZOrXLtHAIeUWLc2nUkU14/MZ/6Jx
L63bB5RdVyglvjmsLWnxZ3mVEonTgwA6K86+jUI1ojotyaHMC8GJGxZoS5LUeU6A
Y2OXgKXYXakxjtrb9QCMeVx1vkBsVuqeU5BQdfgsp3ueZ+5CZE+MiWHQs2uifAz4
suDUyv4okbf1HRh7/F+I6i7QYk6TRLB7vf18QFVcJxNZfze8sQMe3sN+y6b/wvRp
NPeDuuljtSyJBdITIAbiMzG38znpSF+k+BEDmogHtRnSNx7w1tE=
=jMD6
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
