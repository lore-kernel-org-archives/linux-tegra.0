From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 18/18] arm64: dts: tegra210-p2180: Jetson TX1 SC7
 timings
Date: Wed, 26 Jun 2019 12:28:24 +0200
Message-ID: <20190626102824.GG6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:59PM -0700, Sowjanya Komatineni wrote:
> This patch has Jetson TX1 platform specific SC7 timing configuration
> in device tree.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Can you provide a similar patch for Jetson Nano (p3450-0000)? It'd be
great if we can make new features like this available across all boards.

Thierry

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2180.dtsi
> index 27723829d033..cb58f79deb48 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -279,6 +279,13 @@
> =20
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode =3D <0>;
> +		nvidia,cpu-pwr-good-time =3D <0>;
> +		nvidia,cpu-pwr-off-time =3D <0>;
> +		nvidia,core-pwr-good-time =3D <4587 3876>;
> +		nvidia,core-pwr-off-time =3D <39065>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
>  	};
> =20
>  	/* eMMC */
> --=20
> 2.7.4
>=20

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TSMcACgkQ3SOs138+
s6Hobg//bHL6IZg0MNnz6irMk4CtJYVFtTftwwB09UP8JKkxLxrMaYT9yjBG9AjT
bjtGZeRdj66yVRCU0sj8xPSNJZjXMepVk6TXaEjuzFtQcJtrSH1kAz8b+dCPHspT
5+GT3DXacuBqBB6rRQdbSA4MXFC7HWOoMgVPj9afqR4vu50+qhuimRjYQChjE6vF
OM/IcV1NoGwoYWuWmg6JDgPIydS/XoEfifaSLxnCiJ/Xkx13xdTY7FFrcPWGHIjT
X68dbzqKk/6nREuQaT/U9xsTkijD92PW0qTK4jfGEFK6d+DrMfNszfDudIYatw1/
IkP0wgUN7ldmbVCvwArBaSWxZRfIBgAixFniBNjYhaFJ8ctNkXGkedNio20TDdne
CRxgVQXQtmqgSXCbgFryl1NQk8vJGTOVDsYZlaJEBpPSlANx9IZNTOVpqXnD52FN
jcJ+PrD83WUVvT1RCRw0p43Bjc2iCpxcfuYsSxU5AWpvf9P/Om6A0WmpMyZADIXB
K5IUhJtRjBKZblfWPkJv6qX9eYLKx+QqwNy8AAl9Rqf3vjN0aH4J+JWuqSXHK/ko
9hlH7D2x+dQv4PzCvq/FAmquMz+RIo9fT4IZk4Voi0iZ9Zolm7lbTFcOpFJWye5E
wHh7HUyfgxxNYKYGzJFqPeBXPO30Ib6MaYUUQZdL4mM5D1M1IUg=
=DNYf
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
