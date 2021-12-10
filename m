Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBE5C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 13:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhLJNqM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 08:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhLJNqL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 08:46:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD716C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:42:36 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j3so15044558wrp.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qLfA528EdVUsCEB6bw1G/YACt5PURzIrnwOpsUrJGDE=;
        b=Htv0d1IPG1rvldoPNXQlnqSduSiy9rZzRuSKJDE1YoDK6ff5v7u+p8zJc33ZpVvPHm
         0tvBtYOpp6+iG3OUTJWbTyZpyxFhOGzrajYvzz6N+Z9mXnhqaAz6kCDbMk5HSzC7IEvP
         fznZ1wMwtslkSrGvGB08g1/3/UqcNChAsKMGswqZ+W+ecpburyBih0tQPSGX3q42teEF
         MjIJMJSe1Hi+vibM5qvyPlEmiFWl/0B++UXWeNMNiTz/jeQBHY+lbP47KEuSnl9Ojak7
         Tj5N7diGo/DRP6vluzxts9yVQVJ8KVHkgiGo7QaQ8z6QNUDwUZF4Hyd/0uvGaaIxka1U
         AREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qLfA528EdVUsCEB6bw1G/YACt5PURzIrnwOpsUrJGDE=;
        b=xBm51j04IjUFb7PzI8tFgtQWxquLMZPVkNBDQxJ7ifSpqOUqWM6Ggd2jLFTu0YFlzy
         uDeFMvzeA+d/nbWcCkJd0sB6I/kOZzgYEMMATCLFP8LcdRif2aWprjuL9nBE6oocPGPy
         xGKGE1ucwHxvcppCZ6IbVAe6TdXPqwVu5BZooIO5fTz6hmDMVrBzEcMc0TYtvrnJAExb
         IRw+TQwRqy2kXUMWzMKJMwVuAMZlXZwKJrwpb6U/Mf+6LFNqnTtTuNYIFbUDTbxtk8ps
         JF4TimpBMaXAwGNcd/RWb8KSvxFlPYWmJIlV57B1iuYOHr4yOwkBRsmaolvZws8cCa7P
         v74Q==
X-Gm-Message-State: AOAM531wC0vsTD0LCus2Dl/DkFHD0p8keMAp9uT+AYrHSJFdqJzZB0B/
        bN9TrTWty7QsKNWLoVAl5pM=
X-Google-Smtp-Source: ABdhPJx8KGIL+BvSlQk8zV3BKhf+WTvV9dz8Ahmjc6oeORTObTRp3Z9C3QJF2G4S+4E1w/MSKIJvfg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr13848523wrd.323.1639143754816;
        Fri, 10 Dec 2021 05:42:34 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w22sm2872790wmi.27.2021.12.10.05.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:42:34 -0800 (PST)
Date:   Fri, 10 Dec 2021 14:42:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+
 timer
Message-ID: <YbNZR9WqBiWbYn2d@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-7-thierry.reding@gmail.com>
 <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zMsqUpjgjZ8MIwwL"
Content-Disposition: inline
In-Reply-To: <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zMsqUpjgjZ8MIwwL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:36:43PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The TKE (time-keeping engine) found on Tegra30 and later is not
> > backwards compatible with the version found on Tegra20, so update the
> > compatible string list accordingly.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 2 +-
> >  arch/arm/boot/dts/tegra124.dtsi | 2 +-
> >  arch/arm/boot/dts/tegra30.dtsi  | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index 546272e396b4..328425dba023 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -164,7 +164,7 @@ lic: interrupt-controller@60004000 {
> >  	};
> > =20
> >  	timer@60005000 {
> > -		compatible =3D "nvidia,tegra114-timer", "nvidia,tegra30-timer", "nvi=
dia,tegra20-timer";
> > +		compatible =3D "nvidia,tegra114-timer", "nvidia,tegra30-timer";
> >  		reg =3D <0x60005000 0x400>;
> >  		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
> > index 63a64171b422..f4ac0c327c2e 100644
> > --- a/arch/arm/boot/dts/tegra124.dtsi
> > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > @@ -259,7 +259,7 @@ lic: interrupt-controller@60004000 {
> >  	};
> > =20
> >  	timer@60005000 {
> > -		compatible =3D "nvidia,tegra124-timer", "nvidia,tegra30-timer", "nvi=
dia,tegra20-timer";
> > +		compatible =3D "nvidia,tegra124-timer", "nvidia,tegra30-timer";
> >  		reg =3D <0x0 0x60005000 0x0 0x400>;
> >  		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
> > index ae3df73c20a7..4c04b9c28484 100644
> > --- a/arch/arm/boot/dts/tegra30.dtsi
> > +++ b/arch/arm/boot/dts/tegra30.dtsi
> > @@ -342,7 +342,7 @@ lic: interrupt-controller@60004000 {
> >  	};
> > =20
> >  	timer@60005000 {
> > -		compatible =3D "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> > +		compatible =3D "nvidia,tegra30-timer";
> >  		reg =3D <0x60005000 0x400>;
> >  		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> >=20
>=20
> What exactly is incompatible? IIRC, T30+ is a superset of T20. This
> patch should be wrong, also see [1].

As the comment in that location explains, Tegra114 and later have an
architectural timer that is preferred over the legacy timer. So while
this doesn't technically make Tegra114 incompatible (in terms of
register programming, etc.) with Tegra20, in practice we don't want
Tegra20 behaviour on Tegra114 and later.

For Tegra30, you're indeed correct, there shouldn't be a difference, so
I can add that back in.

Thierry

--zMsqUpjgjZ8MIwwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzWUQACgkQ3SOs138+
s6HqQhAAnkq9sr2nNPQwJYntdNeVOTG8XT0JHUyFp4KAx9XcAXhblj70Fv3SVezi
zlNVhQ6T3WQyeekv2KAmEOk6cDDayOipSH3Nuipud+hBuxPXKtTK1dXeyfledI7b
iwnzLV7uf/P1VXOidsqAyUbgjfh9r2vNnLxZivno9hhmLTx571P1WLyF4kSBkxsv
zrfLhsv3DPLc+fBQXC/8N2XdSqQ8/Jv62bad+S7WBWDWPrz0UlD87tSh79HpR6zt
t7R2Z7111wa7DBkx6VH6H+NSp+LR7Vdz7oLRezThwWIlw1XPkFT2KjY4SJPO3NuJ
ApTIsiAmzyeBPGTDVEcTdXS9DVQko9w28trLYxxt21DBQvV9ZIu65sxasO+6fxNy
aX/0+i2KBrBX+o+KeGV8fqXcX51Qs4eXIKyHfKNos5XlgTKsQ+1cSwraoQhY6bg6
A93h5dw9E1wLJFpCYyQv5Y6OZAOt8ZZnPi9xk4OCcEKcmbIFrUHQ7D3Kkv7RDyMW
bQ27+uFEKei4wOkk+Zr0ty3M/OVIVxRh/Cn9ZawZnyr3//kAXvOOioKnaJtXbsKN
z4z/bw4aVvbvfyzXmCuRb2O6xhqo7yD0Oj8o3ZMr+t6KWn07JUVXPIiWbNg71xDp
0JE2lqZj3zqE3C1Zj43veAtC817HgnfqSbzMDHffByA0FqMD0/0=
=neJK
-----END PGP SIGNATURE-----

--zMsqUpjgjZ8MIwwL--
