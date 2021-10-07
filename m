Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C066C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D57561260
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242977AbhJGRCF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242997AbhJGRCA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:02:00 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7762DC0613E3;
        Thu,  7 Oct 2021 09:59:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u18so21158034wrg.5;
        Thu, 07 Oct 2021 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O/6xeTmbcSfH4dU0QlXPd2Z2HNBLZ+XUOU25+6nXnF8=;
        b=Ujcn/9YFWw9MXCaG6NsmLaNNfvK/N1SiKzK4a4mqcfcyD/BeEse0PhnoEfbk4tOYnl
         UiaOQMTY3oguzPKZEDbwyTy9ptHAwXbYsCFtc/Jzco9Xy5YshJ+BOXaO/sk3UFojjuBv
         BsHB8PJ0sSCbWcxuH3YHGoXKLJSl079vyvhrAGpyx9RCUwEMwdkt+fSnfJvJ/GGogEtH
         nLPEmFZBqXBoWakVni5oLyNf9KWN2jTvIpmLAAUHiyfdZhVZQV1Sd/+Fm9qfRHBWjW5R
         olzwQJYxDwGjO50f+x8lmlJGW5vYtgRSNo6Fo0f8uNn65Ouoxo4GOkGIyobZC1+SQXfS
         t1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O/6xeTmbcSfH4dU0QlXPd2Z2HNBLZ+XUOU25+6nXnF8=;
        b=Ar18uk37laqD4LYi+Xew7lkeSsEICAoPdVk7y8Cd/9pInWtTL1mDtaxDBJQog1InC5
         x2dIpfQreJHOc396p4rbDGkZitZk0MBzg/i40nkZ/kmMKQgm7lfmpfHqMgk0any0Aj6r
         V2F/sJKUP43dUJTrCEHFpH9aIEfcPIG0Pj2hNKRIBLVbrcNy9TfDo6jgj6GBAu6A5ezB
         2ftIBusXmQC2XwrQP0i+IOMIngVpjfhixvF5zu8mYS5YDIiHtXAMw5ssarkIdc1XiiJP
         3hB7Tw6ht0Vo2M76CQ546E+/qLZZ5t01eLg5upCKVz7Y0qTanIctzMducU2D29xYJVXu
         bktA==
X-Gm-Message-State: AOAM532jq5fxbpb9x7JywNQXPnQGO7OoiDwcJxTmD/gxjgdRidkHnMuE
        M3t/NwMoiMsb0156Ra5RGZM=
X-Google-Smtp-Source: ABdhPJzcN9D8+20ZyMYSCztYzvvqG61UQ2rwsGhnrzQ/5vwoEHmaKS4ZAR3Ivcfrdkct8bSk4JkhTA==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr6832345wrw.226.1633625970107;
        Thu, 07 Oct 2021 09:59:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x17sm173027wrc.51.2021.10.07.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:59:28 -0700 (PDT)
Date:   Thu, 7 Oct 2021 18:59:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 4/6] iommu/tegra-smmu: Use swgrp pointer instead of
 swgroup id
Message-ID: <YV8nbgfZgkXHgsYm@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-5-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XSdiJyX2ODUVHwjJ"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-5-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XSdiJyX2ODUVHwjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:56PM -0700, Nicolin Chen wrote:
> This patch changes in struct tegra_smmu_group to use swgrp
> pointer instead of swgroup, as a preparational change for
> the "mappings" debugfs feature.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Seems fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--XSdiJyX2ODUVHwjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfJ24ACgkQ3SOs138+
s6G4fg//RJ1qv8A19ca5R0BWaTPrbKYcwVRsYCJWUNSW+TuIOpUIWAR4BaymZSV/
zYQwCVcjbXsrMWHmS/tFA8ySlceEncee13kTA5ypAHsZWOPZOyy3qlt6k6qXZYfc
32SKK7Tq6vbgI5LdWBF8JstrNG50IOeV144GxIK1owgGs7Yht06oqXoCrfBJ48qr
rH9jSZhYS11NvC17I7njqfIf4rSMxo1xVvMW2y1RJoh+rlbGWA9wSbqMDuHQR/Ek
4x5RqN3Vd5pc2LZUZ0UWQt6XnLwMYR9BK3ajLWKMmYEzNveYh9OEnQjInKNF1hjW
uloABAGbVtmf166hjoz/G+Vb7b0RZiskiz+FoljAekF1zFIh8z1J7USrEDcH9U5S
/YO7eaRSfPnL5CGVdrJcDdQuKRsvVF3/ScB8w68L+2/MdibD+oZD8YxUfYsRzFFQ
q2GbON+TSw6XVlpIGSuXlOQ8mmmPNvDv65k8/E0YvO1rkVd1Wll5sLIZqcTCc8t9
XWNSe3Dl9iQYE6OzQms6wjewzTtd5Yg0ZFM3ru081lTiftgz0SjkHGomq8h60afU
LTUaYmThVI1FmQiJZJrEoeHLTiiLF1614/EDSmgkbAfic/Hq7wYaQg4MMjvpAXDb
CCPNWuCOTQwuQxErtNjzMUeZ2dN4r56kZ2vd0eZN8Q7L8Nq8NkU=
=WxRa
-----END PGP SIGNATURE-----

--XSdiJyX2ODUVHwjJ--
