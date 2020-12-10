Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19608C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 01:28:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0A4123BC6
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 01:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbgLJB1x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Dec 2020 20:27:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:46546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728050AbgLJB1x (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 9 Dec 2020 20:27:53 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607563632;
        bh=4fquuoXgeXKGOmKHsZ5csbna5WzsqVOwtrr9OcdcGt4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QoEV6Wb73MTk6RVv03QGdhzC9QChshkqShWs7zHgdbgmb+S1UwE18CCDXqlr4dpCz
         emhS1Fl2MmYt2dxaDR9EjWA1U55ohBQt0NqWkW46lDIJ7R2DROpwXL0FFg8O/iuYaj
         lL/anVqdLkaRGlcyHwbr/QTmTyUrKnXTZmLTmpJ7EOAkCKsyRW6/pjEb+XFL2OG+jC
         CibqOORASvbtc0PPBWsrOwYsxE8gnbYmhg+dXWDogsTlxkLoqAKKPzZ6nn4R+sbTdd
         7dHuLYIxEHKnNsk+oFyn+Nop1xkGRVghGIJXdRGicuphQwt4st39a4Z16yNeAREPks
         NrqiNOUnIIIJA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201025224212.7790-1-digetx@gmail.com>
References: <20201025224212.7790-1-digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Fix duplicated SE clock entry
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 09 Dec 2020 17:27:10 -0800
Message-ID: <160756363099.1580929.2375956922093495697@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-10-25 15:42:12)
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

Looks correct. Should I pick this up Thierry?

>  drivers/clk/tegra/clk-id.h           | 1 +
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
> index ff7da2d3e94d..24413812ec5b 100644
> --- a/drivers/clk/tegra/clk-id.h
> +++ b/drivers/clk/tegra/clk-id.h
> @@ -227,6 +227,7 @@ enum clk_id {
>         tegra_clk_sdmmc4,
>         tegra_clk_sdmmc4_8,
>         tegra_clk_se,
> +       tegra_clk_se_10,
>         tegra_clk_soc_therm,
>         tegra_clk_soc_therm_8,
>         tegra_clk_sor0,
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
> index 2b2a3b81c16b..60cc34f90cb9 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -630,7 +630,7 @@ static struct tegra_periph_init_data periph_clks[] =
=3D {
>         INT8("host1x", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_HOST1X, =
28, 0, tegra_clk_host1x_8),
>         INT8("host1x", mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc=
4_out0, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_9),
>         INT8("se", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SE, 127, TEG=
RA_PERIPH_ON_APB, tegra_clk_se),
> -       INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PE=
RIPH_ON_APB, tegra_clk_se),
> +       INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PE=
RIPH_ON_APB, tegra_clk_se_10),
>         INT8("2d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_2D, 21, 0, t=
egra_clk_gr2d_8),
>         INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, t=
egra_clk_gr3d_8),
>         INT8("vic03", mux_pllm_pllc_pllp_plla_pllc2_c3_clkm, CLK_SOURCE_V=
IC03, 178, 0, tegra_clk_vic03),
