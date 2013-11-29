From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/31] ARM: tegra: update DT files to add reset properties
Date: Fri, 29 Nov 2013 14:00:32 +0100
Message-ID: <20131129130031.GQ22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l8yJEXo8J9fv7OFY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--l8yJEXo8J9fv7OFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:53:59PM -0700, Stephen Warren wrote:
[...]
> @@ -135,8 +140,10 @@
>  		reg-shift = <2>;
>  		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>  		nvidia,dma-request-selector = <&apbdma 9>;
> -		status = "disabled";
>  		clocks = <&tegra_car TEGRA114_CLK_UARTB>;
> +		resets = <&tegra_car 7>;

This is confusing. For some reason that escapes me the tegra114-car.h
file defines TEGRA114_CLK_UARTB as 192. Other reset entries match the
numerical value of the TEGRA114_CLK_* define, which makes it easy to
double-check this.

But UARTB is indeed at bit 7, so this looks good.

Oh, I think perhaps it's caused by bit 7 being shared by both the UARTB
and the VFIR controllers for reset, but not for the clocks.

>  			reg = <0x70080300 0x100>;
>  			nvidia,ahub-cif-ids = <4 4>;
>  			clocks = <&tegra_car TEGRA114_CLK_I2S0>;

The clocks for these i2s devices are already listed in the ahub node. Is
that on purpose?

> @@ -110,6 +118,8 @@
>  			reg = <0x54080000 0x00040000>;
>  			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&tegra_car TEGRA30_CLK_VI>;
> +			resets = <&tegra_car 164>;

I think this needs to be 20.

> @@ -139,6 +155,9 @@
>  			clocks = <&tegra_car TEGRA30_CLK_GR3D
>  				  &tegra_car TEGRA30_CLK_GR3D2>;
>  			clock-names = "3d", "3d2";
> +			resets = <&tegra_car 24>,

For some reason bit 24 is missing from the register definition. Given
that this has worked before I suppose either the documentation is stale
or it's not necessary to take this module out of reset.

> +			 <&tegra_car 30>,  /* i2s0 */
> +			 <&tegra_car 11>,  /* i2s1 */
> +			 <&tegra_car 18>,  /* i2s2 */
> +			 <&tegra_car 101>, /* i2s3 */
> +			 <&tegra_car 102>, /* i2s4 */

Some comment for these as for Tegra20.

Thierry

--l8yJEXo8J9fv7OFY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmI/vAAoJEN0jrNd/PrOhFrEP/A9I9a4VlYmVtlIk9saI27/7
1DKT3VgjzqWxPH+wh/hYJfqYVbwULTjUxbiQNJLXGpC4A6T/zCbr/iDUqg5setTt
7G5fW5a0Av4LvgL5tMPnWezBPMQKJcJUUpBwvcdVXCjk+HBCIsKpH91pr69fyZe8
tMxc0tZR0aqc2rOHHmcoWkDYdd3HV7TEKe8uEnCiT7f0xiSpiAwVrCXtRKXNyEW/
4TIDtEuncqmqSOi8a7DzWqHySAjzp7HN1xixZk9GhI+1U1K3qzHCRCkvHAScOIn0
DDbhNa8dhLLZftN7cPqyhWTOxRCIqYHVHmJvzLa194DlMGs6wd/G3MdOe0xnvQEz
SIQkECDr/yji347FdrlmOVe5jjhQev+5tvO3mLpKAaxoWuzEilAncCRamy6VTLTa
PCfrWnQnEvr3qKYM4mmQeIBbOmjtMOdAwFFzZNCR9zATA0qztaXmRHxhmqGwQgRu
jMRWRPVIlNlMamE+t/NZWrmxzpRQSTA7g6p26m9g9P/o3zZTfW8t+GYEawNtK9Kw
zNWwBJ0Z7tJCvAv6lU/pby2k9efQz0CoTHyXYHYpwiHTGRol39Li87KBRQdHdr6L
LXGN9Te1giBBjVtqlWAvsNFKSN0th/RLhJJBG6VKmFpk0ka/L2XpOw1uGO+8WnD6
kF5mZMrtqRk7hbsKnUnM
=/XNv
-----END PGP SIGNATURE-----

--l8yJEXo8J9fv7OFY--
