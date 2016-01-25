From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: replace led_classdev_register
Date: Mon, 25 Jan 2016 22:00:30 +0100
Message-ID: <2597303.a4Sc8PqG2R@ax5200p>
References: <20160121102450.GA10897@IND12F0122>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3216891.n81t2AyFHP"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121102450.GA10897@IND12F0122>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gujulan Elango, Hari Prasath (H.)" <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nextPart3216891.n81t2AyFHP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag 21 Januar 2016, 10:23:46 schrieb Gujulan Elango, Hari Prasath:
> From: Hari Prasath Gujulan Elango <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>
> 
> Replace the led_classdev_register() with the platform managed version
> devm_led_classdev_register() & henceforth remove the redundant
> nvec_paz00_remove() function.
> 
> Signed-off-by: Hari Prasath Gujulan Elango <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>

Thanks!

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
>  drivers/staging/nvec/nvec_paz00.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec_paz00.c
> b/drivers/staging/nvec/nvec_paz00.c index 68146bf..cddbfd2 100644
> --- a/drivers/staging/nvec/nvec_paz00.c
> +++ b/drivers/staging/nvec/nvec_paz00.c
> @@ -63,7 +63,7 @@ static int nvec_paz00_probe(struct platform_device *pdev)
> 
>  	platform_set_drvdata(pdev, led);
> 
> -	ret = led_classdev_register(&pdev->dev, &led->cdev);
> +	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
>  	if (ret < 0)
>  		return ret;
> 
> @@ -73,18 +73,8 @@ static int nvec_paz00_probe(struct platform_device *pdev)
> return 0;
>  }
> 
> -static int nvec_paz00_remove(struct platform_device *pdev)
> -{
> -	struct nvec_led *led = platform_get_drvdata(pdev);
> -
> -	led_classdev_unregister(&led->cdev);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver nvec_paz00_driver = {
>  	.probe  = nvec_paz00_probe,
> -	.remove = nvec_paz00_remove,
>  	.driver = {
>  		.name  = "nvec-paz00",
>  	},

--nextPart3216891.n81t2AyFHP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJWpozuAAoJEKyeR39HFBtodk4H/1Zrps4VfTi+++xVyjRTKgu6
MniyBAy3VEbnS/AsQQfQKk5ZuRu4JJ/ldWJLyPapKklYu4e+bFGrzqGB97NssFar
jJQhUrQXDT/sthX5IvR+R3x4YI1ARYm8uUYhs6V1jsRW3UefSek3Zd985NdyK1+A
/QTSdFOjR6UlR4b/P0PaEX+nn9/pgYkv3qjj0EcqFneimjYfZuGoH9loJoHK8tM8
kwiEu3+iVa8kVBPea1S/uaZ9SSRp5+M86Hko9NaxSfyr5gwe0E+h0C9J7jDynYaJ
h8eQlP8aQe8URbQ96VaG0P8g0HvANz6u/wunCdfCjjW+n1aFWutuc/aMqYQwtS8=
=jPKV
-----END PGP SIGNATURE-----

--nextPart3216891.n81t2AyFHP--
