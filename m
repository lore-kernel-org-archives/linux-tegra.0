Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA089C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 15:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D48C61184
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 15:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhDOPs7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Apr 2021 11:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhDOPs7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 11:48:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46CFC061574;
        Thu, 15 Apr 2021 08:48:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g5so30879831ejx.0;
        Thu, 15 Apr 2021 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ayGURnHq7wmSKaDUrrltJ9EF5TW5D/i9Qzk+7xK9jcE=;
        b=bTVqVIniyk/vSt6glC8hYD/mGom31RseQA5JKeyjSmx5myZ2gtxEJ+m0q2Pe6vgtrF
         Plrm81Posl68o62eVaPU8gBcTvIRZ1K8pbP7HEmLT98g4mgVbYVVcfgIMtCSqRsn7r8o
         TcJPFU9loC/HUHjAoncJKvmR5TlFCsLfJUlNCld51xw42X3J3NN8A0yWWWf5ivLMPy0r
         U5/u8s53U/Qjw/bjIE4/lCOwgnkKoEn2IH8pJsQDen7bQsH2Z+SoMMEX2Y3gO+d9R0IM
         CkHF7eVdGW10hUfYW+aNtHRWvySGKfdsJTQhp+6yOLpSMOpkKTPPp6R5CaGpALKxw65n
         tdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ayGURnHq7wmSKaDUrrltJ9EF5TW5D/i9Qzk+7xK9jcE=;
        b=UA5tb3kIWj/m8A7gFl+zqc8jZFwYWdF7y05H67gy0mIP7MIGkg8wlFiUajE5SLqhAG
         O9H1P9CI3SIXgKDQ8F67CrFcdW0raqzPt4Nb1xsjcjtP91Mcg83xmVDF+e4xp7Udjsbe
         w05LkGxbrEmLomeDKRtRee9DSDvuXi9n/AY6MEfx5jhFO56NPa6tAZj7J6Wjhg/vjl9o
         nIgCQdl4N9JtdmMKWYGPX0t4pkSm9soFNMoEJMxg4ED5XvjPdjjh19LlSdbLZ0FomJfi
         1omKSVX4IrjraZfmQyoX5cQr6UZZBvMEilQe21xW4F7JTCf4laD1xnVnEND+4hRGNWSD
         MGsA==
X-Gm-Message-State: AOAM530jVmfU1f76oFY8HYUaVNrsxbjYicwjUTlCvg99LexPAONacYZS
        0Q/u3m9Zy73Unkab+hrADa4=
X-Google-Smtp-Source: ABdhPJx4xzQ1G5vhPZnh9xgVnUGgcnXe8Bvj4eboHAX0kHDGCJy+E++Wx5gf0Uj4FLxS2/rB+DCmpw==
X-Received: by 2002:a17:906:c04a:: with SMTP id bm10mr4061202ejb.521.1618501713494;
        Thu, 15 Apr 2021 08:48:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gn19sm2136640ejc.68.2021.04.15.08.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 08:48:32 -0700 (PDT)
Date:   Thu, 15 Apr 2021 17:49:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] drm/tegra: Fix shift overflow in
 tegra_shared_plane_atomic_update
Message-ID: <YHhgekKvL5te6K6n@orome.fritz.box>
References: <20210415152913.1363964-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ue6mK/lIz3sBypv6"
Content-Disposition: inline
In-Reply-To: <20210415152913.1363964-1-nathan@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Ue6mK/lIz3sBypv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 08:29:14AM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
> drivers/gpu/drm/tegra/hub.c:513:11: warning: shift count >=3D width of
> type [-Wshift-count-overflow]
>                 base |=3D BIT(39);
>                         ^~~~~~~
>=20
> BIT is unsigned long, which is 32-bit on ARCH=3Darm, hence the overflow
> warning. Switch to BIT_ULL, which is 64-bit and will not overflow.
>=20
> Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1351
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/tegra/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This code never runs on 32-bit platforms, so another option would be to
not try and build this on 32-bit configurations either. But none of the
rest of the code is built conditionally, so fixing this is preferable.

Applied, thanks.

Thierry

--Ue6mK/lIz3sBypv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB4YHgACgkQ3SOs138+
s6H1eBAApx8g0dh+NPpyZQCcGFt3Hv+BaE/kZh7PJeSDp6ce2EYECbJZ0K92GclY
DrQwJx6ukiYTTNkJiq3cul1lpEgfnbTvG4VRH8mXDxAIOUmje2p0OTXr1yg30IUZ
QqfCS3RLXYXQyLGVlej1/1jhrFM65FQMRxVyHty0bF2j7LQ/C4OIiCjFCMvk+/ML
8HxLpmvH2R159bVxElAW/8B7eakxkwMD84h9/EjUX6EPKxZqEULQb2eMvNHvRCqm
dNjJPUGF5N78pbNSV4n4me3oN1TpB3W4Q0RKZXRksJKj0e/e5iw7LuaDh0DnHDCG
ulD0F7XY7esK4rU/4vBuemcO7u96+2wTTf6UM90UD8w2UTmABLmSBKZXvYUffjYM
fsdtpE2MfG82B2B3GeFgDefDS53bDOR3HMoh8CHP/0jgdxaDM67sk+hnjMgMSIjW
6qky2nOl6DuODDbH6zB2sjeddrg6z7TCMhkE3LueD/vJsO1smMzIuaRQ81NwUOAc
0onVjKmrWsv3NCDPDs3Xd1OtGxLHDqzy+PIco7rM/JuOD0sBSzMYpBXP0zzVf8I9
s+vm53QAuUAV9K9HICZomkkxrUA4ifZ8mpXsAOkH1C3n0g+R3KPMUgDO0mRZmTL7
/udq89CLU/trkJU+ZUkrthPkIYarB/XAx37LCILdunTeEZFivZQ=
=/+7x
-----END PGP SIGNATURE-----

--Ue6mK/lIz3sBypv6--
