Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D33C63697
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 21:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3ABD2244C
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 21:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xwh72D0W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgKNVRA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Nov 2020 16:17:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNVRA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Nov 2020 16:17:00 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6F592240B;
        Sat, 14 Nov 2020 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605388619;
        bh=FqEZUpen8Y29V5HXU1LOgkt0OaBJZycKxqoK60URRsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xwh72D0WhxzeKQQjDromAM80fRybC/ACJJO7GBdUQI3Ra5YxrHHWNhvSpWZoY7hgG
         e8QjNnW15JtUM7zaBF9++qzAmvMHap7VwHPBov1QhstlUyH70BHH51FsA3AzfqLMCv
         sSBu7i1KcJ0W/lI7boP2TaNJjO6SlpfJPzuDHyBE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201104134810.21026-1-digetx@gmail.com>
References: <20201104134810.21026-1-digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra30: Use 300MHz for video decoder by default
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Sat, 14 Nov 2020 13:16:58 -0800
Message-ID: <160538861846.60232.2236874455363048014@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-11-04 05:48:10)
> The 600MHz is a too high clock rate for some SoC versions for the video
> decoder hardware and this may cause stability issues. Use 300MHz for the
> video decoder by default, which is supported by all hardware versions.
>=20
> Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation=
")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Should this go to clk-fixes? Thierry?
