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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555CAC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C38FD23403
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbhAOPDL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728906AbhAOPDL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:03:11 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61C5C061757;
        Fri, 15 Jan 2021 07:02:30 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c14so6187986qtn.0;
        Fri, 15 Jan 2021 07:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bSiHaDW7FBCe87Y0ohNmkO4FYuk7U+giaU0fHS7zJiE=;
        b=PUFas9IPfibW6hcMTLTvGr+lxwFVittZa95Vy4WX1PPcN3dCmSULvOIOsodV6GaCTA
         oqoCs8ly3n3+PTpCvmXaFd5DmwQahP39xxg1kjeDYLGvqdxqf2Q5moFm1ouAR0c56dpY
         U/Oa2Xfh2B0b3hfSdAbKaPXZfXR2iVdnZ1ClmH4dRyuzdjiLWu6e5B6eQVFl4meHX8Vz
         +8TjtPvuyVx5DxXAksHd5uUE5Hl6xfHQuruWRFfzjsumZWCtFww0SfYI2/tJ8lkoR/6b
         pBgzZ/PzJxw+uaS16QSk4pQ/YeRh4bVDQyrDeCQ5iK889khnyM5FUpQmteSxp5gImB+u
         NK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bSiHaDW7FBCe87Y0ohNmkO4FYuk7U+giaU0fHS7zJiE=;
        b=tS4ljXNDWPQdQVV1Tczlcw6b23YiRgKAcKPehuhKfxasKxbjhgHgovHiSQ/eMjJms5
         UlrgmXywwJ54pbC4jpUmVxMqdQF3pudsxB/58fEjaxnLyt9e62J3Cu/Jm2WpieHFirMs
         0cHUqiE/VJPBohnIr+fdqxlBBuraCul26gxVMLtFIwyjxWt5Zg9/dD5D9QXFHlGQj88b
         wxfg80PVFT4vYUY+helYyiYmLcZ8exkGthSPVu2bcMH8jNoDxSPTIanmn0y7VJ7lyXXu
         q2K7EVixzcx6hLv38v6JZwcM+QceZ6RWKZYTg1W8YdwelbeqDPJnmd0p43R7JSjYTV4O
         /+FA==
X-Gm-Message-State: AOAM5317caXl5EU7yqL3nkOYEE5R2Hqdbx2zopvgRTBCefDnhVnc8d3g
        ICB2fqOphbKrLkszeDg1jPo=
X-Google-Smtp-Source: ABdhPJx0R55YllEPRxZGcROYvpgRmgQpSNVOwKnGKtEJyiAhk9r6hbTzazb4vBXGX1VpYvBejQvKyA==
X-Received: by 2002:a05:622a:193:: with SMTP id s19mr11914075qtw.366.1610722950132;
        Fri, 15 Jan 2021 07:02:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c139sm5129276qke.24.2021.01.15.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:02:26 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:02:24 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: tegra30: Use 300MHz for video decoder by
 default
Message-ID: <YAGugCdgeobeahR6@ulmo>
References: <20210112122724.1712-1-digetx@gmail.com>
 <20210112122724.1712-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LEbkjMYHQQby9Z2P"
Content-Disposition: inline
In-Reply-To: <20210112122724.1712-2-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LEbkjMYHQQby9Z2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:27:20PM +0300, Dmitry Osipenko wrote:
> The 600MHz is a too high clock rate for some SoC versions for the video
> decoder hardware and this may cause stability issues. Use 300MHz for the
> video decoder by default, which is supported by all hardware versions.
>=20
> Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation=
")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LEbkjMYHQQby9Z2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABrnsACgkQ3SOs138+
s6GCYw//ZjDSSAnbQTHpERlpyrFIm3mZCvxPsr6o97s/zpfKdjTC9FT/zXsZGi35
CuVUNRrdtLvDv2CmXviO0LPeCWsdBwTTye6/A+jTOZUwkd1SkHLEPLW3xSLI91q2
AmIv3P4FEdo4PEoF8tlkGhdELNoZCDtzQEZ4jZ/A6mbItxrARzeZF946bUmTAmcA
igvlV8PiyzMvC0RY5WWgZM0vm+0eUoP4wOWRGEVnVzm4uYHX92R8lBIu6CiMaCa+
+u2L+5Vm3142UgefCnwMdPggOD1P7e1nR4Cf7hp+AGaam/3aUa+ddDdL+4Ebzs2d
Rj2C5bPmqKGufZ675XtOO7anqK4h6+EdwtID8TUjeiw0nrLcPuHV2jEa+H9XF2a9
WEsPdAsh8Pi7O7gns2XkUci36tF48c+r4L6j8WVqrl85FC+gOOBxzLRjKBMioGz5
fwo/55AzikRgx71nQqj4EWJ7ayzE+edQQHid9mCkbbpYZSRmJZsEITn+idol7AZE
nL37aWaH71wa9Aad39fI0CUS8DrBK6Zq8fCSijQ+YsHDy5dZVppo9GovEl3xf0ok
NIwqfy/b7y5QafgwMBdSeSJMZCpoW4LJobAfSl/XeW4xQtZ/K+gG7U6ZCXP7ZVvF
s+e3RcDMLJfPLIaNQnUGk+gzf+u/iLpYAyORwXm4bQOo++o18Ac=
=LBCu
-----END PGP SIGNATURE-----

--LEbkjMYHQQby9Z2P--
