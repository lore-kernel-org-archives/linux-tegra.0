Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654B4C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB4361A23
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhCYO1C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCYO1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:27:01 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955E4C06174A;
        Thu, 25 Mar 2021 07:27:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so3220903wml.2;
        Thu, 25 Mar 2021 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AX6+kHKK/qwOM4FzMEsGgoKG3nu6wTe2Lo/9dWt/bdY=;
        b=ctWyWNVRu8jSWez3kmcrzujTjN/ZaAFPuBuHHOTElAlkfW46jESUdyDfAMCRmCzuKR
         JUM1TMlVktiOvRlmuxlEAHY1FHVZjSW2PBG3D0NU0m2T7OJRBLDrxKV3nyogedZBBfb/
         km1wyxCWfbn67KdWnqg6UbfHNHVufL9whM9FhBgemgwI+XXNNKa/4g7ZSM7GIk8aRJSk
         K96d/CDb2WLfnjvV7UnIuBIE/YwsG+5h17hVKkuztB/qbkbuB1K4szAjrtwGN4FtFd+u
         JpFwckJBDlCkF35mW/51AtGYWg7vaX4tYmAGvNb2BdONGVEc140GMDo0+HHyrGR55m4r
         0Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AX6+kHKK/qwOM4FzMEsGgoKG3nu6wTe2Lo/9dWt/bdY=;
        b=URTjXU1b0C68VlYHudiIjsvcXnL4xhIu2SEiT1LOtj5cCV81G0ChTGnBHSUkGMKcq1
         2Q/hPUx/hqDTkxvfb40gxnwJuNNQXKcxk/4AeOVtNI4iWGOjxxJwrLp1ALNHmO+vrC3d
         vJAWXt0MUoGREYvrBtlLe3meB31+8elZCeqCl7Fn1/a5UBBtNO9RkN70+5PHW8klvTJq
         w27sBu5ACif7UNCaQ9697MZGw69/FKssvp3AD8wkcWqcsU00yhilrovwaD7oHFdN38gN
         Ykrb/TaGdDrzj+lNPwxEgz1tyDGBwtDT8gQG/Kki/2a5rG75eqEbJN3i57MW8U/i6tHC
         wf+A==
X-Gm-Message-State: AOAM532ExUZBlbYNxzCpzvyUXpQzcbEYN1Ptn48B6HJl8W03D7lc+UAI
        JCGLJ5Vn/64971erBEbOMSJLGuGrTPI=
X-Google-Smtp-Source: ABdhPJyrR4ncok+DuO7e04LqHdGMrK/QDtmw9FEUugwXv2Xa9ePbBAbXSyEzsc3dsX/mDPpk3fMOEg==
X-Received: by 2002:a1c:541a:: with SMTP id i26mr8069918wmb.75.1616682419352;
        Thu, 25 Mar 2021 07:26:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p10sm8032235wrw.33.2021.03.25.07.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:26:58 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:27:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] soc/tegra: pmc: Fix imbalanced clock disabling in
 error code path
Message-ID: <YFydyG+ZmG2gU1QA@orome.fritz.box>
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TnDqhOWTa3f6ocxD"
Content-Disposition: inline
In-Reply-To: <20210302122502.20874-2-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TnDqhOWTa3f6ocxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:24:58PM +0300, Dmitry Osipenko wrote:
> The tegra_powergate_power_up() has a typo in the error code path where it
> will try to disable clocks twice, fix it. In practice that error never
> happens, so this is a minor correction.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--TnDqhOWTa3f6ocxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcncgACgkQ3SOs138+
s6HmthAAg2B9ykkDo47tixsHqUBy+Gx1aVwux9aneN6mTlFerK3j/pPQH4fhEkSN
fcsBqdmiivMYRxEAN2Bns9zxp82ves/mjGK2vGxmun3PvM2Ob9fJlrz7bWxUu9Zg
+qVDQQ46JXk0zBTBrTFuTQIPG3goSCtLPH/b3RSY+Bm7NJcOorN8fStjKiMMPqbO
3+6Yd7h87ov4qMV1peLTq+huVYK+C5R/NDvrCAj7BI/0Reu2WsByAcYhFYkai+w8
K0Zyd0Ny4TYKzWN7l+yQMbafHyIkSLIK5+9AwGoabZzjhLGilcoOFbbqOM0gfqNo
nTb5c8qhOouQ12OWudIMJNyPa+CLlqrrDByBHJE7nS59rupOd+x3pVCPiUZm1U0x
8iFMrcypQid4sTEdW83DcVxKRlIObTAVBcwnibdI51+BBxLZ93WppG2oUTWwVsEU
yL40ShoZEBZ0qW2qI2KmAVmW5lYvYNZGYO4O6QfJroDhCvt87rQBZ44t8eaRMygC
oJvi1yNutW5woxfVJK7SrMuC7yj4DjxKrtlQkGNMK3PGMdYoi+dAfcF4A7Jff4CG
A8ae3y46P27UD/ysO4ErM+r5qWSXiVUB57RIsugCeZvzMxYItLPlx+gQHYAYwf5s
zfe1UvzTDTYNkRDld8mbq8wy1rjoSc3VpEyOqxa0DHRfBclBl+Q=
=ILRw
-----END PGP SIGNATURE-----

--TnDqhOWTa3f6ocxD--
