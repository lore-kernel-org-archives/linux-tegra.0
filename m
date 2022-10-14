Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586AFC43217
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Oct 2022 14:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbiJNORq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Oct 2022 10:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiJNORl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Oct 2022 10:17:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE28D1D4DFB;
        Fri, 14 Oct 2022 07:17:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB81161B68;
        Fri, 14 Oct 2022 14:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B089C433D7;
        Fri, 14 Oct 2022 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665757048;
        bh=JblJP1Zh7eF0jAlB1IozIAlJRPymzFVB/vcSplHa0C8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nQ0srsLbX9fWWom/e+5249nsK7b7B6vnRPMA/2ri2Y7sxY4NTJdiiN1yRLoDEzb/Z
         yM+437kfjpdD5hBXV4x2Awn2lo/WxXDrzDnYiiV5l7C1bnwHbZCXKNFb81BWbGvZqg
         cjm21dtE8oQDXLMvHybfjWxsOmnTnSAvRNWIv553xZ8Lvxzbw2/qZrAeKcH4qonvnr
         WymE8GWkd11pz/Als463rbWbLsTEimjeh2cHKB+7h9rTgh1F+uZk7HN9iQJA1J0zfj
         abevo1lc3X20TGyc7O9yUSBc8KaaqUIRltMTiI9X1dPQYywM1LEvKNaEBbRMnPwW3O
         O4Lgso4eYl5Pw==
Date:   Fri, 14 Oct 2022 16:17:21 +0200
From:   Lorenzo Pieralisi <lpieralisi@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Besar Wicaksono <bwicaksono@nvidia.com>, rafael@kernel.org,
        lenb@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        linux-tegra@vger.kernel.org, treding@nvidia.com,
        jonathanh@nvidia.com, vsethi@nvidia.com,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ACPI: ARM Performance Monitoring Unit Table (APMT)
 initial support
Message-ID: <Y0lvcXocC33TOdFq@lpieralisi>
References: <20220929002834.32664-1-bwicaksono@nvidia.com>
 <20221014105938.fyy6jns5fsu5xd7q@bogus>
 <Y0lu5Vqs8pVeAfwR@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0lu5Vqs8pVeAfwR@lpieralisi>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 14, 2022 at 04:15:01PM +0200, Lorenzo Pieralisi wrote:

[...]

> This also requires Rafael's review - at least to acknowledge the
> change.

Never mind, Rafael has already acked it, so we just need to get
it queued.

Lorenzo
