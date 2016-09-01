From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtc: constify rtc_class_ops structures
Date: Thu, 1 Sep 2016 13:35:22 +0200
Message-ID: <20160901113522.GC18255@ulmo.ba.sec>
References: <1472630725-25465-1-git-send-email-Julia.Lawall@lip6.fr>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <rtc-linux+bncBDTKFPPJUEHRB7FEUC7AKGQEYNYOLZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1472630725-25465-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wan ZongShun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Aug 31, 2016 at 10:05:25AM +0200, Julia Lawall wrote:
> Check for rtc_class_ops structures that are only passed to
> devm_rtc_device_register, rtc_device_register,
> platform_device_register_data, all of which declare the corresponding
> parameter as const.  Declare rtc_class_ops structures that have these
> properties as const.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct rtc_class_ops i@p = { ... };
> 
> @ok@
> identifier r.i;
> expression e1,e2,e3,e4;
> position p;
> @@
> (
> devm_rtc_device_register(e1,e2,&i@p,e3)
> |
> rtc_device_register(e1,e2,&i@p,e3)
> |
> platform_device_register_data(e1,e2,e3,&i@p,e4)
> )
> 
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> @@
> i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct rtc_class_ops i = { ... };
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
[...]
>  drivers/rtc/rtc-tegra.c      |    2 +-
[...]

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyBJ6AAoJEN0jrNd/PrOhhWwP/iRSPG7Hcx1dFammZmPkRgM4
gOsnIhTQnRVvCaMM2rH7ZhHoMoQX+/DX1LJYBmaDejyJfAqC2SxOOdKmTCIJsGcV
UUaaWtRlQUH/VZAAX+WqkHOW6TBA3cY+6ogKN8Htmpk0luiDX7ADJCv1m2edg2Kb
HQZdeNYB/7dO9HMa9sLi1CguxrMgVYPG53iv8Kj1E3Po7pQ+qX59PRVxUwbuiVcn
2H8FLdUoIuxt2M2M4EtVNx8mVpe37RTzR9zOwXRsc7R8v7pzpCT+aY3+R5cXNwhl
pp24pwd3C+cq6nDZ8pDOiyxVG2bcuZogXkKLeA142TEWYHSLa73iafunGAsBjR84
aUVkd7tNiFGheV73DtbAmIIC/8HpGKL+3o2xmCk+aUluD9xxs+DyWO7i3kJAD9q6
JVlVSCGxTnuRjH48NawvNKrnlXiabuo5yavwcxSq4uHenYBDDZ5AlLOV60BWhF2E
BUuY1TP0xSwq69vZcBwzrOCjJ/1dKtB3rixZiTGWO9juoQ7Qp4NMqSWuJ4pe4IgG
Pk+Y5UYRpeHe+5rQvdplKzDvdHoYY4jSe5lHrLlyGAy/NiRaITEyruGZyYQKEqVD
TuzYonHbypFaAVDzaMVtVvkqBw9W/kT8FhtDF4th997coqiL3e8lqgPJ3exGJV32
+RWfcKFRdlmGct9Kw4Iu
=5U2k
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
