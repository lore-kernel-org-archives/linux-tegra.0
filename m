Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA47EB64D9
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Jul 2023 15:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbjGDPyz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Jul 2023 11:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjGDPyy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jul 2023 11:54:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D241B2;
        Tue,  4 Jul 2023 08:54:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C64F561274;
        Tue,  4 Jul 2023 15:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADBFC433C8;
        Tue,  4 Jul 2023 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688486093;
        bh=Gqx9Rdn6n8dZbjq+m756ziWTw2HkOr2gD1K16OAPs7g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BGW3iFxQ9vn2SuHYG/TBg/gtZlM3JW9W0sJFKtiwbTCASP9HiHj/qX1cWV9NG/M6S
         SkWrVkqGj6sbj13ElX2pwZQTl2jq0x+Ym4ZnxU4BxBvwDyfCRneAe7eGc6IqD0JA9c
         E5Q3dNlWutoekpeAgjVOQvZmxvjmB2puvBof1Y24ToFl0QjhUsm++EEMvgw2ymko+T
         RukcsKnAFUxoHiHnvVLB8c8uNVYDFJCoOHXRTHzBQW766xCDcpRvj2hJ+wZnqAn5oe
         JClQiZ9+rUaf5dIJA99TJbL4r+VOIhf3Q+t+zLZN4vO1KVUIHr5DoAC0Yzhtgmxmoq
         gMrn4q4Dby80w==
Message-ID: <b3c1a754f350791da21c92356b2b497f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230630130748.840729-1-thierry.reding@gmail.com>
References: <20230630130748.840729-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Avoid calling an uninitialized function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 04 Jul 2023 08:54:50 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2023-06-30 06:07:48)
> From: Thierry Reding <treding@nvidia.com>
>=20
> Commit 493ffb046cf5 ("clk: tegra: super: Switch to determine_rate")
> replaced clk_super_round_rate() by clk_super_determine_rate(), but
> didn't update one callsite that was explicitly calling the old
> tegra_clk_super_ops.round_rate() function, which was now NULL. This
> resulted in a crash on Tegra30 systems during early boot.
>=20
> Switch this callsite over to the clk_super_determine_rate() equivalent
> to avoid the crash.
>=20
> Fixes: 493ffb046cf5 ("clk: tegra: super: Switch to determine_rate")
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next
