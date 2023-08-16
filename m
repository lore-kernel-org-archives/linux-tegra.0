Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2E2C04A6A
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238866AbjHPQTA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344629AbjHPQSv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:18:51 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F2C2704;
        Wed, 16 Aug 2023 09:18:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso8501209a12.2;
        Wed, 16 Aug 2023 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692202728; x=1692807528;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OHWGePlxX/0T0sEpXsnnpA6/1kFh0NhqfU3NnbU7Xs=;
        b=T78ZgVx0JAfpnN2uBZyfGRpSWD/Nri/WszKy+EDIH8adXvq4SAJ/5c0r6OgasG0Tdp
         VzMIrzp/8aEHa5a9uZWNVytdhuir6xsVqVK11BCpWW4kdWpdaTMIg6WysBvj/GSEUAhB
         26tFsyBJQ7hkeZ24w5RloWNEqvM5bqW9mMMAcUicQgFQHqfrUh7fab+EhiG+plHQTpQO
         G6DNVk3nawp1o32OfJfIcHPsCXH76EU1ROnU08xA9/DLjpX5zHI9P9MzUPErPuwc5WwC
         2mo3symfcr9MQYCPuvwtJhqXNDRs3PcU5RaG4SgL+OW48T0I/oU1oic0ir3jrsFfTxGt
         pEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692202728; x=1692807528;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OHWGePlxX/0T0sEpXsnnpA6/1kFh0NhqfU3NnbU7Xs=;
        b=DO0w1r5yi1c6Z5qzMioYvfb8Bzx0lSRriwOZioRSJJOuVN2gBRfPp/NeErErOVyXt+
         Gkd3+zfus0MSJx+EwXpsb++DV/9O70vqlvAwAqL4u3paRDrbAr/+o8495pB2rlVsoRH3
         ueApIHgd/H8i9/VS69fbyjct/+6i8y3y5O9uOriPpjNf19QrD+j9GSlHX1xrSbUtGjj+
         /YY+BjvZj55VAABHVkEy5XZAW/HZEU8snZjjC2T0ZR+pUlDpgiEbGKoa5RhIlnnFRJlJ
         IWztxzi3AZxHpNY9HOkDE+cFQgP9QZ/+FynAlmZ9xg7YN490JdImxfUYbObp8iJgn8oJ
         p9Gg==
X-Gm-Message-State: AOJu0YymgMT0u7jDEkuJdagWRnLvps+d+H8XYR+IR1a8FVLZaIG43/ah
        zzXCW1Rq4C7U5TF5C4g8WpU=
X-Google-Smtp-Source: AGHT+IGkx5mrTtvhkk7SKxQU3oqBAB/4VtZ1qZj/7vzKhN8GQONG99PADlE+XdLo2TFlArrSRIAR/Q==
X-Received: by 2002:a05:6402:798:b0:522:1d23:a1f8 with SMTP id d24-20020a056402079800b005221d23a1f8mr1855129edy.26.1692202728297;
        Wed, 16 Aug 2023 09:18:48 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b2-20020aa7cd02000000b005254b41f507sm5734965edw.32.2023.08.16.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:18:47 -0700 (PDT)
Date:   Wed, 16 Aug 2023 18:18:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Brad Griffis <bgriffis@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: tegra: fix p3767 card detect polarity
Message-ID: <ZNz25l6UGK2eNMWg@orome>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
 <ZLoj-JgLqL619m70@orome>
 <CH2PR12MB42783D51FD5FD9327C8EBE43AC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M9iWqT3qoWa3ewuP"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB42783D51FD5FD9327C8EBE43AC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--M9iWqT3qoWa3ewuP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 01:37:40PM +0000, Brad Griffis wrote:
> On Fri, Jul 21, 2023 at 6:22 AM +0000, Thierry Reding wrote:
> > On Mon, Jun 26, 2023 at 06:09:19PM +0000, Brad Griffis wrote:
> > > The card detect pin on Orin Nano SKU5 (p3767-0005) is active-low.
> > >
> > > Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> > > Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > This DTS include is also used by Jetson Orin NX, but I assume that the =
same
> > polarity applies to that as well?
>=20
> The polarity is the same for all Orin NX/Nano modules that have SD card.
>=20
> > Actually, looking at the Orin NX, I don't see an SD card slot and judgi=
ng by the
> > documentation that I was able to find it's not documented for Orin Nano
> > either. Or is it only certain variants that were equipped with the SD s=
lot?
>=20
> UEFI dynamically disables this mmc instance on SKUs that do not support i=
t.

Okay, good. I've adjusted the commit message a tiny little bit to
clarify that this applies to all NX/Nano SKUs that have an SD card slot
equipped.

Applied, thanks.
Thierry

--M9iWqT3qoWa3ewuP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTc9uYACgkQ3SOs138+
s6GyjRAAhXXU6Kff+VQGo0eRfobkxzZwhB6Ro9arB1BUZFMeoBHahgkD6gXIWUgQ
TNEttZum+SjGUlAh01X9zBV+djYpvXzBv4I4r7GcWD7nE2DO1gmAkeBR6Locq40U
5PIccnodiv8kEUnSOiybh82hGI1NJPztkmHMAWx2Z4eRufvgcVQsnyDk2LOZUn8q
DjKOc2zmsMUrNyhKO16VgQJCZ2omJWBuzkJtfBZkw25epoY0LbW50F8MAC3Tw3lG
SYLzEdrKqHjCWDGrB1aNM/KXvX5YOvG/nP1N5h5ojgfHsxl9WyPDgNRbOHQhmTk/
QHqqLWCCTuILTu8u1sJ3Xwuc+AfRcbNByZhjhREX8rG++gmzQTLQHfOj69taujRn
8o6Es9iCkQBPdri4guQcYrOP/BQ+ih5XRMrrEmLmuYSDVbrvGnfas1KoXOoMvA9B
YBcD1Ka0UuWcTKHp/NBeYqYPPdGaHCBW/x45l2fggSqGOkpYBGSBToa+6NQQqwNo
32+MUgqDXOHIY+1Wla2znGI4HTGxb3Y6FXEOC0GlNvxAkCVDLEbI83tmGJRDvPUS
Jglb1D55nm+oohieChAep7Vnsrv5UrNcfR5cJT0ri0Umxvu3spitilMdAtUGAdei
y6thSdcfJ7Si7FPz7MTb9l2MUQdG1qE+5jeBF+1TlPP6aMQX5O8=
=bPwL
-----END PGP SIGNATURE-----

--M9iWqT3qoWa3ewuP--
