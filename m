From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging:nvec: fix typo in comment
Date: Wed, 27 May 2015 12:47:45 +0200
Message-ID: <6669345.xnRRftvuKv@fb07-iapwap2>
References: <1432690254-3104-1-git-send-email-shailendra.capricorn@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4553843.8NxVoDL3Rz"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432690254-3104-1-git-send-email-shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart4553843.8NxVoDL3Rz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Am Mittwoch, 27. Mai 2015, 07:00:54 schrieb Shailendra Verma:
> Fix spelling error in comment in function tegra_nvec_remove.
> 
> Signed-off-by: Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
>  drivers/staging/nvec/nvec.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 1bdc8d0..164634d 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -916,7 +916,7 @@ static int tegra_nvec_remove(struct platform_device
> *pdev) nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
>  	cancel_work_sync(&nvec->rx_work);
>  	cancel_work_sync(&nvec->tx_work);
> -	/* FIXME: needs check wether nvec is responsible for power off */
> +	/* FIXME: needs check whether nvec is responsible for power off */
>  	pm_power_off = NULL;
> 
>  	return 0;

--nextPart4553843.8NxVoDL3Rz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVZaDRAAoJEKyeR39HFBtozk8IAKYx48gG15SM55+PQnqeWWab
0KPEUbv1ezJF2vkkSzwuS6ajJ5VNGX4qLsa1HXVzAWuZqusBo8Yd+Oby0tlm0neO
zxmLwhmn55s5bJf0/G697/fBsW+W21cWBOMmHb5O+7BxQy5wp4VfAXkhrgvKKvrj
NcRJScAjYN/Nzn+vv1d6zsjag3O0vScY8HtAnOKYeCAuPWjlgd91ggIKFsYQWGS6
wcSNPGzxVuFJ3l2WkI2O3GiynNKZpC2VglMCVP95uLDbS/zs/QNzKyxeAu3A/xsz
bkUsQ2kH4mXWXRyo2FLDTLnnqCQjo14JhfdtNuQC3PuoiCYJG/xifVq4LqUsJKw=
=OBMJ
-----END PGP SIGNATURE-----

--nextPart4553843.8NxVoDL3Rz--
