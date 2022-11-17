Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EB1C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 22:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241228AbiKQWGG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 17:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241049AbiKQWFe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 17:05:34 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BB77DEC4;
        Thu, 17 Nov 2022 14:04:51 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id k2so8639865ejr.2;
        Thu, 17 Nov 2022 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3haNHYMRPW6WiFon59sm9KfQnepVjzDNjIc2zbZJCx0=;
        b=E0NZwP6AisbwhAYSoYbaL6OpUuZqp6MhD3s0QUfvNM3jHJ6cQFxK2/mXngpBhihcO7
         FvlNzbJaifsfpDY0bJbtNUCWymD5LynFJySzEENUnEJZH5uSJqouRn74gMJCdV9H+HHp
         Z6diOJIThgM8KvXTaaE05Lug//gL4fiC/TFqUrZ7r0e/CU5BGRDuJDYdv02XYPkMFfeU
         XV1TRwpt95s5HIEMLY8R4LpCPI+yZSWPRzG2Z/L6Rhnbsp1vKNWen68M6sigGa4Aoyun
         FuAr9lIBKDfT74FEm0k0GPtM/D9FA5AGFNLDBpYoxR5RQe8zVndvHeWwCHl2mzPkKw5v
         C9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3haNHYMRPW6WiFon59sm9KfQnepVjzDNjIc2zbZJCx0=;
        b=jGCEWxiFjTh2QeQWGPsj/M8BeEAxPbuAhunkkx2aDG1kFWh++lxSq89xLYbjZl3DeH
         ZWJfYwaJWm5KlBLpiZgN0r4LUbCSRQbIjCyEfyB9vrmRQo+eHfiFVqzRenz5plkKoz+3
         hILti2RFZHoEWYlSXVornaI4WD7S0zq7mvHDu8B//2CDmSY0t1N0KQrzlFjX68M1DL3b
         pFR7+Q3Z5VrvugLbznOg1+Q+ZaQf178aO93VJdhqoeasq9vwS2/1ZC2sWsvk01Mbvz8/
         z9UAezFVrKflJQSncDd1xjIQOjk0GWdyepvYb44/SQvHLMH5do/upVMxVl88uNF3Wzm0
         JZgw==
X-Gm-Message-State: ANoB5plt1sy3FIU8uyABY/6cagcptScSZy0IKNgMrFY2u3YagVnz9zmt
        o8Pi0X64rijn6HvA/FPzwWqGmfPFkd0=
X-Google-Smtp-Source: AA0mqf6JiKtGesCmhiy+n56uKHBKuudhP46oqgu7uN4o9Glfem/gXc6BefeMHK/1uEPIiYau2PPxLg==
X-Received: by 2002:a17:906:6403:b0:7b2:9667:241e with SMTP id d3-20020a170906640300b007b29667241emr3812019ejm.115.1668722690341;
        Thu, 17 Nov 2022 14:04:50 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906274a00b007b29d292852sm879166ejd.148.2022.11.17.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:04:49 -0800 (PST)
Date:   Thu, 17 Nov 2022 23:04:48 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Fabio Estevam <festevam@denx.de>
Cc:     vidyas@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: tegra234-p3701-0000: Remove
 'enable-active-low'
Message-ID: <Y3awAIfd6mCcDS1v@orome>
References: <20220919104350.834777-1-festevam@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dxIzlKQrPY+WnXUo"
Content-Disposition: inline
In-Reply-To: <20220919104350.834777-1-festevam@denx.de>
User-Agent: Mutt/2.2.8 (2022-11-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dxIzlKQrPY+WnXUo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 07:43:50AM -0300, Fabio Estevam wrote:
> The 'enable-active-low' property is not a valid one.=20
>=20
> Only 'enable-active-high' is valid, and when this property is absent
> the gpio regulator will act as active low by default.
>=20
> Remove the invalid 'enable-active-low' property.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--dxIzlKQrPY+WnXUo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN2sAAACgkQ3SOs138+
s6Eo3xAAqUqn7uHA3olojMRQrmWxUUEplKI/Y9vpfLCH+xN3YM7cgBfDkw+AkZgC
cl1uVz27EHmk+Ke3fP9yXNvjTWvYn+Krifpo0o2c8k+znUObuMJPVt3hJoVHFbXx
BxtFHgF0oMLeF3XIDqh2aneY5qA2ftCyMlIVR7jBGhsqNsR2D3k01/cBjdkiVEL3
QXaczJaNy9LuAAHz94x/edIWhxEdVGGdAntGqg0IE+2wCmF+c3QvQOFBVp3w6vtP
r+nui+cXiR2SdwWMKKceloFJNdA9fM/xQrfUN9ZGXu/gumvR7VfrhfL45VS0JOLB
MFgC173s/2odzT38yiq0lgpu4UwObvvgW36qZEOZWSClFJ0yc7MIklxd9bpHQCEa
GEmrvskYG0lcwYXSZ80psOd6r5hmBNqL8hlGhERtUNVs+1V3I/XoKwMkoXODhaw7
IWgZ0drsH4y4cfB5zNbiRMvP5jbelGh8ajdxNJdu174OEzuZSuLQGwtwNLQjUy5q
u1RuxLFZwUmWXP41i3lVMcq+WC7kGVaU8B0hUuNsY8QPbW3kg5b78TIOJYATQ8Sw
xm7M+XHe9zEPCW0lfKLuqecYTb4vRKqeOFA03DhMCNDvu5f6abojUhBPa34OAocs
F1M0uAWpDtTLv11NvCnbXTwUFZYiSzWCkgCpf0jUGrXn8NyQQF4=
=nL0o
-----END PGP SIGNATURE-----

--dxIzlKQrPY+WnXUo--
