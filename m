Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1249BC636D4
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Feb 2023 23:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjBJXXW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Feb 2023 18:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjBJXXV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Feb 2023 18:23:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB85213C;
        Fri, 10 Feb 2023 15:23:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BA4A61EAD;
        Fri, 10 Feb 2023 23:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1035C433D2;
        Fri, 10 Feb 2023 23:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676071400;
        bh=8BmQWxV5ToRZdpqs7zbUfMYXxrQ2vb3ZCbvX790eZwc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=flZ/DeD1IK+Cute3qrT1J9arnvR/fWpJ2nMFIW+8y/kb8Se12D7b+VgT0K+LkphJH
         BsEM7Fmc4ljwcbJja9QB4F3G0HUvLVoixDA8eV+zNa3sBj/EhkonqmA1OKiwR934Fg
         YXRZDyLHVL7aYQWFCOUmUmzYgOMBmzXhBSM5Lpn42t275732fLqlxDCkR5E5IoUU/p
         W2a89GFIvRa32rgZQgprD8ALd+ovz+6hRx/ulAaJWQ0r5rRBIioVnhr0XShKWDaz7D
         AdnksHYm2XbJ9JsUUaGlv1Hmx3GS78e5wsrdKoMpFZA581ERGTsDQITaPCQg+iJDm4
         ZF4JWQ0naB63w==
Message-ID: <70dfd7ff2cde709e3e2fc122ef13e19a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221209094124.71043-1-yuancan@huawei.com>
References: <20221209094124.71043-1-yuancan@huawei.com>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     yuancan@huawei.com
To:     Yuan Can <yuancan@huawei.com>, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, tomeu.vizoso@collabora.com
Date:   Fri, 10 Feb 2023 15:23:17 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Yuan Can (2022-12-09 01:41:24)
> The tegra and tegra needs to be freed in the error handling path, otherwi=
se
> it will be leaked.
>=20
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---

Will anyone at Nvidia review this?
