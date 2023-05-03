Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CEAC7EE26
	for <linux-tegra@archiver.kernel.org>; Wed,  3 May 2023 09:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjECJS4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 May 2023 05:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjECJS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 May 2023 05:18:56 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5BA1BFA;
        Wed,  3 May 2023 02:18:54 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so31916385e9.1;
        Wed, 03 May 2023 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683105533; x=1685697533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SerbCvte8Ln3UHF66Me7IiNAwWVhU8rwwnMJP/YMH4=;
        b=XKtYmTgBzIgJYdrVI+fTEAl29NG4jkWS5XPWQBBoHaSpZ0qsk4GOMhlvWrpfsHZ0Km
         FyIF/CczMe+bxmK1heMH37Nj7z/tDapyRkEDggDcDrjoA0j1Ly562ctoHh8QGd9EMALz
         yzdnoSyBSgBkLGrwwu+Ixw92ipTOx+Lt8rvpwDVaMFDRRE2Aktwrql+Oal8YRkqgaU1Y
         vL74bmeaBO0jx4oLBNc7xcxTRIM/KnI3UM4zyJF2dq0xW44kICVQjUcBVa8vcpZE3VE2
         hHR9GyD6kFz0EUyHYdLcgrV/1hSVDqmqHx+6cZEZqpYeiKUYUAiDlGAamPQJzuRm2CHI
         V+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105533; x=1685697533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SerbCvte8Ln3UHF66Me7IiNAwWVhU8rwwnMJP/YMH4=;
        b=UiJO3/Cw6uFYnG0ovLof9X5pYlSPd+oXaEnLfjHFqi1/OUN4boBwKPuLSnl7JQht0i
         Gz58KHhtkwBCKR2zlMV0aX6DVlUm43digtjfbRnQMiKyKHrwkg5iOlupaO/iI4A10Tnm
         VEkgYo9ZULb3aYc5DeAwd+XR5mrgtSieaWyDDnRcw1S2lMoyaA2+r94/3P4+aNAALnzT
         82XRUafQ9BqsOJTgyQc+7rZW8TgGWfYKXYCQNu1yhyL4UjJdvdyM38t/D2PqRlnK/svd
         yLAVjGb/8m9hAOLqKD9Yki6HA5Ixo0B/VeMtgPYxriimlUdYLULqfSRMlrINBScN+eTh
         Txwg==
X-Gm-Message-State: AC+VfDxwmBYjmX4jBlxqpp32YfQy36aWjaaVkk8xs1cr9lA/klQeZA3V
        SyRFAu9N1RVrcmtNJuqwssc=
X-Google-Smtp-Source: ACHHUZ4/vbn7VAA8vSmpZ5hpqCHpFr8PVv8ONeC0ua0rZTsYIqWj9jPfyxpTnWEwUDYJ3+0s73ihTg==
X-Received: by 2002:a05:600c:d7:b0:3f1:93c2:4df6 with SMTP id u23-20020a05600c00d700b003f193c24df6mr13714885wmm.12.1683105532602;
        Wed, 03 May 2023 02:18:52 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f21-20020a1c6a15000000b003ee6aa4e6a9sm1311299wmc.5.2023.05.03.02.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:18:52 -0700 (PDT)
Date:   Wed, 3 May 2023 11:18:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Shubhi Garg <shgarg@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: tegra: Document compatible for IGX
Message-ID: <ZFIm-nDpMZog9aOr@orome>
References: <20230502150249.773425-1-shgarg@nvidia.com>
 <664379bf-96c4-b66c-6b0b-7b848ae6000c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Vko1tQucAgVwjQX"
Content-Disposition: inline
In-Reply-To: <664379bf-96c4-b66c-6b0b-7b848ae6000c@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6Vko1tQucAgVwjQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 08:22:21AM +0200, Krzysztof Kozlowski wrote:
> On 02/05/2023 17:02, Shubhi Garg wrote:
> > Document the compatible strings used for Nvidia IGX Orin Development
> > kit which uses P3701 SKU8 and P3740 carrier board.
> >=20
> > Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documen=
tation/devicetree/bindings/arm/tegra.yaml
> > index 0df41f5b7e2a..34523b8b5d1f 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> > +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> > @@ -176,5 +176,10 @@ properties:
> >            - const: nvidia,p3768-0000+p3767-0000
> >            - const: nvidia,p3767-0000
> >            - const: nvidia,tegra234
> > +      - description: NVIDIA IGX Orin Development Kit
> > +        items:
> > +          - const: nvidia,p3740-0002+p3701-0008
> > +          - const: nvidia,p3701-0008
> > +          - const: nvidia,tegra234
> > =20
>=20
> Don't stuff things to the end, but put in some logical order. For
> example 'I' could be before 'N'.

Sorting these alphabetically doesn't work well because it's not very
deterministic. So far we've always grouped these by SoC family and
within each group they are sorted chronologically. Chronologically
here being determined by the upstream activity. We could perhaps make
that a bit more formal by sorting by part number. Those are usually
assigned at design time (i.e. p3740 was designed prior to p3768), so
in that case the IGX would be sorted after the AGX Orin.

The NVIDIA in the description is something we haven't been very strict
about. It'd probably be a good idea to add that wherever relevant since
other vendors make products with these modules.

We could also add comments to the list to visually separate the SoC
family groups. That's something for another patch, though.

Would you agree with chronological (by part number) sorting? In practice
this would tend towards new things getting added to the end, but I think
it's the least confusing for people looking at these lists. For instance
if I buy a very recent device, I would expect it to show up somewhere
close to the end of a list rather than potentially very high up.

Thierry

--6Vko1tQucAgVwjQX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRSJvgACgkQ3SOs138+
s6EDAg//SpMJpUx87PnrtyCorL3jf+UuYZXTUC8ih/qVZAw7j9vCp1KnGyy7CoZ+
doA//mQl2VyK39pyor082omb2z6UPoe8QXF0Un9hn4+qPZPjXEGeSdUQHaIwTFNG
qlcujWeLlDjORzv7kT/Tk44JxebTbLp7kzrTVhlA9vuCB/fl/JIIJhazQ4Um/7t6
ZWHOxxgj91+dJD5zpzQtrOetRKhFkbXT4Po73C7dZmE6DzKo5lOhUh/TbNXeMxzu
5Y/l+/oZ06eyLAPwnxreC3hScO1EeXRdGUdr+zomIM4FMnurCONM/uZp7XMpObzO
yz+vs6bY91DgCTYDUTnS3soDUyljOHAZh7/Fa22FKqXiYy6YkuFWfcM9d6KXWuo1
YalwYfosRyO2oo+pk7TzjafRHBIokwV9wyOwDRC3PCvizfsqbi3LXiMFwfJf26i+
TbyIVZeZvYZqOZSyaVnaRBKceO8lyagI7bOW8i59WVCLBYvDGzttgIpdpsqlgDEF
Nb3Al14ahr+h12O9B5N9fDgaXkJoR3CFg5//TgKV5ORrM3isHrsCM8XZaXeJ5hb7
wOexoadRqOkdQzlNpxPoX84Zqy3lLfGwlDI/L2pFjwWbKDqyYM3sH2NBQHNmgjG4
Sih+kzy1N5DGwEoiC3jrT19Crr85iRgcpbPvHrz0x8FbRoFJgJI=
=S4US
-----END PGP SIGNATURE-----

--6Vko1tQucAgVwjQX--
