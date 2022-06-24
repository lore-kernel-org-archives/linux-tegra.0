Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E993EC43334
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 18:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiFXSRB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 14:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiFXSRA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 14:17:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B718C4AE04;
        Fri, 24 Jun 2022 11:16:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6E446B82B66;
        Fri, 24 Jun 2022 18:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC7AC34114;
        Fri, 24 Jun 2022 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656094617;
        bh=n1LsVWPppqVw17V2C2CbJ9bsPsdKNUAhXkXhRj8P2wU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nRGKP/FPdhMfGBc8xut4pg9CGb6b7mSG97qm0Irs57Ym31Mv2hYepUGA4rDurgb7e
         BlAzsP+tSOEfsJSDylJ3gspeiCneli8O3G/KWiMRzXCskFgrdde+3g58xzByJPkABy
         nBbM8x2IzlAnIxT6lY7it/gY5GV3DRfx4M4hT/O4SFiHp+4cQSuwfz6S+58BsTu3av
         cvls1Lr1HyLXTzreRX6DysSMMUriWNyNX2Fqg49MJV33wS0LlGpjqkFqng6eunuEGa
         R/os1Q4a/SmlGKNUMb5d0pB2x8Zc+7PvTvltt5rj/qrlCFv334aQ5/0RfyEVM2Jr+I
         ojsljXP9+fp0Q==
Date:   Fri, 24 Jun 2022 11:16:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Bhadram Varka <vbhadram@nvidia.com>
Cc:     <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next v1 8/9] stmmac: tegra: Add MGBE support
Message-ID: <20220624111647.4c67a69a@kernel.org>
In-Reply-To: <20220623074615.56418-8-vbhadram@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
        <20220623074615.56418-8-vbhadram@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 23 Jun 2022 13:16:14 +0530 Bhadram Varka wrote:
> Add MGBE/XPCS IP support which founds on Tegra234 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>

Please repost the actual net-next material once the dust settles 
on folks picking stuff out to their trees.
