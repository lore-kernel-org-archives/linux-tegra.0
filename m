Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33708C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3F52619B6
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhCWK0j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 06:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhCWK03 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 06:26:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A03CC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:26:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u9so26186457ejj.7
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i9GC/9wiyyqmpufu38pWJsXai4JYlchBbnAvyV+krzE=;
        b=L+wi+UOgUEO3sGWRs3M/3DlQrKQ5vL0TLkVUuCbNCepy+8NEOeYny/vFSR8c+RsVO4
         +OobxERyce3rQNRp0pMQe+lDnANQcrx6hbJKcQAyisbGmju5lgSlqGltB7fnJAazmL9o
         3L9QB4eVXw77C1mdXdgj3S2dW/00yHGT8PNihMVD5nttpP9+TJUEC6p08VNPPthizvbz
         lqiSYQZJb67He6+3CRLBIKVq8tHkPz1Aet4b7G2DraZNimx51Uz+x2IXCb4Dj06wXFJP
         QUgW3euj/ybhKK0Tk2nr2BOe5nGRv1z/S6W2O1e3VmD9AuAcsUiXOblOHIxpsUPf6hez
         TsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i9GC/9wiyyqmpufu38pWJsXai4JYlchBbnAvyV+krzE=;
        b=Ka8KNZ9uTf5LdZXOPXW11rtBVrYL1sxsC4UM1mIipLxeqmsvFuWAwFINdJzDCKHSJm
         IoKgX8vyYKATOyWO4ffaWkVVhB1n9v81+vyKpXy3npbWitWQDzl36NRNpeQQ93QfzovA
         JvdR9qa14BiYO5so9somKh0MKQRZoAjLDvgjdBqMBlIJRlhSNbulPN+v8TevxrWqzgtu
         Kon61qiqv1DMknqinY0VKI38hTs7ivk5bY9nz9Ioo5HCI30AP9CMS1pJQlPe49hzUpud
         new9MK/xkh33cam4v3fE5IvGd1mW1vQqNa1cX9pe2Nem2FZTC4ZbZkqnFyFWtjY1RQXe
         mdmg==
X-Gm-Message-State: AOAM531driZpmXSSB8gBcGemoTaCW3G7x4QyjGw4SPHLeyV42KLY5X2r
        /VmGlCiZGbktj009JFhMP9o=
X-Google-Smtp-Source: ABdhPJx8GLe2zb8aE/AgSh9CtJB0rFJ0ry63SsJ+QoOXgggjb/wUs+nK5Q+Wq3m4oVPmmFXnbF5itA==
X-Received: by 2002:a17:907:9e6:: with SMTP id ce6mr4105511ejc.207.1616495188129;
        Tue, 23 Mar 2021 03:26:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b18sm11005136ejb.77.2021.03.23.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 03:26:25 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:26:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 05/21] gpu: host1x: Use HW-equivalent syncpoint
 expiration check
