From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 6/7] arm64: dts: tegra210-p2180: Enable CPU idle support
Date: Thu, 31 Jan 2019 13:57:11 +0100
Message-ID: <20190131125711.GL23438@ulmo>
References: <20190131092410.28222-1-josephl@nvidia.com>
 <20190131092410.28222-7-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6831676933274225653=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131092410.28222-7-josephl@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============6831676933274225653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gmhhrsDozM2n+uz5"
Content-Disposition: inline


--gmhhrsDozM2n+uz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 05:24:09PM +0800, Joseph Lo wrote:
> Enable CPU idle support for Jetson TX1 platform.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
>  * no change
> v3:
>  * no change
> v2:
>  * no change
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2180.dtsi
> index 053458a5db55..d1a492c63e96 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -305,6 +305,12 @@
>  		cpu@3 {
>  			enable-method =3D "psci";
>  		};
> +
> +		idle-states {
> +			c7 {
> +				status =3D "okay";

Doesn't seem like the code currently cares, but the bindings are
specific, so this looks good to me.

Given that we need the timer in order to get out of this state, I'm
assuming that I should hold back on these patches until the driver
changes have been merged to make sure we don't regress. Is that
correct?

Thierry

--gmhhrsDozM2n+uz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS8KcACgkQ3SOs138+
s6F85w//ZZmfY0LXgFe/SNF2zAqb+A8PuEpwhY1vyW3fIlGZih2CcGLC5hqvP0T5
Mvj1dUpvwuTxWc03OK208/+HTPKlGaV7L2zsZFxETVZqEGNxSicUtdbSM6E0j7t6
swRUWgpDsG+5IBXFLSqhD7fJoZBlqVUSGs7Qi+nHGg+U9HKZjxGRZlB1SKZXSb79
4b50pyIQcXlIcxclIeKKWg6JhANqTcZz5biVIcSLRlF98TcMTwwkit7wrwBIFcN6
SbFo8VOoDD6mFGHbNylLNK4Ze/hTBB4/DrE+oy6FCJ9p5DrDrZZx4JCOTFKfYUYU
l/JTaxkNvZ7IvP8T3y0DqB8FMTflkdDlHi4jciPkUgiKYyNBhrSGojlO5SMRL5rE
dIeTTVMpJZi1MDvALazq5ldhe+iZnKWXmKYro+QCTaS5m4zxs3KK4F6ELN/h0AOv
NJzluQ3c/4QoCJ6aFr+a+hyU0yWn7BjGebGhaqsN2c9CGygX6LdFYuXy7O+jMGEB
rmFZf4oeyOPDdMt4wijTzpmhNyzQYhRpibktGhqDxpL2nlrAHLhsKDKocZEyeqyS
w/pNjVpLWlHBFbj6S+DfNN5atlIbQx5wgouEMrnWQgvwW4+Ko+kYzB7WcAsXJoWw
suhlLUGMS36clexmesvR14idfDLTmqM1r4O3LtTjarL8NCx+Bxc=
=NAvK
-----END PGP SIGNATURE-----

--gmhhrsDozM2n+uz5--


--===============6831676933274225653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6831676933274225653==--
