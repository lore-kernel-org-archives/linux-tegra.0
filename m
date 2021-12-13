Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B02EC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240504AbhLMQLf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240487AbhLMQLd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:11:33 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6918C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:11:32 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p8so24430208ljo.5
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jno42QEFUtzX6aQuOpHfdEceSS9MwhGdUdvSoYWMn+A=;
        b=SxlOto8oWt4H6YI6uss88j1xgbIHuU9TN6nyVlM4jdKKQBXHcMVUqtnIwwEzJR5fZA
         4s7R+uYWURYVhEFttfB0baAOUOD+XJ1qeLOY7puawKfpixv/G2nvjnYJGhQsh5BgXRnG
         u9pPYC0RmNx3ZoZSL16U2/VKraJP5nxL5aeg2tfNXQcbUEsscDMTtcBsUKGFZ4iZghzT
         cebEkxHNOcePM3XVJnbzhlPBnDZgAsaqrocDBrx9TFj/TyRAkg5iHwPvzMrNvjp4/8hi
         iuO+epOJl5+NOkQgjdBNwxSQYcgifAP6X7f4TwmMcVLOWrtOu4RTENK+OcwwY5u2i/BF
         lh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jno42QEFUtzX6aQuOpHfdEceSS9MwhGdUdvSoYWMn+A=;
        b=akSWhFUDHG8Ldtx3dU87qGgiQkd4XjljCbNJfp6nDUrIb8OwvI55DOtUjx6xi5adru
         JFEN3TCG97aIzji2xh+aYwxox7HdJJGm+i1CpSPT8KLam8FHn4E2wuCylV4g+Joi4nnc
         66cFEutJFsu9hJ30ctUxOrMq4X80YOQdIiYJ88zF2OECY6/fpuvTr5cIswIycyAb5Zfu
         UEJS8Uld4fuycY1SpsvSfA87olSRA6Z/UeAk3LBurLMkw6FYFkXh4Manyblbi+U/WxE2
         H+74dJtFepMYcZCW8YkCo9fkk8r7MxaeEDDkynjatY1PJq/RSlgtNqrOijattQdm8fsw
         RQdw==
X-Gm-Message-State: AOAM5331PHfMdxA1LEdGprFOjc/XUlZ28okdLBfvYcwSPfVPPpicctEo
        H+oGXlyoxMWlShGct8DR4hE=
X-Google-Smtp-Source: ABdhPJykSN4pyxYMDDYs4mAcS/LTe+kduu6yuXoEdhCD7TRiOtuvtenS1C1EvTSNuOSMjcO2riNTRg==
X-Received: by 2002:a2e:5416:: with SMTP id i22mr31218421ljb.499.1639411889518;
        Mon, 13 Dec 2021 08:11:29 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c37sm1482611lfv.152.2021.12.13.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:11:28 -0800 (PST)
Date:   Mon, 13 Dec 2021 17:11:26 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
Message-ID: <YbdwrnFH8GAZLfhv@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
 <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com>
 <YbNs1SCLclVifFDP@orome>
 <80f3fac6-ad64-988e-636d-5d872890f56e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9pUbjjbqkTaJphrD"
Content-Disposition: inline
In-Reply-To: <80f3fac6-ad64-988e-636d-5d872890f56e@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9pUbjjbqkTaJphrD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 09:08:43PM +0300, Dmitry Osipenko wrote:
> 10.12.2021 18:05, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 09, 2021 at 10:24:26PM +0300, Dmitry Osipenko wrote:
> >> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The Ouya board specifies the #reset-cells property for the GPIO
> >>> controller. Since the GPIO controller doesn't provide reset controls
> >>> this is not needed, so they can be dropped.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
> >>>  1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/t=
egra30-ouya.dts
> >>> index 4259871b76c9..fd64aadc472a 100644
> >>> --- a/arch/arm/boot/dts/tegra30-ouya.dts
> >>> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
> >>> @@ -70,7 +70,6 @@ hdmi@54280000 {
> >>> =20
> >>>  	gpio: gpio@6000d000 {
> >>>  		gpio-ranges =3D <&pinmux 0 0 248>;
> >>> -		#reset-cells =3D <1>;
> >>>  	};
> >>> =20
> >>>  	pinmux@70000868 {
> >>>
> >>
> >> Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested =
it
> >> almost 3 years ago [1].
> >>
> >> [1]
> >> https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agne=
r.ch/
> >=20
> > Does it still work today?
>=20
> It works. That patch still applies as-is.

Alright, I'll pull that in then.

Thierry

--9pUbjjbqkTaJphrD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG3cK4ACgkQ3SOs138+
s6HPaRAAi/ub/H9NzCiH0gtpElwrN1hiOMTj1A+vsbJBd0xK/ZpV+F7HucVXXWdX
NTFO7OAQWf8fDLnzBgJX8vk91U4MdymPTYg6A5Kp3yEb2F6NNNo5N0swvkeBVllg
yPOx1spFAKjVs7U1p+TMEXI8QG4aemUT4CA8KFvIrAE1EszYW/QBUtH8mnw6J9uj
l0S60G7ueZEjxTFu6NGZxsgBKDgQc9KHXmjK9WE4ZYuVuE33OXWuV8h22mW/eBhO
gC/uPVbvyzA0x2pyRz1NKqMSehxUWIKk6hcwnroVIzE/zRcrIWli+128So7edi7b
e3IJ7kA6NrwidfJBzo5pYfjFdGOJJwCFN0uCQ1Sk+Ct8n0w0j2maYEOFx+o5pFAk
DlzktvAEuiH7iI++h2KeYJrVIudpLL+zjz1MappSKXmZLLWBGhUlNsagoXyst3ni
uyxsLWsKDuWb614TNYxD2Ydfhag65spVrdJ2VxPf/sxW/IfEalJdjDHPd8VsJEOd
1+fZtc38TN0rcMr0YGftnJ2Nlp4xRkdBZVXsPyQsWjk5W5YRysJ9zpQVK5oXZw9N
HXvVHQvYOycR1NZmdcNsunIROZaA55yBFXf2M0kP6qyxtodaL2quq/jOGf9MCyQH
68sS3Z4ZjS7TOlboDIIwULiImqsjJu+TlL9nlJ/L2FeCWsgz/Ek=
=n6ld
-----END PGP SIGNATURE-----

--9pUbjjbqkTaJphrD--
