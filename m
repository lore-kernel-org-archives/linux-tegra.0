From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: mark suspend function as
 __maybe_unused
Date: Tue, 5 Mar 2019 13:20:30 +0100
Message-ID: <20190305122030.GF26369@ulmo>
References: <20190304202610.1759671-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304202610.1759671-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 09:26:05PM +0100, Arnd Bergmann wrote:
> We get a warning about this being unused when CONFIG_PM is disabled:
>=20
> drivers/mailbox/tegra-hsp.c:782:12: error: 'tegra_hsp_resume' defined but=
 not used [-Werror=3Dunused-function]
>=20
> Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mailbox/tegra-hsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+aYwACgkQ3SOs138+
s6F9oA/9G0y36pi3ft61OqkocxLmtr4Y24ehLLNbXGApAOul17LmulGPKmX4ZYeD
zdlfmyTfBVO297x0feDAXlpZehks/nUIAITMOpMvk2ns2RlFvSJJBCeuIQd4wHNn
4gtEwx1ZE0/SAPwHYfNXJ95q2fKaQ2ROb3HVueN5Vpl3Vlf+KWtAk1D2/Faw2mUe
VZNFrujKZ7m/7Qtfjb55f17nV0mpToB98ihQkQwmgwDK2DAk1RDmhDqH210p4fDf
IWPHg5azUKGjzH9ziVdcDFHu7HQzmF/Mp8hq1wZ5rbdnLFEDXRq86eaNbA6Av5H1
r7mxn6sxBZD5qzYhoH5wNqwjj8BX9C2uvviYhOQiWRxOB7GiOs2wChVsSdvCR2A0
8xzTF/7Xe8rR4a06H244J+yurv9xYamdnc8qjz2gjj6B/LDOtCfkwE2bEUac2oMd
evBP3KZyjbuYCTbaDc4o6BdkWhJC/5Qhb0ODLl4xwkQEgcjg4yeQCqEE8JOkjAGZ
l2JcEzcCS37HKK0dxW0F4HUBq0xgXRZkoqMfrNahxYUbg5r/q8cuyH4VT22fE2H0
bIqDxu7EdbrAFu7Nexq1wu4/nXyiMYhqKvjXwZIH/4PJ8fon0MP5GGdhj/RiM4pG
cfTLeAskpVUI86xLQzIz+01ZFgbw8+vmBKCH5IIFlF9z1v8CbAM=
=jnzY
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
