From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] arm64: tegra: Add CPU and cache topology for Tegra194
Date: Tue, 1 Oct 2019 16:36:10 +0200
Message-ID: <20191001143610.GB3566931@ulmo>
References: <20190920145621.12527-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7458062834700779964=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920145621.12527-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============7458062834700779964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 04:56:21PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Tegra194 has four CPU clusters, each with their own cache hierarchy.
> This patch creates the CPU map for these clusters and adds the second-
> and third-level caches and associates them with the CPUs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - fix reg properties for CPU nodes and update unit-address to match
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 156 +++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 12 deletions(-)

Applied to for-5.5/arm64/dt.

Thierry

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZFoACgkQ3SOs138+
s6E0DQ/9E5bKqzhcgdK1ReNtJcRQrizoLvlpRBtXyug8WVy1ecWNq6sb1LJrI4R8
GtT5QPNuZxb0xQYeoeIEa6qIV+TSbzG6uM3MHQE6JNTd53qFyx/P3toMqJtjupfG
IoS0Z8ojwvJidBXDOUFEfyl9q4AWOaYOCVA25NkA9EJuDSgLdgFTmkRnm5XUmpxy
3vV1ykDdN6chQrjGS49VOsU8xToWvXQ6k6yztMY7hrD+g//FqavbyIFVvSAs/bzn
RD0EJQkDWHopJ2EXgzCDJYzNtBE7jNyeJzxF4L5vIWf8X/wssdZFWD5YP5hHvNiY
gAFThEsolGcdMaU6WFzkmVf0ZX/+uuNh+KKMI1p1HtEcmCqANwmW4VfvfpKiAtTf
El2VQJ+C8JiqP/MX2MprMzzz6hv6THauEgKoTIMs0UaEO7a+4QoGoyWteoznhpfE
VkgIg1gPY/Jld3RETzk0jprU8KAweV9nzf97q/WShVe+Vrjw8hTrcUZYb0F9vcZc
rzdr8ZaIZLqSZXOnRFPkGiaEva0BecpVg2lEsddYy9GDbOALN5nNUgz4dsoUiQKZ
otSmXTpgDdTuxI7B6S5yVWbtEXKcMKQfR2iejvOV8WDKP1pqcnNAAopcxVlGvOF+
FKjhoYwZ2mYqb0clGHbRGlWQV1Eu/XuMPzbQJndIK71OUPuS2+s=
=YAaR
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--


--===============7458062834700779964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7458062834700779964==--
