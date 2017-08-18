From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/4] phy: tegra: use of_device_get_match_data()
Date: Fri, 18 Aug 2017 14:42:03 +0200
Message-ID: <20170818124203.GA4556@ulmo>
References: <1502270280-13792-1-git-send-email-chunfeng.yun@mediatek.com>
 <1502270280-13792-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502270280-13792-4-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kamil Debski <kamil@wypas.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Axel Lin <axel.lin@ingics.com>, Baoyou Xie <baoyou.xie@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.orglin
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2017 at 05:18:00PM +0800, Chunfeng Yun wrote:
> reduce the boilerplate code to get the specific data
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/tegra/xusb.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

You're not reducing by much here. =3D)

> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 3cbcb25..25cdfb1 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -848,7 +848,6 @@ static int tegra_xusb_padctl_probe(struct platform_de=
vice *pdev)
>  	struct device_node *np =3D of_node_get(pdev->dev.of_node);
>  	const struct tegra_xusb_padctl_soc *soc;
>  	struct tegra_xusb_padctl *padctl;
> -	const struct of_device_id *match;
>  	struct resource *res;
>  	int err;
> =20
> @@ -861,8 +860,9 @@ static int tegra_xusb_padctl_probe(struct platform_de=
vice *pdev)
> =20
>  	of_node_put(np);
> =20
> -	match =3D of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
> -	soc =3D match->data;
> +	soc =3D of_device_get_match_data(&pdev->dev);
> +	if (!soc)
> +		return -EINVAL;

This is never going to happen. There will always be a match, otherwise
this function would never be called.

Also, if you omit these last two lines, then you actually do reduce the
boilerplate.

Thierry

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmW4JgACgkQ3SOs138+
s6HZeA/+JZndCg9U/ujFpVP64Fa46vJ+TIk6H8Y1Bba9fMQCVVvGTMRBB83bRFw3
/9Ftr3ih5HSYVb7SJAH8v0Uwp3AUAMENOkkllBoXmZj8+paBDk5CACy+uyM1k2Vr
Uj6+UK05jNoQv7RhtdOoVz5YBwypMyMVaYSYrOUMHnI4VkppPEwgqMXY/4BY+vUf
QRSTZC03rPG4vamuyQ4eVDnmxUaoDUezodpCrdil7UZ2X12BLJfuY1G/xTcH8imJ
/LCglKY0ET0SZYgCvOBhYwD48Km21tPIdzJ/VSsyTishn5ZZHi9reYHVwJWKuTBm
0Xu1A/mAM6G2k2nkqSTAATLzV+Fj19Ivz/KI5ddmJ+1edf/D64mEhT3Y4uVvFQBF
9NQJ/fgRI0V2O4O21owl2y3N+oPvWJFdyktopmUi4n4dk/nmyPxYZ26OzJuwDGoE
og7JOdUF5L2czOJkNmc0YmFOfWloatp6FJYSMH8AC5lt4koiceGSNhNrf2nTHT7a
qsDcZRnzsQh8AlPBhFmTnC96ZGlfOKl8YSh4cJf/FnRFo6FbvRgkjybNqpTE0bSz
qYrk3eGV2wEfqn2Iphq2pqqRTmQNLOINdM09etnecL7SyA0hZGDZaPFHnLWOut+y
Ov2oJfNvQa9Pryr6kMTx2wkMr1S0hkN79TdDBBxceH+k1bj/ZJA=
=zQR5
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
