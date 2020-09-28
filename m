Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F54C4741F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2813E221E8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0ZUvXwo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgI1NKQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgI1NKQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:10:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC33C061755;
        Mon, 28 Sep 2020 06:10:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so1303324wrv.1;
        Mon, 28 Sep 2020 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JtJ50J+uZX/OvZSAOJ1o6x79ryX8z+0JqEU167BNi6k=;
        b=d0ZUvXwoOO8XOPK8RRMqMQKfPkIg2je6ZIyjq3Zr0znMm2R0coT+QtYqJu49NghEjt
         /L/HRPKyj5sR6PLT3ZgnN+QVzzeRywHCgbsqpGvBHkcNZa6qWPosssB/2HWr/lyHxPpP
         Tb/u93tB0z/111/kyHS7ARqQbgwR3rjAoGUb32QNkK3fNriluk+3PWDuA/g0g79l/D0F
         3Hi5EUjwqPjhAiRUst+Y4MDgRGsKEAjtAgkwz9Y2pM3ykn/xUbTVwFTIhk+H0X2Um9CT
         dHKKwIyzBk4jdVpcvnXwcLz2OqWpSZidYXqGBgzrbwx5fID+5emMsCmbNbFcB5TRknz6
         qw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JtJ50J+uZX/OvZSAOJ1o6x79ryX8z+0JqEU167BNi6k=;
        b=t8ei2sigBm93RDCb0a/MW5Z4dm50Nfevpq26iKVpKcdtvSb0myYslQFWTLPDJ6uQWW
         qpLKPElcxq+CB/8Ezn4x/11SGmiFhLcVnUyBMCMZJfEMzS+JSu8n4Jxr9QGrx0nta20B
         UdecwLK3XhOad8e0TyYQ+tkGOmgLhHg+7hW2LbcxDh6QGB47Aa4CKHUhjYzBNe8oeyKb
         2BcPkFuA/nDh5WxYbEm2E9f6l4yclca1KdezKG3+udCOIenbVmzu/pr3uTSSrJ3F7WKJ
         OzQMfNMj6qdXT+uJw0PTUs0s13xfH37wJ1SMMb2a5a6T3SXsNSu63hw8P9PvSFb8ZZ7p
         X2ZQ==
X-Gm-Message-State: AOAM532ZXmIe3vl+oNetCwRnAwKcENWB4GPxNd18758ZUTac1uUKk9MX
        64ZbiJlZqsruKBMIZ6lJoI0=
X-Google-Smtp-Source: ABdhPJzeM915RwDK4gln2RndHdA+LIcxyJe39PJD/kWRg26KUzaq3gWMMflH4Iejf/Fbj14yySBCdA==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr1618785wrc.193.1601298614474;
        Mon, 28 Sep 2020 06:10:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m4sm1660351wro.18.2020.09.28.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:10:12 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:10:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 06/15] phy: tegra: xusb: Add Tegra210 lane_iddq
 operation
Message-ID: <20200928131010.GG3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-7-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-7-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:32PM +0800, JC Kuo wrote:
> As per Tegra210 TRM, before changing lane assignments, driver should
> keep lanes in IDDQ and sleep state; after changing lane assignments,
> driver should bring lanes out of IDDQ.
> This commit implements the required operations.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    add 'misc_ctl2' data member to UPHY lane for carrying MISC_PAD_PX_CTL2=
 offset
>    tegra210_uphy_lane_iddq_[enable/disable]() to access 'misc_ctl2' data =
member
>   =20
>  drivers/phy/tegra/xusb-tegra210.c | 82 ++++++++++++++++++++++++++++---
>  drivers/phy/tegra/xusb.c          |  6 +++
>  drivers/phy/tegra/xusb.h          |  6 +++
>  3 files changed, 86 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x4LIACgkQ3SOs138+
s6EWnxAAqg2nc6Gb5VPf9jkmreIxzXLFLr8D7F0j8EqfeMHwwQyAC+DiPrs5/Yke
4o58t1xz4d6eLORhGZi+l2rW6bKA9wp0ODjwrTtajzWMik2yqm1GQ7r9S24+yyWB
L7CjqvLJPqXjoWSJEHFdTm5YqAYdkYKKz2235Y4HO5Rh1GbbrMmA3YVWA+Ta03h3
rmEyq68UFi56+ESEt3qyTPt+ygydCxY9I3Gpek4GqNXUTJuBChYDEUtToeyhWA78
nnMd5ay8IkJiiTbiCU7YFF0hruExZs37twH60SzhZRT+8ADtcvc9dzXccgDOa37u
n0HJhy4uVbubHGbCIuDZ7cuUB3cmgbZ5XUcc+Qt13GbGtD2mB9fb0hceD8dmBOu/
sI9VsSjBV5t6g5ETigzIaLerqRwax7kIoQRSQER4YdveJWKCj9o4roQVTwPDclNm
v55LwmZ5ciDuJoqGDDlu23ZUkDtM6zsBLwmUG2tgT1WldU8aVlL1T5IBEEnFP/fI
u7bvX88aoCqoosn5JkgRcgxY0pOHf/BtD2FKis0sCM5hstNzKpvmbmzXlyu0LVRq
Nw73QhZS2fG8qq/y17Yl/CQyZ8YYxjddXO7VlbN+MNVB9ucPsqrWULgVBa9d9Yp6
1EqQwbhu8KJ1LXA9YTKQv8JMUQsi1Yg6hqEEjZV1ivWoy4x1AVw=
=M5t/
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
