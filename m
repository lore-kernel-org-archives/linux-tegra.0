From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Add ethernet controller on Tegra194
Date: Mon, 2 Jul 2018 15:57:03 +0200
Message-ID: <20180702135703.GL13096@ulmo>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
 <20180620125406.11906-5-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9133669983205340955=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620125406.11906-5-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, vbhadram@nvidia.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============9133669983205340955==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5VuzLDXibKSJvVYD"
Content-Disposition: inline


--5VuzLDXibKSJvVYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:54:06PM +0300, Mikko Perttunen wrote:
> The Tegra194 contains the same ethernet controller as the Tegra186.
> Add the device tree node for it, and correspondingly the PHY node
> on the board device tree.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 22 ++++++++++++++++++++=
++
>  2 files changed, 42 insertions(+)

Applied, thanks.

Thierry

--5VuzLDXibKSJvVYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6Ly4ACgkQ3SOs138+
s6H//g//RF577iLlAUjlYYa+l05ikyT+Zm4OiBYYvSzNCFwLptVa/K8ddZNEtvh8
WUiFeDZEY8Dld+VPC7E95C00vsc/ruvyM04pUrHttcZEzdLe+ErjxvG8e/pj1bei
JbI5Xm/49i5Ujk41p/DHwRpLr7tbwepSk3wB/UKjwxjIF2rC8caXRu1//PxrKLOh
7hcJx6LNjVD+AQzAeVuof/xlrkN9sJ17f3Ux/C43NdKD9SF532EI4V3KWJrPjdqR
KYiwTBxTg9IOn4dYCZlVFxeO9LBZNQ/e2UmCHPhgYmxhr4eT8pKhtXrLrZxi2Ouh
nxWt73WFDGgvgf6E8ymszFOEqqtCKBHQoSMhMWHuqr5be1bi//Vn1z3bodpBuugy
sMO3EISoiuFKohIBNLdJevJ+Oq5+HFXL0eWyPeTNryWNcpC4kzsbaKuLZhWx5mh5
e2XX8feUmKHFn9aCJB4yE4UgUpEOqIykD7g0bGJiWEzc+xnd1fBLvGWxfnqfgLW+
U2a5s9niwqXqry2NFm0Yya3ks3z1TVgTLyiNrVMunathb17uflgb4EIiLa1fLeX5
01eww8Azgxu1MjGddVKpi19Lc2gY4tO5eBd4Bw0vqtnot6J42OhPKAVhWJeELcyu
3GMfv5P2NR5yrVlIEnph2b3uTMLoQgC1nWPS3N1M1BkUj0XolBc=
=frP1
-----END PGP SIGNATURE-----

--5VuzLDXibKSJvVYD--


--===============9133669983205340955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9133669983205340955==--
