Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF17C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 19:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8881460FF2
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 19:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhJHTh7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 15:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhJHTh7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 15:37:59 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C19C061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 12:36:03 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r10so32854953wra.12
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b1rZWiqQzmNj+NqTVFA45dmnunj0XY71rhazJGucrSM=;
        b=EgE0zVt0ebJbLWWSLeyI4QnNd/bgcE1MuJa7qIeh11N3+fJVLToED04dGK66rPGhJo
         7gGMSwI3tci8zXvf84XCVOS4cNrqy7EvtXo1cjcMexN1Q5uOCPwwUK1gAnrSTnmBSCr/
         A8N3te0nWmxY8VBI/LLzW+j0XbGNlkDHGUAjGCBDLX5sX2qSdiKoFCFW9P2lHKH98bok
         STwwTx+I9eNXaQzcxSt6H868+m8m0pwi3K03U9Up4+iDvQRKxiRoC3CxtrnNByHOdMeb
         veUbfF+W6o38hq6ml/EkJWOpx3JMDK36ID955FNifuynSkKibkIzcW2V4qT2aukQFgXg
         p+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b1rZWiqQzmNj+NqTVFA45dmnunj0XY71rhazJGucrSM=;
        b=yowSagh4xBD2WpSlzGTxP/pG7qLBX4V66TCVLvGNLoE3iz6QUqdqH2B70MggauKZmr
         k/++AhuJ6OSzQ5DBr7wo34sy/dlYbBhXbsOl22kxt03h0hMiNSjyHy2rioINQNxZ3I/O
         RhpInQkzdidG2mU0QkNeOgJZ4ZFGWdi25RzVAqBDMgi0p0dK0bfLxaklmokydp5E3ZAf
         g69ELpgyXUj27fuoKZUKNvUIX2MNwmJsumLBtDLVlvlGldr0SEVj9MrMLZ3j/FRyTs59
         f+vK7J84TPq3M4xU5wCU5zrcZPsE3dMX8kS3YiOVmJBJxhAVBr3U9Kk24QjyDRYDua9o
         FuxQ==
X-Gm-Message-State: AOAM5315BW9XCvtQfs8BpbLxJnrWSp6MspOjEaAFEcFMvvxsHwIlKv9V
        9tAT5JvsV6jpr2k+hpp/ZVlfYVfRyzs=
X-Google-Smtp-Source: ABdhPJxnEFh9XuPLcWk5ofRvfii4olskeD/CURIi3ywT8uQk4y6FJUKHLgTQFtjhLn1kUfWcgBk16g==
X-Received: by 2002:adf:a310:: with SMTP id c16mr6348947wrb.319.1633721762060;
        Fri, 08 Oct 2021 12:36:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e1sm249320wru.26.2021.10.08.12.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:36:00 -0700 (PDT)
Date:   Fri, 8 Oct 2021 21:35:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
Message-ID: <YWCdn11xFQ32Wt8G@orome.fritz.box>
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2x2WiGY/yCMBO0jh"
Content-Disposition: inline
In-Reply-To: <20210929222805.16511-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2x2WiGY/yCMBO0jh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
> bridge that requires a precise clock rate in order to operate properly.
> Tegra30 has a dedicated PLL for each display controller, hence the PLL
> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
> output. Configure the clock rate before display controller is enabled
> since DC itself may be running off this PLL and it's not okay to change
> the rate of the active PLL that doesn't support dynamic frequency
> switching since hardware will hang.
>=20
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>  drivers/gpu/drm/tegra/dc.h  |  1 +
>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 12 deletions(-)

Applied, thanks.

Thierry

--2x2WiGY/yCMBO0jh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFgnZ0ACgkQ3SOs138+
s6FqRBAApniEtWPtkEJHYg3VNRrfr1nUcpA/CUMtGisgXFpxR50I29Jky0ndTU6Q
E9xgU4AOc1esJ3IC+sZdF4wpXpo+DsSeKTOBP9D5nS95MRZhq0t7RFyhXY4iyNdm
cuA1c7uGf7v+gqcvV3bq2kgaxsfCByDJFwdFE492EyJPtzslYJBhKEB0ff3u61uC
f4JoE1FcKfe3gH5plS+Ecse5Q66BZqr557I8nRsW63IAKP/sMPrS+qTjLVrBvz6r
uEOEtPGKEv4h7lafEovEeIJB6VG9A1QDcL6UkBN0VLPe76KuqTzR6hUWkuEBKbVQ
8yPaRjz92PvtFTc4LS6IV68ZbVkUeyi8BwFXQIHDFYSpQy6IJ+6XLIuTLTf1TwrC
++0Qi/Uv6Exl7h6jaG0UCBPIs/99E1E8C8ebz/FxxZCdc0WyuwGzVRqmX2UBk1dT
4Hkfz2OKnU3Go/GL3WHJEvz0c90WcVXZ4SjbnrCCDw3BAooX+A4+IohW+zl1h8BV
F5NWufTzILMxesVkBcntr5YwaOTay5mE2EQqm29Em8v9kKCKpyCAjELEOD4oUiJi
gbsTphQJZkmMDpfhmA2cRrGDBUr/yuIx5c5EFjx88l1g7gOACrXOd3uQUB2DPuPc
7tUn2HNst6/ZHvnjshHIhNso2DMXX72yPAg1+r6OAOgm577H978=
=yvhH
-----END PGP SIGNATURE-----

--2x2WiGY/yCMBO0jh--
