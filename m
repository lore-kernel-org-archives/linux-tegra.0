From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] [v2] PCI: tegra: Fix runtime PM imbalance on error
Date: Fri, 29 May 2020 20:05:18 +0200
Message-ID: <20200529180518.GA3078281@ulmo>
References: <20200521024709.2368-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200521024709.2368-1-dinghao.liu@zju.edu.cn>
Sender: linux-pci-owner@vger.kernel.org
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: kjlu@umn.edu, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 10:47:09AM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
>=20
> Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
> an error code.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/pci/controller/pci-tegra.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7RTtcACgkQ3SOs138+
s6FFww/+KMM+DRTaPWNZojZr63GKToc/xvSE1Nb55d6CJHWJdLjxwzaoeVxmMAzO
W9sX31ectNIrK1a1p+4TiErNIrzNr4bEyjZWpGMlljo2LJrS3e7n5VNVHrZBK5PW
mfxdVWdhYWVoVtQOeXf193TSRLkAuvsiznFknYHr4sKCBTXCm06zaRucjFxIX2Jt
EzF0L72aKYGQe93JmSGh3HJdOrryiCd3f5IAc8kc+KfYRAUm8jlLIgmUUGM9o+GR
NQGhHFHm/fnsQAehXieRx1DR4GwZPa1FzrBBkhGcMNcg+io8Qe1rdH3imSD17P5D
v+lB6v3SMHOdf0/ahUGHf6/xkuX2oBvOYEhmMucguOXksM0N/QsuyHUAkIc/W6Tc
RnPrxtK4ui8LrCJtrLb4+Qn3L33IMj0eIKEajY7/IA1Z/ElILC25HgQHlsbFWPis
WCbAv7vYvdf7uunrys6fTr2WIuX6f3lOI2svqfVfWFkmzAN3D0Cxl1vOyTb5FXjG
CH/1Jf0CxgCMZDMB4F/7NNH1snTQ8hNPe+u40TjlDexYV28ArVCzJ+IH3ghdUb9O
2RcDyL4yIpAJJ5VPwd9ao9HEg9TiRzGoi0nqSWtauGDbasTFLcDtpFSQYijJpJfg
JFgpeJ4a5Cn54XZSwdZs9oWaXvkJoP902S5fUZkuHgDc8SQXtqU=
=3fsG
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
