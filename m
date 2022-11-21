Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483D7C43219
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 12:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKUMKG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 07:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiKUMKF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 07:10:05 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B797DCA9
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 04:10:04 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id me22so11441366ejb.8
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 04:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkb3lOzKWPhmdK/svSdbDDXxasbvhA6mXtWuXOpT/io=;
        b=ARhcmfp4g9gykm1IGK6/kMtG+59mxb6kmQ6TgZIJQC8+n4O2/oSKo2gRIn5A/bJtdy
         Ny6Femy3vWkLPbrTjzeqMO4F+/U6rzwWByaorfwtp5GnrxjOeYoh934nZS+x15UFFExl
         kcu5eCbDIlMXjXHIXxS4ml8q8Xi3BdlMvbZUO1CoT31YibHbjQs1hQKqxcpXKJ1hHRC3
         q9ZJU3KOP6H5Qr5SsHHPwxrGd+/b+zzp7NwiZ/A5DL7VVIel0Ys2GLAc5hm5mQQb7XIF
         nAKN9XE7Tyb3BYEJXDlQe2n/J7RyM8COAUt1uSbCHY24mLP3TNpjXKyCmA3+LCj9AUmx
         GMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkb3lOzKWPhmdK/svSdbDDXxasbvhA6mXtWuXOpT/io=;
        b=lvqKr/GBVmXNGa84bXjNipk0v7IsMqsjx1EKvMaFq9m9jYoap8jB6Azaq+xijkkKNs
         Al45y+5hggpY19sTCH7YtKtPF+W6UyOHHr67u4tQIdqFPxjX8gEa9/cagl3+DTvMRdY8
         WiIBc1yRbUbcvO2mD8EMIL2p9+FMR5Sc2WvDHsFiLubvcDkWURf4MfnyXbevJk3BfhsO
         PDGBrJXnYsjTDQu3/vf00WyTXWG6eEGmq/DA6zKt4Y7ooPRJTRhAsRjtqfGGKZf+S7F3
         ziiz7YMdcaRi/XMBFoWLPjxsoQHvYdpKjBUJNxam+hi7H/Ap1yyPR7eJq4LYl+UBwfcS
         KBCQ==
X-Gm-Message-State: ANoB5pnZwWh757K+Gqu/W1xggV9DG6Y0PGMuHnQiCHUJNHhJQb62yRqe
        BD71dHEEW17zmRK4rVih6ok=
X-Google-Smtp-Source: AA0mqf5U8NSV9VzRuOjlqgSqt7jxcd/+KZ6sM03IjXrzUWfUuFE3tTKPwwEQLJbmHsv0eBdiU8tC3A==
X-Received: by 2002:a17:906:cc8f:b0:78b:8ce7:fe3c with SMTP id oq15-20020a170906cc8f00b0078b8ce7fe3cmr15021249ejb.557.1669032603279;
        Mon, 21 Nov 2022 04:10:03 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906318800b007b47748d22fsm2752872ejy.220.2022.11.21.04.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 04:10:02 -0800 (PST)
Date:   Mon, 21 Nov 2022 13:10:01 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/8] dt-bindings: Changes for v6.2-rc1
Message-ID: <Y3tqmX4FV4OzOIOz@orome>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
 <20221119012025.3968358-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7/pSouzpPCyokl52"
Content-Disposition: inline
In-Reply-To: <20221119012025.3968358-4-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7/pSouzpPCyokl52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2022 at 02:20:21AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.2-dt-bindings
>=20
> for you to fetch changes up to 9c812445df0507aa30ddb511a777fc5dd981eb66:
>=20
>   dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-18 23:58:=
45 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.2-rc1
>=20
> New memory client IDs and IOMMU stream IDs, as well as new compatible
> strings are introduced to support more hardware on Tegra234. Some device
> tree bindings are converted to json-schema to allow formal validation.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       dt-bindings: tegra: Update headers for Tegra234
>       dt-bindings: memory: Fix typos and definitions for Tegra

I was just testing a new script and noticed that the Fixes: reference in
this patch to the first one no longer matches, so I'll have to respin
this (along with for-6.2/memory and for-6.2/arm64/dt which depend on
this).

Thierry

--7/pSouzpPCyokl52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN7apkACgkQ3SOs138+
s6HbSQ/8DrhZV3H5SGvPc1SZdkuAHzTu8bkxKOjfum1o94p54/bkK5yeaoaMZlj1
q2+Nbh6UBDvH6Y2NbjWSt4xGEiYgs/YkJxj01b6Zre9SQ4grzdx4PhabjAWvCfUE
rFTA5Da7d68DXRc/3ipWvF1mwmNjL+l6tAOlRKFg80/wXJ6S+QozKxh9/Uz70K1s
KCiuWzaeJhieVNCgSidNyhOI9eAEfi2Xt9svjyjm+KYMF90x9sfBJQrpemnuejqX
u9AhoKi1dcZME/qewWqB40p6O9AJ1s4oC43Xj6U3yw3T1OLSct0e30t77lVBz7u8
YxcEOH0wshHb7PDwMKuFDGY3znGMpKnWiv3I3UfOq+Za9ahB15zAh+FdhtJUkx7N
Y7WmjXFk7xFjY4dhPqfqwzwNsDwRgbj56+AaBk23zkHS/EN4hdV585rG4vkaNOnc
vWJgM5Y8v/yHAhdjwx90Qkbw+uUCQoZVh5KJ4Lwj01I3veq9nPCtdG4NaYBqWkAY
T5XYWq5WbQNK0jTQ3lOgmQAr0XESKUDTh/gSGFJm0A3YzZJPCHmgdDsnk+02EFpM
MbhFgaJOshDopSWKGMDA22Qq/m5vag6ukEneFeOl8a1CUpZMdVFKbiTDbS9RsGYu
nHEk2FgRVKLpROA3ZJZeUtXQx/ZxNMNpk15B404zUJ7pzonKIvU=
=1i4c
-----END PGP SIGNATURE-----

--7/pSouzpPCyokl52--
