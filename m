From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add CPU nodes to Tegra194 device tree
Date: Mon, 2 Jul 2018 15:57:54 +0200
Message-ID: <20180702135754.GM13096@ulmo>
References: <20180702121131.13461-1-mperttunen@nvidia.com>
 <20180702121131.13461-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9134007389063895449=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180702121131.13461-2-mperttunen@nvidia.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============9134007389063895449==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Content-Disposition: inline


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 03:11:31PM +0300, Mikko Perttunen wrote:
> Add CPU and PSCI nodes to device tree. The Tegra194 SoC contains
> eight NVIDIA Carmel CPUs.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>=20
> Notes:
>     v2:
>     - Moved PSCI node/properties to SoC device tree
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)

Applied, thanks.

Thierry

--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6L2IACgkQ3SOs138+
s6Hliw/+LfJGullf42ByB6mbKyZGcO3GbiJ7ob/zgR7GYmj5swQd2NanUjZjTZ1s
1VOUjPd5PeEEgpBdIEZ4+bHZO1G9LcP2/0fes40eiTTNRSyp6+v+ntezZSc1pGgt
AFEUtujq9DHMGTj6KPOCCL8GMqH2f7kAnhuzf0UGJf5IoSc41VTKQ3QKYHYuEzrV
XVXL3AwPvBrnYgZlkm0S29RBMPBx1xgurM3JTL89YtFyApjKn8k8VrzDblimRLlO
rSg4EpGoZOdv+HsFgZQDuQRmamvXVTpw2peZfaLibusOUn6HtWAODZ18GAlxf/E0
olXqwNleNJnN8FChoTlcClfjT9M1FhiU17SPN9ZINDwdyAUMa0J27Cu90oejFavh
Ig4oa0WtrMse3/Y6TzBvxzY2nqd7wuhz92MjK5XCk9K7pA3hNdODAgrOGx+nKQuI
T6sH3eZoB5a8XpR5Q4sS7DnQu/nuZ5EIMlt/ocebEqjBbIu82AYHMir3rvjG5Llc
EdmLNymiT0Aub0ZPkqy59oSXz6SJXhoPx9xs6oTwOn+AqMvmrYyQnoWubvo6yMri
Ag37ze1FKQTGWhafjEXxNXfeX3IlX7jjeKQaR8d/e2YIqvornAu8JOejOFYxHSEE
Xtx0XYxuprjZDyEr3NiuEVfptSdCjSJLMl3GP5XsZrcmGL+iwV8=
=0WWG
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--


--===============9134007389063895449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9134007389063895449==--
