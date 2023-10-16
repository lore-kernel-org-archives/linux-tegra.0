Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49317CDB482
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Oct 2023 11:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbjJPLJU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Oct 2023 07:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjJPLJT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Oct 2023 07:09:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD3D83;
        Mon, 16 Oct 2023 04:09:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B25DC433CA;
        Mon, 16 Oct 2023 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697454556;
        bh=5zJCucxKJiJFREdw+9vbsSiIgkqJAENia9ICetGpmRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jdzZjzvPDHkpl8zWlRdXVe75detixZmuTQ/WKblr04pVx7gO6RXZd910mFx9yhbVy
         8z6DegMckHefAnMVz/Oku2GBpfOXHjDTGV8WukTbi5US6hDivMFL1Aw55aaVqDTVil
         l1ZweBBT7IPT7xGqzWsAYehrjBiTQdKqEjtKeQrEtTO8jDvWCFNJamw0x/ocGuxjUc
         ecOXtS8S6tq8m8TXsOykXzc+oGl8PWKjUeNJjODIS9gXZfiAvxwbpjpPCnHCsSoPCx
         4d6F9hm/DcXbhbIk0SztDzlz6P5I6LE57eZ5qwjk2tCSgl8LHlMfGQXeKm/ZqVpxoI
         x+fQ6exGQmivA==
Date:   Mon, 16 Oct 2023 16:39:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mohan Kumar <mkumard@nvidia.com>
Cc:     robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, krzysztof.kozlowski+dt@linaro.org,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V1 0/2] Support dma channel mask
Message-ID: <ZS0Z2G64rjrQTobg@matsya>
References: <20231009063509.2269-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009063509.2269-1-mkumard@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09-10-23, 12:05, Mohan Kumar wrote:
> To reserve the dma channel using dma-channel-mask property
> for Tegra platforms.
> 
> Mohan Kumar (2):
>   dt-bindings: dma: Add dma-channel-mask to nvidia,tegra210-adma
>   dmaengine: tegra210-adma: Support dma-channel-mask property

This fails to apply for me, pls rebase

-- 
~Vinod
