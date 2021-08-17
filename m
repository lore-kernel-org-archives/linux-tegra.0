Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A54FC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 14:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEEC60F39
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 14:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhHQORx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 10:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhHQORx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 10:17:53 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A8BC061764
        for <linux-tegra@vger.kernel.org>; Tue, 17 Aug 2021 07:17:20 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id k8so9909953wrn.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Aug 2021 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0ddf0QlWXZvw9cFQ3kuZ4Xnh7Li763SQ7aJW6E6s09Q=;
        b=qGjWbKfWFGyNuXZf4+T+XXtC7Bl1zf8fearXJvXyqS4WIM70WzneZXFuDJJi7vzwYD
         pQT79odUC/9i09IIFIs6s8qqVe9KFZDTLPpvGpGW3Ux3TStEoaZ1UMvTZpTKP7rUyKpk
         1qyQtRW1pmXENIK6jK7dNmJsTsaQDCZH1DK9ZxZ+XTWWe9e2e3YDnPhVX6wWGT0oxzsN
         JY2GqJTc1aSLzxZYqLRZaVQT5zoJJuoupSc9C9/K7zJEM6mUg086c4eDl3xqjmJoI2KH
         aXq+55oyCUqwKDiOIiHDCznVvfiLJM1sTFce1DeE7jtkvrFe3Dca8+oQUOHpYPAME2OG
         sJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0ddf0QlWXZvw9cFQ3kuZ4Xnh7Li763SQ7aJW6E6s09Q=;
        b=aY4OCIOMPTnPMcVpKxuX2wgdWC42T5Jo4B9pRTy0cT42B4hclVcWJiij7H7D3sx1zR
         tX/9I1lfSf7ZKfSOjFxs/LxRPOROO5Zwfc2VNWgbr+3r9cyOtGlHGdluUUuZZ7/VebvX
         /7N5V9GPtXt1szKOapYR650dvogxIEuB+axFcxyRF8mK2nh8HCgNEwaH3kQVP0IMsAh7
         nDHuDUnlRHyM17iLyzyHFlu8iJYIN4ANCZLg4Hc6YMGokvoC/1hWWFktygKkf+8BwGlw
         f63b8UH691uVBsvLdErq5viJlFVTCJ+02MW8FlMSLjbAFDFNy2ZeW6rtxUucBtEmApry
         kMtA==
X-Gm-Message-State: AOAM531hd3GaPNGL1WpQA8MY7ok9/47QBac81p6osIJWrbKiOsuc9+7Q
        TRrOcDV4c+lFvynJBHrt9fw=
X-Google-Smtp-Source: ABdhPJyWWQG4vy0Ql++S+F59TPBJsGORcv9SNkFKHVL57RrSskmZQyR/ERyxIt/fObQT9dZ2K/yLqQ==
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr4368536wru.411.1629209838712;
        Tue, 17 Aug 2021 07:17:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e11sm2550320wrm.80.2021.08.17.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:17:17 -0700 (PDT)
Date:   Tue, 17 Aug 2021 16:17:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Tegra DRM and Host1x driver fixes
Message-ID: <YRvE7Cq++eR5MhKw@orome.fritz.box>
References: <20210817020153.25378-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EjbfSmiC+1y9P3RS"
Content-Disposition: inline
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EjbfSmiC+1y9P3RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 05:01:50AM +0300, Dmitry Osipenko wrote:
> Fix troubles introduced by recent commits.
>=20
> Dmitry Osipenko (3):
>   drm/tegra: dc: Remove unused variables
>   drm/tegra: uapi: Fix wrong mapping end address in case of disabled
>     IOMMU
>   gpu/host1x: fence: Make spinlock static
>=20
>  drivers/gpu/drm/tegra/dc.c   | 3 ---
>  drivers/gpu/drm/tegra/dc.h   | 6 ------
>  drivers/gpu/drm/tegra/uapi.c | 2 +-
>  drivers/gpu/host1x/fence.c   | 2 +-
>  4 files changed, 2 insertions(+), 11 deletions(-)

All three patches applied, thanks.

Thierry

--EjbfSmiC+1y9P3RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbxOwACgkQ3SOs138+
s6EUuxAAmusBpdRYua3uXBIL/iWDWhGlbMKonYw014ZlKOhMHY3PeGFgLm8Dp/gH
kjeDu6Hz1IuqERdwai9x3XZN/QV9tqKCoOk5bgCxJ7JZRe8+C390bpH7MQiZyhA7
k0Ol9UDy6HS1vwGtfB3FH+vNmVxKeBcWHLgAcoZUqjck0kJ9stq76pSXIoBKK4gR
hPOTbKmTVCKU5Mf83MsWPgXiB4Ex1MFgBi8VtpSN1eaB8lAZ6pNJUrI8nqimnpQY
Xkpt698z2EkCdqtF1mv3hp09rUCUpojHKZPVsPNY5wEdIWFFYl9VriBHbzgLlH9l
8eQJ72jMsQ5q2R+KYNkzXOONb7WC6wce8h8hZgsc06tgZcIH8Ni1TjGMIJhXDXIZ
lGiDMIK22H+ySkhipEeQEJ+cwze5XbZMNV+0vXQ7FT6Hq7eAExq/kusyrmAjtujD
aDODLXVvAZi4dGjhg5QHIK886YahpLmsRmpDBXfUc3XmRhvvja75OsNWEDs1Ze8x
WHeiBSw+G8Cku12RvyReCTYGX03aR+wlN80x0IkSNv24Lp/RvFOqyNaQp9WuuSDQ
9E1HoMGKijnYSUD7gXB968vlkX8LxacG/ZlhL2CRlB6OMr8Old0etCtSkcoBeyP4
kdsmLYQyGsJs1Q1yXoAKhHn1sebWpYRInrfBJ/ZlMEjsrjdzIdU=
=kpzq
-----END PGP SIGNATURE-----

--EjbfSmiC+1y9P3RS--
