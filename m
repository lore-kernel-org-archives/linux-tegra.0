Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E076EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 06:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjGUGWj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 02:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjGUGWO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 02:22:14 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D0530C0;
        Thu, 20 Jul 2023 23:21:47 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9936b3d0286so253688666b.0;
        Thu, 20 Jul 2023 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689920506; x=1690525306;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/41dQ3c/Hx+YYfhvABXVnfSE5c1C3EeGcDjRGR6LcU=;
        b=TBKZ8kJYY8zbOME4XyLOOZat7TUECE52lPSxv1W8+V0Fx+BLL5OJml3Ct+eZyUGIgu
         bUVjFx4bi9l2OFvQVFXWno5WOLK7uMl0j5Wde0hoORKXlcjztXPfglm8Gh8OwX1dMYLQ
         NDVWf4lqD0U9tTDVwjUDFJqPFj2EswN/aECtFlREcUZOT+lgLx07Pk9WOIltUdgL/mH5
         Bh8/XaWLhZihH0ISzXsNov/wB+zgsTnMjss6ObeC7mufaYEpoFxqUAN3KsmPU/7o5kgT
         pq35Ari+lXPBSXb03keIPnmrzUvCi6/S29tFj8EfnS4XeN0ViE0Y32+meneo+Eyavu7/
         jtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689920506; x=1690525306;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/41dQ3c/Hx+YYfhvABXVnfSE5c1C3EeGcDjRGR6LcU=;
        b=IH6QyYtN5LCCu5eBsGeX8vqFcWYtwo2zX8KM0PxlAmCrLGcRYDJXG7KoXYeBbDDa1M
         BK/aI+S5Ntkr2LrAURgwj5nZm3gTtMZag56iMMtwdUrDncnMGi/LkoVbg672Ek1P3fVi
         UqKyp9GzYUzlWzPQGA7BF25rZTojCTk8WVVY4yQvfXUuxrWHYEBvNAD+o0kCq0H9GPP0
         xC7qZ6po+/tkSDSXwiE9rsbQnyrUg7zIcywz0kTr/GqaC/J4wMd/WdczjSdIk6Kda47g
         KBu5Fp8FWWtPbIbAeLRJfmdmQdgNL4Sthj+BuHf24LDrE7rxWNTbecNzi5mcA5mxdgwj
         YnRg==
X-Gm-Message-State: ABy/qLa02rdM4UZHSOtrP5aIJpUYJrmlkGqcpapAF8dVZlBikOVl+qsD
        cGKMEEDPBlVRk212e3FKGB0=
X-Google-Smtp-Source: APBJJlEGxWm0ii6ImSsWnu6tI2qzk9YhtYkizLb7RvEs3vljuD4rrfYDwgkTF5RriCdLcU+OZNq5Kg==
X-Received: by 2002:a17:907:75f7:b0:982:89b3:8650 with SMTP id jz23-20020a17090775f700b0098289b38650mr960139ejc.64.1689920505732;
        Thu, 20 Jul 2023 23:21:45 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cb14-20020a170906a44e00b00992eabc0ad8sm1677859ejb.42.2023.07.20.23.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:21:45 -0700 (PDT)
Date:   Fri, 21 Jul 2023 08:21:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Brad Griffis <bgriffis@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: tegra: fix p3767 card detect polarity
Message-ID: <ZLoj-JgLqL619m70@orome>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CrT3QqnvATO8hR6T"
Content-Disposition: inline
In-Reply-To: <20230626180920.318774-1-bgriffis@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--CrT3QqnvATO8hR6T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 06:09:19PM +0000, Brad Griffis wrote:
> The card detect pin on Orin Nano SKU5 (p3767-0005) is active-low.
>=20
> Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This DTS include is also used by Jetson Orin NX, but I assume that the
same polarity applies to that as well?

Actually, looking at the Orin NX, I don't see an SD card slot and
judging by the documentation that I was able to find it's not documented
for Orin Nano either. Or is it only certain variants that were equipped
with the SD slot?

Thierry

> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra234-p3767.dtsi
> index bd60478fa75e..831a553ec387 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> @@ -42,7 +42,7 @@ flash@0 {
>  		mmc@3400000 {
>  			status =3D "okay";
>  			bus-width =3D <4>;
> -			cd-gpios =3D <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
> +			cd-gpios =3D <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
>  			disable-wp;
>  		};
> =20
> --=20
> 2.25.1
>=20

--CrT3QqnvATO8hR6T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6I/UACgkQ3SOs138+
s6Hveg/8DZbfqL2oqL9OnjVIqsIpwupmXZO3lB2HQhDi1lX86Kd5vPJz18PTq77O
9deOfQQksh9N5U93A6UQ2Kgi/H3wctAUCA/c3/CHPV9SITSYlI/HV2TfCpThVpZH
E2PCtDFKRsbJ3hKg4IZxC9sar2X4NdKS4TERH+LLBW3BU6ofUYRLeUC2yoEDZVCl
5qLrdHoIgOmahyMS9Udpt5rLQUJxECt+MOdF1tmGDBRDD2G5q5kQNF/83NwTqbYI
FAd1QNR2wZLrQbA0yW4OAiihfPqiIpYf8duOQ4R8PcxHekz0ZAmX3QnwYo3Yxsqk
tgARqGtQ7onITVtg13c8jOXg/7i4sHeQvD1QuqoGdlbsnf5Rbp7qCugvMDxFflxp
Xz8xQh7vjishOiVkBJM54cTnLIDl5MyxhU7G/gWUr+5Y3LaDm/2JCKpLyDCiSmIr
aQko/iMRcQg5Uaaq0THnGt3xKGatR4taFz5IURhNwA+L9qZwiHYwjoLB3mIpxlsI
rWDD0rNxOXBWiIvsCnK7mhq11K2C/XK+C1U4ZaqxebVSvf5/C+u3+pAmxhafs6wL
vqDiQYDt16N8pAJ9ntedOXS/mZFuPXTlF8G9IjCmmy/0SX6lXFPE5J3UD7N0LMBx
OOWCuq9agaT07R3LNjCG0E1qpyx0K3CMxLQtWTyBq9eapktG7QE=
=ERAi
-----END PGP SIGNATURE-----

--CrT3QqnvATO8hR6T--
