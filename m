From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] gpu: host1x: add runtime pm support for dc
Date: Thu, 13 Jun 2013 20:49:39 +0200
Message-ID: <20130613184938.GE32574@mithrandir>
References: <1371117218-2326-1-git-send-email-mkulkarni@nvidia.com>
 <1371117218-2326-4-git-send-email-mkulkarni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371117218-2326-4-git-send-email-mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2013 at 03:23:37PM +0530, Mayuresh Kulkarni wrote:
[...]
> diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
[...]
> @@ -1128,9 +1129,7 @@ static int tegra_dc_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(dc->clk);
>  	}
> =20
> -	err =3D clk_prepare_enable(dc->clk);
> -	if (err < 0)
> -		return err;
> +	platform_set_drvdata(pdev, dc);

Why do you move the call to platform_set_drvdata() up here?

Thierry

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRuhRCAAoJEN0jrNd/PrOhyjQQALJXA7pC8gN5raC6QgJ22FfM
zy8Sursr8bwcCFePa0vuZG6dGorfBqzWteEEm1dC6Je9Y4DdlmlH/GaY2Z2gVtpW
q5qnZkuokU/QMPdz1pWURjvC+30y/oLcwgh37cauixZkcfcP+K025o4zrd70jIby
s5BuJdaZrEe2AoBTXCxhuAlfvcKNj6PKCurknKtR7+5gNUwvyjRB+tWnpVyMnBYA
glYQBhZOnwcUyO1PwWCCdre3Y/oVpm0cXR5Fj1MTXQXXh9owavIDVcUHLKGwevkz
WAPzkOoEW8yYCytROqHPGoCyEApglpu4iAF4LkcvhrT4WurC1Fc/dJbdYGf9jlFf
FS4RBszLOjQVhwV5YGydGuX5QmrDDVCGZRFNxi/Ek7IhACb86ol88SkhbmHSGmKJ
oNws9R0XUNb07EfaxjPTRSIUKunIvqcRr0e3gnFzs443c76y4L+5ry74LViQXnz9
57i9fJ8dWt+OpZ4l+WcLt5g2rzYiWLUsND0zEqKwo/OQlfPOpaKlbNfujruaRHtO
dQ+Z2jxVY383MHHki2hbFSYNYmrET5qE7FR4UCvlhijfSPYqznxJDRXNtj0O0EqH
+xW1CELOxlR31soYXfMnyGyNsiajfBB2eolkmR2OFo8dh2mjAk2jEkR36sBmX1Qo
VfloWSPNB5riGqrq54ok
=Bicr
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
