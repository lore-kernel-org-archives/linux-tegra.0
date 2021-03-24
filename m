Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29863C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBD3161A10
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhCXPMK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbhCXPMF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 11:12:05 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBE9C061763;
        Wed, 24 Mar 2021 08:12:04 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so2887394wma.0;
        Wed, 24 Mar 2021 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TDYF5ErOLHEJ+hIFEGfywBCNbHx+JNBmcnAt70zbjjQ=;
        b=FBMT4AAOZPxQR987rajfHBV3eU/Ahs24p1NtzKjDWRiCuwoznwnYVyno336zSZ53rZ
         DaC7QmmZuTDATkhpr0dxv3VlCJcZag/UQFsc9yZ+AzCsUVma8pFXFYuScE3z6QY0zW2e
         zPx9OmSXtI9x01HHjeJXCH72azdg5bYXc/2vX2g4iPdb4qROrsVLf9jk4V2S2B0IF10P
         GP45bKkLWlUJ5dTgNKjFaO1TewRQA4p3mkam32tlMjYNpz9bCjWODp/LB7Kn0fjRuX3W
         njtrPzDUvzHiX0f0xYPMXV38GhD/8zY6YDe4Cb17fxlEokjjZNQ5oH0rg+iwpKCU+XLH
         Apjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TDYF5ErOLHEJ+hIFEGfywBCNbHx+JNBmcnAt70zbjjQ=;
        b=KkNYqLJ30lhZlS2KWhJH5EnSqYwWjR8xwvaV1De1yjyiNX3iszFO53x34hFHiCZQTB
         fUVBEZP2vt644zktwjyfJq8KgNXaFYQwa3KRhivKZuGyEEt1boeXAiVblhyFWBHi6Un5
         3dQ1Sre1PUjKYXqJQ2YfyzavdbkkF23wuST6y6OMkGbWQkqWeMkB0IHJacOZXZz9DJM+
         pUcvuWAkhfIdSuk/XGKxVb/HHwYQUvu7Wcx4q0rBi99MTNVCAKfSu8lKFE0BxISeWy2j
         W5lKeuIDJTmT41JxN1yaDNMDYgLCqo+U4omU0Oi459/CZTRjDRYpnaIm2KzYVvPOWnk+
         sZZg==
X-Gm-Message-State: AOAM5300UI4BZ8AhztQe8yxijMKg5J8x3/bWAE19qFpXwlEWANP7+Oc3
        La+Q8twjNmNb0VXaS41AC50=
X-Google-Smtp-Source: ABdhPJynhubUNp2wL5Zrc24t08eDL1nTjuWQ/0omKuvJKwCaajPcrmWji6DTk7EOKUJ3tkkoYySXzw==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr3433264wmk.101.1616598723306;
        Wed, 24 Mar 2021 08:12:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b15sm3374606wrx.73.2021.03.24.08.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:11:57 -0700 (PDT)
