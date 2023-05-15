Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F347C77B7D
	for <linux-tegra@archiver.kernel.org>; Mon, 15 May 2023 15:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbjEOPLd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 May 2023 11:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239554AbjEOPL3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 11:11:29 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3529BD9;
        Mon, 15 May 2023 08:11:28 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965e4be7541so2245920566b.1;
        Mon, 15 May 2023 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684163486; x=1686755486;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsvUBcMhOXjqd9ZDcNssy54SV6VYhmPfH6EPl2aTGuo=;
        b=SUOsWuqoVICxibXu5xSHf8Z0wc7B1eU3oJwjbr2GaBlSNqD6QimfxV3isULv6T1sqa
         ohUq01s1RmY1Sjpgo48anUM/RStTdiBNL7muGnj/U9V9qbZVrzyTNpMc0eSqcEC9iucA
         s2DnHiW5D0Bv8PqFXMBJ8SmblAkH9vvJMKPwDVMtQyDe/knCsQwsZ4iCtEkg6ZAGOSQ1
         47xb2Lxm5xHkrHK4kGFejDWeLdoSrdE+LlIYQrkrMyR5jJuEERh+av8VH0xlr6doydB+
         fMnIJcOfK0rKiIz9T7jFqDobjLm2EK2b/BwpWd9yfLlGITR0QWC8hQy9fqKgpZqWPqrb
         PGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684163486; x=1686755486;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsvUBcMhOXjqd9ZDcNssy54SV6VYhmPfH6EPl2aTGuo=;
        b=hz+eof0ErrjYBE5zrPVZj9NOklXUrUHGYIPnlVdJzpMgkIqsSJD9sGr1UMZEpvayP8
         e0myn4TZ8xDD7xZZIlZnGCWBkydRgXC17rJhFO2AGfJbWQlvhnp0EaJjjdGecpnrlE9u
         Q+y8EOuSgydVgGDVkqv7rTiMlQ7PRiaKW0tgMlbc+YglXuuNsOrYvR51aNzUASpn8XSw
         GSFETed26wWnsdu+dTwgnRIVAsWYltSYDRuKQPCcgsUgTFA4G2RxUA2NoWeLLKXZYvZy
         7XjQcsq2tLCLOP3wuLTEPcUCNqiEAMargGKfkM2BmJw1k1Cnnwpi9D79kmOS2LVD33gf
         EISw==
X-Gm-Message-State: AC+VfDwzlG7svMIqIGr5MVv99fIa3ENU94dZhTJwSwJUzZgaJU/dn4Ji
        wOW6Txe41IF036GD9ChYsewDGLlwivu9+Q==
X-Google-Smtp-Source: ACHHUZ7YBwqr/F4kfwrb+asV0F0rUDMrK6vKIRJEw+6w/Q+GtuWiyFCIKfCFQCRmpUrxC7SxmBYCIg==
X-Received: by 2002:a17:907:d1c:b0:966:5912:c4b with SMTP id gn28-20020a1709070d1c00b0096659120c4bmr25950950ejc.76.1684163486444;
        Mon, 15 May 2023 08:11:26 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tc19-20020a1709078d1300b00969f2d5267asm9185757ejc.114.2023.05.15.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:11:25 -0700 (PDT)
Date:   Mon, 15 May 2023 17:11:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Shubhi Garg <shgarg@nvidia.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Document compatible for IGX
Message-ID: <ZGJLnKTfUx0ImP_B@orome>
References: <20230508102733.1751527-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AWy5YPLxdPOo+rxH"
Content-Disposition: inline
In-Reply-To: <20230508102733.1751527-1-shgarg@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AWy5YPLxdPOo+rxH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 10:27:32AM +0000, Shubhi Garg wrote:
> Document the compatible strings used for Nvidia IGX Orin Development
> kit which uses P3701 SKU8 and P3740 carrier board.
>=20
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>=20
> v2: sorted IGX Orin position as per part number. Since
> P3740 is designed prior to P3768, it is placed before Orin NX.
>=20
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Both patches applied.

Thanks,
Thierry

--AWy5YPLxdPOo+rxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRiS5wACgkQ3SOs138+
s6F+tw//V7IBe5CmY9Ky5oBnDZAn1CoU2LbNEl/l3/MK1DLml1GtJ1lqK08n0rOZ
xrdqIFoPmv8y8aJPCvmdvqA8X+xN6eEq8YDb2Xswz/Cd6LnEBiWn+Bes2ln8oy05
kDbTG3wnzOIAGCCwSgyUVfb0DX9e0/80ysIRtO7riCrmN3wmXiNXmvDEljBt/5Ej
wE9dODkYcNd4QsMDmIHyKKoOcuQA27uF6Uj5QCYkMdfe+aaEaFk20AIbDLbcvBPu
j3F0l8YeESDzxmnMbh1QnqrWkkH3q1gz6GxzYtJpmbZi3L8Uy/ebH4pFhBtvT1Fo
pEivtS7oeoXkOdpkfnpvnJ/T2NfbtUd60817mV4Obw1RTNz5wJ+HjA4vERhGS2AZ
w8jek2/CVYoKgg5/aITN3aesWem7PTSeHenT5iex0Bzlbl6WAgPgmsVXjc78exXu
3BOIDSLGIDLm8xgSIHOfaS4LUCdaUY8XRc2t+9uf7JvBMes82MAdcuNm87ipLLbL
YFOWKJbmyQEsRDO+FTC5S5oZpaGTPnFn5pC4mwldZC8n7PDIw8ir+M196CGjcKid
siqlzjjXsCG9HSLtl02sosThE70Qld/HIerSVHkA62BiMWoMRxOehce1W+IWR3v2
iyek02J+reWP7JDbmnuozO0RWDNe2ccoHi4ZW+bb/KzpBO/Ocwc=
=Wq7D
-----END PGP SIGNATURE-----

--AWy5YPLxdPOo+rxH--
