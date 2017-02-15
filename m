From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging:nvec:nvec_ps2.c: Preferingkzalloc(sizeof(*ser_dev)...) over kzalloc(sizeof(struct serio)...)
Date: Wed, 15 Feb 2017 13:06:56 +0100
Message-ID: <2216261.0XPs8u6SRF@fb07-iapwap2>
References: <20170214170120.GA6501@arushi-HP-Pavilion-Notebook>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart59499477.p2dvfuOhKM"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170214170120.GA6501@arushi-HP-Pavilion-Notebook>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart59499477.p2dvfuOhKM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 14. Februar 2017, 22:31:20 CET schrieb Arushi Singhal:
> Prefer kzalloc(sizeof(*ser_dev)...) over kzalloc(sizeof(struct
> serio)...) as reported by checkpatch.pl.
> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

looks like we are in a (make everyone) happy week.

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>


> ---
>  drivers/staging/nvec/nvec_ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c
> b/drivers/staging/nvec/nvec_ps2.c index 499952c8ef39..3b7bce3ffd19 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -107,7 +107,7 @@ static int nvec_mouse_probe(struct platform_device
> *pdev) struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
>  	struct serio *ser_dev;
> 
> -	ser_dev = kzalloc(sizeof(struct serio), GFP_KERNEL);
> +	ser_dev = kzalloc(sizeof(*ser_dev), GFP_KERNEL);
>  	if (!ser_dev)
>  		return -ENOMEM;


--nextPart59499477.p2dvfuOhKM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAlikRGAACgkQrJ5Hf0cU
G2hoCQf/RaQfwTH1BD8qMhrFhBnuc/ChvwqGWSzDEXZ7CaDZ5FMcfAaeP/+Joppb
fg5Zf/iJVU4MQQVSZG39hDzH2hhXk2BTkxuTAvNdfTZqMJJZ9s1glOyX8CTNNOAb
heIG99w35I8tW1JzmsgYLaY7ROXghdg8tc9Hh9v9b+hnaulXjcrixbpDRAlhc47f
eLpsP49/97iHaFgL0Zho+LQ1oVCGxbhYDw4eQffMxIWoCmiSiZQk5B8DGe7aGIJe
aADkGF+hBkISexm8O93F/RHQAleS9wp4/TNGo6p76SESBDyKAfxQa1WJwpJB9m/v
nMZN1Ffge2P3pp74wpnEC+KJxikGww==
=7g4d
-----END PGP SIGNATURE-----

--nextPart59499477.p2dvfuOhKM--