Date:   Wed, 24 Mar 2021 16:12:18 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] NVIDIA Tegra ARM32 device-tree improvements
Message-ID: <YFtW0sfEk2gUwAWe@orome.fritz.box>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FqyHv5d3fWN99NbQ"
Content-Disposition: inline
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FqyHv5d3fWN99NbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:09:49PM +0300, Dmitry Osipenko wrote:
> Hi,
>=20
> This series is partially factored out from [1] since the DT patches
> could be applied separately. In addition I added couple more new
> patches and implemented suggestion given by Daniel Lezcano to [1],
> see "Specify all CPU cores as cooling devices" patches.
>=20
> [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D221130
>=20
> Please note that this patchset enables voltage scaling for a few boards,
> but currently voltage scaling is limited in kernel by the regulator coupl=
er
> drivers, so it's safe to change the device-trees. Voltage scaling will
> be fully unlocked once [1] will be merged.
>=20
> Changelog:
>=20
> v3: - Added new "Specify tps65911 as wakeup source" patch, which previous=
ly
>       was a part of series that added wakeup-source support to TPS65911 R=
TC
>       driver [1]. The RTC series was partially applied, excluding the DT
>       patch.
>=20
>       [1] https://lore.kernel.org/linux-rtc/20210120211603.18555-1-digetx=
@gmail.com/
>=20
> v2: - The "acer-a500: Rename avdd to vdda of touchscreen node" patch
>       now shouldn't have merge conflicts with the upstream kernel since
>       v1 was based on a patch that adds a new atmel,wakeup-method propert=
y,
>       which is not supported by upstream yet.
>=20
>     - Fixed unwrapped commit description in the "cardhu: Support CPU
>       frequency and voltage" patch.
>=20
> Dmitry Osipenko (14):
>   ARM: tegra: ventana: Support CPU and Core voltage scaling
>   ARM: tegra: ventana: Support CPU thermal throttling
>   ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all
>     board variants
>   ARM: tegra: cardhu: Support CPU thermal throttling
>   ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core
>     domains
>   ARM: tegra: acer-a500: Enable core voltage scaling
>   ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
>   ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
>   ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
>   ARM: tegra: nexus7: Specify all CPU cores as cooling devices
>   ARM: tegra: ouya: Specify all CPU cores as cooling devices
>   ARM: tegra: Specify CPU suspend OPP in device-tree
>   ARM: tegra: Specify memory suspend OPP in device-tree
>   ARM: tegra: Specify tps65911 as wakeup source
>=20
>  .../boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
>  .../boot/dts/tegra20-acer-a500-picasso.dts    | 14 ++--
>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  2 +
>  arch/arm/boot/dts/tegra20-paz00.dts           | 14 ++--
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  1 +
>  arch/arm/boot/dts/tegra20-ventana.dts         | 78 ++++++++++++++---
>  arch/arm/boot/dts/tegra30-apalis.dtsi         |  1 +
>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 14 +++-
>  .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  1 +
>  arch/arm/boot/dts/tegra30-beaver.dts          |  1 +
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 48 -----------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi         | 84 ++++++++++++++++++-
>  arch/arm/boot/dts/tegra30-colibri.dtsi        |  1 +
>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        |  3 +
>  arch/arm/boot/dts/tegra30-ouya.dts            | 16 +++-
>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi |  3 +
>  16 files changed, 202 insertions(+), 84 deletions(-)

All of these applied, thanks.

Thierry

--FqyHv5d3fWN99NbQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbVtIACgkQ3SOs138+
s6HPkA//cy8YJ2iHisZpY5NR3MmAfVKK8tZR0cSbikz8+UotKeNM8Nc7YChgr/9V
WqMKlHKyMTYhp90mtCKAj16RIU4xeqfFtEsgEOoKKKMjhkiQEByEp5f8s6T0WzAm
KapJQJvTVQGP4WGXpeFEbQPpCNvFoGu+mjJoXlUmAiQWMKYYD5oiKgh7D55dsa0g
GIPLnxi61JiAp8OfBvjhhZbH35lbM1I6cwkSFjS8OhiVdNp1lNGgiWOfqy8NxUOj
fdIFgBTyg/BXvQuSN9rDDhs1CI2PQy6Wv4ah+GPrbJ1e56/mvC5O4JbvfH/CSjt0
tE0pBDZpyd8vEbty4w9qhMbOdYN7GUKX/QrC1aHHcigksdgUU2HsUXUUBBAQMaj9
JLH+a6HH8++DLt0F8yCVJl9/AxxPz0R8Sj9ac6szBHJPwu5QhOiDzGOT326H9AZ0
bnHg5pl3YeyBo33ZebJqXDi9UhV50zZRKrbqjhiu3DFm0svxVgI9qFvLgFjG3KNl
vkPnG/TIBTJxaCmAfJ4fFBmy8J/XyHbK8QIjeAzBhf7JQQsabeWpA/UTuhf6ZhO0
oLaqAtMKc1YJ4P1uUSX7k+IrfrVqR6ChZuW7dQF/uVDgua34KiDnEkbVS9Qn5EU1
PmVg9s8g04vvP2RjrNBcT0S9ZUSOZW/ufDEVLh1YL59KdF/Gqmo=
=aWLb
-----END PGP SIGNATURE-----

--FqyHv5d3fWN99NbQ--
