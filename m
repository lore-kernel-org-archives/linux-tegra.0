Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7869CC388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04E3420809
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD3EoWTE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJRmT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJRmT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:42:19 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04B2C0613CF;
        Tue, 10 Nov 2020 09:42:18 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so3922607wmh.4;
        Tue, 10 Nov 2020 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u7PePiutY/L/sMANbIk3Ifrd0U9F0uL2w8ZKdaPSMVA=;
        b=LD3EoWTE3jCWBub+KgOL5rdsFJCVg5oznIQk26MlvFiS0tiMkKt9PVv9q6Vs+wK7nE
         BB2WBzukBIPhF8xdZ5iDo5GGZNnU0qxdkVuVQko1/dpmaiTLJXg+kVOSnG6rKxAbC0ua
         pI/NE80XKis+SKnBJpTPDAc2Vib9auhwTXkSrd1EZT/mFLqHqp03aPXXGfHq6c//Pm5N
         7z6z7nMm4v8pozeqLX/gzvh7M+lOekC9rd8QZAfn0ZQfDW69fA3qVAy4KlH4yw5R3QCG
         3XwpxC4hfqIrdaStV0Vu1owQtXF037N3U/s0kQ66nQjSHplugDNSuTBqh0KVV1JET4rj
         umTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u7PePiutY/L/sMANbIk3Ifrd0U9F0uL2w8ZKdaPSMVA=;
        b=q6pcnKUHHp61a4PaD8V6ZoROLBcVs9aQD15A+3namnDHZnaYsHJ6xXngiQx7oGWQW7
         57QpQBmsHR+mDfY1TfnAz5Gpg8ePFwdq4PHM6mMlO1fedcDko63WXRDi3DeAdlobVatC
         man3O8MyXCtqpxvgomqi46pFN5Xs2F6JD56zunEEjnn555pxPQwwV66jlUSv+VrqLJk5
         p21TsrMkY+LVix5RoDEpm3JZujp2JgNLSPwQJ3mTlScZxjic7YgTBc+z69Ztn9WeJHr3
         zcwrUXtVe7UZ/RgRiztrwlJpeh6NeYo8CvMd524+bqozdqbD7iBokWuUQiuI8gZv+4Wh
         LCyQ==
X-Gm-Message-State: AOAM531SsaNphAy4qTwSHv3Jvrn1zuZ6Ipuv+ckqJmw6AJGVvHdfdYtZ
        AbStszCIn+kgLJIGF0KykaM=
X-Google-Smtp-Source: ABdhPJzuo8WETyEeGZyAxWnfhgSPWgU3u8ajcmBY1cEEYGoaFFyp6xLHj9rsDgmaIzPFXWaoz5ZoxA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr178293wmh.189.1605030137748;
        Tue, 10 Nov 2020 09:42:17 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i10sm9103887wrs.22.2020.11.10.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:42:16 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:42:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
Message-ID: <20201110174215.GE2297135@ulmo>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
In-Reply-To: <20201004133114.845230-1-pgwipeout@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2020 at 01:31:11PM +0000, Peter Geis wrote:
> Good Day,
>=20
> This series introduces upstream kernel support for the Ouya game console =
device. Please review and apply. Thank you in advance.
>=20
> Changelog:
> v3: - Reorder aliases per Dmitry Osipenko's review.
>     - Add sdio clocks per Dmitry Osipenko's review.
>     - Add missing ti sleep bits per Dmitry Osipenko's review.
>     - Enable lp1 sleep mode.
>     - Fix bluetooth comment and add missing power supplies.
>=20
> v2: - Update pmic and clock handles per Rob Herring's review.
>     - Add acks from Rob Herring to patch 2 and 3.
>=20
> Peter Geis (3):
>   ARM: tegra: Add device-tree for Ouya
>   dt-bindings: Add vendor prefix for Ouya Inc.
>   dt-bindings: ARM: tegra: Add Ouya game console
>=20
>  .../devicetree/bindings/arm/tegra.yaml        |    3 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm/boot/dts/Makefile                    |    3 +-
>  arch/arm/boot/dts/tegra30-ouya.dts            | 4511 +++++++++++++++++
>  4 files changed, 4518 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

Applied, thanks.

Thierry

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q0PYACgkQ3SOs138+
s6HInBAArw5O4bLPyhfu+ViRVz6vcmT3JHr6FZfIpjj8kwHWj4HoUpKMiQqe2tYQ
RtnBZCnBwxx4ahrghwET/WIcVPeDpJKdS18++i6P7S2YnmMjzQK7MKiLc3i2V5xh
KAjI/n/pgq9i2Ca0ZnY3cYfXDTMdUBNTwWy3Y4SYUQ4MWdLiVgJ388PHfFC6kW43
ykeq8/kpKci+Y4rX4CzL8YMNsj+k1Sxu/NekOXjF6F/8KfqkC4vgZ4zbDWpT1CFL
X4xu0T0vmSZMTObPRZ13Ourk+CCYX8/UJwf/ShABC7j0KGDE0qlGaS3V9LeWQ0VG
80UFgOkfxpsAPVZ0BacXuBfYgJUv7QUFDJuvzBRsUvSfbGbGaTn2X9okKHE0SvM3
ioSw8LRUxSkhf3mJxL8ltQ8iGMh4ko581pgHMfJHIZefKhV7L0O9jyhJFMJ8F0FS
mK82SJbBS4H59AI1M1z+0O9TkBO0t9XSzgNjp2oQNIuCfA3atCm32spwj7oiFPHV
Tfou3KbqaYpWG4REiuUj3vJA3FQhC7arzY4gEtGElA5Ig6N9HarliXWWSosmO7Ao
uKck4lmJHq+YmTn0VHCELwsRVsnkRJQlUg4Be0dYfaKikqiJIuD3dyTKfzB+HRN+
HfgMvAgiHCd30G2vwXwQ34DsnF1dzq9JflEbGQ1XMdR7K/Ko/34=
=I/ei
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
