Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9E7C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35B47238A0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731623AbhAOPOt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731014AbhAOPOt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:14:49 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A09C0613C1;
        Fri, 15 Jan 2021 07:14:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id q18so9646147wrn.1;
        Fri, 15 Jan 2021 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ig07a06RJYhstJUTtuTXnM88Wle9PbNTUQG1v2vMeJ8=;
        b=O+keQBl+QSDanNb32m8TwXA2KNoj5a2rF9ZRcJlGW/uzYxkc07P/fUeE1MWAuuthUA
         bhDqUnvVzrSQr0ITpRGefg/EXl4VhM/9Ev1JqFszBDPjvP7OQcHcHxhEqvILanx7O5YV
         oJPd1wtCt3NdkRdV6tO3OWBSOU7VI/TqpoFteWYtBd18QbT5iOnuAZgF8L+thU7G+4EU
         nPAomvo+f+g3Z8LRnffoKlxJip5AfXDUYma3FsDPHqqo4M/IhCfQSmA5GOKZyS4YUboI
         PkXPOm7LEVcYpKaRrwtxuTb4XCKrrdJ/Teos/Rdf6KevhFcds6UaiXJExQ7MQqA61ot2
         I2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ig07a06RJYhstJUTtuTXnM88Wle9PbNTUQG1v2vMeJ8=;
        b=DAu/345heFz8B81TLOyLbLgkq/1vCMszCvRqQn7x4rZB73TpBRrnB13xNopu1LRbDg
         951dsq0FzHpFD7DTo6x7pWOPn85I+2DxDP8OWBtQrAidatC1ldSA91U61J16MacZxOrE
         TMlEl+8rjvBChYQE0zVgqOMh8aLZAOg4//PzQpcDQlYx4zM0bEAw0sQCF6m4KtNzPXYH
         vjS7McE9UW9knT3CHiiCNZLgJvElhYjlHeBWBj9343AVLv5Q3HjgTENpQMvTrvawi2mk
         LCBc+SJGEXjiXpwQn7IG7SzR2MiNNecqbvSrtm0HsXBfxgFBYe8mY1QWesC3Qq8Jck1T
         aqqQ==
X-Gm-Message-State: AOAM530Yhx7sdHzVL3FSn27gh2LkGQoGiJPgowL4blKC6G+P8sLn4cgG
        rjguPdzp/jFe7e2dcC+A+SiLq/+5Spc=
X-Google-Smtp-Source: ABdhPJwR57JCT5Mt+hvTlyf2X6XItRzZ97oHiK9O1wz2Q+KgGRO09uSyXC+vSEgux9S2ZOKFknpirA==
X-Received: by 2002:adf:dc87:: with SMTP id r7mr13803060wrj.305.1610723647676;
        Fri, 15 Jan 2021 07:14:07 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x17sm14952793wro.40.2021.01.15.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:14:06 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:14:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: tegra: Halve SCLK rate on Tegra20
Message-ID: <YAGxPEWGN3sgovJo@ulmo>
References: <20210112122724.1712-1-digetx@gmail.com>
 <20210112122724.1712-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PnIn8VStIBEjcSUJ"
Content-Disposition: inline
In-Reply-To: <20210112122724.1712-5-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PnIn8VStIBEjcSUJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:27:23PM +0300, Dmitry Osipenko wrote:
> Higher SCLK rates on Tegra20 require high core voltage. The higher
> clock rate may have a positive performance effect only for AHB DMA
> transfers and AVP CPU, but both aren't used by upstream kernel at all.
> Halve SCLK rate on Tegra20 in order to remove the high core voltage
> requirement.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--PnIn8VStIBEjcSUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsTwACgkQ3SOs138+
s6FuzQ/5ARFFUFkrWCz5UZGMJfVegH8DUhtKTtMzaqPZIvFnmMAymkei5mA9xJAC
EVjkgKRg1Wf7K2jHxiqtLhPHPCQbu/qaG9yNKrptUUDMh1iBKqM9NKiGZYThfIjk
IytrbIEKUqwk/YHtmCSqn0Uj6Wcy4pXsnpv1ER0N6efnCvfOKury8jPdaRtXVCHh
pp8z4gqMUVGy7ATXHpMG739WZvk3y+M+Lm2vmmgJV0CVOWzKE+KXm7viSVFOsP6m
UFxZwkp0Kld6flCZaGp4DY/KB/aHeEp56bJ8/fHGenRSt0dVifFL7bSJWuTetpet
mXZXiXNJ0yQD9Ct5ZoToWKMI/JDMmG1O4UqAUcO+tAgp7dRG6vBwPWn7TWvMqtPJ
DT4r/EZtXHoBqdYNm4FP73voa5NI6LguDfb0lQBPIK6xq9+pRV6pSZNb8R56haEd
wDdIQDRxeA/aScEymwCC7JeYvDV4zuIvALCJIAs1f9U2DRW+I9KxaUuseVTubb6R
6U9ZCbTw2PMmAz2cvylvfk9Jc3rByitKO40/NEmcCPU+osThOTb3AAkPoiM7Wdu2
FNxGZaZ2Mb2Tbwz3+/sVgZnp85HRmoF2wBRbxyiv7bSFxb+OnkZs9QlUrP5u07+O
Cqx2zeXPx1imsojsqt7hu8gL91PFxpK54UPOvfooAHQUtyR68UM=
=4t7Z
-----END PGP SIGNATURE-----

--PnIn8VStIBEjcSUJ--
