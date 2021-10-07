Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A845AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A6A861090
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 16:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242800AbhJGQpo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242755AbhJGQpo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 12:45:44 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04573C061570;
        Thu,  7 Oct 2021 09:43:50 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id s15so21030179wrv.11;
        Thu, 07 Oct 2021 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/o6DiwQZhh19GLhVRavM/M0aMT3RcLEjTJ9jadw7cGo=;
        b=RvjWatib7mLhQDYv2+BXxiKtKUXGJLp0dXyjkWYHoki61KjPqd0PsYAiAApiYK8lsf
         cmpFclGzBy2jCMrijwFTXsC20VfARzplHYSfrfWVpxLATljzz7SJdQPSAYnsVZbo6zLm
         lOHqcuRDkUEpJ6vGAh78qSM4wIl4S4DVclBgy2FcNbKebvpn5KB5bKV6VJZl1SBFn1Vl
         LNv2cXrWBkzUOz8PEJ5S3h1Vi5sFIV8Qz9sokvPWTg2yCU6LLX2EZciaxjis5Nihw4+x
         +cjjJFs5bZg9eCV97VZefXU+aV2og3VVfwJvMJ3OJ1in/CtplG7WX63LKAWaM0RpSepE
         cSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/o6DiwQZhh19GLhVRavM/M0aMT3RcLEjTJ9jadw7cGo=;
        b=WWWVxKwAST8NKmsrS3O2fA+/DMwk7zvJNjN0dKhcPNDfvmJ+UI+Q613BL0qDQZABPE
         AvGN5o68Ix6dLhLg99lEK1x2oRPHBTNQ09ZOnoGbp2/e6LLOiOPdsd/qr9QWE21rTxAU
         ZpEakYNbWagrP7YriyCe+U5kWJ+6OsW9AoRY/A0qoQXBJCKnixKOqZVVV9AyAVxWpfbw
         ZseVc0HJHz403Cqlx2MVtPbGZ9D6CLTW29I3tCDuh5HiOwOjEPg7THvAoVZHsPLNDOsK
         Mgwtuobjva5mJa10+xygQABs7ly+GgBB9RUio3faErql16X5JJTnw6IEbMkmIJzPIaZ6
         Fs+A==
X-Gm-Message-State: AOAM5338WTLea01QApfe/NYJh+foqxiSQn+1nZIakZgNabjN3VAHrjWh
        Mh9lfbY4tMzOEnamkM5G75jeP8bu3zg=
X-Google-Smtp-Source: ABdhPJxMOHI4XL+MVCsGksAzLKfzL84amFFZ6UA/Vds//W9SvT/L9kO0OFGtcWT5eAjLP4w2Cq8vfw==
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr5901641wmg.70.1633625028637;
        Thu, 07 Oct 2021 09:43:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z6sm186037wmp.1.2021.10.07.09.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:43:47 -0700 (PDT)
Date:   Thu, 7 Oct 2021 18:43:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 1/6] iommu/tegra-smmu: Rename struct iommu_group
 *group to *grp
Message-ID: <YV8jwuXnwx2tqBlR@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uYhwg0fUPRcWSEUC"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uYhwg0fUPRcWSEUC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:53PM -0700, Nicolin Chen wrote:
> There are a few structs using "group" for their pointer instances.
> This gets confusing sometimes. The instance of struct iommu_group
> is used in local function with an alias "grp", which can separate
> it from others.
>=20
> So this patch simply renames "group" to "grp" as a cleanup.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--uYhwg0fUPRcWSEUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfI8AACgkQ3SOs138+
s6Eq7w//SVWsjVe9UOjkMKkpAbWc4qfqqLNq7qF34QQ9ro3WdZpuOAu19A6CAFlp
GhMiQp/HKvnnWD9RWjftqKHnK1fuEoBvyPoRJGV8M4SQ8jdKAZfA57evk8a8DH/U
e32E9akHOXqFxMK8YJAcz3JECGJ0IWTheeUREBcfB8Gk8ldW1rl1zRTP2hwLD89e
WftOVkxpIeqrpJthaQ0MGIjEdVk3E0My9KSD2TCkCqVUVh8cprUhMaWl6ImuauGt
BYxaXHCxkLKkM0QLEcOJReizLpqBTBMOAvuvWU+Fdzrgse0Fq6XrFx9DbNyvYG8a
2PXa7b+BbO32/3eIOtzvddqEV7u0f0PgNY2rTfXlpE572OTWZ74/MYKyIbMxt4im
rtwF8goKHEANM1wyCngM3mcoQfHlZNhluWAM6zrfpj0EQeovkj2vskrjnC67Kdnv
uze7Rqc9IZqVDS43xC54zLwqh7F89yt8GzXQySZLBtxctvRgKwYs5VzNxd7CYGTP
ZRdEvOTXHCR5cXoCmc59B6V8mty6v59Fk4ZMOlPIWOVSzCEIZbxZGTvHCB/JGxff
5XqwY2w1pRC78MusL3NctBY4tbnSEU2uDyGJIkBnIuc381yqB0E1v88EYrnsszha
p0J0h08Sqc1Vz2YSaAZYoZtoaKNKQy/j1mXeCHC6dMWwH5jkNLQ=
=ZGNg
-----END PGP SIGNATURE-----

--uYhwg0fUPRcWSEUC--
