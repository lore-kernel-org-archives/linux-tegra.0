From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add AC97 clock to the host controller
 node
Date: Mon, 18 Nov 2013 15:59:16 +0100
Message-ID: <20131118145915.GG26046@ulmo.nvidia.com>
References: <1384370243-17178-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384370243-17178-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2013 at 08:17:21PM +0100, Lucas Stach wrote:
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> --
> CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/d=
ts/tegra20-colibri-512.dtsi
> index d5c9bca..f186e64 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> +++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> @@ -448,6 +448,7 @@
>  			GPIO_ACTIVE_HIGH>;
>  		nvidia,codec-sync-gpio =3D <&gpio TEGRA_GPIO(P, 0)
>  			GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&tegra_car TEGRA20_CLK_AC97>;
>  	};
> =20
>  	usb@c5004000 {

That property already exists in the ac97 node of tegra20.dtsi, so it
shouldn't be needed here.

Thierry

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiitDAAoJEN0jrNd/PrOhsFgP/17MpgwO0jbHdL4iLFJMw64K
MRfcf+hP1nFTX9HHYNrnfIS1kOfFJXLMK/AS5Raf8ij/yWdd3+r7sdch8aw92xFh
B950J/CmRfq50VbsJaD0tO6J0KIP0J4JhNmbfLGI/GaHW4wRVlymmRJW6MwMezYL
u1o2exPSSk4vmyr/g6CBmfxQ77TVaJo3ViFgIU36+lIdnOEtROIp+RZYiWs2pGCy
vDNb94a1CL9xIXhvmpT9RbBj9aQl92v3yn8UAulc33UyenZFPIN+hLXWos9Dsb60
AjeAz75oUGASFSd6/PrYlKCuEHWtbdZj10gPglJ1xgrXtrnWUqUZnMCg7iplI+T+
KR//FXBwKGVuo/ag3ljUkMDmN+UWt03TXFduLrnECmomYUbHLwYA8Qe2OrzNMlBk
5K4aeVv7BRe7moloF4HmLhIU9XUss2ViboHp1tkIUxxFA0f1mfVLOH71WZnUMCUG
Cd5+QUYojux5XlQ8jKyS7dIz+qj1oQ4d5iTawTpyBYfON/bzwxQ8WGJHGcry+3Qj
K/NUjnSu0W7UicVCYn2tV52vV1pSaG+tnxDrCJmjydttsFatg3eyx4ejlsG3mmFm
hFsLfKwp2f0yj/OPZpy5pu1sDM1Pz91pMOwI6+Zw2/OXEUXmbEWGijr/Alyi6gJT
wkfbNlOJaPDvpVOPKF3k
=mHsw
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
