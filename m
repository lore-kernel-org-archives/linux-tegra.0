Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D27C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 13:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbhLJNx0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 08:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhLJNxZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 08:53:25 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E06C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:49:50 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso9050505wms.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=thw5REhk1uDF6if9tIrs1a59hjmxPrqR4AWvmL/3irI=;
        b=DlP6f8Pi5//VHM5fshm5kFSsv+I26f3wAUFv1j/N01z35apyj3NSQSBylbIkkHGXYV
         Fh4mOM+cPAB+fZNIcdtOYDMjMJg2v8gRh4G1cp1R3trHqQyYgPvi0Sw2QBq/Nqe6qo2O
         JP3Syp6hnWPGyzuy8G1tmBNgYB1gzi5482bZwavyeL5Sq1z3VyHg1oREcB+SQJMKVyMw
         6i6iuZcVealPHjGSdwmZv06Ekr4QeE4GkpCNcWVamwogPm4JmYG8sa4UzKLLK/yu2mL6
         jBBIQ5noOEbhpHDW3tiAbz65/Mr51eE5e7ju3pg00mivVV3lCCz/AiLY0m9F1Xe3jpH5
         b8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=thw5REhk1uDF6if9tIrs1a59hjmxPrqR4AWvmL/3irI=;
        b=gQDJri93LR0RnRC67RQ0BUPoghsYrsg8uJAxxiqJXzW3Rvrcy7oBjzCiTYe0VGz/YU
         c6wMRBsMhZGdj0tv4Y3DOFC6GsdaFPO+FndEL5Yt0Lh2xo4JtLt0MIAQbFEHD9wUG+PU
         jA7AyHV3NoUR5VgGQLc7c1yNMGlTs5Ar4/GS3X5zIc2pLYeOvatdAV570oZCiLOUsX8L
         YHcMliW+7J6GLKWHb81jMimxn9ECYFc386L6Ei9GgEFOPqD6HAY/3cfjSIysfFJbbPwJ
         BgstX3/a07qwDyfVvr0TC1BWJmKQ7660PqpY3rzsghKXOxzqfUYoo+8nGOwuc5FHOZKU
         SWNQ==
X-Gm-Message-State: AOAM531KZuHpcW1BzIDPX2WOn8bdGLBM2dCWuJn5xaD1KXiSw8aJbg9J
        3vlbJwumkGhNd6w6+Xm7xyKNPkczO5gfgQ==
X-Google-Smtp-Source: ABdhPJwS59EedKsDvTyGRTcf6+Klmo7Ra2ubLcB9U2h0+cBvWeU9+vSLqescQk5D76dbMxq/WnFe7w==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr16363617wma.30.1639144189206;
        Fri, 10 Dec 2021 05:49:49 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id q24sm11301966wmj.21.2021.12.10.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:49:48 -0800 (PST)
Date:   Fri, 10 Dec 2021 14:49:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/25] ARM: tegra: Drop reg-shift for Tegra HS UART
Message-ID: <YbNa+S8XbIi7nExH@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-11-thierry.reding@gmail.com>
 <03da037c-4bd2-2405-f665-10cb89faabb0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NzprD4i6oNWl+4D4"
Content-Disposition: inline
In-Reply-To: <03da037c-4bd2-2405-f665-10cb89faabb0@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NzprD4i6oNWl+4D4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:01:02PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > When the Tegra High-Speed UART is used instead of the regular UART, the
> > reg-shift property is implied from the compatible string and should not
> > be explicitly listed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
> >  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
> >  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
> >  4 files changed, 9 insertions(+)
>=20
> Again?

Yeah, I ended up with a bunch more cleanup patches than I had
anticipated, so I wanted to send them all out in one batch. Still need
to resolve why this isn't always flagged, but in the meantime I'll add
fixes for the remaining HS UART instances to this patch.

Thierry

--NzprD4i6oNWl+4D4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzWvkACgkQ3SOs138+
s6HBZw//cRPz7aWg422xW0mr9YqgADUflghsW+bG8c2wrdhJCi9joe3xjITQ1j3a
Y3IxwwsAZBLQgomFwMQjec7wrsFzCLhUc0CJSasY/Nyjiu2G4KiK/75weSOA+wVY
K+SSQV3e3tqQafOUhTP1Ciq2fWslc/RRAr8G9g+jrqmBtJeZPoPSUbNGUvc/cW8u
h9HCfU5451GP9Vao5adEuKWmVzDYGaNVDalCfS4GBpnxScA46vljM52IGMSTc0+W
cvdFzrIWc0oVSU1Ksp6mLtTV8w663Fl4bt1ZA8JPBATCSfoIkhLdc5fYsuZc4CxF
9zVSwrO2KF4jSsVK2wpkETFbuxOD6i7ON/VL/AXx9pUP9PRZ+W4hnLu3WKDoRgUp
r5mtTYjhh7gVbo3vFJDXH4QecoyFqyl0M18cGe0Qk63NU8LtdV8tJlmQwMu2rGNj
Pww5EgtuyIA+YYeemhTZOspqSP2epDSj45fH2PdwKXWh5ZY2U9rwUKtnVxIp8ued
zNNBI27EzWtQZAHpBd+64GqSLlWeTPVfk1lCxE2MpNAy4VsVJ19wN8SfEUccp28+
QmFk5kZGBG1OuV414Txmj5A1krEavnfj+gMLS4Pxsvxbv/GY+s4plvpTlJPOyVP5
bZT0x+MUrPCtKxsFoweG2wWW3RZoMf5jA6thT+dvxpmQersrlvw=
=Pc6P
-----END PGP SIGNATURE-----

--NzprD4i6oNWl+4D4--
