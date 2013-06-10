From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] memory: tegra30-mc: Fix IRQ handler bugs.
Date: Mon, 10 Jun 2013 22:37:49 +0200
Message-ID: <20130610203748.GB26036@mithrandir>
References: <1370855624-30564-1-git-send-email-ttynkkynen@nvidia.com>
 <1370855624-30564-3-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370855624-30564-3-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2013 at 12:13:44PM +0300, Tuomas Tynkkynen wrote:
[...]
> diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
[...]
> @@ -313,8 +313,11 @@ static irqreturn_t tegra30_mc_isr(int irq, void *data)
>  	mask &= stat;
>  	if (!mask)
>  		return IRQ_NONE;
> -	while ((bit = ffs(mask)) != 0)
> +	while ((bit = ffs(mask)) != 0) {
>  		tegra30_mc_decode(mc, bit - 1);
> +		mask &= BIT(bit);

Same comment as for patch 1/2.

Thierry

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRtjkcAAoJEN0jrNd/PrOhJTQP/jxuMESlkis/fkdlwjVZuHQf
7iZ9k7qQhWCXViAiwBwnWxRcSRBFm9yFD32gZwmppXxxRgKi8pqc/kVnNVud5cys
isEp3avTptGlIRBooYCC6srKUEWJlPQq6TiwBP8TBVXgsHsro8XaNWYS0GHYlgFD
NRMw3hrTW+rLfzbTxPgOhxe3Eehq9w9W2mWya+d0rkiHp/qm+sJJrvX9t8be7Y9i
e0RMPB84gIWpZ3fhGsln0bxSYqoevBBralAcKXVohosvwhYD3cxe6Ks/5H31wxOY
T2vC0QuHEpo8VFODZW/t+ndAvjQr7Vtw+1YAL3kQmFR6gaDPpNAFTrBRU/oqVWws
b14p3n/juNb9Is/ayfv0vDOFkQ8OKvaOWS+XvmL/CW0Sjxwmal5hfn3wxm/HH1s4
tmtvTkLSFFjGoMiN3enDqe+61gazBxP4h6lseYmbqN9REHCn0r6JGFzLkzROgcZr
/a+vV02H7txBtjNBxacH5vBsGVRa+q1aipiRa5ctNktF60hFCZeZUo/lVfCKNNT1
KHcPGd2fKBMoZohT5ZPI+3l75UWusWsdF3BUHOCpG2+ejvPG62eropdcLnbUQwVQ
vJ9KCWTd9rID02kk4FeCQqrhsLvhPj51zxoWoTEZgmiq9rZowRdLihToY9rY6anT
6eEzbTwJIT1pJFgGYP2u
=vKey
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
