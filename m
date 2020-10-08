Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952ACC04EBE
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:56:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 418372083B
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQH4TLrI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgJHJ4V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 05:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgJHJ4V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 05:56:21 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9975C061755;
        Thu,  8 Oct 2020 02:56:19 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id ce10so7215221ejc.5;
        Thu, 08 Oct 2020 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vud+Tde+jCn43K272A0b3+noi0OEELurVQ7SECSZPOY=;
        b=uQH4TLrIMlR7FlO+StJtZGH3v6i2HYIsRq6E3pAvqIqCVCxjv8v180DhoHWXYvBotS
         3yL6RA/+Im86xIYkxg0k95GyYIIUIWPRNcJtNBju3UZk8FEeaeKbowYgn8GApgxMzWoe
         vN4Ex+gFLe6EvtnuWCNDzSmUKqq1m21nBR24XLrHg4A8pEbA4jvc3pZi2mO3RxjesVpI
         fjQOe3j+lt/131osV2TZkz4o+MX8CD/S/ty7ZgomeVdeDpg5I9vBn18e4R4fctVC6fW7
         ByzwFeVHUw6y5j9tlfBbKlj4Mw8feksNeIJMc1+EmksKuQqxH0KzPEbc8aHMr1nyHgs1
         fcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vud+Tde+jCn43K272A0b3+noi0OEELurVQ7SECSZPOY=;
        b=hGd/p53Db6zfD5Ks/bLkMcj2hfpzkkgy9lVBM+r6fQz0IFZQkU66cPJ4aRK5BebG8Y
         Uqsvx+VWl+hZ/HiKNmhWUdxWZtXQhYClu0cPV/ca86ugFFrESZKiSTxcloQ6x6gz4U+p
         nBH+w5ZTFPk+a/SSxM2P3q5zxwUeY3mACr09cv7P9HbED4h5D5W/IgdyPwIKF7JXwZDi
         RkMRxnxQBZhzTsKiI7wvCyf+CV+I0MA4FLx5OlxZFqK32Gzm0sLkO7FJNoaJZc+GJF4v
         bHxrvaTwhYH929UikfUSqsebONHKuypu4HkLmWdumzGolkIXN4zT8Mx2H36Pwxtxe8sd
         tFyQ==
X-Gm-Message-State: AOAM533rVkA+S5xzKnEfPqqKVo8s6WAmFLKkK6bov+GYife4eUVVAuxQ
        83oCSb/7A3ZRlF//2uC/Ln4=
X-Google-Smtp-Source: ABdhPJwrZ4dHMXazfEMebENZYGWYwSvw5NiZ+X5aNceexc6qPbhddzUF+Vc+g5rMO3mqD7PByPK+QA==
X-Received: by 2002:a17:906:170e:: with SMTP id c14mr7758141eje.275.1602150978403;
        Thu, 08 Oct 2020 02:56:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b1sm3532006edr.51.2020.10.08.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 02:56:17 -0700 (PDT)
Date:   Thu, 8 Oct 2020 11:56:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        digetx@gmail.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        hch@infradead.org
Subject: Re: [PATCH v4 2/2] iommu/tegra-smmu: Expand mutex protection range
Message-ID: <20201008095615.GC2349275@ulmo>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20200929061325.10197-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 11:13:25PM -0700, Nicolin Chen wrote:
> This is used to protect potential race condition at use_count.
> since probes of client drivers, calling attach_dev(), may run
> concurrently.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v3->v4:
>  * Fixed typo "Expend" =3D> "Expand"
> v2->v3:
>  * Renamed label "err_unlock" to "unlock"
> v1->v2:
>  * N/A
>=20
>  drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9+4j8ACgkQ3SOs138+
s6GrKxAAuQKdxk03qO0RyklzIvs/tQ4YwXAu25i2zLUTZsHePVoDX5cmHR3yMauj
QZKg81UOmUYDx2olNKqFfb6r+0cQUh1A2WXOufC4PaDDrOXTtztY6UAtjkW4subD
eASIetGdq+q+LOY46iq4iKtMMGCC50lEw7deNDcy2pGsawdVSpxk0EqSJUl+847Y
u14ZM2DseMxV6/l/ZYR+RlkwFfevKTBCe0ZiMmT4pPFQ/OvCy0tKYu9cJthZMLxZ
VKxtJ/l/tcGmZh3FEnS74jL65OXbykbuOyRujnC+tJlsB7MoaPjo+V6SKtDNbx+W
a90hcFiTCrBnEXjSDDvBeHm7NZEDKyD7s84WP3B1X3cXKJ16t9rNKCSMofj8RRVi
J/FJ4bYeBT9IGwrkEwroh2yBV3tVsv8OQkgPC1vxkB72vfDsz1FY4OsV3gz9+/Ai
k6sKVM1YyqKIDOWZT+vvleYz+mJU3cifRBl9pmktdbunjasHYIJFcfiv/+M7qkqW
lt75sN1s8H6TIKFBTb9ZEPOsfv2AbHa1+ibCwFdkcUfcNUU3n6wAuy+TO/9R65Ss
JtrbZIbhykdN6gnxVhb8FkcUn8JNx/AD+iSgkw4fx6GGaX6Wca0AcWedFRSV/6P/
QRFPkms+FTsdvN88T+PPqy6bmlV4QDxPKowfBQMyZHNj/cJKN7M=
=dNPP
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
