Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B698EB64DA
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Jul 2023 08:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjGRIEw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Jul 2023 04:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjGRIEj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jul 2023 04:04:39 -0400
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E72E172C;
        Tue, 18 Jul 2023 01:04:17 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fdbfda94c4so2964755e87.0;
        Tue, 18 Jul 2023 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689667152; x=1692259152;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfZeVJQddYVik65NhkUKDVIYNEDqe9J+8qwZMY+1f8g=;
        b=iVLKx8koGZA4vpdYezulLaynnPeFQBLaMwMIW912r3w3m1Y0KiPEY8pr7KqCL1cfiM
         bp1NmvwTtNeHjI2SYzMUpRRU+tsTYhnk1+C+6DixYOzKjf0zdJH5+mVZi7zsyQ75dcEE
         mVekorrUukCH2dZgHFoT45jabDdVzsvRHQ5fsD6Z0owKXOXj+lohpB0yCxWT9nIQ7chN
         RYxzvb+sLcit6FJSpreNohN33mF1/cghGO9MC0rTs8hBXI51J4UbCVswih4eWnJp4Whq
         Ymd/cK3ooBh77EudcG0Mxvgmxyoi9VYgFZp62z7+HyOwL55H+yWYv0KAbLAQfO1rQvQe
         44VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689667152; x=1692259152;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfZeVJQddYVik65NhkUKDVIYNEDqe9J+8qwZMY+1f8g=;
        b=T2GoDF6FGqHfA3845FL2+DBUbET8YGUQaJ5lPFUShhX3tNJXiSCLBhoDYBTq21/juy
         IfmnuSno+sINizvSAa7X97J+xac5lHdMUxbfY6mu1PAAU9xAUYqegAuNza4j2koZ4nbb
         sZKxBeOce7qm7uwkHJ5qwIqimT3M+9LuZNz9ZeGJslQlm/nqkWFXve69TGmbIm1GZ0uT
         /8c+D1yMknhAJrGjYdK1KRB4GOEIqcmrmkjI5lrvGuBciUd9GvsgBbOvcciJfBl6cSl0
         AND+E4ugbCy4KBDt+UOhvXr8+RFt1sJsW/1DXj31FpNVyw0EvmVUwbuUi7Ew6ai/lG0K
         hGSA==
X-Gm-Message-State: ABy/qLa82AtAVGajZk/7v47FFcLmpqxaxxz+f05W4mPBJtaBkzMTm7dt
        fUG9QQW7gj4phauDuA+SGxA=
X-Google-Smtp-Source: APBJJlGxxGaZNSPC9s9WgzTHpkoiBd/uxkadKRTOF/dW1H0yLQyWxuMq4i1Ju8TvnvlXW2MHk2EBNQ==
X-Received: by 2002:a05:6512:3b90:b0:4fb:8fe3:9266 with SMTP id g16-20020a0565123b9000b004fb8fe39266mr16063531lfv.0.1689667151982;
        Tue, 18 Jul 2023 00:59:11 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k21-20020aa7d8d5000000b00521ab0cda8fsm342703eds.27.2023.07.18.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:59:11 -0700 (PDT)
Date:   Tue, 18 Jul 2023 09:59:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Smaug
Message-ID: <ZLZGTmWyJHclFnGs@orome>
References: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
 <b3755c4b-fee0-85e3-4066-fb20c1ad99a3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rq3h6hwtw2gfWWtd"
Content-Disposition: inline
In-Reply-To: <b3755c4b-fee0-85e3-4066-fb20c1ad99a3@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Rq3h6hwtw2gfWWtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 10:03:19AM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2023 12:10, Diogo Ivo wrote:
> > After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> > reset-names") was applied, the HSUART failed to probe and the following
> > error is seen:
> >=20
> >  serial-tegra 70006300.serial: Couldn't get the reset
> >  serial-tegra: probe of 70006300.serial failed with error -2
> >=20
> > Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> > reset-names") is correct because the "reset-names" property is not
> > needed for 8250 UARTs. However, the "reset-names" is required for the
> > HSUART and should have been populated as part of commit a63c0cd83720c
> > ("arm64: dts: tegra: smaug: Add Bluetooth node") that enabled the HSUART
> > for the Pixel C. Fix this by populating the "reset-names" property for
> > the HSUART on the Pixel C.
> >=20
> > Fixes: a63c0cd83720 ("arm64: dts: tegra: smaug: Add Bluetooth node")
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64=
/boot/dts/nvidia/tegra210-smaug.dts
> > index 2c608d645642..bcb533cc002c 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > @@ -1364,6 +1364,7 @@ serial@70006000 {
> > =20
> >  	uartd: serial@70006300 {
> >  		compatible =3D "nvidia,tegra30-hsuart";
> > +		reset-names =3D "serial";
>=20
> Why reset-names is board specific? This makes little sense. If you need
> reset-names, then it is part of SoC.

As the commit message explains, this is because we have two
"conflicting" device tree bindings for these devices. One is a standard
UART, typically used when the device is a debug serial console and a
more specialized high-speed UART which then requires additional
properties.

Effectively this means that whenever we override the standard UART with
the high-speed UART we need to extend the device tree with those
additional properties. We actually have similar issues with dmas and
dma-names, which are only valid for the HS UART and I have a couple of
patches[0][1] to clean that all up. It's a bit weird because we
basically have a patch that removes reset-names (for standard UART) and
then we have another patch that adds the reset-names (for HS UART), but
I don't see a way around it given the bindings that we have.

Thierry

[0]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D364269
[1]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D364270

--Rq3h6hwtw2gfWWtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2Rk0ACgkQ3SOs138+
s6E9PxAAi3lK6Tz97ooPeTx+YVMTX2+PTyigu92qpxZ39Pu0Z+gCmmF1LMiJiqRj
z7tSzZevRANW1aV45POXukLKoGvtV1rN4meZFai+wP4M3sYlXiFEnFjMJ5mdUT9c
BDtWQ8BQpVslUxhei52WiUlBm28FP8YkzQIvkLqDXGbZrqpBHF5rvkWuUuFq4v9k
sqiyi+uMuEdThMgWJxHXp25QFOleYSysLXVieFtfd0EgqF+L/Cf0XAEb/ztqpY9k
8CV0ENNzq59Gal3SpNe2LPCHsx/r6s1eB1VsmumxZmzn45YSfqhDgrNFx033iq/D
CunbsaWJ/aC7DJvR83kPYSLTjdavp2TDjAfWRIuaH1KlgARTBhmnLNkGhJVxxvtC
fqdn//QaaPdJqh7pof5yKBIKVzebHb0uQ4rGwWqfVOYnSC2ImoTurP3MWS2lCnyR
/fFDwubrORptxjNWlDxoemFmGQb/g8NXjUUJtbfw97CmMAqUAR4bEkXhO3YeXoSg
0IhKucxIQeQwjT92eKWALte4j17ELYyrQoi7kUpDRBfKV6r/8AYe4Wm2h+UoP+mP
TtfaCzT05SEhnYZ3yitGFa1MROHH7d8s+vYtvvOSRFZr9lgILc2arf8v5fR8x3ej
IzwoG5b0YDK5iLV29vsf8dqgYQ33HQzTwpKT0gXko4xFRkQjUdQ=
=KFUl
-----END PGP SIGNATURE-----

--Rq3h6hwtw2gfWWtd--
