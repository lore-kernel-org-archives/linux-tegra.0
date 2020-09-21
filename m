Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6822C43464
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B55421789
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNP7C+gS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgIUMSt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgIUMSr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 08:18:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECC8C061755;
        Mon, 21 Sep 2020 05:18:46 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so12419377wmk.1;
        Mon, 21 Sep 2020 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p+YywcoqsbxKr1Q9e81+Kg/BD43gmmKCQnyer/UQlyk=;
        b=VNP7C+gSEBFP+YuZrk2bOL+I9gVa5zQO9n916x7biCogB/4VFj0x1tOJGdjgS0uwSA
         jlhghMI17bqbaoo0a97+4He8pud0N/xYvD5ZEwybnsA6QLJhnTtD4Xehl0bB5E8pnu6V
         b4YaFNIuYx7M9sE1OKXdbqHI9Zk9kogblX1uW4yFPyK5EdvOV9dmHTlZd4oAuLc5Ou1y
         unc/jnNLqAkrraxTk0wi81hXzjiHfu5r1suCxLQDka1OP/E6bgqbwnXJ4DLRu3JPfQus
         2aUX0SKcfKNNclId+gVyVUDhW8M6SaQKbp5vQ+gqJhUejthJCpiZaatjpH80iLxoXfz/
         UgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p+YywcoqsbxKr1Q9e81+Kg/BD43gmmKCQnyer/UQlyk=;
        b=uSh26BaMeH0yg44yWd9tGK8fVUA8uoA4o51cZ98kdISRFaEfgGM51QSonE4bBrI7xH
         jSxbSJ+v6m2gWwN2+R5tMVSiifGR9B+2rG7fgrDf5DXND60j8J4j8M8WrD3jZ4dFi1ex
         xa4BK9d8YonHHd3siUAG7YOc+ynal36lVdxVUYImqG13+IbUms74fPzJE6dKuLGMOqAG
         wt5dqiBiKRXcEiZ7rMmpoiNrEqJdX8kC27lnq/Q/x2POhzXJtuYuYIT5D3uL/kBHNTcy
         XNmSiemENjLN1dSkhKCLijZiE5RxR0yEaDUE2IE90jBXPCHv+CDj9IzublW6brdDL+YZ
         Zw/w==
X-Gm-Message-State: AOAM531GOMAmq81x7P+KCkvagVuGooBoj+gVOSZBdh+Rwzsj6EMq9aT2
        mSPndsAXzMRDoLqFjfbZbAnmR1Zj0v0=
X-Google-Smtp-Source: ABdhPJxvJJvl/HNXPBl/SbB8PV8Ox9bh4k76k+VF7tNejn4c9w7pKTHznBgqS3QEWDDYSHAW1DLZ/w==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr29255325wml.159.1600690725337;
        Mon, 21 Sep 2020 05:18:45 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j7sm19684170wrs.11.2020.09.21.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:18:44 -0700 (PDT)
Date:   Mon, 21 Sep 2020 14:18:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.10-rc1
Message-ID: <20200921121842.GQ3950626@ulmo>
References: <20200921121628.3954746-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V2tfspbppmK1TQo2"
Content-Disposition: inline
In-Reply-To: <20200921121628.3954746-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--V2tfspbppmK1TQo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:16:28PM +0200, Thierry Reding wrote:
> Hi Mike, Stephen,
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.10-clk
>=20
> for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b03848a1ad:
>=20
>   clk: tegra: Fix missing prototype for tegra210_clk_register_emc() (2020=
-09-21 14:09:10 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> clk: tegra: Changes for v5.10-rc1
>=20
> This is a set of small fixes for the Tegra clock driver.
>=20
> ----------------------------------------------------------------
> Thierry Reding (3):
>       clk: tegra: Capitalization fixes
>       clk: tegra: Always program PLL_E when enabled
>       clk: tegra: Fix missing prototype for tegra210_clk_register_emc()
>=20
>  drivers/clk/tegra/clk-pll.c          | 7 ++-----
>  drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
>  2 files changed, 4 insertions(+), 5 deletions(-)

I just realized after sending this out that this is all really tiny and
minor fixes, so perhaps it makes sense to even apply this for v5.9?

Thierry

--V2tfspbppmK1TQo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9omiIACgkQ3SOs138+
s6HC7RAAlRhiAC6YW4Pu6epa/xuk800Dhgq5CY49eo19B69Ywb5eR+6nBCc7c+Ng
XpDH1bRPR3P3YuokHykY+KztSQm2oNzPH/3+cc9XwgF5bv0wfEySPM4eUvBi9vfi
5hVFvlcRHdsKuJMnHYlhEzSWMXadrXegWf2RlsKw51uz83V8+p9qJyJCCwGCf//2
JvQqWpP0ll7sw6Lz0Fllt99QPQYyQOFFgQ1axuKz0oWthvzHKS3F60irtym1RvaN
RDAsRnN9VX2OGIGYT/zq+rGw4Ib/isa+yt/hQLRiklhkmTLoPITPjFzhtYANRcX4
ORvH4tv/mzxCdTsCqSBuRtAoceEVbraB0b57Q1SqK7XG2ejZu+pHycRsi11l9uuy
F/zNncxcn0wRp2LO0Dv4cJ0NHNuqUv1yPCdInytSqSp41YWLMZztyiAFc+l8HTEy
kKPhOT0/qcesUVmJa1eKT/e4Cd9MCvOz34iRQxVQ0spyq6GSHSywD0x0O0C5bbFt
0XmWvsmH72L68bjtvb/Uo+b8P8yXSxSYeABArxicMIP+ycSIAUk+MjjO9a6NB1wx
94jj29/dt5+Zvg+7R0nP5lRa1raj2aVubW3f00w87Nm9aTtM0/FKOElRiF+B2qbK
zJMHznAjhzZW+C8lfL45bIttYezNSzogm7oqAoyE2j01d7Ll9YY=
=zyBz
-----END PGP SIGNATURE-----

--V2tfspbppmK1TQo2--
