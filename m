From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: tegra: Add device-tree for ASUS Google Nexus
 7
Date: Tue, 7 Apr 2020 12:50:53 +0200
Message-ID: <20200407105053.GD1720957@ulmo>
References: <20200406194110.21283-1-digetx@gmail.com>
 <20200406194110.21283-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200406194110.21283-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 10:41:06PM +0300, Dmitry Osipenko wrote:
[...]
> diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
[...]
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,cma@80000000 {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x80000000 0x30000000>;
> +			size = <0x10000000>; /* 256MiB */
> +			linux,cma-default;
> +			reusable;
> +		};
> +
> +		ramoops@bfdf0000 {
> +			compatible = "ramoops";
> +			reg = <0xbfdf0000 0x10000>;	/* 64kB */
> +			console-size = <0x8000>;	/* 32kB */
> +			record-size = <0x400>;		/*  1kB */
> +			ecc-size = <16>;
> +		};
> +
> +		trust_zone@bfe00000 {

Given that this is trademarked as "TrustZone", perhaps drop the
underscore?

Other than that, the same comments as for the Acer tablet patch also
apply here.

Thierry

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6MWw0ACgkQ3SOs138+
s6GFUxAAjuO9EN/TXj4dinbIrLbtW7TMjcDyz79Bogtubyxa0vfYgHB14xoBe5tm
xRsBWLwvJho9KUQZo2eo8prLaI1Wv2hZNy5T94OmmBRfT52Vfg+xLdRySwwDruft
Shw9b0FPXFJQAuV4R2BcWav7nznEiB+1d/NVwa/Je4bexYWWjXlcdjWDsx5fpBhd
SQaXl+P337dFW9xsoXSzM7Cxv9gMvZXxe61qgWTKCnTzkyvRZjPlnp61RgHaB60b
R9X4h4Llu297J3Abz8xfniQPj2V2ivcm5G7uOIeAlJFDNht78Pirytg8X8G2c3Iv
KGdz6NmV9yCkNSGjJ6gkQEH5BuI/dQbcmRkEw3CaD4hB2fWOvEfLqlSbplc/b3MT
pY7z60pREG06H2VlqrFMVQH0JFLkFNVMAZzDkvxpE9y+hLLDUYVjvHXti1HOTIBW
IJA+aiqaxiDDtghn4gp254d6n0Toq9knu3PIaKFf8ssv7VlrAFYUrScXnnXZfbG2
Nhu7szpE0ejt1+LwJkKWybeIEuKP4WK1cVmyd9vNPSa+i6WBNAmfxtA7SZ22ZF3+
nCZokOQ9js77AIIzz/WbtwG9miq6S2W1At7itN4IN2pt5B358kiXHdjk3y32k4Pz
ZM2/ODOgdmAKILn8xfXqi1S1ITKlUYD62qu86RYDiWclgDIOLJU=
=MqrP
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
