From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 29/31] ARM: tegra: remove legacy DMA entries from DT
Date: Fri, 29 Nov 2013 15:53:50 +0100
Message-ID: <20131129145349.GI9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-30-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LYw3s/afESlflPpp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-30-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LYw3s/afESlflPpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:24PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Now that all Tegra drivers have been converted to use DMA APIs which
> retrieve DMA channel information from standard DMA DT properties, we can
> remove all the legacy DT DMA-related properties.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 14 --------------
>  arch/arm/boot/dts/tegra20.dtsi  | 13 -------------
>  arch/arm/boot/dts/tegra30.dtsi  | 12 ------------
>  3 files changed, 39 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--LYw3s/afESlflPpp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKp9AAoJEN0jrNd/PrOh7xkP/Rwh1Kl6uQmLybJte51eF1R/
vSHLDuIuuOrle6xBWc3WHcrB8i1DA3Zvc/3iF6IMJyO2DERAPSwE+P66px6PwKwp
Q7+QTYOOsJOvI2LHmr9ccJ4Nhx87ZP9Z2pAJFG5Whs5M/l1BkKNG0FJW9hMMxHPM
Chw9FyVLveNQfxcNDGDvox4mgnUkqlaot0GHJrdl4Ie83TtGnz9JixI5yYkprhcp
2LWkUmnjs1t7Dnc8u0LSdhGoibRPEyp/da8TyYMnSJ/X8xKTgqZM5+sOwe92wjtW
m7AzXJVpmVaRiiKgpBuI4f+Jthk4tK1kHVQp1+0i/FqErxnHgarcDkhljvK89D+U
AHy8VX5KKnQHk3SKuYdvarLiVQN4Fj8jtusftWBEHtW/08I9QY/pb7ITkgATQSpK
1bFMlA+bJ9A14fZRlboxdKxGaGOmYpnddl6Q21KHL6ALjgOmhrn+uJ6C0eDnwOFU
erFm0Vn2kAlRl9puAc33+4j+ynh9rVHE0aqP8eNVJpuIMVgTzTg29smImyrzXBvP
nqadPde4cjbb13O74laNQVlpHG87xchY18stK5Hpu30neKbbOJwkurx9i6fwUoUg
Xtsm4OnY5h4JheKWiH67bO9RXd+ptKsCnu2iN59vQTKH52WJdEtgCm9RImXyERJv
xDanwFUV8Xo4V6EYiijt
=riBz
-----END PGP SIGNATURE-----

--LYw3s/afESlflPpp--
