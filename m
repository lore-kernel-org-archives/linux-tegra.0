Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16290C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 08:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBD1C23D4F
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 08:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgLJIDH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Dec 2020 03:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgLJIDH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Dec 2020 03:03:07 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC10C0613CF;
        Thu, 10 Dec 2020 00:02:26 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id bo9so5988625ejb.13;
        Thu, 10 Dec 2020 00:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gepYDu0wny/2sKZLnfp5j/sfmRWJCXHMwGREZkDWP4U=;
        b=CIkoMCl70jOtB0h7ih8Em3Cky+PwvrFnWshKyjRoJqEYPfVWQnd//I2U+b+AsEQT2N
         493H3mrluNs/Vj9pLfYuaWRMskraIoQ04kt80cqqYFgqbV3d0hBeY47Ldt5i9pVfnGtz
         pbTLNWx6JXjg5fHXftQyHVnxfH7QxmqldjeRg1jOPef+cbe0C/P73wPj+JYHqrUuDXSI
         hwPaIKLf30iVAiSIMX5HVTKMxoy4IDn6EPmr8QZQBKYW1IzeMq+QDF0Qa2EHADWvxuwv
         zhzhlNBnz4wtDoUr5ksvTFZg6NW2yIVIgu/oUKhNjw/HH01GhpCrGfb0K+MoQe7yR+00
         WgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gepYDu0wny/2sKZLnfp5j/sfmRWJCXHMwGREZkDWP4U=;
        b=Dd/ejied4zcKBzTmBi2A0a7Ee8X/SYpQpIqh9qfKkaZXE5kO7IkGSDNC6eA1Mp1h3t
         F8qYDL0qzWUSmut0iw4vXLhyZiwAvypYqTcdHu2MZWUhKdwm+2P2x+kPfpeKlVcgDaX2
         IOWxVbogzPOVPq86xhB6JEOa639SDCLAEr8PgTAN4SOZIM6ltT744zOzwT3J3CzRfj9V
         lCFUy1jsLXezPkOHTYsjofcfc5Zro+CL4UWTHn2H0keOo5tum+GvwwG2pr7HV8HZhcCf
         XmJrZMRO4cffAPeopfS504NeK0VGFY2q/VHz+NAt54N47UekgTuuCardO2mQT8Rn8E3J
         lIRQ==
X-Gm-Message-State: AOAM531Qq7mGLS5PTNGF49Z62WyKIP0dMyBxJf7CJMu8+iC3e6Pme4no
        DK55bmo8pfCsk6s8crMeW30=
X-Google-Smtp-Source: ABdhPJw9lhXX/V2yxwL6JrVu9jNUWLRMKIwYkimwVmi54pTUj20COvWowSQESBjGiJ24yOKPCQjHUw==
X-Received: by 2002:a17:907:1004:: with SMTP id ox4mr5267839ejb.240.1607587345720;
        Thu, 10 Dec 2020 00:02:25 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s6sm3688917ejb.122.2020.12.10.00.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 00:02:24 -0800 (PST)
Date:   Thu, 10 Dec 2020 09:02:22 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: tegra: Fix duplicated SE clock entry
Message-ID: <X9HWDq8UBDdr4vGs@ulmo>
References: <20201025224212.7790-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KAA0DHtXUWF2QXAw"
Content-Disposition: inline
In-Reply-To: <20201025224212.7790-1-digetx@gmail.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--KAA0DHtXUWF2QXAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:42:12AM +0300, Dmitry Osipenko wrote:
> The periph_clks[] array contains duplicated entry for Security Engine
> clock which was meant to be defined for T210, but it wasn't added
> properly. This patch corrects the T210 SE entry and fixes the following
> error message on T114/T124: "Tegra clk 127: register failed with -17".
>=20
> Fixes: dc37fec48314 ("clk: tegra: periph: Add new periph clks and muxes f=
or Tegra210")
> Tested-by Nicolas Chauvet <kwizart@gmail.com>
> Reported-by Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-id.h           | 1 +
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--KAA0DHtXUWF2QXAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/R1gwACgkQ3SOs138+
s6FjHA/+MZliA/1FCUfV5MVbp9NlWq4s16hK4nloyO7HpnsQduSwo06ag5LpuuTB
XTZ6eCN6f7oVEDiG5UaQE2xd2JDAyHSE5emJA3zfG2yTdOteZ3dq6QMeSEN65IEx
4rvVP3pc5i5nUVydalKTY9YIr49X2/vIEJT2MhB3qYEvOGCy033+5QdEnZhwwkBL
pOEt9UtaaUw5CFMfXvBABue3xF7nbJ6xjIjR23+9qAzl5PKaZrrzBDXWt1eTp7KR
nLK3MZ93PhbUgy4Ex9IE6zclzBSpiMtESEj2NTZeq9gXgk5ZsLELF/Rw4vA56qGa
mUbVPGNcaSZHDDyTdWwYWoLIkwZu2T1jx/ylSDcXcfdz/IKkzMpLoSgKHFxjN3fx
DKdJxW7xk1C5dQ43qM18WrGrdq3E8ZEqDgEiY/9k1JsBfo6escUwEkYGgpI6dESD
hq25DChqtGrVr9KaqOzzCEyBE61KhvYZw7gHAGoVyxa/90bMTVeE3kgTBOfPaVc7
OIm2UUiA2mxurl1x2fcNWw4haEbaFnGvpGMf0kq7G4USYpSJCG9/VwXNbdztG50I
tMcho2QYUJTArnOSvLtJELuUoRD/3MaS1lMzgpMoaO+qfmduRjr6GMMXfYElF9yG
UvW34msXFKiiY6kMAimDiDnDHgQSNCA0DRcjku2YKrPMv+QTJ7M=
=SgsT
-----END PGP SIGNATURE-----

--KAA0DHtXUWF2QXAw--
