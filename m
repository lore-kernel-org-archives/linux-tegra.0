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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46C3C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EC3960D07
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhHKJ4t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 05:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236521AbhHKJ4s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 05:56:48 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B2BC061765;
        Wed, 11 Aug 2021 02:56:25 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id u1so1540689wmm.0;
        Wed, 11 Aug 2021 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ej3XkkVy2Mkdl4WbgSlULmvp3Q2tHnmIbB47E6hdIZ0=;
        b=fwqyG3+dJBqCPhqiwk2VVMrx0xJEdQ7LH/kPOoVitCiJ3QdoqT+YHjKwK3qpS2SOiK
         jUVa86CnhjCOLo3GJZvTLdfxWsOt0vlkLedcdr/uD3VPlucNmKfQm3nXJSEUhEyqL3LL
         Hc4/u9ndl6bSv33LnMCVC+Ny/WS4fRSuAkgTgJncrBkEwPZvm37yfZtdQipxm4tRDgrb
         vx5eoOnZ02tEJOuF7GwtN+i3PikXZDRWUvSno0j3jd3gB28IWcRk2PtYXkRVwhxQTd1X
         Nu/hhki+icJ0T4ucgvnmlSTgz2vWVc5NpNYmiwFlhIW6/tw1KNmZHw0kID5iiS738sBt
         cfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ej3XkkVy2Mkdl4WbgSlULmvp3Q2tHnmIbB47E6hdIZ0=;
        b=PwvbzTk0NUtlWbrzputDNm4YDFffKCrj2p9CCizCwmcEdVuOcfO4ouTaWDG+J3GyHo
         FuMGCE0kvAivLz5Y0x+EdKt558zneV4EM/2nASPi30Yiah8B0vOUeZ0KzUC6H0/HDme4
         +E5ZqJF0uIP31j0hJZCR4wDR+JTL8B37V90uwMAdTzUSDPtlio5V+vLhrVX4cMkyHwCt
         dT6gQlN8t0T6aIoKF6tpybnGUm/HcuLw268vALNig7u2ccpF9HNyGlgiyHQUBEs2Bseg
         /VUJNXqodNDJDc2PttGPLNQ7nLkKVnSfat7a0r8TtA9xNeMe6A2T2fQY/59GPMXL4gWt
         13fA==
X-Gm-Message-State: AOAM533Qx5Eq0iYDzLj8rkfq1R84NPe0vDvD3GZnv9jHjxjJZrlAf7DF
        Dwf3MENjjN/uCbufXSWZMmY=
X-Google-Smtp-Source: ABdhPJz4rdVV6mfWlnvmvbbrsBAMotmDoPu3ouCW/nwR46/V7lyOEhle42HlJwVEfMOu8BW8FMG7/w==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr16053783wmi.176.1628675783813;
        Wed, 11 Aug 2021 02:56:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k1sm26695067wrz.61.2021.08.11.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:56:21 -0700 (PDT)
Date:   Wed, 11 Aug 2021 11:58:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] clk: tegra: Remove CLK_IS_CRITICAL flag from fuse
 clock
Message-ID: <YROfVuevpA9DEWZ4@orome.fritz.box>
References: <20210802221336.32016-1-digetx@gmail.com>
 <20210802221336.32016-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ApKy06so4aP3qKHX"
Content-Disposition: inline
In-Reply-To: <20210802221336.32016-5-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ApKy06so4aP3qKHX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 01:13:36AM +0300, Dmitry Osipenko wrote:
> FUSE driver now takes care of keeping the clock enabled when necessary.
> Remove the CLK_IS_CRITICAL flag from the clock.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Mike, Stephen,

I've picked this up into the Tegra tree because it has a runtime
dependency on the patches earlier in this series.

Thierry

>=20
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
> index 292d6269daf1..4dcf7f7cb8a0 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -777,11 +777,7 @@ static struct tegra_periph_init_data gate_clks[] =3D=
 {
>  	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
>  	GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
>  	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET,=
 tegra_clk_kbc, 0),
> -	/*
> -	 * Critical for RAM re-repair operation, which must occur on resume
> -	 * from LP1 system suspend and as part of CCPLEX cluster switching.
> -	 */
> -	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_C=
RITICAL),
> +	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
>  	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn=
, 0),
>  	GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
>  	GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
> --=20
> 2.32.0
>=20

--ApKy06so4aP3qKHX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmETn1YACgkQ3SOs138+
s6GGbQ//VxRQd5VZsLWIVmenpbQW6n9uDX+prPqoihH5xRPIpy8rmV/2Kg+TVDCK
dIBxN+3nrM6mtPPh6QB2bQWMODOE4lzILL1zhVRs+v1lHXkDfU++eF43gMz/Jcst
DlDbmCvo65QywreoRZrN5mIuiDa8K7RMvGcIscMkCc3Znki8DYJL1MMbukDYUP2q
9o0r59h/3HezmiDy7Jb+VOJn0k23Ht4HJaAljBfpJ9nK7lN7aZvMi06IEvXURD85
baNKIy1GTXEFFZ+qOGcNCz5462Toh178Lt6Y9tFSqNapHvh3dD3ufclJ9ioDn1Ci
ehY30Db5oF3FlCTPUgocRJRRoEBwezMFMy/kMNlEzFpdywIliqKtSxSeRtEAw0CR
YzLKMUywX96B3KOf0pbDSWlZT/5vficui7aedknSb8JQN9qkNiiuJv+VH2y9UaO5
/uv4RlLBZ78I3RpknHIlGjHZTxCkaxOB3lh8qV+LEFqVaktPeU+SPwW+hYWw9+5Y
iDhvRGzM9BCC0OI2WfnHgPaGETDFiukVpK56cC8TTeECfc3M9dgBsLG5idzJGyOS
mcF72OOdoYJEHTLsL0YT6IxDLr9boOU9N7tPRhH49zOsTKsyDBU9WTA+yuCaFlbY
2bMHT91UAQqW2M51qEZMcsH3B2FeqjvaxpNjj/z8ybeuF7f4TzY=
=dPAD
-----END PGP SIGNATURE-----

--ApKy06so4aP3qKHX--
