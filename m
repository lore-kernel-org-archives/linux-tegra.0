Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358FBC2B9F7
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 09:03:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B8B61408
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 09:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbhEZJEu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 May 2021 05:04:50 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38233 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbhEZJEi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 May 2021 05:04:38 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3ED6410000D;
        Wed, 26 May 2021 09:03:04 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Michael Walle <michael@walle.cc>
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Fix freeing of otp_info buffer
Date:   Wed, 26 May 2021 11:03:04 +0200
Message-Id: <20210526090304.180839-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518185503.162787-1-jonathanh@nvidia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bc8e157fdb466536557b97b6c0df6d7b46a2b91b'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 2021-05-18 at 18:55:03 UTC, Jon Hunter wrote:
> Commit 4b361cfa8624 ("mtd: core: add OTP nvmem provider support") is
> causing the following panic ...
> 
>  ------------[ cut here ]------------
>  kernel BUG at /local/workdir/tegra/linux_next/kernel/mm/slab.c:2730!
>  Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>  Modules linked in:
>  CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc2-next-20210518 #1
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  PC is at ___cache_free+0x3f8/0x51c
>  ...
>  [<c029bb1c>] (___cache_free) from [<c029c658>] (kfree+0xac/0x1bc)
>  [<c029c658>] (kfree) from [<c06da094>] (mtd_otp_size+0xc4/0x108)
>  [<c06da094>] (mtd_otp_size) from [<c06dc864>] (mtd_device_parse_register+0xe4/0x2b4)
>  [<c06dc864>] (mtd_device_parse_register) from [<c06e3ccc>] (spi_nor_probe+0x210/0x2c0)
>  [<c06e3ccc>] (spi_nor_probe) from [<c06e9578>] (spi_probe+0x88/0xac)
>  [<c06e9578>] (spi_probe) from [<c066891c>] (really_probe+0x214/0x3a4)
>  [<c066891c>] (really_probe) from [<c0668b14>] (driver_probe_device+0x68/0xc0)
>  [<c0668b14>] (driver_probe_device) from [<c0666cf8>] (bus_for_each_drv+0x5c/0xbc)
>  [<c0666cf8>] (bus_for_each_drv) from [<c0668694>] (__device_attach+0xe4/0x150)
>  [<c0668694>] (__device_attach) from [<c06679e0>] (bus_probe_device+0x84/0x8c)
>  [<c06679e0>] (bus_probe_device) from [<c06657f8>] (device_add+0x48c/0x868)
>  [<c06657f8>] (device_add) from [<c06eb784>] (spi_add_device+0xa0/0x168)
>  [<c06eb784>] (spi_add_device) from [<c06ec9a8>] (spi_register_controller+0x8b8/0xb38)
>  [<c06ec9a8>] (spi_register_controller) from [<c06ecc3c>] (devm_spi_register_controller+0x14/0x50)
>  [<c06ecc3c>] (devm_spi_register_controller) from [<c06f0510>] (tegra_spi_probe+0x33c/0x450)
>  [<c06f0510>] (tegra_spi_probe) from [<c066abec>] (platform_probe+0x5c/0xb8)
>  [<c066abec>] (platform_probe) from [<c066891c>] (really_probe+0x214/0x3a4)
>  [<c066891c>] (really_probe) from [<c0668b14>] (driver_probe_device+0x68/0xc0)
>  [<c0668b14>] (driver_probe_device) from [<c0668e30>] (device_driver_attach+0x58/0x60)
>  [<c0668e30>] (device_driver_attach) from [<c0668eb8>] (__driver_attach+0x80/0xc8)
>  [<c0668eb8>] (__driver_attach) from [<c0666c48>] (bus_for_each_dev+0x78/0xb8)
>  [<c0666c48>] (bus_for_each_dev) from [<c0667c44>] (bus_add_driver+0x164/0x1e8)
>  [<c0667c44>] (bus_add_driver) from [<c066997c>] (driver_register+0x7c/0x114)
>  [<c066997c>] (driver_register) from [<c010223c>] (do_one_initcall+0x50/0x2b0)
>  [<c010223c>] (do_one_initcall) from [<c11011f0>] (kernel_init_freeable+0x1a8/0x1fc)
>  [<c11011f0>] (kernel_init_freeable) from [<c0c09190>] (kernel_init+0x8/0x118)
>  [<c0c09190>] (kernel_init) from [<c01001b0>] (ret_from_fork+0x14/0x24)
>  ...
>  ---[ end trace 0f652dd222de75d7 ]---
> 
> In the function mtd_otp_size() a buffer is allocated by calling
> kmalloc() and a pointer to the buffer is stored in a variable 'info'.
> The pointer 'info' may then be incremented depending on the length
> returned from mtd_get_user/fact_prot_info(). If 'info' is incremented,
> when kfree() is called to free the buffer the above panic occurs because
> we are no longer passing the original address of the buffer allocated.
> Fix this by indexing through the buffer allocated to avoid incrementing
> the pointer.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
