Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2D2C432BE
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 21:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47DB460FC2
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 21:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhG0Vy2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 17:54:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232013AbhG0Vy1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 17:54:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2864960F91;
        Tue, 27 Jul 2021 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422867;
        bh=JWPqEvdUD8XWRfGIETHhThBzPZ1y5KHckWrOO7MNCm4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nx+y9acfxSoGNyQY0DdES7IM4xXVKE9r5oQfyovMOz1Y2d+RX2RSJYC3Um0X4JCSP
         IFc5HwrefhyZ7QjYB4ZrqjGp7psXCAUTRyX+nyF9AScBAJ+JppIGSmH/yJq+qvfPnG
         DwVExajkTWQDgFxC2XwsDCRwz3K1tlW5pbcwN43lfo1qMTITa/4vwjvgLIG7Ttnwhj
         q28lMq0WhFtuB++DzOsriqmRwLpLHA06vSn8+6rkpExAof89eOEe7G6A89QuRiS5do
         P7k6yJWPzgRjzHMVcC68oHyx9chVI3HfRjLvBoWjj3w0eol54qV/J+SY5E7cEkXSGj
         oHHZ4jYHj/0cg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210717112742.7196-1-digetx@gmail.com>
References: <20210717112742.7196-1-digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Implement disable_unused() of tegra_clk_sdmmc_mux_ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 27 Jul 2021 14:54:24 -0700
Message-ID: <162742286477.2368309.2790017158875617305@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2021-07-17 04:27:42)
> Implement disable_unused() callback of tegra_clk_sdmmc_mux_ops to fix
> imbalanced disabling of the unused MMC clock on Tegra210 Jetson Nano.
>=20
> Fixes: c592c8a28f58 ("clk: tegra: Fix refcounting of gate clocks")
> Reported-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
> Tested-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-fixes
