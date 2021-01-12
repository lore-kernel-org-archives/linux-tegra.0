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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6595BC433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12AFB2311A
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405751AbhALM7V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405890AbhALM7N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:59:13 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AB9C06179F;
        Tue, 12 Jan 2021 04:58:32 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id q1so3698641ion.8;
        Tue, 12 Jan 2021 04:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YafB9M+qZnE/nt5PVl5uoiIhZtLdagUggJ2HZtBPpoo=;
        b=slCZ1s0niVvQypVbz6PlWneerrA/X0C+iZjWZftfHUan8VIXBhN8ehLo/qgdsRFZJx
         ybWaaR6WLdsMs7sD7wGuw1P6NzvBoQx/lgR0TelTOekUkpcwWDjszTZDOk8KkifKQx0q
         yX0Gd4tzs8LqrCKfrLLReUcSRThmEeHGvye5GvBOxASEZNO2J+n78vQo68bVMYN1tDAs
         4xMGF8mVeLooTNV9jGaJD3Yp8V24Q2Q5t31V6QDa8RCr/dVSAOLGoc3Zqx/0qC54Bqzr
         NwQ4letDqwcRCLivmrimf1f7iM3c6AWOQoMBtUR/HmqGKw9JQr3MDwQzXfcPPnpglX5I
         Q5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YafB9M+qZnE/nt5PVl5uoiIhZtLdagUggJ2HZtBPpoo=;
        b=RrhAmKobaD7N9DohTIik0u7KeTONtjADzWe6Ym5sgPwZvG+H+Cv79hlZFlT/nzUVsm
         N358R/Ma30BahV6S9jdN7MEfmv+guGAcX/TM0pPBuph4SblD/j9NKzRrX+XQLbnZMAOs
         8ydCw14oTVORR61ZIGI3ODAh4ysya8aD1hvHGWt50wFM+yiYiwGohA0kMak0EjYICC5m
         N0qUcrmk4GTGg2g+gdMxHtBwXGTp+VbFctjPQGReuNDR22Y77/SFq91fti4VkIorW0QZ
         Mva+/xnwfx8xGenjdmKdclRpnQPaRhmBHYZ4fqlr5Y4Y/hN5NkQX0oVtPv5DOMrj/rPF
         +pAw==
X-Gm-Message-State: AOAM532vsPmalKH9+UQZ5Gwrqzi3Fjv9eRtPf6ZF4DAtDPYCBVx2UiiC
        +CGgR1BxeRA8SFo1xWXpvyk=
X-Google-Smtp-Source: ABdhPJywbjxLymotcPdnGX1DpYbIDcHERYl02nM8jXctCbtODKNlYwNeIxmbXGzxtI9IP7oPYtY32A==
X-Received: by 2002:a05:6e02:1a0c:: with SMTP id s12mr3918732ild.14.1610456312090;
        Tue, 12 Jan 2021 04:58:32 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u8sm1864246iom.22.2021.01.12.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:58:30 -0800 (PST)
Date:   Tue, 12 Jan 2021 13:58:28 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Ion Agorria <ion@agorria.com>
Subject: Re: [PATCH v2 1/2] clk: tegra30: Add hda clock default rates to
 clock driver
Message-ID: <X/2c9BiqgURAJWCa@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x2yLJCQXx9a7mg5I"
Content-Disposition: inline
In-Reply-To: <20210108135913.2421585-2-pgwipeout@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--x2yLJCQXx9a7mg5I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 01:59:12PM +0000, Peter Geis wrote:
> Current implementation defaults the hda clocks to clk_m. This causes hda
> to run too slow to operate correctly. Fix this by defaulting to pll_p and
> setting the frequency to the correct rate.
>=20
> This matches upstream t124 and downstream t30.
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--x2yLJCQXx9a7mg5I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nPQACgkQ3SOs138+
s6FBPg/9EWWt+2cctRc+UkfJQ3+RYU8Wa7yl7XGS885r3BmnOC87IdRB0/sdjlAc
SUHqd2YbuCfOnfHmC9u5uKXlQTKKffNQSgE4QFM+81tXAU5E3RShLqsTAlYylOJb
COXR1sOfBFas9jYQ714tLnfvc10YLYdEzKYBVRXMu2g9u4sN4fWo+cUGR7cklBaB
WbZlRlzcRx7VUmcfwt2DGQzisg1CdyPat9OcQFwZAFT60Laa0zOYsiSRDTAD/JVj
5XxRJQb52tjEw3pRBfOsVBs7R4W2aY+SDrXTlcGSRonbMi2Tx0DhzyEniVafdDOw
u4cMVfqmsC6c9o2RjQmmzFdbDlsYJFS0dU2S4Zc2W3MarCrmEeI98qGMj4dRyV7H
9RjrwQ++sEtvdSwsRHIrn7dIDr4/F2tjSSXfV8g2BxChnqFtVh/c9jg5ZDNwXAto
25ejdqF2PlCnqLi+v3RpBzkSsoC+d1bTcGjJ9o2jBSHvwjjI3qWb9EMpEb4uuZ8O
1MYFNCANnx1Xw+1GMmUfYKBiiajrnPbFME/8Cbb3oeI3s9Yjit2jhR6Kl87k6bfN
OOW7RcO+Ljv57Ta+XYDVIg6aTsmcr9gXC48XYbnSkPeWmarbSNIawdIQvPemjDmu
vLB1K5a3KfO7hwe5iw44yoi7bdqcUS5shDov/SAheN/cavRE6iI=
=kKkO
-----END PGP SIGNATURE-----

--x2yLJCQXx9a7mg5I--
