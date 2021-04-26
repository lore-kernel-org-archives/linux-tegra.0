Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785F6C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:14:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32C4B61090
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhDZMO5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhDZMO5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:14:57 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09575C061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:14:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id y124-20020a1c32820000b029010c93864955so5052563wmy.5
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CE7zRhtAa8CSx+pBRTAPatUuImC2PZVX0r4YJ3atqh8=;
        b=CVERlkPHpYlFQH9ReHfzqPQXn+ll+MGiJY/xQwvT0dwIgQR9GHaJdhrrDx8fx0n8K/
         LJwibG6exObQ7U3NE3m37Ek8fFDIvaOPPm+8cB/eRUW8k6yigRqDouYbPwyNGPTnOEIO
         QH0ic1S4XZ6smPOrs0HRTrVk8nCxFGECZ9A2g9J63v6j9Mit1+5V4qMEa4zOPIMy56MU
         kJYkW4QSk6eEpMJQDHc9DA0prkPFIWpBk1hyFIonXTUNjDAIx2DAsQaZxzHg6sKGspMp
         0BfYx+cKYJAnrYnIgQFG2/0Hdq6iPkAptNV3NrHGBmYvwRtliEMNlHS5e0D6/SLwmb0w
         xujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CE7zRhtAa8CSx+pBRTAPatUuImC2PZVX0r4YJ3atqh8=;
        b=mC/gCAR+aFuucP2GJRZocvam4KJxlHdbQ6uzt3MGkWEXD5YX5UZ2crLetjTlY4l9j9
         W595owZNlNNyX8dOlcq5e5ZiSalcjFowImNUxfr9RNyV0ljDgZM5khzh/yhlPYGs4q6v
         yZSH5oC5CZk1QzefCZ0zBtW8Tel+Jn54BuTLmhevfrCLvfzcWY2wGtccqb9/HHG8sviF
         3eOc3nJyYM3xYotWqMaxoW/4nql3hsY9qgWNwSnOK5jT+0YEAmDDH8QYph63WC1nM0C0
         gleUlpIH9clxAf7xGnX/KKlaWWwLsg42xppObDkZFr67yLyf38h5hNosA/29XB/PD/be
         UdHQ==
X-Gm-Message-State: AOAM531aiTAP2o5qWkx6ASHVZXooFgvN7Q0O2+h+oT+3HPVTXcTNhdrr
        ilkmct2dVENO47gHAo94lzo=
X-Google-Smtp-Source: ABdhPJwOpSdJ4QBj6R4gCDZTXFvLIZMY2YYpw58PggW7VNZH6Wl8s64o2jsbHN/kB3M0NIa7oQlUzA==
X-Received: by 2002:a1c:2387:: with SMTP id j129mr5900733wmj.88.1619439254766;
        Mon, 26 Apr 2021 05:14:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b15sm20422743wrt.57.2021.04.26.05.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:14:13 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:15:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] memory: tegra: Driver unification
Message-ID: <YIauys8FZGKCDl0V@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <519a1ee4-52a3-a465-9203-b14ae10d5e49@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhY6ZFyzXSPxEkfL"
Content-Disposition: inline
In-Reply-To: <519a1ee4-52a3-a465-9203-b14ae10d5e49@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AhY6ZFyzXSPxEkfL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 11:06:51AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2021 18:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > this set of patches converges the feature sets of the pre-Tegra186 and
> > the post-Tegra186 memory controller drivers such that newer chips can
> > take advantage of some features that were previously only implemented
> > on earlier chips.
> >=20
> > Note that this looks a bit daunting from a diffstat point of view but
> > the bulk of this is in the first two patches that basically shuffle
> > around where some of the per-memory-client register definitions are
> > located, hence the big number of changed lines.
> >=20
> > I haven't done any exhaustive testing on the series yet, but wanted to
> > get some feedback on the general idea. I'll queue up this up for our
> > automated testing in the coming days.
> >=20
> > Thierry
> >=20
> > Thierry Reding (10):
> >   memory: tegra: Consolidate register fields
> >   memory: tegra: Unify struct tegra_mc across SoC generations
> >   memory: tegra: Push suspend/resume into SoC drivers
> >   memory: tegra: Make per-SoC setup more generic
> >   memory: tegra: Extract setup code into callback
> >   memory: tegra: Parameterize interrupt handler
> >   memory: tegra: Only initialize reset controller if available
> >   memory: tegra: Unify drivers
> >   memory: tegra: Add memory client IDs to tables
> >   memory: tegra: Split Tegra194 data into separate file
>=20
> I didn't get patch 10/10. Neither did lore.

I suspect that I typed one too many zeros before the wildcard and
therefore the glob didn't pick up that last patch. I'll make sure to
include it in v2.

Thierry

--AhY6ZFyzXSPxEkfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGrsoACgkQ3SOs138+
s6Gsew//Qp03zhGNKu4Gum1aRYXtotLlgs0F9eqeQ55DHMdoZTROIImCogA5itpm
E/ux6WFLrj+B83IcMEz/COlVmbCJ2zlN88iHlHI/Y+U1yJvVyXVKaTJEnv124AtA
yMoTR4ds9U4c+xTyCS1nKtSCu7cn7qWQEVi5odKvkdXGVYEF8UiNOV4zvc0F57i8
rVvuy2Znr8qrpiV1pBVdYvIf8I6NPYB49lYzXSe3A7f4HctvU4OMgBmkz/7dChJO
11SnxmbC15ZienM3cVLdAsxpOcwbNc2GbrlUYmyU5U0Y3oumEkPpxZY710SpqCKa
0sCx7HK4+OlGGWtJCsaW6n2mNKx1k1ivJlaQ/3DKYubaWlaQGjrZoWgzOZTB+14t
4n5Ei9LMSm7PA2jH4VpyrcaW91KDdobxiiDAY/yIzSZXLlPh21+BYXCD1JbwmLTn
UFlV595BjVvUJzoUwci4Opw3phr/4i/1R3pyBjaNIOlhtsLcz22ifuWQKxtJmYzC
65Q0x2OkMPJr0yZCcVi1JMM6nF5yo8mOMT35qO2sTB1vQVA3VElU2nKNSydRAJKY
g1IM66/xxkvC2h8ZVy73/1OOOW1yLgpV6zDxNNoN970wqRxEUTIWOlYhI22wfYaw
rNfK0ae2EODtcPzRYrlqh1kzH4I8qJhGJseCw5l/I0Tx8it8nSo=
=wl3j
-----END PGP SIGNATURE-----

--AhY6ZFyzXSPxEkfL--
