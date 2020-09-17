Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367EAC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:43:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6862074B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qseHGXS+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgIQKn2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgIQKnU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:43:20 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D567DC06174A;
        Thu, 17 Sep 2020 03:43:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z4so1523756wrr.4;
        Thu, 17 Sep 2020 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mKCF4ocmjj0Rm/uGS3hAJIwKdlyyGieDpW/qiQNTdJk=;
        b=qseHGXS+myHj8YT5np06wt5GuN3KC9SHsrQKnfIB33AKOpEwc2CRp8YEaM8Fyzo8Jf
         8gLosBtOHZzdOTjf0O4tiAJAx/fOFkPK1Lvr8paLzeYh/HxR+cF4I1VTnnP6Rkv7WaCH
         hjGEaRwgaUflAzRjLzwcIQoQH9u5FMCjk91LM0X5/6t/0WVNajYkaopS9jMKX0XtXDJ1
         HsC4TXCFXEvXp9h2SuEEN6m+eBafPkwkaatwa7UN5292Ew0kES3VD67QsUxaXi9lSFxz
         5TEjL1tjKe+gKTdd1Ywhk4kSq5N2R0VcAxCeIPZXWNJ20R/Q2iakudz9fvYzM+B4XTKt
         Ebvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mKCF4ocmjj0Rm/uGS3hAJIwKdlyyGieDpW/qiQNTdJk=;
        b=Md+uSjlljgZfyotZT6wv6CWH42Ob2a26Q7ULT/xsIuXtzqCcSHvKN6jRoZ2ubOptij
         rvPk+WpzWfE9/ksOt4wCTzjk7BjLhKAeJJ07Vpi8wIXdN2IH8xCLUI4pzG9lP0eWgRg8
         cbJ/VPOSKBuYT+Wc4uz9U53uZDmgQZjuBC7/b4TyJgJ6hhfoZGexoagj4N2NCqCfyNfo
         dbuLhsDXk84yktpZIrlUi5s2uw2Cgw2aSvDXortFJY9BiOa00JWQKfXIKwhvZWQ5OA8S
         QNSaOlHjsfPHzRbH7IzutqJ5Rv3XPKlZ8cmGQUZTY/U07R5wVaNHjsebsRgUFu8wvNNp
         pcnQ==
X-Gm-Message-State: AOAM532AhUmosCWT/FBKRt7x4+aUE1wMYqP/yJiEOpVHp38IowURktpX
        LC4rT5O77REYPqABypQCCZzMxmEzsDbpJQ==
X-Google-Smtp-Source: ABdhPJyBLuiFgLg3ScXKGeKllJOMU22WY2nsLkgR2mJHwhvarmwmUZ5Qy9UU6mDr6dlEtNsUFWiDVw==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr33419886wrn.12.1600339398589;
        Thu, 17 Sep 2020 03:43:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t188sm11273801wmf.41.2020.09.17.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:43:17 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:43:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH] memory: tegra: Correct num_tlb_lines for tegra210
Message-ID: <20200917104315.GI3515672@ulmo>
References: <20200915232803.26163-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline
In-Reply-To: <20200915232803.26163-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:28:03PM -0700, Nicolin Chen wrote:
> According to Tegra210 TRM, the default value of TLB_ACTIVE_LINES
> field of register MC_SMMU_TLB_CONFIG_0 is 0x30. So num_tlb_lines
> should be 48 (0x30) rather than 32 (0x20).
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please send this as part of a series including:

    https://patchwork.ozlabs.org/project/linux-tegra/patch/20200916002359.1=
0823-1-nicoleotsuka@gmail.com/

Adding Joerg for visibility. From the Tegra side:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra=
210.c
> index 51b537cfa5a7..4fbf8cbc6666 100644
> --- a/drivers/memory/tegra/tegra210.c
> +++ b/drivers/memory/tegra/tegra210.c
> @@ -1074,7 +1074,7 @@ static const struct tegra_smmu_soc tegra210_smmu_so=
c =3D {
>  	.num_groups =3D ARRAY_SIZE(tegra210_groups),
>  	.supports_round_robin_arbitration =3D true,
>  	.supports_request_limit =3D true,
> -	.num_tlb_lines =3D 32,
> +	.num_tlb_lines =3D 48,
>  	.num_asids =3D 128,
>  };
> =20
> --=20
> 2.17.1
>=20

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jPcMACgkQ3SOs138+
s6EmBg/9HLDWhpRNJR/5mco/9GHyNB36dWfDmikjmORhkt5kJlK8O5z93Y7+kUbE
s/KFvB/lBMrkKqHhG2SeCFB7gQ+xQKz0isV1S/NhjgzxWfggd2B1w3ZRLdQZksFP
YEzQIdj81fGuI4/kJSt/q1/yVAgqXDTbuZeYjdrLOwK59y89BUZjS89H0AeKHduG
0UN/zrFuc67q587yy+kVFjhuHoSZG/APsIIMc0x0Q/GmSbPKcAf3UMEZ/QpwE0Bb
PT657IFAhhdosRc89UAjBXBMqCwaXEn4ZVImaUs4DM+GUm+lM8LnvQswDf1s+TkT
eDfsI2B4ptr0hMaoC4NC7BZX1BDbgj13S40x1kkXAyWSzRvTZjhF/2pHA8Mu6ZAx
3nH3v9o7cCu7qKpWYW+wTuewj9IejPXMKVjy3Dx8zVIAxux4Q3zr9LCJASzMoabk
M1ph2Nd3j3/dMKDAQGkW9Yyj/Ny16k7LWbtEAM+V3Ineg8vTOgTc869Tfmj5IK+K
V+kVgzokJ8JL8wxpzvVS2mvhGKl5vGD97BYQnlOTaC4iOZcLr99YfeVUdY43Yo+9
wHgaGfY1c3XxmiOre3OYXaXUOB0pXF2++3L1G1OUZowdH1v180WK+1IWG1Qk3ol+
tQiVymrJlDnzyw/MhKdzJ+WBB3uxibFu6LzOnQuIbidFHxhAFI8=
=w5PD
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--
