Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30626C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Apr 2022 14:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346881AbiDKOEx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346877AbiDKOEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Apr 2022 10:04:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B6C32059;
        Mon, 11 Apr 2022 07:02:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7084361261;
        Mon, 11 Apr 2022 14:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4651EC385A5;
        Mon, 11 Apr 2022 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649685757;
        bh=07v+3z10ECX0r1m3v8M8SiEwG2zIj0iVaYdwykpznMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JlA5SCAWYzQbSMHBj/qK5KVN3+Q+ZHhtCKmkBoLfvrTT6CR8ID+SNwq9B6ddfozrx
         MXaUI4kRm+NZHeByktiT+TjlnYes5kxyBJKa1/+Vsangc0YwzELM3FSYeHvzX17I38
         IrYUcTvUIwz8ZtTMLySJiRVsC02nl3Dmke220ftbbo0Tz4/W24+uWfAO4gmPhwL8tJ
         OV5AuiCY+Hk243rtFPJl5aXeN4mJJ+z6Uokd7O9WAnrmtL31ZxyMmaMRWQjEpNL6UH
         Jyxuv7DnpKDcRLKjdbfiD55c2zOIhZYPf+ykUVRz6JCVeBVw3WG2ciMmTCGd4FDv9H
         g9pM4XL08wUzg==
Date:   Mon, 11 Apr 2022 19:32:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        jonathanh@nvidia.com, kyarlagadda@nvidia.com, ldewangan@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, rgumasta@nvidia.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, nathan@kernel.org
Subject: Re: [PATCH v22 0/2] Add NVIDIA Tegra GPC-DMA driver
Message-ID: <YlQ0+fMIaoWJoi6p@matsya>
References: <20220225132044.14478-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225132044.14478-1-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-02-22, 18:50, Akhil R wrote:
> Add support for NVIDIA Tegra general purpose DMA driver for
> Tegra186 and Tegra194 platform.

Applied, thanks

-- 
~Vinod
