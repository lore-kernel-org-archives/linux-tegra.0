Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D95BC636CC
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Feb 2023 11:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjBHLdF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Feb 2023 06:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBHLdE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Feb 2023 06:33:04 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A642DE7A
        for <linux-tegra@vger.kernel.org>; Wed,  8 Feb 2023 03:33:03 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id h3so777379eda.5
        for <linux-tegra@vger.kernel.org>; Wed, 08 Feb 2023 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=fXWANCuB/MzwMxY8e/PE9hMX6kQQgSi4nwzOxcZP1sqB8ClZa9gcDxf95xcMCFGA60
         8r4HPxPuojmsyiGZM5fo54iQbE21y+qmauAqwiUZ3JgfWGvn5hFl6n/jQnypHDEAEiIN
         BuyuO7rl564g2V4OrWmmn0okwkjZbGE1TCtQTMGjJTfw9GCV5cQzEBQZbHy2naOM6bpE
         uDbQrwann+eaSyPP4Qr1iDlD/kMNgp3Ia2Gz41p5KUz1dsAlq9DKH/Kv+GyzBHKHadV6
         bLLJuLtOY0ewEYZPIZXw0dCi5dG6BoEsrdfO+bUYCY7Ew7umVt4h/WIptyhk6gza7ptd
         eQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=jjh0vh+dO/3oEc8FHvXFw+cWMWJ5AbtgIDGj4bM/fphVfZTk7IbxoCcsWwYY3s44CD
         cKu/IUPCZ2byzV2RH2GRGnzFS3YpkfZTKLj37dLvvAjygwvip6gjezmyJEuDwuC/qZlY
         N1Sk5Ncx2/mYEoxZDHTT/yzk/SpuV2ovSMeXjaPt4c3zgyCYEqm4D6bKl+HIm7EFuASE
         yvqnDiahkrcD5ICEiJrAI4pPiT3wHj0ArL6vsfGPp/XVmw7QNA8h/MDov0vkVkgOckkx
         3I4s9Nw/DeXHYQwIv2wASssOzHzWYsX1r2JBdJjwxETFasflPYij6JJbp0zzwpi1aiYm
         QOcQ==
X-Gm-Message-State: AO0yUKVYXvNnlrTenDgYWf3qoIR1Hq4mi3GX5VPmYhHQ+Lgf4TMLvAX3
        qLMpWbUSezI0wSRfRND8o8c=
X-Google-Smtp-Source: AK7set+tg8yMsoPfm6aG9wW3C95mLbOW3tHfVXRDEHWicn13te2n5qII2lTooySpSVWWHaqcTV5FYg==
X-Received: by 2002:a50:9f25:0:b0:4aa:a517:b861 with SMTP id b34-20020a509f25000000b004aaa517b861mr7580201edf.30.1675855982063;
        Wed, 08 Feb 2023 03:33:02 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b004aab193b8dbsm4424195ede.80.2023.02.08.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:33:01 -0800 (PST)
Date:   Wed, 8 Feb 2023 12:33:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
Message-ID: <Y+OIbIEn4QSQCB7M@orome>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D5qM/4zvEVCMgXpb"
Content-Disposition: inline
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--D5qM/4zvEVCMgXpb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 08:19:07PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--D5qM/4zvEVCMgXpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjiGsACgkQ3SOs138+
s6GK+Q//ZiTKsijeECRfzHmIOgymJ77EeHGA/vhS4NBBfe9U296ifD3l2Iyv+64i
fI7nKoz7sr+HxnB675oWnqtDQNIogLRPrej9fG7qGtqk7JWxnUuGkELw43jefGp+
62Q7q/UXC7tSPNf3lZGD1Mcown6X1SkSwohIqvqhY5GLcSMV8/QMOIIQIHeeyjTZ
fxtr8htfD+XArBu+CD5gbo8mQezE3zwlOOnms6OfciwEK/RU70OPK/Do38/gDaIf
c7oJv32pu43UekdJES/C4HhfkdSi/xOUZSYRnl13V0xQ0imngncCPUU+sV+yRhGu
tSqIpDypo9GBzu/AyGMD7L+7wTOlhZKYcPCH7+wUil7H+7QNx5kqxTZQY+w6rMR6
Z7MHYsU5oTnhsgvJmTybU/NFp1Cb0jNlWzH+YvuJz82Wx9wD7p3l+HkOazLj63wv
e1Ktc1Dn9AOKMJR4R6IFwb8T9FiqtQ4MWdJmCbLSuRemo62DYAPzm2els+2lO7yG
/vzZSAi/655ELwubZcGkMQ6ng3nda0JRSqocaT/AzwpnWiTok+srqy2JuoLjE1uG
OLMieD4toJrYTzqR1wPK1lKtJu+qXgw2GsI0nbGJ//kcAK9l5rwKZT0ye8bwG+5N
BWkK1n+90YKZI00GffWXjiOaH/yuzSYrQZuDtzAizFJ0UX87E4k=
=sIaY
-----END PGP SIGNATURE-----

--D5qM/4zvEVCMgXpb--
