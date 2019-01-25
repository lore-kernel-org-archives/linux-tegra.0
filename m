From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: fuse: fix typo in tegra210_init_speedo_data
Date: Fri, 25 Jan 2019 12:45:14 +0100
Message-ID: <20190125114514.GA12353@ulmo>
References: <20190104071646.15828-1-josephl@nvidia.com>
 <20190104071646.15828-3-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2742746896377470155=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104071646.15828-3-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============2742746896377470155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2019 at 03:16:46PM +0800, Joseph Lo wrote:
> Fix typo when reading SoC speedo value from fuse SoC speedo register.
>=20
> Reported-by: Mark Zhang <markz@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-5.1/soc, thanks.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxK9sgACgkQ3SOs138+
s6F/4w/+OOjIwvCIOMFyAIK+rcqXFPPOUo0KtJ/dVNvK56BGhWSNbi21FtbO6MxY
50xzifCrSqLR1tTDwLof3OXg9Ew0/dg+e8Hh+STyPvjel6u8zkHMBcLTfdAu/+cd
CEj/pyeSr8yxGrpZJVw10BuTt7/qfKcJWzvGc2HiuBhgi9BfSqIUgo5r9Hyhuhom
W84g46Bgi9yo5wJi+tkVhtBgHkNOoBxX/m+2Fdej6lZCVkDYaw7J3vxiB+UKP+3W
RK0gl8V2nrvC26kov/AGzPy912/3AmgPmTqR8xZTSnmBEnq1TAGO3ffG2X076bJ5
a/ECnD6rorwAPkI2GAW80bAx6Pg9C5ORbRF9+NQa3fqHn1VaplCajJ3+5fkbGwPF
SsGrFyoi8fmdQSNS7/ao/EMj2HqszOc1usJCoc8fKZVUuiN/NH3SnXPp8p79rePD
fLuMYW0/8DN0ULoRGZ/aTNWCsLvkvkfx/y9QzJKVgDwnXZyolWXmTgs8FiZ2irvz
KxGBvWJkRJPSs8vKXTenvl8SHWvv383o9V7AvBdv3ywLbPIlbaLkKtxnEx6a7Ipo
BFdyivyvrziN8+9mKVweH/cKC/XZSPVtEk5lp5cFmIsokJrMXtbtacWiviWFoUsl
oT2H55vytZCsizJdqg8x3715yddZvbinvtjknjwAeOg5o44dNuM=
=Jd6c
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--


--===============2742746896377470155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2742746896377470155==--
