From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V2 2/5] rtc: tegra: Use struct dev_pm_ops for power
 management
Date: Mon, 11 Mar 2013 09:51:33 +0100
Message-ID: <20130311085132.GA7900@avionic-0098.mockup.avionic-design.de>
References: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com>
 <1362991468-30226-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362991468-30226-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 02:14:25PM +0530, Laxman Dewangan wrote:
[...]
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
[...]
> @@ -431,6 +430,8 @@ static int tegra_rtc_resume(struct platform_device *p=
dev)
>  }
>  #endif
> =20
> +SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);

I should've been more explicit. Since you had this marked as static in
the previous patch, this needs to be static SIMPLE_DEV_PM_OPS.

With that change,

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPZsUAAoJEN0jrNd/PrOhUaUP/2PS48iepRWIsPSSrdthlRII
Fy0S55ZZQarzWxe79GiKaKPb5deA7wMpQaALspP3r5PJ1wmZgpDw5CgoRpOz6R8A
gNjuGXBs+7vzoljxzwF4giA2djUyHBy28VJ/BD+yTDoMHKj3fWtDJb39GOGdgL9C
Y3k6oJgb9rJs9mhMYs9f/ZV9qcetozz6x/Sd01l9qcZZKzFPoJPbqI3xTlaiqFHN
iTMR+3esZ+hHqhkfo/v11fy/VJaDFWX+/JSQuQS/jnSKn62KZypeinQgIYfrLcDD
KVCUQ2BnMBeEzejv2NzbosRUMVNX7gvJK9tTrrTvlra0FCmZIknIrI/L+bx86Vf/
VtkhgCWt/W5bRhrhUZOPvcIKD8n3GrpXoIw3qHvq71p1o9EgQVFJ7MMrE7WRVDrI
XWJaWhC0lXEkZ5Cr4qkZjIH7SKo57Slb5agrGLlGp8peMjFjB+xFNWzcD+SbSHUW
tC/HRmP673t/N2HmetxQ+s8eMKGL7FgtxkfADJuRYNb6vxwLjUXMn5t77YDI+t7o
NNDFKtGP8BJjzxPfcGpMXzlGdgSLZzh/b6rL8Yv/GYSCa7h+Fnr+xQGLHr3bYXtQ
UcxBTgo12rWSnyK2jPJHEpzLVgxTVzmXxP1BPpQxQpLGV3847S5EFHzgEbkhHNxj
ZDAq+4Apchsm04hH8X5H
=q9I2
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
