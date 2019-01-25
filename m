From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: dts: tegra210-smaug: fix IRQ type of PMIC
Date: Fri, 25 Jan 2019 13:03:16 +0100
Message-ID: <20190125120316.GD12353@ulmo>
References: <20190104071646.15828-1-josephl@nvidia.com>
 <20190104071646.15828-2-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0889917863182305958=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104071646.15828-2-josephl@nvidia.com>
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


--===============0889917863182305958==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2019 at 03:16:45PM +0800, Joseph Lo wrote:
> Fix IRQ type of PMIC which should be configured as high-level trigger.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index c08c5471b974..5a67890cfb7a 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1362,7 +1362,7 @@
>  		max77620: max77620@3c {
>  			compatible =3D "maxim,max77620";
>  			reg =3D <0x3c>;
> -			interrupts =3D <0 86 IRQ_TYPE_NONE>;
> +			interrupts =3D <0 86 IRQ_TYPE_LEVEL_HIGH>;

Applied to for-5.1/arm64/dt, thanks.

Thierry

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxK+wQACgkQ3SOs138+
s6E5PQ//dAz9UJjbVba6RxO169pcE5EHPckO9PWifyggQSznb7GsS2wNRmt+riKs
bPSFBbQG+FHETwT6n57vzuWpyxWvJfbtbSujYxvwhd9sV1znAfXViImMMt0zB76K
q0z8AfYsMnjIjdkxCoIAnmOWo6ofTiiwtCnesCpehKcfmgfQ9VqybR6e26dA+Emo
kbKusiEprqkJRu7JPplgC22VvNQzEdEJJmY2BvRy7rOHYh19/3reE3ANWGHtJt09
YXSGbejb6onQC/aQ/jSWyCciX/U7B/wd/6P9XvCVVMr/jpuA5W0BEKg6ADS29jWp
oDhMVXujt6WgFTpK+YgnDfZFLzXxUftGuJ06WG2G8woTnshCzUho1w+17+dq5Bxv
csC0aKwb6u1z5kMkxk/Xq+spUv6oYs59cKv+D0D38xeus0tRbnMUGbHETARkkgrh
nZHX7rdmgA9sU6iebmTiwp7+bNOl2KSOwnGQs4oI6TnjYBkGLwlDNkbpapvEJEeo
FT5s2YapLJLOz0pqyYoEQm8mEEFxK8/FB8L49LOdU/6AOdpHlrRRs4DU+ZRXE+M1
2IBRwg7yLkSwMUrvNQctjVJz0vcqMlZcIO4nX4E1EmB/hc0KuQ+gy9GpH7aCQg3n
kWR08j2w2ocPpKBvzagUDRd0+AWLH5NpHtwY6ZFZ0d+Knb8gIpc=
=zfze
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--


--===============0889917863182305958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0889917863182305958==--
