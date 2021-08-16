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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8512C4320A
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 09:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EA8F61B7D
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 09:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbhHPJzR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 05:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbhHPJzQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 05:55:16 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7A9C061764;
        Mon, 16 Aug 2021 02:54:45 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r6so22725475wrt.4;
        Mon, 16 Aug 2021 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OVIiXaXt+PNMazqOI2FVcSRJWLlNFOCX48IyWhzo2SE=;
        b=ER9UOjvpcCe8cps+ZwqPAd/L13LCHSWr7ePe+PGIkWBIviTRId6qN5fHuS/1n4X8uY
         s1AR6XqZf/OscRAZ6ZLsuv9MIuhK4qhnu1nXnADnc5UJouIVWNw5urML1iDjWxNaXZoZ
         ksOaN8/cryni9cg0jQDC+qvCJ8YhHhiBO7L9jxJaq1+aJoE2IqxK8PfZUqzcuOR8qrCa
         1+FyUH61P6/BjU/iQrLPki+I5PJ0KjPVrszUgStU3E3B1J2kbG8Yvk/EWgODW2l13pwY
         UiVE5Xc5izntFytlVCDjHTsO/21ohg/akLc6YWWM6OihzctxVYrTezb5iVSDBaoc1h1b
         WnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OVIiXaXt+PNMazqOI2FVcSRJWLlNFOCX48IyWhzo2SE=;
        b=sNypIRQSEmnhyo/2M20e1eDkNclYx+xwpNvGeB27H8hMYPvVYRDFN5ufSVaOxfS2NC
         J16gvx8ahJLZKKfthVA+reDeN19yqCYXpBSFEdMi/ixWmcQk1nFbeToUyt6bRBECWsLt
         FrRd1gw7ylyJoDnhdZ6ZMnvnS6Wu9K94GOxXKtD4BtiHN525oC/bOtuwfqVdbCPGn5tj
         hVQI8YU+LaHsiEd3FaF4QSh7nrMTaoxNBPsiQR9p+EnvRlnAN4hXNNPbBIbZvPQUjYul
         jSwQzJ7kkuC8+wSG8MltGHUajDioLXXGGWPkvBY3iX4Y8ArQcsBAej8PAfyKd/wqbAz9
         QY6g==
X-Gm-Message-State: AOAM531uJYb7deDrD6fLh9H6zrzoCpHTZuESS9i9qDt/MWEnvT6xHI0r
        UAXy5yex3HwXK8fyCwWyTP4=
X-Google-Smtp-Source: ABdhPJyHV1ltLaoofusnP7m6+Sw8yxHlFYo06zYWZCtvRdcTYPXFyoXEh9LCvs0EL6Gnw3bcnXijzg==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr15957821wrs.216.1629107683797;
        Mon, 16 Aug 2021 02:54:43 -0700 (PDT)
Received: from localhost (pd9e51807.dip0.t-ipconnect.de. [217.229.24.7])
        by smtp.gmail.com with ESMTPSA id l21sm9692957wmh.31.2021.08.16.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:54:42 -0700 (PDT)
Date:   Mon, 16 Aug 2021 11:54:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <YRo14o5XJpMVUDbH@orome.fritz.box>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/uNhmtWkYfSYaFoo"
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/uNhmtWkYfSYaFoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
>=20
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--/uNhmtWkYfSYaFoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEaNeEACgkQ3SOs138+
s6FCpw/7BlHGOK9ti9B6aeIIOMkVFHwa6ssji99uO3n8SCquZ3gTqWd4VE4Bnlsz
fI4wit4W8R0dRI896hlaBw6U6b/XkKzajDmA02mo38V27POnqWyTKr3nvUibR7Jo
ILI8fDHs8G9yenX7BoAraShENnlDkJYtslxInAWoxHrcxOAVuj3CS6PsbbP0Tekg
1aeOxRidBOVHihOHOixf87HOMlz4hONSYC/791lO/r9B59PwOJV67qdQncLEPBFm
u6I2thVc1ZIalGW/EUcFGouoEN4IBXXTiLKrp50/5y9+MLnwkBfqYr8PLEZ31CV0
6rmjeAAkVuao1GuA2I/VRuN8j3gz3ra+rbh0qp1wUCUKf6E9k1SW0Lnu9a3O9ctY
5NkfgAF9UQ6p9Bn72yOP4UbPIyJIfPoQ7LBZvSbmMtQ88PRNZscfgMvnj3ku3qg0
2fEY21akncJUbahcEZHwRZamunyQ/UaJIl3nUSXAfjGFccMe3vPGAn8h4BAIlaOV
9hdmVaCxEuAyL9cO21KVfzvJelfeKGLYXsL2YLf1t9KpElFWDK9SpkcrW8hKnYlk
a5vz1WHFryX5JqS7g9C+FLKefkVv1RC8mH6BPmObJIQJQ0XU+KbnTtTmxFZMr8TR
Entg6D805mQuzDE0KdepXexhMklsGGo4HamscCn0mG5SvXVfdzg=
=jhac
-----END PGP SIGNATURE-----

--/uNhmtWkYfSYaFoo--
