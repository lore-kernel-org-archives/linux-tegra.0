Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B1C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhLMQEK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhLMQEK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:04:10 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D97C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:04:09 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so11918531wms.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+QrkKwvfjaS/aVjlFK3ER/jJeEFQNT9lEgOTkWvYFSg=;
        b=RAodqqr3WreYRyfYPbdfF+Xdz9CBkEMiEF9E1Pq7V6h+B/U9OEdDvth6k/gGHqlsls
         H4z2S5R8UgpD/xwKgzCcfZCC+Xa7B25Co4NyLALz+zH5ayiGOPtui7imy1ZrJoBxAIx0
         YicRvZvn6fxtdKpSIGE00VWSWgRZ0c1ilDt+LB2RGH2OyJyyExKj+GIlsmreLNBhJKnv
         EQbVZYIDLSSSxAkNUAJJfNbLoO+AVTX7jjb9vdmdGMUZhMckBcWXTYNnRQBiDt2oULFt
         6ZfibddNnoMUlysbD6L23YApnxMaXLUKbOORsw+LCDDCt2l+GQPOhi0ZgfWIzGHrx8mx
         XvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+QrkKwvfjaS/aVjlFK3ER/jJeEFQNT9lEgOTkWvYFSg=;
        b=091yjHWMqefVet/oIaeSG3etzNR0UEPY30OntQ9ma/FMl2Qxqlje9Thgqv5g22wBhQ
         /Bn/LhWujFyQAUgSVLjN53ZkJaetYvZRsOFyFcPeA2K+mX17tgAX+7OFSm+9/NMLaP2L
         dol5zrcnyiRts+/4OnRzPIJGhOQxboKt1LcX/wkNm5hZzAbKUl8gBA8omjE/OZNTjUsx
         XYkNjsoHuYxBWQ09/pOHHD0An81FhBpY5lAJnddcwKiijJxEBLNdcy3TwXQvgUoC9xvj
         ZDKBUUTyaIdYbTC8tV04/+kILB6oCgSzBPb5La0RmkPOCEGGhX4IfDLZjwHVarT6pUrx
         heqA==
X-Gm-Message-State: AOAM5330bmA7cx0KVhLpuTBsw6tvOC31OGxdWem+nSmag9P10xTmn7fk
        CPs0hIoyNvRR/ewAVpWwMfc=
X-Google-Smtp-Source: ABdhPJxWb+IqKucv7zfo7AyV6pscEnYfJQX4lESgwiOsoavz8xDyH+0nQsyWxx/ztPDVGj/P6EYpPg==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr38505277wmk.77.1639411448393;
        Mon, 13 Dec 2021 08:04:08 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f15sm9257317wmg.30.2021.12.13.08.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:04:07 -0800 (PST)
Date:   Mon, 13 Dec 2021 17:04:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+
 timer
Message-ID: <Ybdu9RjWZxL325xz@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-7-thierry.reding@gmail.com>
 <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com>
 <YbNZR9WqBiWbYn2d@orome>
 <8988f759-689f-7c46-ba1e-3eab1a91de7c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WUNNhHAyIvOB8tVY"
Content-Disposition: inline
In-Reply-To: <8988f759-689f-7c46-ba1e-3eab1a91de7c@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WUNNhHAyIvOB8tVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 06:23:34PM +0300, Dmitry Osipenko wrote:
> 10.12.2021 16:42, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 09, 2021 at 10:36:43PM +0300, Dmitry Osipenko wrote:
> >> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The TKE (time-keeping engine) found on Tegra30 and later is not
> >>> backwards compatible with the version found on Tegra20, so update the
> >>> compatible string list accordingly.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
> >>>  arch/arm/boot/dts/tegra124.dtsi | 2 +-
> >>>  arch/arm/boot/dts/tegra30.dtsi  | 2 +-
> >>>  3 files changed, 3 insertions(+), 3 deletions(-)
> ...
> >>>  	timer@60005000 {
> >>> -		compatible =3D "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> >>> +		compatible =3D "nvidia,tegra30-timer";
> >>>  		reg =3D <0x60005000 0x400>;
> >>>  		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> >>>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> >>>
> >>
> >> What exactly is incompatible? IIRC, T30+ is a superset of T20. This
> >> patch should be wrong, also see [1].
> >=20
> > As the comment in that location explains, Tegra114 and later have an
> > architectural timer that is preferred over the legacy timer. So while
> > this doesn't technically make Tegra114 incompatible (in terms of
> > register programming, etc.) with Tegra20, in practice we don't want
> > Tegra20 behaviour on Tegra114 and later.
>=20
> So the T114 timer code works using the T20 code and we prefer to use the
> ARCH timer on T114+ in the driver, what is the problem then? Where is
> the incompatibility?

It's the priority that's set differently for Tegra20 and Tegra30. On
Tegra114 and later, the Tegra timer has lower priority so that the
architected timer takes precedence. It's not exactly an
incompatibilitity, but there's no good way to describe it otherwise.

Thierry

--WUNNhHAyIvOB8tVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG3bvUACgkQ3SOs138+
s6Fy0Q/+OakLUE2CR5YGyaOvyEXNTr2FOsVfOV0gyOq5w6TfQ7frYHKIKkCPUHvb
zF5e3R7x6qu27Sfbk+fXm3W8nayjvYc5fJdUgGuBiX1H1Jq8QcDDLFFc+OaZOmOc
FFZK9y5/+f3CAwTeff361Fo4ADA4/BAGtHNgp/VwjjIVbLY2GHbN4lBONITv+2z2
pQRgW89cdHlmUzIC+laohdHtHMM6XQ8qQKMe7bl3xGEBnjQqdvBMLwW3Y1JGYvfs
k8hBk5WKaMdcvgISnlIbOL7m4mzC7N/7OSzZAZtnqcSHhmFQ+GmSufO++bMy98wi
hECKcCCQ6Gy+Z55D1/BVhgYWQt7uldmTN/g9Q4i8eiPDvPH2M0hhGHw6sz+7NfDe
MlZfelWcbqprFEGvgBV4ALTGY07Og3AyBvv3GvOCRKNEq7ZlKJtcPMdDPS/UCE0L
c07sM6grCtlJi3+YuHaN0x8C76J5caH5RKrnfxe4zdhBlHxQgC13FVMJRoR1C3QI
E5lewcU5/Qg6H9EjOULRXZqkEyruyJ1/JADO3o1IM97ht/RMSHVz2bQkR2i451Fg
sfP1/GLKEFfxtoovtZ04ir9a+Ycz8J+IAmF+RhnRjYQVltQvafJ4+zvM967ikhWN
AGfk+Xz23vP5bIISnS9ecWhBY8J7Qrz8xoTEJPqA/QHJAMNs1eE=
=5us3
-----END PGP SIGNATURE-----

--WUNNhHAyIvOB8tVY--
