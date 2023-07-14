Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F5DEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 19:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbjGNTfB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbjGNTfB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 15:35:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D504F12D;
        Fri, 14 Jul 2023 12:34:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67D0261DDB;
        Fri, 14 Jul 2023 19:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64C0C433C7;
        Fri, 14 Jul 2023 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689363298;
        bh=coJii5owjJT4psrykdkd2QZrVS8+72vCzDQtZKFwADs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Qs69AsxFTwxe7qQ9dAN1lLk532XZRcYbAlVYzjJD+j6L1k2cgP+nY21n8aKZ/xTqS
         yIrUprT1gUdZd5+myyllx4fx2LY801n9XsQj9jB0Xv4vn8U95LkUyBsE6DQWUrtcaE
         cfWcbUB5eykdGbpqw4cHUdzJkS423d39ApYdkQM2geD7Cl1DiHsuJmQNe5wuUVJIHF
         ch+4A8vSG8vDxjMHCWdQ6oUXXQU5MBV0YIJS2gmEazA5YA3Y9sECSsM9D/DQ9+UYVp
         V2VJbU8B0GRWLR4kA9/sBvV9Vu1sSV0YAreNqw0cWVX2eephIXifBN2sFYL8qEMnfH
         sV5wF6scpfxDA==
Message-ID: <dce45b56-2b2b-850b-e5b6-fdc98cfa04ee@kernel.org>
Date:   Fri, 14 Jul 2023 14:34:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] firmware: Explicitly include correct DT includes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230714174438.4054854-1-robh@kernel.org>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230714174438.4054854-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 7/14/23 12:44, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/firmware/arm_scmi/driver.c | 4 ++--
>   drivers/firmware/imx/imx-dsp.c     | 1 -
>   drivers/firmware/imx/imx-scu-irq.c | 1 +
>   drivers/firmware/imx/imx-scu.c     | 1 +
>   drivers/firmware/mtk-adsp-ipc.c    | 1 -
>   drivers/firmware/raspberrypi.c     | 1 +
>   drivers/firmware/scpi_pm_domain.c  | 3 ++-
>   drivers/firmware/stratix10-rsu.c   | 1 -

For stratix10-rsu.c, Acked-by: Dinh Nguyen <dinguyen@kernel.org>
