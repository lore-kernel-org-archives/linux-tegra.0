From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/1] amba: tegra-ahb: Fix build error w/ PM_SLEEP w/o
 PM_RUNTIME
Date: Thu, 14 Mar 2013 21:04:31 +0100
Message-ID: <20130314200431.GA4252@avionic-0098.mockup.avionic-design.de>
References: <1363252089-4120-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363252089-4120-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 11:08:09AM +0200, Hiroshi Doyu wrote:
> Make this depend on CONFIG_PM. This protection is necessary to not
> cause any build errors with any combination of PM features especially
> when supporting a new SoC where each PM features are being enabled
> one-by-one during its depelopment.
>=20
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reported-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/amba/tegra-ahb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> index 093c435..1f44e56 100644
> --- a/drivers/amba/tegra-ahb.c
> +++ b/drivers/amba/tegra-ahb.c
> @@ -158,7 +158,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
>  EXPORT_SYMBOL(tegra_ahb_enable_smmu);
>  #endif
> =20
> -#ifdef CONFIG_PM_SLEEP
> +#ifdef CONFIG_PM
>  static int tegra_ahb_suspend(struct device *dev)
>  {
>  	int i;

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRQi1PAAoJEN0jrNd/PrOhzSwP/0Bu6vkT3+bMYMYAA+UJb5pp
17Gy+fjaFVt/H9lTLOqjGSw2DSKylu8DyT9parMh7g7QQu5rqJbcvrybyV+noISc
TBnNiV5bHs8T/hs3E4xZec4sAs++H7c7nU0q9bWHPl6CX8+8rbC2OTmnvjW3CrIE
VRWAnQmKCgWF+LYBFZ+7OJCBKYrTPDZ/l6p9Wn8Fi7Et8KyFRZvgBnG8XDSrWBgp
nVWaLg7tDeEuwKyDCazPXDjfmUAnyKrYvAgtcZALNR6w2mAwBlF1nToeKGkJ9h0J
IfGaJBaYvtBcdvYS5in+MGUdkglX5NRQG03ntSD/jVcBagP1rOFZrNSQrpFIB8ep
6TLN+4E+MRVZjcnxILHLl6zfFC0/+ZnYVsTbBb6ZWZElYPH5e+MveXMfThpWjmrG
gSBnR7GSCXuBhP3f3dW8EQnbshIWjL2nKWfZWIXARGfhJ5nCbTEAfbtwwUUY08RU
DHiED384N73tQjcNZZqIk1NZGph6uxBBhLcd5NFp1ybkTjg5Zv1n0uOskIR1YVKV
IO/4PAF7iArJl+5WcQtyzM64Qw0JqzHIKjOlNvilyYkkGVtQGDiAzLjLPFtiKJXC
ywsP6u+dZwawWVJ3b7rDo8Dib2aBBRx3HXao1a1ezbRRLHDGb/LXhc5mPTKRIvHQ
XasHBlXeVd/P60NWeRnS
=ilpT
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
