Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E185C6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 11:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjDDLGc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbjDDLGK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 07:06:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD175269;
        Tue,  4 Apr 2023 04:04:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ew6so128842487edb.7;
        Tue, 04 Apr 2023 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680606238;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fna98BOXaPalQtbny6015p5IIFjUBKyffzvMmpdaxto=;
        b=fs59/D5ouTu64eyM86CdFM3P+CGzngI5xTh6/WPM9C0AsjaF2rSxH9G/1DLE/B9Xrk
         /gnOMtKYYdLqAAli9t0sXQRW8SzWgheyRpn0Son+BPrIUFdjthyZusXKJ/LiBG9U25Tg
         AcwNd+4ar1K90HsL9fMuSiCZ+SlLnKrAtcydT9xaN0yrfNolpR9v5rkWlmE4BCynT2+x
         Rq3P5JkjsOjgiN0xgXZ6jDPkR5N9rJbvFk0c9zGCtb74GiyBur8gFGznoVDsLtKelXPu
         xOy70vEdVvQL9chEcO1mF8wAoPsDMl9l/IizYcQTPlaW4tMu+XHWLMZ/FcG4+vk8TLp1
         uGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680606238;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fna98BOXaPalQtbny6015p5IIFjUBKyffzvMmpdaxto=;
        b=BE3KgWxifTHo6WiBxsT4lDcM4EFSyRTVYwLaeapoMYkwRYvXwQ4uU8yNouiOg1dAW0
         z3T58pHfNITGr6sfalWBPl0dgnPaA1e7tjgSepAgFYDTzrIOmCWtWPahq5LpyTmNtiXz
         s/Yw0cmpuvIn6uvfhxvIus1TrjCdUQJzWTgZ8ADt32zD5BtNTA+HqcC630jW3cm/BiXU
         U9b30Z/4lgCPC8xVBP3RDpufy8TVKeLUxq5d1vI2s5JrU7N86xzL9Qays7QZPf/KuTAd
         B8zNYMdzyVihu5YlqNk0tzT3jEOq6VDFLPaPBisDMo2EQHykVRZG0Emx+a0WHruwUM/Y
         4wJQ==
X-Gm-Message-State: AAQBX9cz1VnR8WWSXtNJ28s2pce3NgR52oA66YFwpFGcCj67Mf+cgTvb
        dYzYxyQXISNZI2zUMV7R7KCycu5DAbI=
X-Google-Smtp-Source: AKy350ao5TOqOSsKpv54TlBSUzVQIMTj7FyQSMApYVFUiEeRb5OUW3rOmEFeTU/uxFEmQq7VeSOCnQ==
X-Received: by 2002:a05:6402:1a2c:b0:4fd:2b04:6e8b with SMTP id be12-20020a0564021a2c00b004fd2b046e8bmr2222804edb.29.1680606238642;
        Tue, 04 Apr 2023 04:03:58 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ee55-20020a056402293700b004aef147add6sm5668875edb.47.2023.04.04.04.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:03:58 -0700 (PDT)
Date:   Tue, 4 Apr 2023 13:03:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: tegra: Document Jetson Orin Nano
Message-ID: <ZCwEHNeZEhvzclX6@orome>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <20230331163159.17145-2-thierry.reding@gmail.com>
 <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tIuhWl8EGbu/wjct"
Content-Disposition: inline
In-Reply-To: <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--tIuhWl8EGbu/wjct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:20:16PM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2023 18:31, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
> > Document the corresponding compatible strings for these devices.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documen=
tation/devicetree/bindings/arm/tegra.yaml
> > index 61e638c9cad7..60c151da5e06 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> > +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> > @@ -220,6 +220,13 @@ properties:
> >                - nvidia,p3767-0001
> >                - nvidia,p3767-0002
> >            - const: nvidia,tegra234
> > +      - description: Jetson Orin Nano
> > +        items:
> > +          - enum:
> > +              - nvidia,p3767-0003
> > +              - nvidia,p3767-0004
> > +              - nvidia,p3767-0005
>=20
> Similar questions as for patch #1. Where are the DTSes? Where are the
> differences? If we keep documenting every SKU which is the same from
> user/OS perspective, this list would grow crazy.

As for the concern of this list growing crazy: as far as I know it's
complete after this. I'm not aware of any other SKUs being planned for
the future. Obviously that could always change, but again, I think there
is some advantage in being as complete as possible when documenting
these, otherwise someone will eventually come across a SKU that's not
documented and be easily confused.

Thierry

--tIuhWl8EGbu/wjct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsBBwACgkQ3SOs138+
s6EbZg/9FD4w/ntB8fSVDEIKKyhtSt8sgxLcjuz1KK2ZrwKvevU7LgqmuAAJ29yT
QyTehky+UMhGdCcWied+DhtwTNtt3kfosYStr0HFKZOFv0Cm1wBpgMz7PytjkA5U
QmoOvhILWsm152Z8PqNK999nJktGDmJRCTFh99yvyLrCXG5XG/HKyfsJDg++GP6w
btMJUHKCVsyd399gyMElvlUcjRK+DvN7lQpkjTQm3ebldt6KMB2WdTYLsTc8J2SR
qfwxfGo7dA+F74vxOs6iqq6hw0wRSpzLSh0fAxRPs//8PwR512jwhr5GFsoxi4wJ
RLQSIW8OkvFv0o2uCI7UNUXv3/HbcxMs74XCRaU5hFkad1x6kr436QW+qnhT9pLq
ShVuoxsoPfo0orl91eK6/8LusWv/OrIoovq2UAJ/MwSnpcwQLcWi278G4ailoP6N
3QlBkKP5mc/TrIU0LTR0he3jSOzJD2M4YviecE8DqLT74XBHDRWo8eEiUNAyyI0w
5eGOvLKIT+JGMzxlVwkue1LXBvuGiI+Lo2apqXZdaTK+NyNCfMZuIiHnzYEsU7Fn
EDz7Y6Lw5mW8MbKcrz6oS9bkNitwRG4aE5YgodVGp3d4NMk5r+Fpm4dLkEhJ8jdV
U8OJJz79YxJl3sIau099EENakAcZUvpy8tKUqep/5r6vb7dDDn4=
=Lukh
-----END PGP SIGNATURE-----

--tIuhWl8EGbu/wjct--
