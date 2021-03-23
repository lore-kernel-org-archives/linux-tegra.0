Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A0AC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56AB0619B8
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhCWSjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 14:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhCWSik (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:38:40 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076EFC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:38:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w18so24680522edc.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BEqxfTxECuU0628ZGdqAZzid8U8f7ew46SKU/6uTTlM=;
        b=pBcJ0ZOJuKD+BM2Lsj9T+jLNF+se6MzORRP6y2/U0rc94VIwFoq/JF5hHxoc9Siuq7
         ggCOkBRZ40pH+T9S3xPv1wiu1+T48nvXS/3DfwGFAeYzMzeLo6UBAvpVRaZATofuCi3T
         7r1qgGWVGoaBN2p9edRJ4QpWLnk1U9psqUvCWiZEkbUOdSFl7b9MyfnbQCQ/N5HJBSoA
         2JSsok46LiSx1FqQ3x7fIZsesytDY6LEQrlBfeL5BRkyw9vg14hgxkgYE7poTKkhNV7/
         HD4vy5iFepBTaz+iuEIGfpP8EJUgJ6QFoGQmgo70bbfEqxTj9nju5fd6AQWNYHNZUCky
         ywNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BEqxfTxECuU0628ZGdqAZzid8U8f7ew46SKU/6uTTlM=;
        b=NUzLhBtSUAADy0Fl5MUmX9kvlk+iKwjNu+kENHOy9EZRFf+nkPwRGBjyA5Xs2PCydY
         5r27qNB/8ciC3bOv30mVfRheS0kYQDRA85h29eH7PCFgZ1zFxVnLHYy72e1+SB/AP5Ng
         ceYyFAXDj7b8QJoBplOHvMoGSxLU/NNkSyZ8r3SHvQAf4c1nfBqJcSO5gdlXEgKon71E
         Q8KF+2xQZ8t7w2OGipuVxoCmDYCTwTZNIWj01Ho0PdcToY36n2HViGWIldgZwJR3QPBD
         1ZS6Zun5d9Ff6rRgIaH8Elk94gsxC7EEitxjyLAFyjZilpj4CkDObYcCkMSyKZ4zZGbs
         EaDQ==
X-Gm-Message-State: AOAM531qYE6p5+3Jp4Jjv+TDMon5s5VczGn2CSzuqGAmMQo6Dy1jBzld
        kXYjjisBXFv65B5LGEsNMQY=
X-Google-Smtp-Source: ABdhPJxQZLyfd9lIjj45IxgzFzNX1mokXYa5piHX3fUHn7DzOrQ+GDg4PJHuAXciZtjYaM2yynEyKw==
X-Received: by 2002:aa7:d294:: with SMTP id w20mr6051576edq.68.1616524718764;
        Tue, 23 Mar 2021 11:38:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q12sm11611926ejy.91.2021.03.23.11.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:38:37 -0700 (PDT)
Date:   Tue, 23 Mar 2021 19:38:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM64: tegra: Fix mmc0 alias for Jetson Xavier NX
Message-ID: <YFo1whmQTuD5ShVe@orome.fritz.box>
References: <20210312094235.755603-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zsnf50ou/o3QO3lM"
Content-Disposition: inline
In-Reply-To: <20210312094235.755603-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zsnf50ou/o3QO3lM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 09:42:35AM +0000, Jon Hunter wrote:
> There are two variants of the Jetson Xavier NX platform; one has an
> eMMC and one as a micro SD-card slot. The SDHCI controller used by
> each variant is different, however, the current device-tree for both
> Xavier NX boards have the same SDHCI controller defined as 'mmc0' in
> the device-tree alias node. Fix this by correcting the 'mmc0' alias
> for the SD-card variant.
>=20
> Fixes: 3f9efbbe57bc ("arm64: tegra: Add support for Jetson Xavier NX")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
>  3 files changed, 8 insertions(+), 1 deletion(-)

Applied, thanks. I'll let this soak in linux-next for just a few days
and then send this as a pull request for v5.12.

Just one small nitpick: the correct prefix is "arm64: tegra:". I've
fixed it up and will keep doing so, but if you want to save me an extra
2 seconds per patch that would be how. =3D)

Thierry

--zsnf50ou/o3QO3lM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaNcIACgkQ3SOs138+
s6HxURAAiF9zxDSeaQvY2HDXU7aIokXHM5IrmEXrOTFc0Xp8rUcMd3KBY0W5ma5L
vtU2BwFwoPm1QptN3RZg1WlnUX3AnyVHAVvfcYaTgh6gcOh/k3QoGFlEWE76un43
whxfuSoGegY46j2WdFBn5zwu6fpEnwkqCy2VzMcldQ28faqsl2in6IRGceTH18+B
7Iiqiu6DFJExv0/BUS9wl45xxNx4K3SpcNkRcc1+6fSRWRXd37oQkE0YlHGODENq
2J50KOEfZeCIZ41L5Xt0Rw8g6KQBYye6HUGa8jSnFSyT93oZcx9ZPd+kTIK/kRBW
6uGJ87z3/jhWsOaYA42Hps3vg9E+X2RIj3rWnUofwLEbVwekk3xDVUdp1giPBSs0
pLYyRL2XgF5l9VmUNeJ34QtcA0/jlu8F3l8WJgSipyIg/Zq0zTRVsMhkczkxjKt6
IQOk4oXI/jPc2wl3jch70kNYIxAgIdlCYre8K4c6HvuhQ0JHPbT4Shlui4w6wAOa
fFaNbAjSSYRwhRulw4kgpUrXk/p2oL7w8u7JyCADdbiv9Gkt4R4vr7lDYv/4ToEP
XXL5UN2JHnX3FCRJWOXX/XuDPNlRNFNR9i4qJBL2IKR/snVtKo8ygs9rOX9UJKjy
rna4pQ/BLYk6fHu4ylWomtttFP90IKq4QZWlpWoCW/TMXE6iAOE=
=z3D6
-----END PGP SIGNATURE-----

--zsnf50ou/o3QO3lM--
