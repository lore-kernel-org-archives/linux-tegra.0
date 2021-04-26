Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971F2C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57BAB6109E
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhDZMTC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhDZMS6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:18:58 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95DEC061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:18:15 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e5so26996088wrg.7
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tK15BlmvmIRcfhgXosCMmTiD+iicYMVtt9PlUH1r5cQ=;
        b=RXOekx7IaygSvK2lipN3ycXY5+ah7vdVbcnRy7yyxmuDwoDiPXgNpQI1ZUym6o1idk
         1BLpZw1DPaHGhInxsveUS1hiR7DpLXStvt80AV+neFgjDzX3vgLRrORtnZWsIWCsaNA2
         PHhGLWa+RWtObO0iVxVtzqecLy1UNPh0f7cxTuOmmn185Z/Gr7SO8Oq7e8b9hBHaPbw/
         tmIz3fLxTJgxTIMetZtuPTHTv0FmU9hcMzRvhkLcoVjK8ckGEB8R7BSMR2bCzrSQwYsL
         FlgFvtHgNGJ7ndoyBKBlT64K4k/o1nWdJWgeYUD04mGuVcqCtXvhKwEYCQiGzceI4isb
         xjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tK15BlmvmIRcfhgXosCMmTiD+iicYMVtt9PlUH1r5cQ=;
        b=lXAkelVFFuVQDR5SK/mJjb9J4XqycJsfjrguJmAOiq3xKj8BuhTVJ44iuU/JRmJHBW
         SAtx0nwxoqQvK1iUDnxWxnwDzhnxeAhhEJOhzFqrlIzjVz0Qp87W+yewbstWNHjzNDbW
         2ZFX5DErSJWSkjQbOg1ORJ7Cqo71MbJXuY8EcTV7c7yDuRrWXVbJ8fo2jiXHFIu9YI0G
         PTInhaaOxJLR9ooTrp7dLfJBGKhi9nyqfGOnaAwDHkd7YX3OVYwx0gmTnYjSM96/WLkb
         ZNEI4KPlGryVYZMwXLWh5iSF3sDmokfWNAdoEDh4/w27Zam+EBQ8HydK/nxZ1tkKaitT
         t0VQ==
X-Gm-Message-State: AOAM530AkBYVWnFewb9deY1rX8JHwRcF9Nz0On5VNVpt3rbjVZXugS5k
        TPuij1Z/vx9Suh1eIY/BHdJvKtmVeCM=
X-Google-Smtp-Source: ABdhPJylzE4JXtBqaLpMFyW67e4U9xwgihBq8qjF2G1I7X4Fzewl8hTbyZoHFDlcTKaEvJOpyBW1MQ==
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr22840333wrz.72.1619439494628;
        Mon, 26 Apr 2021 05:18:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q7sm20118478wrr.62.2021.04.26.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:18:13 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:19:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] memory: tegra: Parameterize interrupt handler
Message-ID: <YIavul2o2MCSVxLI@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-7-thierry.reding@gmail.com>
 <aa5d7581-0cda-596f-8929-ba0dbd8155d1@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/L89aHPukja1BO3w"
Content-Disposition: inline
In-Reply-To: <aa5d7581-0cda-596f-8929-ba0dbd8155d1@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/L89aHPukja1BO3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 11:01:00AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2021 18:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra20 requires a slightly different interrupt handler than Tegra30 and
> > later, so parameterize the handler, so that each SoC implementation can
> > provide its own.
> >=20
> > While at it, also make IRQ support optional, which will help unify the
> > Tegra186 memory controller driver with this one.
>=20
> Please split making it optional to separate patch. Looking at the code
> should be possible and not affect bisectability.

Technically that means I'd have to add a check for valid callback,
otherwise it'd risks oopsing if for whatever reason that's passed in as
NULL. It shouldn't be a problem in practice because it'll be valid in
all cases, at least until the unification patch, so perhaps there's no
need for the check if it's made optional in a subsequent patch anyway.

Thierry

--/L89aHPukja1BO3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGr7oACgkQ3SOs138+
s6FNgBAAuBiq1nkhhxw6MLmZspeT3IqosXzWYAOEKRyvv85sRPetzv/C4esS45vw
HIWo5Fpvcms3ge4F4jFCGApbI/I1DhTD4Tj5uX6aUvN/SudxFelghptq/lze0MKo
nAfwJte/jh+VNrPqTw+c1eOtb3dBH6C3efrwzRfuEX1q9tFSU4TI/KO0D/wdQczJ
r3xwTjEn7jHHNZPtzRIjhN/CSralCXEH6mvmZ+SySleYDgNZXLZBclzX6t2Ux5Xv
sTk3mtIOZiP5oyRrwHoqZbnQCMj7GmhnZZ3llXyUuAdJK9LwirS4iqCPtHJVVn0k
86UsjoSY6v7B1KZJLr+LxXTatWireent2/OYALsrZgmdLEV3plp5PP9diFNU8ZDs
bxxkQr4SQs4HcXp1wdGHzWg9WHoZER0kPSylEVRRSavCRdRmyuYaCSWwRdujXXMC
MkORODMoBkWd+KO7QXlI5HKQvV67ybK1kp7eB8L4YhoJczQABUOHS1un7YaNQAAV
jGzU2APuiaAj9dQtghOw4eQ5oKA6Kb8z8FHRD0agaAmBvFo0nvARKkpCGbmzGKbR
yupcv04pxVIkH5f7KtRkE2KhphwcA9136Po1zM4kyYgR+pImyOArIwSeR9q8FvaS
kj+VHHCLg0pS9L3sj/PnosYQzQgIrzE+GYBN+As88Df9Qda9Ikw=
=gYUS
-----END PGP SIGNATURE-----

--/L89aHPukja1BO3w--
