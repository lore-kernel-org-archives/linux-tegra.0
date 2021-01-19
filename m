Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB9EC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EC3322DD3
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389681AbhASRZ6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390882AbhASRZi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:25:38 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E7CC061574
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:24:58 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id j26so14234162qtq.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RFsp8lPtXOkJqiVYtfS+5gtcZwJZ2DJczmZXyQF3k5o=;
        b=tE3tCxmnHjxJ6o4RMNWM3LX021NvAM10Bj0KottSma+lbBPaWskeRH64xsTVlAXE7f
         zqNTQMZ3T3Dwiij8cwzInCwfNYHOo6eODS5Bo6yehCS/6NKdhWqaPPqhZNKOsCPWiXN0
         QCFCvs5Sc3XLToBYNqgsQECVq+TpM8o8w7u9Yy1Mb7U4TDsRdiatONXsxGIGg2ppCQO2
         V3kOZrIJbHTAwLfiBa6zswjmFMShidSI1tGZ1rc3X4TWwJS0R0OasDSanaEQnEGF++jP
         G8jbTTXk8FoZm0izk+ytPx0CccfaKW2J4gOpqYGG605FoDCQcxJfYZQJQlars9ptB2el
         NWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RFsp8lPtXOkJqiVYtfS+5gtcZwJZ2DJczmZXyQF3k5o=;
        b=exr1R+mFIJrlVi4W2JDATmKDx7M8j+2ycVEkwHbm4eSYBR28UnB+j4zAZaGzago6D4
         KQQ7ZgPycRu23YO0bdNdfyhKfwtaBZGFPx8g2023xwa+d9AOtx0VlyNSYo3Gkcy/z3sG
         OpmuUC0dZI74vT2rjALB+0AW0BH30zhZbBLYlN0aW+MKAH0sPKATYzWxqRzSnpPfabXZ
         CJgSPbIif5O7uTuZufBiPHklSC2fMYQeVy9pDHAyGoIhj2+LtxMlzrhAtjAOhzofBqYW
         kXg/yw0PzEiBsZ+q0mjYxmTe7gTIEaZsli9H6ebibhv9PJuQScVSOQ+wbWsgOg16/gXr
         atpg==
X-Gm-Message-State: AOAM530h+FEVqcagwF/feavCeO0ngeultVOSlFCVHjrXwFx6nQumnaDP
        1aK6pEtcMUuCyOMOdvNqJdI=
X-Google-Smtp-Source: ABdhPJxf5vBI7LfB2h4nrs4XOuj66hcRSFQ2eH3OreXwJBOU9zsRwRvA1HzRfhuny1DyMgthJbOHMg==
X-Received: by 2002:ac8:5ad4:: with SMTP id d20mr5149594qtd.109.1611077097291;
        Tue, 19 Jan 2021 09:24:57 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q92sm12655542qtd.48.2021.01.19.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:24:55 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:24:53 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] ARM: tegra: Don't enable unused PLLs on resume from
 suspend
Message-ID: <YAcV5WX+VPfq5y1y@ulmo>
References: <20210112135031.3196-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gLutzXZLyTodRAaf"
Content-Disposition: inline
In-Reply-To: <20210112135031.3196-1-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gLutzXZLyTodRAaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 04:50:31PM +0300, Dmitry Osipenko wrote:
> PLLC and PLLM are usually disabled on system suspend because all devices
> which use these PLLs are either suspended or switched away to other clock
> source. Don't enable unused PLLs on resume from suspend by keeping track
> of the enable-state of the PLLs across suspend-resume.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/sleep-tegra20.S | 38 ++++++++++--
>  arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++------
>  2 files changed, 108 insertions(+), 24 deletions(-)

For future patches with this many tested-bys, can you collect a bit of
information about where these were tested? That'd be a good way to get a
better understanding of the coverage and a good way to collect a bit of
information about what devices are being used.

I've seen a pattern like this used sometimes:

	Tested-by: Name <email> # Board that was tested on

So perhaps we can adopt this for these cases?

Applied, thanks.

Thierry

--gLutzXZLyTodRAaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHFeUACgkQ3SOs138+
s6Fcsg/9Fhp84MdKfs8pQaWatM02ndv3GVtPkhokmcLmnvoS+3KaF82/NjhP9g0b
pN5VkFzZttx2ZN2xPsPlVNIwdtbbOb1/KD1xg+Zrjo7KtwyX8Qfnh4pMfMrm8ZQv
J9H+q+GA/ZpO1oacHu4EpfEwIOen3otbXrlZ/pDkBxCZ4FyXAiQbcQXv6mZjkAVJ
wKeJumr7MminEJ4O7f/Lzq7gqq8qPba6X3I9vQ5UNv37spRPF72IZ65uLNYsQlqO
aDtJuJyBSaiK6XaQlKGxVb0CxdNDvfDhUvP3zmKr2mcbaZYDnVN1J9Ip5hihfqrP
vL1krbjlmja3Xj2r9ytIKTMmD16YF41H5g0WQrgmynzNuyF7JsAD2vSjbdLP0Dts
p2EL0QFe/HlZe9dFOsl8QhyLufI6eqwyCv4zeku9UR8XbyIwoLBSgH0Az3W4FMX+
tyASDdZCaS0Cmjwclc2hHzUo7g/jVk2Bb0gs7SoTqmtprw2JLA+XG082MvyxOrgi
nisB/hsCp3ZTkVwb0zwfYaU5RgI+HllfEHViNOK2roE81tf7hFtjwRqcBwjHskeV
+v80x0hpJpr2RulYpNDvI2Y/AXqzkbTEQNGtJCH5x7ft8QbHa00hO7AD9bhF7Viy
bcX7LSlYhkn6TpEnjNF7RaK6EVvcmjX+GSKzxsRS9yVyoHAjtsw=
=Fgiu
-----END PGP SIGNATURE-----

--gLutzXZLyTodRAaf--
