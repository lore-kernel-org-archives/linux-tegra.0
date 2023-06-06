Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4E0C77B73
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 13:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbjFFNHa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238018AbjFFNHT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 09:07:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16379171D;
        Tue,  6 Jun 2023 06:06:58 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977d7bdde43so472023166b.0;
        Tue, 06 Jun 2023 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686056785; x=1688648785;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbRuTKSJa327MMe46wnpPr1MlEYQnbVCq5j+kBpMA9Y=;
        b=XYNENxLWJV8LmgOmo72mYj7Nl1w0IBGKQ2Za2sue8MnQicolz86Roa5piUa3OOJ54R
         eNaBhIz3GLPwy8672KLztE/rFjNweBMBZrdfNMF1aOP74EBKUZmzcAGC70QObyVeYzLY
         Xsu2VWaxK6oPMEWykWD5Vv+SDqxDMA3Gb31HU+INDswCkQNLDW1Tpin5hE5aKHrXrvYA
         c3JoDibc9oS6tg98o7bs8QGtgtD7YpRcSi98dPffCxm3etSPbAbEcG0J8oH4r4ur4Vav
         fEBbIUAs75zeoFv6bANwUgiVLQ6r8BosPMkqp4I6m2ZLlJcxzp4minNDKVvzfb2rdcaX
         CWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056785; x=1688648785;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbRuTKSJa327MMe46wnpPr1MlEYQnbVCq5j+kBpMA9Y=;
        b=TFxSsRaGQO3pXB1Ma3oSGSz1gv4evJI7jb6/thLdDdWzeZBo5TacXdS1+reuYWQxaY
         wqi0x0PX+fbEI5zwLI0ePeexvu1ZBBItkMOAX8JoaInO+tRK027RX23M6PkXRalSaN9y
         woCaVy4WziNYT+sTTSRIYGstcZ19DpM6H4YnTVZONeNYp5qqm1Phs0v4dhAxaFJGshdw
         gTXOyZosTEl8C+HVa6J4mUnROmrvtL7MFHhitZvFpNmeO9eFI7ox0zo11aPYGUDI820K
         EtX89vVKHoOXdIOrLVQVW4AFGlLsaIL+2n19WiQKkykqk9YFTTThON3Prp+nS1Jo2MtJ
         FfZQ==
X-Gm-Message-State: AC+VfDyw4bONOdeBvZQRm+K99AO0HNzIYUPeFiuTeZQe2Bk17JaOb/t9
        LvE59qJwkFLrQRy/7rmpdSk=
X-Google-Smtp-Source: ACHHUZ7pm1qriWAhP+7SOTS/XwbpjYej4j34vGXzH12ikHDckVjL75Xnty3gkDhJb6CBSH7aouretg==
X-Received: by 2002:a17:907:9288:b0:973:87d3:80d4 with SMTP id bw8-20020a170907928800b0097387d380d4mr2464682ejc.18.1686056784862;
        Tue, 06 Jun 2023 06:06:24 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d18-20020a1709064c5200b0094f44bdf7acsm5487883ejw.57.2023.06.06.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:06:24 -0700 (PDT)
Date:   Tue, 6 Jun 2023 15:06:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: tegra: Support Jetson Orin Nano
 Developer Kit
Message-ID: <ZH8vTj1WXeadC2VN@orome>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
 <168605652835.2915879.11202169691767509843.b4-ty@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s+5FPmNXuKyMtEl3"
Content-Disposition: inline
In-Reply-To: <168605652835.2915879.11202169691767509843.b4-ty@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--s+5FPmNXuKyMtEl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 03:03:32PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
>=20
> On Tue, 16 May 2023 11:58:47 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > this series documents the compatible strings for the Jetson Orin Nano
> > module and the corresponding developer kit.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/3] dt-bindings: tegra: Document Jetson Orin Nano
>       commit: b4032e1726648cb156f45ae756c8730d6d39a5de
> [2/3] dt-bindings: tegra: Document Jetson Orin Nano Developer Kit
>       commit: 5f027147e4796e9fc11083b2ad50a91c1ac36ede

I've actually also applied patch 3/3. I think b4 got confused somehow
because I applied these to different branches.

Thierry

--s+5FPmNXuKyMtEl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR/L04ACgkQ3SOs138+
s6HcHRAAwCJJ6FuX1aR1sEIbsQwTOu1IX5VV/FyF94p21qvhgoc8p1yV4FYLviJJ
aFz6VZciMKJbb1pBkbHLKn8P7VdR/8GUmPKgWCLRgTJ7dMIfW+moSsfa1xoEPrgJ
wyVoq78cbHNUuTfRKyHHHv/VgYJuU5l+0Dw63V18P/1gP+g9HIvZKclzTpH5F64d
f5x011E1ZT8qA/XlGumhwemRPiYz+zavIxsYwq2EItG9JtZDvx7N78ALAcfBtpwN
LDiaz7+BfTw2jQ9VtIpA1kOIsTscVr87nQu6tcUUPDL5nNRzUAXS/wPwMQ0UpJoI
cuAP7gJjE+nYr6MPS7gtjuqk7xfg7j4kTx3T+PqINUkMljUW/kkdVGizEeWaefaP
eNmyRqvLDMxuhpRutgMpwwtVumIxVFNSeM3JiIvLySRcwYNEfVH62/KmAeh7XFNj
/BRgjC7wQ2mjFWRc7LnKYlEsXjyMc4bH0x9DD2mCHgb3at261XKmZQyT4lClUh1u
Aq0Abb583zRTWlAyhH4opuJLYWtRYqZHs1KF9KRTCVq/sU5R9Wr6e+ASbPfWcaGf
JGFIYrmEk3Kud3thKeZ1afRqKuMpV1Ai9ooJhNsLFCI78FL8pNez3VvB6/76sImL
6AUsNRCCUR4q3uv/zKO5YoXitUaMiYh/UUV4o97SoSfc2ONqMsU=
=Ewu+
-----END PGP SIGNATURE-----

--s+5FPmNXuKyMtEl3--
