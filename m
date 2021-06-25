Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD58EC49EAF
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 949A461976
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 23:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFYXdg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:33:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhFYXdg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 19:33:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2D306194F;
        Fri, 25 Jun 2021 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624663874;
        bh=gx4z69JK8B1m24jj5p5HkcPmeM5Zoi7oy/pqkyg5PL4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bW1wwQttYOmlwa2rjEEnr0Mp8iZGp75nskWzdpChMTN2VWb0sp1T+Ia8aJXaXGhGY
         un7RUgy+mm97xnWOF65Q4B6RqdFm6a+394mzULPtJhAxxj04zW5roHFwrh7VvXoq3B
         TTLLCk3WIf0Amk0Tg7MBdWszPXbREWQ06DwAVqGhLysupAg1zAP8Eu42RZ6Vd6VqrV
         Z1r8ejjjmIdN9PiQZGCBAue/YW41Yu3xVWeTmugS8/IfxgArHlzkWfq1LuoFDGRTZm
         LYtn3JUrAMp48yw45ZmVwm0B/dlrAw50GtLhXlz9TC776zq7Fl2orM1bjoZXp1tp8K
         sJ8EuysqygPBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617082759.1008-1-thunder.leizhen@huawei.com>
References: <20210617082759.1008-1-thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] clk: tegra: tegra124-emc: Fix possible memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Date:   Fri, 25 Jun 2021 16:31:13 -0700
Message-ID: <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Zhen Lei (2021-06-17 01:27:59)
> When krealloc() fails to expand the memory and returns NULL, the original
> memory is not released. In this case, the original "timings" scale should
> be maintained.
>=20
> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Looks correct, but when does krealloc() return NULL? My read of the
kerneldoc is that it would return the original memory if the new
allocation "failed".

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
