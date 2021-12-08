Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001E4C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 14:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbhLHPDY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhLHPDX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 10:03:23 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4C7C061746;
        Wed,  8 Dec 2021 06:59:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id c4so4525576wrd.9;
        Wed, 08 Dec 2021 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bOrXaXtCZ9KNFIVYTUvhsQjGQXROR8j2pxTSi4qiSrc=;
        b=BAsi0OIdPypri44k4P8PULRMyLSRmymbkeiBC5Z4gfq+Ci2nZSnS2OymMdUzkNt/Ll
         8UYqZvZ7E/xatq29jicbYwqWSky/usEZMab2Tk7OJnR4TqOJ0eJHhyPLTHBL/T5CEm0c
         aTt/frh4eMo4OboQKq/G7kGHVffmwarFiHXSW5uebmiTn6y9Vrk56mgW/mYhPuzgEYNR
         zCmubx32RyDzG6EdMEG4xYJC0rPJ1vbQSO5LGZjTyM2hajKDuMJoL/gTsYj+duk/axR5
         HYopLxa8fUGUzRxkr9uIq+yYEU9Z1tWenUdn9o0n66ESgN6P23NfbsCbqW/Zo8gFjV0s
         mE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bOrXaXtCZ9KNFIVYTUvhsQjGQXROR8j2pxTSi4qiSrc=;
        b=1dT4uyBIb/xReyKgYKJt6x7vVT/0fqfj48iwW1ntv4Qg9oWvQTcIVpc94AiQwK5YsD
         ET83s3MHSKZ7Fmbj5QE7Icn0m94HvBn7Q20p8PXoGDiyJyPAMG7UOXNLz0+dtEpuutwm
         5i3N54Q7Jb1q6XCYVSQJlc8QdtIhDa8MDGBTiJ+E9JboRfcd0tw9ISfbsaE8OxT3g1jm
         8V+8oo46l6mfC7fgWuqdE54IjVcMOyFnQ4TvKBLC0je7hMSqA3+KzZel4IA3b89MMl3h
         DSmfvFC3HA+kI9NGG8WZH4ajdCo76Qg43uEII6F7q4QHbbJ14fPHEaYSHrxm67K2P5QH
         XN4Q==
X-Gm-Message-State: AOAM5320WqK6KvfpgYAKBh0jwRUMT5Sj7XqhVtRaksgY316XwNLy3T+3
        kZ0nufjLiKmyRiZguCjFKiA=
X-Google-Smtp-Source: ABdhPJyzN8uSVBhpNPJUedYx1HnawjOIPV8adrA+A2kEOhZ0ujFTWa+oY/m5egy8kD90+lMHJRxAaQ==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr59630400wrs.277.1638975590304;
        Wed, 08 Dec 2021 06:59:50 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w15sm2960057wrk.77.2021.12.08.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:59:49 -0800 (PST)
Date:   Wed, 8 Dec 2021 15:59:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
Message-ID: <YbDIYjlActbuTuyf@orome>
References: <20211207101316.381031-1-thierry.reding@gmail.com>
 <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
 <24a7e99e-0a00-08c9-eb32-b9b64d747bac@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SqIWivl+XAjBz5NP"
Content-Disposition: inline
In-Reply-To: <24a7e99e-0a00-08c9-eb32-b9b64d747bac@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--SqIWivl+XAjBz5NP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 05:41:52PM +0300, Dmitry Osipenko wrote:
> 07.12.2021 17:19, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 07.12.2021 13:13, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> When the Tegra High-Speed UART is used instead of the regular UART, the
> >> reg-shift property is implied from the compatible string and should not
> >> be explicitly listed.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
> >>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
> >>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
> >>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
> >>  4 files changed, 9 insertions(+)
> >=20
> > What about Ouya?
> >=20
>=20
> What about T20?

I went through all of the above based on results from a dtbs_check run.
I don't see these errors flagged for Ouya or any Tegra20 boards. I have
no idea why and will need to look into it some more.

Thierry

--SqIWivl+XAjBz5NP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGwyGAACgkQ3SOs138+
s6EBUg//RgCUWXzWaIO6Bq/4Ve+G2tnfIf4eGViK1dNwO+nW9PlNPGPwEJBq9HGA
LDJ8kKRX33Ta2ceqRrx6UJ6Cx32jhvWNwFsZq6Xj+ey0nwCg6KxRSNZ9Gmd5cSv7
/5l7fLm7C0KEu55MIzr8GW0SScIsMEIGrBk1k+aRuL750h8Ff1ThV2jPfrK2Fz+/
7HKRTRBU1F+WxvuZdEYQ5Fev2iOMqTDnfGYyZp2Wy2Ovv2dsY5EmKDLmazEhcf8K
2Gapk3U9tvNkKIOSpnriYW/WUp2eq5xCae5K88rWZApBv+iZaiLNYYB1CK0y0TJT
S5SPy5ApvWAjCekYvpUcowsgwJgMxgZWqe96zT9ktE3kH3jTN/J2l2CfpZx2xfiO
CmrayBNSOsOlZ2UAiOyzgjP/kD6QAg1w/ojnI36LaL6grmpiYm8a57n0QOrhwT/m
WzMu3H0FgUpAtZYnYNCeS3CkwoiQLiONSWMXLIxYmcbb1dwroJZGCUQCfhqWCWKe
ZN1TsdvAahax0DaMlPGO36axekNlKyUusK1thXHvWc2aSdMZ2vWSGU56UmixheVK
r2c5EaLWvPvtT9FzeRVWaYD0tbmFkU44HKnf1K4aYh3jwGm4chVN5g7ReFlVHs6W
/cv/81t0kSdohlvmE+OhUGpHdxlzoNWmXT+km++zzblkXAMeLVw=
=U6hF
-----END PGP SIGNATURE-----

--SqIWivl+XAjBz5NP--
