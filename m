Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6825C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 13:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhLJNrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 08:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhLJNrc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 08:47:32 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E81AC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:43:57 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t9so14992048wrx.7
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RNuyIlPuendYEJZoxwlO6EG3Ha0zowQ7COv6B2wd3Sg=;
        b=Dxn9x1fXjy7wkt1wlhEld4yyeooIjnPkYh+t2j1ycCX3VwX8GFzguVqjt01LeJZr0U
         oda/6Y6H0EXYuYBsPFzZrTVg3CQH6HQM4lTUuNx6+FXHhm4IxIkc2ZiQz81D/Y3LAoDK
         5Y6wN9B4TXOqsi8D0Y3FBdYY8xkCtckB0TimObzS7NcnGnuTsX5C7JYo+bSCaBRdy9/K
         BCIEuWcqsPQJd4YuFbklbN2KlZoI0TiL49NSeYS0jacfYO+XDPvhb5HXKTBm7KVaKLMx
         UZ+6MnPi2A65n1RJzZT7AfnYxDGYAW8+SMZwgnK9gWjzZ5s7oP9u0Y+GP0Z5lSk3abWa
         B7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RNuyIlPuendYEJZoxwlO6EG3Ha0zowQ7COv6B2wd3Sg=;
        b=MVaeXLrKRF5CyEPYZKroX1COIk+ROzk909kmsBZuFBgRAU0vjOv81Ao9FvX3pgBa/9
         DgCmGC4xiJ1TqTuaTTaHvRVtlOasOa4kPpvbrw3HWFoWJsQrT1wNf99W+DrsdqOf3NUG
         NME8tCSQIuW18E8o2MBrVDQ2Hmq0GN9zltmbvVv6asOK9eVRNhaIKcgzfAI4a4VsMsRq
         LESt2nDbWQsPbBkg9tIIvwZv8/4dUi8Z3+0oj07+Xfukda0dTOk6rdNMfTsAEnyWHRJi
         Z2XCC+AzBY4bckKcgsDLy5fswDNhRxlzXZtn7g4lPh2FiwyIoSE9B/LPtpRHmil/08jh
         DJGw==
X-Gm-Message-State: AOAM532Ecy5tsqsnJqlWPZG8lBHMUskwW3k21K2snG51wW7B4ve7w1wV
        kvnVY+B20oVCsh8IR+S/pYKiqHcAspdi7w==
X-Google-Smtp-Source: ABdhPJzAJO4M07drhxbURaMJR7hSWJhdHdtdbqzu63ZBmBXPauaS7sER7em2zbrx9v66X8CxrJMV3w==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr14536309wrd.3.1639143835509;
        Fri, 10 Dec 2021 05:43:55 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id i17sm3225816wmq.48.2021.12.10.05.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:43:54 -0800 (PST)
Date:   Fri, 10 Dec 2021 14:43:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
Message-ID: <YbNZlyjpi/i2Dph6@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-8-thierry.reding@gmail.com>
 <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pBGIdz4XHS4FLsPe"
Content-Disposition: inline
In-Reply-To: <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pBGIdz4XHS4FLsPe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 11:34:39PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Tegra memory controller provides reset controls for hotflush reset,
> > so the #reset-cells property must be specified.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index 328425dba023..ce7410ee08b8 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
> > =20
> >  		interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > =20
> > +		#reset-cells =3D <1>;
> >  		#iommu-cells =3D <1>;
> >  	};
> > =20
> >=20
>=20
> This will conflict with the patch that adds video decoder node [1].
> Since the VDE patch was sent out earlier, I suggest you to drop this patc=
h.
>=20
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.406=
4-23-digetx@gmail.com/

I prefer to keep this separate because it actually gives the reason for
why this is added, whereas with the VDE node patch it looks like it's
there by mistake.

Thierry

--pBGIdz4XHS4FLsPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzWZcACgkQ3SOs138+
s6GGpg/+OM6VsCK4YLAong14QVEmjH0N2Qc4F4ZJI0q4o82EmjTbrsKuYYI806zB
RHF31ukI3MvG/fOVtdMB8+vPCQK4yuifInkNLUK6Y6REkhI6mKcT9kceWvAUbmSc
YqwN9cRnoaFrruoiPnJVdWu0BbIsV0X9lo4Rl5YuJV0Zzms9ERZHQVMeSKH/YHfh
xxTLrrOri+eqqqQMdg8if80XqETu1mY04RI97q8HbHh3EEc9dyUkQ5hDwQSfBPJk
WW4aWxxusO0vTeQm+gq/rZ9EAVSDSF/dkEpHWzGKCy1LBn3cWS3runR2J16+Bq/f
6NiLO1ssLddZUOooLg+SXEdQWq7SIYikyleDSbmF0rtmIwH29TND1ePCNemMXKPa
WYZPoS5YRajIs7BHutjmZ29IIoJnhjz60i1vL8skYd6c3TLfPQrgJaIMKGk2qR9R
lvWjoja2wEpT8Y0haN2p7wlUL+5OOLopIFN4LzW2+KyybIBcLxJ2TMAAK1yV+mes
iQeQ0xQVBJyiY5s+uOG8F5dJMWe3GLFGY94Y1+Xhv6/beBF3d1UkacC9NiyDqVFI
74WWtmufZZ11oi3+c4mAm+teC7EXn5mepiQtrNt/6T2EV7GyCHoyy1YHIcwHd7Hu
1iN//CNWANBWXQmR7uAZaPv4I/0LqK/v7sscB5JdBFkHxKGEvEM=
=Fpy6
-----END PGP SIGNATURE-----

--pBGIdz4XHS4FLsPe--
