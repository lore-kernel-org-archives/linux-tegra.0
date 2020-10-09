Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9337AC433DF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C3EF222BA
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJdHOZtB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388385AbgJIMLq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgJIMLq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 08:11:46 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111ADC0613D2;
        Fri,  9 Oct 2020 05:11:46 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i5so9103450edr.5;
        Fri, 09 Oct 2020 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jk0rFDCpD3qSTy22hFQcdvZQOyHmddQwqnlhye5Yc0Y=;
        b=XJdHOZtBcMJm3LWWIIugpmY5dlOwMxapGDSLOd25Xwn8zKs/BlDOSQpAIB7gvRJ2JB
         E13PnG0Yw+QrkKa8XIh76Ky0n/EKThjkMVzhHy9L4BDDbM2UaDXntjfRwRY2avt7FOmz
         f5GzgwKZ+eByPhpX+OYDg4oxS8wO4LK1J6M24BzIlBSyinw6xWnaUcozLUfJtkRcslAy
         1pS3C8iVY+4D8fMgythYF2/r60zqFAWJPmDxn78byjl01hUcqAKFDnrNsUcZixosHwHj
         HU++anqe0c7Bw715d7nPpGWTPlE3seLLU90lnpqJNL7+qNi4EQhwCc9NnEKnkluIFdr+
         klzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jk0rFDCpD3qSTy22hFQcdvZQOyHmddQwqnlhye5Yc0Y=;
        b=S50ylAr/FyUf7xqZ/HPwKtm+4IZXrv0k3K14uJshkNlvJtZ651u46AcBpD0bp4UE5j
         GYcJStqnm+9fIXXkJw4WAOwvgJ6DLihj1DcjLaPLv1ts0xkCHyGUd/KZMs1Mly8R9MHi
         S5yZRYlDPrR4xgWEgb0+4Wj+SBhpvP+ulUqX6jwrn5iYNzaGa7qkGJq+yJbvMacazpzE
         PAzbg7RKYctRh2MgdIIPpoRN6utma8JnHFgPbNjMgqwumPmyAkWKNtbgHWuP1KDQQ91W
         Dk/5xE2JDERxpLrcKq+TTLfbsEJHO4Mey9B35xXfuPy1fKOqQAVGTNB9B9Qp8sWExg0q
         gEcQ==
X-Gm-Message-State: AOAM5328UFTvm67PmDBuWgvyadCMLnuSV58awAU0hKH8jASTS5LMdd8O
        xY22Kq52f06nX967HDXzuIg=
X-Google-Smtp-Source: ABdhPJxvPt/AAZpDaEx6NkpJGZ5qRZOyDzTTATPtRJDp9RA750NQOrbjTfZL7RInnOxLT5ohOsOOSw==
X-Received: by 2002:a05:6402:1446:: with SMTP id d6mr14176591edx.244.1602245504723;
        Fri, 09 Oct 2020 05:11:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m7sm6931865edv.88.2020.10.09.05.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:11:43 -0700 (PDT)
Date:   Fri, 9 Oct 2020 14:11:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] memory: tegra: Correct la.reg address of seswr
Message-ID: <20201009121141.GA458338@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:37:42PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, ALLOWANCE_SESWR is located in field
> [23:16] of register at address 0x3e0 with a reset value of 0x80
> at register 0x3e0, while bit-1 of register 0xb98 is for enable
> bit of seswr. So this patch fixes it.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra=
210.c
> index 7fb8b5438bf4..088814279616 100644
> --- a/drivers/memory/tegra/tegra210.c
> +++ b/drivers/memory/tegra/tegra210.c
> @@ -897,7 +897,7 @@ static const struct tegra_mc_client tegra210_mc_clien=
ts[] =3D {
>  			.bit =3D 1,
>  		},
>  		.la =3D {
> -			.reg =3D 0xb98,
> +			.reg =3D 0x3e0,
>  			.shift =3D 16,
>  			.mask =3D 0xff,
>  			.def =3D 0x80,

Heh, indeed. Look like I copied the reg offset from the .smmu.reg by
mistake.

Acked-by: Thierry Reding <treding@nvidia.com>

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+AU30ACgkQ3SOs138+
s6HLcw//f0rLGT0weUM22TjDoPlUvDuJdLz7knleQVQb4hOA5dQ982eMQ3N2Dxxv
0vy3w4DwWguwe07XYwumkLE/jr4ExjKIoy+AUoiEZUb9u4vpuOPlqoKkeUKf+mlW
dE6grD8rdTXqYyJHlQyRHPLSXyVqLahSAUQDceSbQYZo9uS695NC2y81nzITqNHd
hgCW/f73CM2Mu3Zld3LQi9v6BpI4JmMLdJVKfGesCSaRxME1e3iCFp66U6dF6eU7
lJ/oWvE4FqL/PO61xEgm8iL6MmFtuv5sWcS7CD4zL2ISeyLuML821cHshhbZ1MxZ
VMCmaJtQ65Fm7eqfkSp7pEo8G9tyMrO8Rp+0n7TpmiHC7wdvVlr3eizgNUUW7/zu
wf9ElokKFHTPYOzZe49cxBagSLhxqA8TZNW1qPy3hfglyFajQIuQ36rZ1sGyG+vR
pGpeyIcmDdOAz5coUtA29gfS/4dGX11cW07DmvXnPxiA6BWDtWFzXeojY39/UvvQ
/R8lYlnzXvPbDyyOaqzNi+FVK1xwZSoH7fhBJxCxvTUDil+xiIHGqyfnER3QTy+E
JcNM3XJwQwT+udbuly/aslk8rMG0ZHvOV9Fv0W+bOyh9f5CF8hN8qcXjzwnnd2F1
PAOPvBlQEXBburedRuFrhcSZPK51CzNLYCwk1bEOd+BxAfrUSJM=
=PIGI
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
