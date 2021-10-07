Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163D4C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFEA761263
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243443AbhJGSFw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243419AbhJGSFv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:05:51 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83EEC061570;
        Thu,  7 Oct 2021 11:03:57 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id s15so21722470wrv.11;
        Thu, 07 Oct 2021 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LZMwmOkgk54eN1UQEPXt7V5xX9DIaJ65/jsj/DfOi4o=;
        b=HUUz197XMFD4QIOrap8XB9wCFV+JH7BtWEeT41amx0tBVZTCIk5dcPiGAQ+ien3Az0
         WfRt4aF0/mjIKvVR1GZXLdSPKFUyeLi4nCum5k3zvhd7ulygZZZSZvq5hYsre9hHk/3n
         EpCrxmK0ogeMsAwZL+OA89w519fjQYP9zREk5P0Fkp4FRWElsdaR54q5BtJLbd7/s4/J
         WtGTJCIXfkX8yP4xq7wjufuoJuuHAbwtH/jGbXXqy+wmRmAfN2BfFUfoQd1D2KMm0X6i
         Y32kgzC7vjkSp1+MaA7LDsN/BkOzfpSS94wTzEIucqXfjJ3QokfGbqSXMykYiK4CZPX8
         pmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LZMwmOkgk54eN1UQEPXt7V5xX9DIaJ65/jsj/DfOi4o=;
        b=5ZDYkC6wAHEE0ZF/UupnJNktlUwwuuzn4bmdiYsyHO0fsu2lkyHL7Z6sqLpe1EzxOW
         MXgg92FrkkodZkxkY5j0VO++VH+oA3Oe8xC3+gG5KYq0aOlgxIPejYEmrEMLoqR7D49Q
         C6akPf67ar1SjEG/N3atK4dsdgaCRam5wr6vQczc1WBQf1kWlYUGleAxRagw/b+peRB8
         dEFTf+CQbYjjoDF0riSj0NkZ05n6Job5CJn249iZYwWyX8oOQtpbN5icvb8F16DnlIDJ
         yuetwRI64BgnxoCyd5/ESZmfsqFP7xd9wMkWmMHmjulMFEVuX3HUDqtjlxsYPZQEV1/r
         e1BQ==
X-Gm-Message-State: AOAM530h/L6h2i80ebfAX1qX6s0imHlLzJzio9bVjujSs+Cdqheg9XNo
        XhMGwZi0Bw9MRoj/rbGyNZA=
X-Google-Smtp-Source: ABdhPJyycWoJZY36EQ+xWCIw4MlCVxIs0pvtuJveS1miA3vFhtl1b5/SApCGxHqlO2rvNeK+/K7ISA==
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr7170320wrh.131.1633629836236;
        Thu, 07 Oct 2021 11:03:56 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n66sm123267wmn.2.2021.10.07.11.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:03:55 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:03:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
Message-ID: <YV82imZcgUlYbQCw@orome.fritz.box>
References: <20210927093705.458573-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WijDuHqqAP6ZhHfE"
Content-Disposition: inline
In-Reply-To: <20210927093705.458573-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WijDuHqqAP6ZhHfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 11:36:59AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Linking fails when dma-buf is disabled:
>=20
> ld.lld: error: undefined symbol: dma_fence_release
> >>> referenced by fence.c
> >>>               gpu/host1x/fence.o:(host1x_syncpt_fence_enable_signalin=
g) in archive drivers/built-in.a
> >>> referenced by fence.c
> >>>               gpu/host1x/fence.o:(host1x_fence_signal) in archive dri=
vers/built-in.a
> >>> referenced by fence.c
> >>>               gpu/host1x/fence.o:(do_fence_timeout) in archive driver=
s/built-in.a
>=20
> Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/host1x/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--WijDuHqqAP6ZhHfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfNooACgkQ3SOs138+
s6EkbA/+PDMiY14SV9kV644GqfM5UvlMjnXD3NUtGJ8W0AV8/PifHO7jXxUyikmd
8Y12WgdtuRboSdf365SCGguKHgXsYaxpW4U5SipQkt/3HM4qBms5k0bwfbRYU2nF
bsZGG4pnSH4j52LQ7CshQojnvndWOS8fDMgswz8Rw2XlRlWQqS89KGZlTiSMcWss
ZXKCaStIeWaiJ8+03fxUDHqJlNui7WjlgkbcgIfgBDBioGtIfCi8VqXurpnbfUUQ
TbHEwFomGSMRqya7eMO5iW0e0i8rLgvFPVK6xX9t5p5rYriWUmG/yAxQVS4RMN46
WsLK7p80HUFtIs9KHZxdRDf50QI8q1N5eA3X0PQbtmX7uleo5Z+0/AiSUYJGcMl5
PwOg7chuXzhlBMOkCLG2jgMNPT+CTfBByxKsrAP3y1uz/XJyo49IRb3KhxqiC1bZ
QWifYe4wm07T07CzUpkyP4iA+I6zKfXfZ0l+1qJw2qxwuN6fKGAXu7/AujGM0rGX
dGN10HKy9NYoNuWFUBLkccUs9FM6Molmu2LpQDd+lz17okS9QwijW87bqzu03B6A
Vp/pisQeiDa1ME7VXWXp6egLQ43y14qb/HhQmkUnLtiDPyxh+ooeGr4OnIx35Xec
+Gh8a2bDvNXYi0A23NRSiYXIhO+aG00eV59dpHv7Ib3NselAH48=
=OOu+
-----END PGP SIGNATURE-----

--WijDuHqqAP6ZhHfE--
