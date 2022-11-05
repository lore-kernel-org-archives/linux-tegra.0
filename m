Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C438DC4332F
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Nov 2022 14:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKEOkY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Nov 2022 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKEOkX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Nov 2022 10:40:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A15DFBB;
        Sat,  5 Nov 2022 07:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8208CB8016A;
        Sat,  5 Nov 2022 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961DEC433D6;
        Sat,  5 Nov 2022 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667659220;
        bh=29M2448cgOHYMEKXGsRwTgE8lDNz4UjpIrZVsELUkhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bflqU6waEXJqA6CNM09mtvnNt/MZZikccFuzmCnxFLkmYKiXy63JrPY+t+MzZ1oYb
         OtC6+GcrwZxIoxEp0Ki+TTNKl/0CV/GJuC4ybq2IO08Q9JNNMTUprs3GgwAS3gEfEL
         wRR8wkvsro/j4Tw00v1LhsZhbU3wvYmSzzipipcbOnL4kxLQ6cvWBfEiuGlcrD3ufY
         SVtxrSpCKYnLNW3rerKUzP9hk4Kqrla9CB2eKcPuBXstLq+E7bffk55hgDD5ciAf4h
         H2yRtkqw8GxU0j+v9IjCoQC4QF0FR6HVRmJwHUmgCYvtnWBsRtKMQq/VYCOaq/DHSH
         m8pnSqQCFUjtQ==
Date:   Sat, 5 Nov 2022 20:10:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Haotien Hsu <haotienh@nvidia.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Remove usb3 supply
Message-ID: <Y2Z10EDPOwj5X2yX@matsya>
References: <20221005084031.2154251-1-haotienh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005084031.2154251-1-haotienh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05-10-22, 16:40, Haotien Hsu wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Remove redundant codes for getting the vbus supply of usb3 ports because
> we get and control the vbus supply by the companion usb2 ports

Applied, thanks

-- 
~Vinod
