Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130D5C0015E
	for <linux-tegra@archiver.kernel.org>; Sat, 29 Jul 2023 16:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjG2QKi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 29 Jul 2023 12:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjG2QKg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 29 Jul 2023 12:10:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7740B3C1D
        for <linux-tegra@vger.kernel.org>; Sat, 29 Jul 2023 09:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A10860C78
        for <linux-tegra@vger.kernel.org>; Sat, 29 Jul 2023 16:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B51C433C7;
        Sat, 29 Jul 2023 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690647021;
        bh=V6YVtnCFJuNH+7RK60cPen2/GIH6Vm7DE1dz27OC46U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GKfuFXtR25g5AGrIWHJZuBvuS7wngCkhwo8veYrkDP97UQgb7J+qngGnpP82CBO63
         cMS0N6Be7pwWdj9XISMiwpdD6o4Pg8TFPNNqG8ieaab4CqeiVXAjCV3knz78pK3FtT
         Wi1+QU5PIH4Up3GZ5Pkql8h0hYq+zmoTpaTA2jI8byLZJlN0RuHf68GAbw6WtcYWac
         sp1aK0baad+qhXo1pI7ogpkSCYvqHknE9Fv0Q/uLEpgCGh2cevZHpUAdIpXA/Y/41P
         DAJCbyivPk/pk3+RPaQrANNtIQxzSrDem2GnordAiAdGWxuDvclTQ95cF0KYiFyKiv
         sOnLcXnJNFZQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46D6AE21EC9;
        Sat, 29 Jul 2023 16:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: tegra: Properly allocate clock bulk data
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169064702128.23345.15655949504237032704.git-patchwork-notify@kernel.org>
Date:   Sat, 29 Jul 2023 16:10:21 +0000
References: <20230726163200.2138394-1-thierry.reding@gmail.com>
In-Reply-To: <20230726163200.2138394-1-thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jonathanh@nvidia.com,
        netdev@vger.kernel.org, linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 26 Jul 2023 18:32:00 +0200 you wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The clock data is an array of struct clk_bulk_data, so make sure to
> allocate enough memory.
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: tegra: Properly allocate clock bulk data
    https://git.kernel.org/netdev/net/c/a0b1b2055be3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


