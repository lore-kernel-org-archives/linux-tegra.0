Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C9FC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 19 May 2022 18:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242176AbiESSFx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 May 2022 14:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243151AbiESSFp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 May 2022 14:05:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9429CDFF6A;
        Thu, 19 May 2022 11:05:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40913B8277E;
        Thu, 19 May 2022 18:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A7BC385AA;
        Thu, 19 May 2022 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652983538;
        bh=eiONrI+/XIOUrRkbYlo8XEvtMnn4h975jZWYVuC1GfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bHhW0O/zb8ezRvcI8k2YnsLVhATLz/RylFLkAoiLTo0zIx8NKsPXk1geulxFV7B5l
         ihuckq535D4hjyyQS5kI0VXinkgn75K8dwNq7JlSIdTkuEw+plIzFIR+r7G/CgHh60
         Z/YOrD6mtel4MtBTDGXlGCrFTQfxXvEoyXWaWlQ9q1ixvZwcXPSloyvtdKCN0O6bMa
         2Ot7vSwbc/AfLaF0CZmOn/MOkPXkxonONHf33+BWD4FWQZGipfMRKRUgeYIZtOjuA/
         kFB9OHRZ4rBEp0odb+fUh5pliqYn97+zrRc8GSO173fynlsk0HK+/9ii0t8DaWJMTw
         F5/Mat4ypE4ww==
Date:   Thu, 19 May 2022 23:35:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        jonathanh@nvidia.com, kyarlagadda@nvidia.com, ldewangan@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, rgumasta@nvidia.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, nathan@kernel.org,
        dan.carpenter@oracle.com
Subject: Re: [PATCH v2 0/2] Fix uninitialized variable usage in Tegra GPCDMA
Message-ID: <YoaG4tFAO1/DRR5k@matsya>
References: <20220426101913.43335-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426101913.43335-1-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26-04-22, 15:49, Akhil R wrote:
> Initialize uninitialized variable and remove unused switch case
> in tegra186-gpcdma driver.

Applied, thanks

-- 
~Vinod
