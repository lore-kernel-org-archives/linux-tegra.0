Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D7AC76188
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 13:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237738AbjDENS3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 09:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbjDENS2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 09:18:28 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39B82106
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 06:18:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso23723358wms.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680700705;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=861ZIRpnhegR9y99s7OG4uanbWErP/lhY6sHZ8OLs8E=;
        b=aP1HCLkgRbtQuW/UfdUQRgvWMknQtF5ch3/2zfC9gWK0JeLHE8qZN+eP/dDYdPBgYE
         IuGz2LsYTjpvC471so8yzOpZjlKom6Ha++pomLFn5T2jtOqqk7BfaHmRIyL7ipVJT/Ur
         t+eb/XvbY+sVAItSZVmq/0pZlURW+Cl5zw5kX7FsxNKa/hcoo1tk7BbHVjZWaq87tRgx
         mHPJ5VQgWiWifRnvY472KG6jGfsd4vEK078M/seyEslx/Rvr7bMVh8UQeyWM9s6SA/xJ
         dHUtrpRZcdzUIaWB5ppC8sBHJv+a6fhiHG3XHIFUyLHTD0lTOd9WvEv1Vdptjz4+Pf8a
         LsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680700705;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=861ZIRpnhegR9y99s7OG4uanbWErP/lhY6sHZ8OLs8E=;
        b=7XplvbsMjQseAE+7W52kFeYMcqiJIFAWq124vPt+/1KIsa9g0ky2mWjkBV6EZ/kF2Y
         GFMDNgkkvbNfULbICS69NuJ7HgeTBbq8L5VJWezv24civzGDi7gbRWHk18nGIBxQlC7S
         WsWI+4pm/A6Quk0hqj9sCNEWAE7Tbr2doGSsFyKRy9iJVPtuirsmz7BAsvwFnFyWQYR3
         4fU+sSaGmtSGry87kDgtl79O+YiFHCuvzA5OkNZ+KSutTZjfBQIi6mxhkBW2cgayAOu1
         GHGVdy+FvkigJPraFJj3pjR8NCHgA0baWJSg3kEZDbEPSkJrTgI1vznYva7ZJ8o4qXcE
         yrtA==
X-Gm-Message-State: AAQBX9cNn/oSYnNZFYDkEMqo3TEbgcWiFa25pq/Lps33nKFDJKM6lBvP
        hlTioeGJl6zsfrnuH/Z768Y=
X-Google-Smtp-Source: AKy350bpU9o8XFFOGhoQJo7KqVpNG55ltq5RoF50+EHubHEirJRhj1Hif57Iybym7vLtQGYm10oKdg==
X-Received: by 2002:a05:600c:2158:b0:3ef:68d5:9573 with SMTP id v24-20020a05600c215800b003ef68d59573mr4634703wml.19.1680700705291;
        Wed, 05 Apr 2023 06:18:25 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c4ec600b003edc4788fa0sm2308872wmq.2.2023.04.05.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:18:24 -0700 (PDT)
Date:   Wed, 5 Apr 2023 15:18:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <ZC11H7mXfHX_mGXh@orome>
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="imb6ZQrPTqhgyr1B"
Content-Disposition: inline
In-Reply-To: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--imb6ZQrPTqhgyr1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2023 at 07:42:55PM +0000, Diogo Ivo wrote:
> Add the reserved-memory regions of the nominal and derated tables setup by
> the bootloader so that the EMC frequency change code can access them.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 709f3f417a19..a74826ae97b4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -30,6 +30,22 @@ memory {
>  		reg =3D <0x0 0x80000000 0x0 0xc0000000>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		nominal: emc-table@f67cc000 {
> +			compatible =3D "nvidia,tegra210-emc-table";
> +			reg =3D <0x0 0xf67cc000 0x0 0xbea0>;
> +		};
> +
> +		derated: emc-table@f67d7ea0 {
> +			compatible =3D "nvidia,tegra210-emc-table";
> +			reg =3D <0x0 0xf67d7ea0 0x0 0xbea0>;
> +		};
> +	};
> +

These tables are typically generated by the firmware/bootloader at
runtime. Often they'll use heap allocations for these, so the addresses
are not guaranteed to be static.

Can you share a few details about what set of components you've used to
set this up? If we add these we want to be as specific as possible that
people use exactly the same set of firmware files.

Thierry

--imb6ZQrPTqhgyr1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtdR8ACgkQ3SOs138+
s6FUHw//bHwoxM6Z56McHEETqOz8xc6QsHTu7Gs0I50XJebV+ZSCfCZ1MrMpelbD
8xS9MurtNbCFxGwe+qpntUpUMfCYZ9+EtR9I2eikiFYwZ1apHRyjzUZfOjLUhsvy
hlOYvjyesHgM0rsQYML2zlhABqT4LaNbN2ueldBH1bpN+jIMwnKIHF9lZrKbASye
A28z5sVXK9psSvfryEVdhJFrOckI7hvViSaI0K9lNUpI5BXyQ6QcmzvTYZLNcXh9
tqVuio0ZUqH9G7X6bpjs61hyqUMUqPYfj5GVFQcp/WyA2XNprY6tLzNUcXM85l+o
hXUXdAXr4KNGx6ZRONjxUmJQIxbQruE19nnts86G71ZoMDbvWRmyXuODPEqsMOxw
RpjtDi51ATNWAGdF8ly2wCMtPwaRrnbdkqoYQfuio0xvBmwlMr638yfJ4/dOuV04
VnJn+y85dZw4PrqnM/9bY9QDPf0+CPpXzXFu2un2hh6sWwdYwARp8amhDMIWkHoe
aCOw/bHK4eMo5YtiJdzaQQFEZpV1QQxN7Ayi2j3mF6PK2YMLmjVHIOggH7QFE+8t
5O8RuubwEaX+SHgE/XYA9VaRhMe5x/7iK6QvOcNVZtf8p4U6ZXxe6n4CXFobAPTy
fY0KMPX9X4NMY+ZNA+m8GOQvWiHffUMHBtvYjU/EEF4/Mpa3g/I=
=ZvYA
-----END PGP SIGNATURE-----

--imb6ZQrPTqhgyr1B--
