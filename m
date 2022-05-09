Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F058BC41535
	for <linux-tegra@archiver.kernel.org>; Mon,  9 May 2022 09:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiEIJxC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 May 2022 05:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiEIJct (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 May 2022 05:32:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971A92218FC;
        Mon,  9 May 2022 02:28:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 258D6614BB;
        Mon,  9 May 2022 09:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15903C385AC;
        Mon,  9 May 2022 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652088530;
        bh=3iTqXEKUOS/eqYT5xmR3rSnyJdIWdYq46LxP+sQuJpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BICeC5sQ707kdEq4a9WRgFtwUBmZVnQYKm/9UM+6cbO0vwlKRG5+j1HUmWQxGhvfw
         D8LyU/SzBNjV6TJdWk78kSbPwmfUn1xn0b0HR3zGHswQVW20XU+tEiUbQtWoNQVdYa
         P++wJwIOoY/bJF2yq0JCQSjiVvhqh0FZZDHmFjtrRkFaShr9MGFQSjiLwSUq0bt8I8
         /6YuDD/d5N7kJvqV4J0fI7dD+r18NuUS4LFZoB1z4Qcap4s9PT5LagrOWQfSXZuXfo
         n1E4UXBFUKjpq5ei5sg/E6vouI2CBI57Ygh22zsXwKtrgp435QvoOx+mvwLKasSa6j
         0xoP6TZC6DCTQ==
Date:   Mon, 9 May 2022 10:28:44 +0100
From:   Will Deacon <will@kernel.org>
To:     Besar Wicaksono <bwicaksono@nvidia.com>
Cc:     catalin.marinas@arm.com, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sudeep.holla@arm.com,
        thanu.rangarajan@arm.com, Michael.Williams@arm.com,
        suzuki.poulose@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
        vsethi@nvidia.com
Subject: Re: [PATCH 0/2] perf: ARM CoreSight PMU support
Message-ID: <20220509092843.GB26264@willie-the-truck>
References: <20220509002810.12412-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509002810.12412-1-bwicaksono@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, May 08, 2022 at 07:28:08PM -0500, Besar Wicaksono wrote:
> Add driver support for ARM CoreSight PMU device and event attributes for NVIDIA
> implementation. The code is based on ARM Coresight PMU architecture and ACPI ARM
> Performance Monitoring Unit table (APMT) specification below:
>  * ARM Coresight PMU:
>         https://developer.arm.com/documentation/ihi0091/latest
>  * APMT: https://developer.arm.com/documentation/den0117/latest
> 
> Notes:
>  * There is a concern on the naming of the PMU device.
>    Currently the driver is probing "arm-coresight-pmu" device, however the APMT
>    spec supports different kinds of CoreSight PMU based implementation. So it is
>    open for discussion if the name can stay or a "generic" name is required.
>    Please see the following thread:
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2022-May/740485.html
> 
> Besar Wicaksono (2):
>   perf: coresight_pmu: Add support for ARM CoreSight PMU driver
>   perf: coresight_pmu: Add support for NVIDIA SCF and MCF attribute
> 
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/perf/Kconfig                          |    2 +
>  drivers/perf/Makefile                         |    1 +
>  drivers/perf/coresight_pmu/Kconfig            |   10 +
>  drivers/perf/coresight_pmu/Makefile           |    7 +
>  .../perf/coresight_pmu/arm_coresight_pmu.c    | 1317 +++++++++++++++++
>  .../perf/coresight_pmu/arm_coresight_pmu.h    |  147 ++
>  .../coresight_pmu/arm_coresight_pmu_nvidia.c  |  300 ++++
>  .../coresight_pmu/arm_coresight_pmu_nvidia.h  |   17 +
>  9 files changed, 1802 insertions(+)

How does this interact with all the stuff we have under
drivers/hwtracing/coresight/?

Will
