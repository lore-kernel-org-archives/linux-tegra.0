Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA35C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Mar 2022 22:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352353AbiCOWsS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Mar 2022 18:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352334AbiCOWsR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Mar 2022 18:48:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F21E5D1A7;
        Tue, 15 Mar 2022 15:47:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91D4461456;
        Tue, 15 Mar 2022 22:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7E8C340E8;
        Tue, 15 Mar 2022 22:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647384424;
        bh=86orAlnXxtfNaGMM9WoOgNr7cI+roJgX2Retc4ANSZU=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=CUfkDOMp7/G9aS7ZJK8VXoEGwpow29KDhCIiBkqyRUEJoOI4lU/V32HfVdz4XwYJW
         9R9s5KFsCQ/d2P6EhvyV0CDyhfAYE0F9Vs59OX/ml0dlmZuUCUHswBJ97BF0WFO6A/
         wsF/fGWdQ/tMdYCw9AT2h9mIl94OPkdW4SYh4taBsqZvc9lwWIqIGGg4SrzE4fzAHD
         IrIlwsyy5qu7VnGRbmFlfKVGktuJaZF3aBiTWl78xEhU9Gby5ZnxTT4rfm51g89fBN
         hnnOd/xur0WmQBHO0325k72C8OsunMLmuLN+0UJ4u17EB6NMr2LnqogM0mHbU1Y8Ah
         fnlhFZ6E8dSAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220313190419.2207-12-ansuelsmth@gmail.com>
References: <20220313190419.2207-1-ansuelsmth@gmail.com> <20220313190419.2207-12-ansuelsmth@gmail.com>
Subject: Re: [PATCH 11/16] clk: qcom: krait-cc: force sec_mux to QSB
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Date:   Tue, 15 Mar 2022 15:47:02 -0700
User-Agent: alot/0.10
Message-Id: <20220315224703.EE7E8C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Ansuel Smith (2022-03-13 12:04:14)
> Now that we have converted every driver to parent_data, it was
> notice that the bootloader can't really leave the system in a
> strange state where l2 or the cpu0/1 can be sourced in a number of ways
> for example cpu1 sourcing out of qsb, l2 sourcing out of pxo.
> To correctly reset the mux and the HFPLL force the sec_mux to QSB.
>=20
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/krait-cc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
> index 6530f10a546f..1bdc89c097e6 100644
> --- a/drivers/clk/qcom/krait-cc.c
> +++ b/drivers/clk/qcom/krait-cc.c
> @@ -15,6 +15,8 @@
> =20
>  #include "clk-krait.h"
> =20
> +#define QSB_RATE       1
> +
>  static unsigned int sec_mux_map[] =3D {
>         2,
>         0,
> @@ -178,6 +180,12 @@ krait_add_sec_mux(struct device *dev, struct clk *qs=
b, int id,
>         if (ret)
>                 clk =3D ERR_PTR(ret);
> =20
> +       /* Force the sec_mux to be set to QSB rate.

The comment start should be on a line alone

	/*
	 * Force the ...

> +        * This is needed to correctly set the parents and
> +        * to later reset mux and HFPLL to a known freq.
> +        */
> +       clk_set_rate(clk, QSB_RATE);
> +
>  err_clk:
>         if (unique_aux)
>                 kfree(parent_name);
