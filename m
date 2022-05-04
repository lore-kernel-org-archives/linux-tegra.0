Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49306C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 09:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347468AbiEDJhd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 May 2022 05:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347543AbiEDJgS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 May 2022 05:36:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5CA28E09;
        Wed,  4 May 2022 02:32:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so1192578wrg.3;
        Wed, 04 May 2022 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ir8xeuoOsELR7ko5SSdLbLzKuTeoHKooBZefHDAwbhA=;
        b=U7He6XDuTd1t4ZDuX3r7oNHwW7xOcfaIXQitq+A6+GvtuagSEAb+ZYbs4xxKFSzxhj
         WA/M4m1po5Cpz8PYHzF5HM9Y5CCplHsZ7qyJnflTreUFGvIGVtrYJ8U92fcfajsWusga
         xLrqBcz9nr82fRiGZJsMJa96FBfamap++pdpR1J4UEBQT2ywRQLq1vrdT0syl3svAkl4
         nc+kkdvABDn0tCxEYheygu7TBrJWhbF6Ccxi/LG2T4KvaBHvb5UxBFjG/Cbqn89bF2aH
         lcDXp4bJnbRsISG0PI8ecdoXw0xYUhqWGnWWD+WvfTvBh/SCuu0LuJZfXpIt0R3EgiFg
         9/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ir8xeuoOsELR7ko5SSdLbLzKuTeoHKooBZefHDAwbhA=;
        b=eAUd/j/6xvZ1VkVIR3QOXmHZmDqJTmiC3BC3DOnZooyOzdKHyd5dLoyUbSXT77gtav
         SJi0bkitjnL4QK2/euapi0APxtDTySayzz146+KrV5s0rzlXYqVNesM64LxFu+1KNjxj
         6rvvU1VbLV3ilrmpI8DkDYao06Sh5e1QKT2y12SDjEPFee+SiM/gRDesBQCRhrVz0hIG
         CdA2I/dOIoKao+J71NwBoIl8oaXUgPZmISpoj6immXyJ0Gej9P55+XRkPC2JVe06JKKT
         RcwQ9+rfW2AV9XiZtUUa+V9duuNJNy7YpRfyLpxSSLM3JhoB9bOjSUG/bvvpXfv95QgY
         d/9Q==
X-Gm-Message-State: AOAM53207XZL6Opg7hhW9Mc6U0y2uitEELZE0TlbPgla0l+KPqGQtzGv
        WwZlfc8LgY2SK23E/N5WhKs=
X-Google-Smtp-Source: ABdhPJwqAG4vUa+RbWq6QRvPPx/0deI8VbZLfOYg/HIWb5kbgTfDIOqAASSuqB3sjE6ReNDTF39RzQ==
X-Received: by 2002:a5d:64ad:0:b0:20c:565d:ca19 with SMTP id m13-20020a5d64ad000000b0020c565dca19mr14226773wrp.634.1651656746487;
        Wed, 04 May 2022 02:32:26 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bi14-20020a05600c3d8e00b003942a244ec9sm28722wmb.14.2022.05.04.02.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:32:25 -0700 (PDT)
Date:   Wed, 4 May 2022 11:32:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH 1/2] clk: tegra: register clocks from root to leaf
Message-ID: <YnJIJpHXmyRDYj5q@orome>
References: <20220406151701.262056-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sWjaDvbx0ZWRXID7"
Content-Disposition: inline
In-Reply-To: <20220406151701.262056-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--sWjaDvbx0ZWRXID7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 04:17:00PM +0100, Jon Hunter wrote:
> From: Timo Alho <talho@nvidia.com>
>=20
> Current clock initialization causes intermediate registering of orphan
> clocks (i.e. a clock without a parent registered). CCF keeps track of
> orphan clocks and any time a new clock is registered, it will loop
> through the list of orphan and queries if the parent is now
> available. This operation triggers a clk operation(s), which is an IPC
> with BPMP-FW. Hence, due to the order of which the clock appear
> currently, this causes >5000 IPC messages to be sent to BPMP-FW during
> clock initialization.
>=20
> Optimize the clock probing by registering clocks hierarchically from
> root clock towards leafs.
>=20
> Signed-off-by: Timo Alho <talho@nvidia.com>
> [ Checkpatch warnings fixed by Jon Hunter <jonathanh@nvidia.com> ]
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 72 ++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 16 deletions(-)

Both patches applied, with slight tweaks to the commit message.

Thanks,
Thierry

--sWjaDvbx0ZWRXID7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJySCYACgkQ3SOs138+
s6Ea8w/+PcY98t2cYMTz+5+0LAS4u946QKFrWrUmRJc+Y8REmmnLlwxgKb5JRaBI
XZQwOIf005oqymLp9+kIwmdFUve/cxU7y04fj5rYFS7O6O70siZ7wTwsosEsz7gR
k2pTWfJFqff4odpjaPiFWspQtQ6BCuioY8v00W1NFHNnaHdIJi7Ts8ddma+PuaMW
0Go/AlgDtAzIuOuyhPoQnhF1+6E+x9jeEiChblobQfSe55XcxNp3p/9OyDJPl/Fj
fgrvb2FpHe1NhylMD9SA5bD2UbzaCeIP3vrgnI8vvMNVQrwyRblQXT01b2DmCP0v
Ub6nIoeebBV2f+yTDwsaDk5iIPQ6pdNPh/XgQunW/Ksi1ooq9RLkfIG9r4+d420q
8+eZbH6tCek13zVN0sdhbYVnK9aLdwMVV1pK5UvU14znpTPa9NCM3BfRxWBZB0GU
IdYQdGthTsO75APXvmSifZTXi5dgcNNnn26AbBJRdsQhtbAKRiY1d8dT1Mowmp2B
07DuiYEVCiHZ3Co4lEQGWdhp2I66G/bDVnzmdrHWm556M+Gm+FwjGgDgQ1FVQcpm
OrEbYDZogMpppHRbQ90F1irEikGJ3BvjUUWAC2Px0mh3i2fbqQx8IO8eQRrUUkPx
efRy1BXEGOh3hc+kg1bp0ppfOs6YZIlqzr33ObSUctKUU8TpWi0=
=Y+Ky
-----END PGP SIGNATURE-----

--sWjaDvbx0ZWRXID7--
