Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710F8C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 08:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38DDB619BF
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 08:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCWIYe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 04:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhCWIYP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 04:24:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CB3C061574;
        Tue, 23 Mar 2021 01:24:14 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id e7so22347169edu.10;
        Tue, 23 Mar 2021 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ExPvoR1f5uk9en0rkDtqJD0vTJCWwj6XJRPX25LF4GI=;
        b=EWOlil8z8SmEC4vMkC1X6yg4dGf2oO8XZ+FHKiXnn8NePq7leLDczKzbQV1lmATFO4
         bs8NmLZkkoOayGewo3yioiWXy2mnb5vaAc5bnUhQpoCKvT957lq4ZX7HSJ7IQtajDxQM
         u3V60BNpSG9Zgat1bguSE1GFGwL42L8LwSJS/x2xQmhVcqlSwPLbgkK0bZPisiA8z6uB
         S6etvEui/U/+Uk8d3ixZ5jPf2yPSFFEliptkXpvHGzMzt3nn/Y/ibZW3aq2zXc3UT5+L
         32gG7wABs0gjjj25w+KQu/TymBqixl9lI6n0luNfkJtD12n1UnNd7pu03jM3Y3eoZMpw
         rRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ExPvoR1f5uk9en0rkDtqJD0vTJCWwj6XJRPX25LF4GI=;
        b=bfbNR8H6aVUdhTXtzlZpnvavHQ/pM0+aJYM2YBit1T4ZSevS/poSPCkNM76tqGVRww
         kIGOCLudaPLX0H6RZDJA89yEJpM6vJ8jbDLGnhr3kS2h23aAAmFpU9LcKb2xnHazxWcG
         u6BuhmKfPOthZ5loVgrK0NnMoqtpHfyxnlPtEWbKGp3bprl2Iumu1VxdQM314Idr9xv9
         QLopiduy1pbTksn7GdArCvSfL+qAff8GE7Cth4XMxZ68O1+qbB75sj16d29WxKk0TS9F
         s67V9W4qdy1on3PUUNV62Y3iaYjs5tS4WSfOSdz58JURuFkXCgJecZ31HkYJxOYiwqIg
         vkkQ==
X-Gm-Message-State: AOAM5339C2+vdxlGp/FqSF0VU2x7XxV8QoIW1C5p6EXfRs+HQ1Xh0RL1
        bcG903EyfZVHR08S7PTWAZw=
X-Google-Smtp-Source: ABdhPJwjOHKc07ohHiCyiRhf4qYoQ5nvvwkcrvwqJJ8e4Emc8JgofuGmQDmheSUlAh26OMPl1kTgIg==
X-Received: by 2002:aa7:d841:: with SMTP id f1mr3405065eds.286.1616487853407;
        Tue, 23 Mar 2021 01:24:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id cf4sm12479246edb.19.2021.03.23.01.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 01:24:11 -0700 (PDT)
Date:   Tue, 23 Mar 2021 09:24:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: fix old-style declaration
Message-ID: <YFmlv8IcQUMHMiVY@orome.fritz.box>
References: <20210322215047.1062540-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LolfSL2RAikY4/X5"
Content-Disposition: inline
In-Reply-To: <20210322215047.1062540-1-arnd@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LolfSL2RAikY4/X5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 10:50:41PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> With extra warnings enabled, gcc complains about a slightly odd
> prototype:
>=20
> drivers/clk/tegra/clk-dfll.c:1380:1: error: 'inline' is not at beginning =
of declaration [-Werror=3Dold-style-declaration]
>  1380 | static void inline dfll_debug_init(struct tegra_dfll *td) { }
>=20
> Move the 'inline' keyword to the start of the line.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/tegra/clk-dfll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LolfSL2RAikY4/X5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZpb0ACgkQ3SOs138+
s6GKSw//TBDe4fGAkcOmAj+cCIi6pzB3yM4jxBiim/v/INh8n0Q7xPtrpJsb5nbE
pNmvfdE6eFGr9hiY51NtfrpYtnBG0xt9GLXS7z5InPQ0EG2crT5uFEt7Ei5n2v6F
0iepKoFvrXFi/RNld3EyfrHqIs7I+6fmXIbiRSXY6L0qRUuc2YFJQGCfYUKwLoUn
jFtwj8Oj0SjwlD1Sfx0bUNKomRtnwF+WX3nDlb8v33SIccHxMy4LwN9RjOUBXWSh
E+dwmpde2pIKoPu6k1NVuGDWHVM+4n3uh1l6p0RBuwzaou8Opw4fPeCdpe2sCf75
jgj1WUe1dEzoWNVTfgxixG3e4G7aFzELCwoP8KYOiMSsvQ8y4GNyx2Yim2yhAFJB
uPWPBHK+iIbvVY3pe5Nqt/Z5l5Kkhnqcfh4eTwNOkCK7x2r1nYoro/MBZ3GR1PRT
JUk7Rvk+/lJa0kJbrJPfslYUB1n4UtGL0nYDaNQ9xZGgYxe3ldAcoTZhCLHLFQY+
CnyjgJ2meRV2+h4E2TuouYm4MSfp21RPx1kDBrPRdj9CSSfT2a34VKANRSYuKIUM
+4CZAX5v1a7ZWVf9Zl+/1ZXK0aho4nsAjVoeyhfSwY0VXZnmuNu/tcXtdcOn8oda
QLxrnbyskLtbxtZyjd9xhERJy6lpCbNGlAWy5LgwE+qJlPp/5e8=
=78Hv
-----END PGP SIGNATURE-----

--LolfSL2RAikY4/X5--