Message-ID: <YFnCZU2fg/abv2eW@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-6-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VM1LGagSr+SVkiqf"
Content-Disposition: inline
In-Reply-To: <20210111130019.3515669-6-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VM1LGagSr+SVkiqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:03PM +0200, Mikko Perttunen wrote:
> Make syncpoint expiration checks always use the same logic used by
> the hardware. This ensures that there are no race conditions that
> could occur because of the hardware triggering a syncpoint interrupt
> and then the driver disagreeing.
>=20
> One situation where this could occur is if a job incremented a
> syncpoint too many times -- then the hardware would trigger an
> interrupt, but the driver would assume that a syncpoint value
> greater than the syncpoint's max value is in the future, and not
> clean up the job.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/syncpt.c | 51 ++-----------------------------------
>  1 file changed, 2 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index e48b4595cf53..9ccdf7709946 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -306,59 +306,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
>  bool host1x_syncpt_is_expired(struct host1x_syncpt *sp, u32 thresh)
>  {
>  	u32 current_val;
> -	u32 future_val;
> =20
>  	smp_rmb();
> =20
>  	current_val =3D (u32)atomic_read(&sp->min_val);
> -	future_val =3D (u32)atomic_read(&sp->max_val);
> -
> -	/* Note the use of unsigned arithmetic here (mod 1<<32).
> -	 *
> -	 * c =3D current_val =3D min_val	=3D the current value of the syncpoint.
> -	 * t =3D thresh			=3D the value we are checking
> -	 * f =3D future_val  =3D max_val	=3D the value c will reach when all
> -	 *				  outstanding increments have completed.
> -	 *
> -	 * Note that c always chases f until it reaches f.
> -	 *
> -	 * Dtf =3D (f - t)
> -	 * Dtc =3D (c - t)
> -	 *
> -	 *  Consider all cases:
> -	 *
> -	 *	A) .....c..t..f.....	Dtf < Dtc	need to wait
> -	 *	B) .....c.....f..t..	Dtf > Dtc	expired
> -	 *	C) ..t..c.....f.....	Dtf > Dtc	expired	   (Dct very large)
> -	 *
> -	 *  Any case where f=3D=3Dc: always expired (for any t).	Dtf =3D=3D Dcf
> -	 *  Any case where t=3D=3Dc: always expired (for any f).	Dtf >=3D Dtc (=
because Dtc=3D=3D0)
> -	 *  Any case where t=3D=3Df!=3Dc: always wait.		Dtf <  Dtc (because Dtf=
=3D=3D0,
> -	 *							Dtc!=3D0)
> -	 *
> -	 *  Other cases:
> -	 *
> -	 *	A) .....t..f..c.....	Dtf < Dtc	need to wait
> -	 *	A) .....f..c..t.....	Dtf < Dtc	need to wait
> -	 *	A) .....f..t..c.....	Dtf > Dtc	expired
> -	 *
> -	 *   So:
> -	 *	   Dtf >=3D Dtc implies EXPIRED	(return true)
> -	 *	   Dtf <  Dtc implies WAIT	(return false)
> -	 *
> -	 * Note: If t is expired then we *cannot* wait on it. We would wait
> -	 * forever (hang the system).
> -	 *
> -	 * Note: do NOT get clever and remove the -thresh from both sides. It
> -	 * is NOT the same.
> -	 *
> -	 * If future valueis zero, we have a client managed sync point. In that
> -	 * case we do a direct comparison.
> -	 */
> -	if (!host1x_syncpt_client_managed(sp))
> -		return future_val - thresh >=3D current_val - thresh;
> -	else
> -		return (s32)(current_val - thresh) >=3D 0;
> +
> +	return ((current_val - thresh) & 0x80000000U) =3D=3D 0U;

Heh... now I finally understand what this is supposed to do. =3D)

Nice one.

Thierry

--VM1LGagSr+SVkiqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZwmUACgkQ3SOs138+
s6GqjhAAr8zY6uzaKGI5lfqI8sHd88xVKWBTVSx+2crfUZ6i5Qj3N5VzylFlM2Wl
2T7POX3/pyFPd8NwWQq5awmYA2rRWqdZ33K9iivasUK+Bn/K3XDOIH9EdHgPOYLz
IZqJH7zQUmFPcPYV7ARPUbyjsDjRArhEXFAGIIfhNoRvk6/mDViEnwFjLq81yGIE
ytYOu4Cr/kL6idOsLpscc6cU2d3pU/9uJgUoJaM+FNvgZbjmmOw7mIz5bTgQO8Kt
GSx+/chve2MaN4wNgPQJ8FQlp72dd68/t6xJYrtUaaM0ZfWCILEBJ5dLhvdYYAE+
qKzXixKTwvVx3xGjLFeQzdcRIq0oQZmzTayYmoboDLPH73kn+XBcSd48kiXE3E2E
BA8am6cIi0VsfdtXDKXGaY47GvpCkhMuTi4/NWE9x6xH7ghzCYtR8YDepJWUuNjJ
MqmZ2fd0ePnBZMbGWtNPiMUHlfk/c/J2vdcXY2qgh93bfQvNIvdc2WQR23awc/bm
uGcHWU5/BD9Z397UDf1PrKJc4ux1mu/yfHDEbgslXMtq2KFRkEBdHImZW2MzVBIt
lRfMdu56YhTlKtthZQkO/aGVqCwj7zUABiVQpucOTJW/kAcWEQLA9m+nXL0nZ5km
bobJIruxhRED2yumP+F6t/Zi0Y/yIgbMLCL4kcOMpIy6hBVBluo=
=yEMR
-----END PGP SIGNATURE-----

--VM1LGagSr+SVkiqf--
