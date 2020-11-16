Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAE2C4742C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 13:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A639222B9
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 13:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tP1jYnX5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgKPNUM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 08:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbgKPNUM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 08:20:12 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12438C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 05:20:10 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 23so12019719wmg.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F2fVw9l+jNZXbmU970orT1XJJthyNqr5RGIjpJC1p4c=;
        b=tP1jYnX5rQKPjQzK6u3CHdJ0fmMmj5/IYdXEIJRNEyMUgIgL0ZD1mdI1W4aA/6QQ0/
         SnTZzg0g2QsberUSwXAjwlukj3GjaZB1C8deZN86jMsmFbQVOyH4UXSb7gq2BAYGH+mM
         T5JVBNZ31gci1FpUvtw+XxxeL275L/H7f77D6HfEoE0igH1Ird528BXFKMc0LZesKQRU
         0gsnDS+UI4NJF13fxFVTQ+UF/+mP52JCeAqIRe935uVt3Lf2klfLNF1cdyw5aoebAjoL
         KDXIknJGl+MfJGokMF2ab84FQowiA3HiksttxWGSCXzhmSPN2CrhU7RzIX7UrtOoUlDq
         kpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F2fVw9l+jNZXbmU970orT1XJJthyNqr5RGIjpJC1p4c=;
        b=NKoxTLUdkYko3WK9wDytkGJEXHdyZtzJkCzePu7d0+Y4lhR9wskdTQ3GFOotm4I09U
         KKUDU9YAG4jyCmw8x5gPinCEbt/j1dSRlbMmUjZOKNwAWX8lGDC+P3roDfTez9FL30mr
         Cn7NYuTAgPfiLY2OoFjsVWrHB4bvm4tDrUxmy8A8SlnpFjX9f/sZxIGRNTPn771uB5F7
         X/hBXQycQF1bL0khYm5+fy7BLzPYPw15dafqhDn0+Oweb5IkK8kVmoqe004SbYTEmK0U
         CY4Vt8ezTlQG2VO+zGYgY1by0nWFuB9ts9Pib2cLvQ+H2zBApoThXQ8CHXku0jJM6n25
         mjXQ==
X-Gm-Message-State: AOAM530PynyDKx/oRg0cvtuZjgJfL5FNqCn7HfMTFtyPdHplap1i9sFo
        +n9VOiPJVvIB5iuE2YLtw6BGsMkFU4g=
X-Google-Smtp-Source: ABdhPJwKXB1f2ybPl48LX5MYTkW2QF6obhX4dF3VlE4b3SjMq79xKnKsKD4uvTTGRJFZ1Fmy1ff7GQ==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr15197621wmg.2.1605532808756;
        Mon, 16 Nov 2020 05:20:08 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d10sm22835293wro.89.2020.11.16.05.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 05:20:07 -0800 (PST)
Date:   Mon, 16 Nov 2020 14:20:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on
 TEGRA20_APB_DMA
Message-ID: <20201116132005.GD2224373@ulmo>
References: <20200923003421.4561-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <20200923003421.4561-1-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 03:34:21AM +0300, Dmitry Osipenko wrote:
> The DMA subsystem could be entirely disabled in Kconfig and then the
> TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
> fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
> dependency.
>=20
> The FUSE driver isn't a critical driver and currently it only provides
> NVMEM interface to userspace which isn't known to be widely used, and
> thus, it's fine if FUSE driver fails to load.

This isn't entirely accurate. The FUSE driver also provides SKU specific
information via tegra_sku_info and exposes some of the FUSE registers to
other drivers, such as the calibration data for XUSB.

The APB DMA is really only needed to work around an issue on Tegra20, so
perhaps this really is okay. On the other hand, could we not just change
the dependency to something like

	select DMADEVICES if ARCH_TEGRA_2x_SOC
	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC

to fix the Kconfig issue but keep the explicit documentation of this
dependency?

Thierry

>=20
> Let's remove the erroneous Kconfig dependency and let the FUSE driver to
> fail the probing if DMA is unavailable.
>=20
> Fixes: 19d41e5e9c68 ("soc/tegra: fuse: Add APB DMA dependency for Tegra20=
")
> Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D209301
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 976dee036470..676807c5a215 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -136,7 +136,6 @@ config SOC_TEGRA_FUSE
>  	def_bool y
>  	depends on ARCH_TEGRA
>  	select SOC_BUS
> -	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
> =20
>  config SOC_TEGRA_FLOWCTRL
>  	bool
> --=20
> 2.27.0
>=20

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+yfIMACgkQ3SOs138+
s6F+fA//YGltKrTZ+W6QunoppJZYucvju3wSPpBcoijLNAJpMwwMfTU4fPJXbXPp
wrdDyWUOwBQiS+7lPuLu3dwgJASAa9I8cFOKA78e/VYuLuzZZG5is7wDrFvcy3W3
DyiUo/rjLUCsdqWKD0jdJaoItsLpByYtXcst0jxEPeis9JBBX9Fd5gMKFG9d3vL1
ncQMtPw3q5O0AVxYJp7lOL44upZthl4f3DOtbLhG5+s+Pf3zhix6WfdStKFMvilY
Phwo9eH87PjMUw8olZnO6/VgAfK2jT6MCmGgTiN2qvCYbXEzL3IAtLg5uXxCG4ux
swkEQwVEjY9VRMrzFi8HsbXSm9zU4hV6P0cp4z8mRh+SFFaIIRlXTyNT09t1Fx0k
mXvpBtDh37LBH71ELZFJ8B+UDZfkKYTEwdbzyHrtwWWfNijZExNO0FUYFXGT5xe1
lMyqNpAaNzpNOcCC1l94F1xbOx/2/buV/5vDXosO0gU2Gt/yH85aw719e8jK//vu
W2ABOb3xRpSVly9V1zzmMQe706+yxSAHaI2FsZSbzvR00t1bPWcoiY+pKjzhxhDg
F9/VRHT6F5KA+ecxPF16avlKcDqSoqAQA/fxoulAMaM4obbmtbCyiKisIexHXoE7
syHDJGm2Ej1G+f2h/ifKtEWVKKRRoMy1G73FzQuHJNHINOXRRYA=
=C5o4
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
