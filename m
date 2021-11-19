Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F87EC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 18:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D1D61A58
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 18:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234482AbhKSSgX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 13:36:23 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:36409 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbhKSSgX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 13:36:23 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8DFF0200004;
        Fri, 19 Nov 2021 18:33:17 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd: dataflash: Add device-tree SPI IDs
Date:   Fri, 19 Nov 2021 19:33:16 +0100
Message-Id: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211115113655.237785-1-jonathanh@nvidia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b5ceec8074eb6dc015a8d5fa04706bc4c3cbbe55'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 2021-11-15 at 11:36:55 UTC, Jon Hunter wrote:
> Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
> compatible") added a test to check that every SPI driver has a
> spi_device_id for each DT compatiable string defined by the driver
> and warns if the spi_device_id is missing. The spi_device_ids are
> missing for the dataflash driver and the following warnings are now
> seen.
> 
>  WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
>  WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash
> 
> Fix this by adding the necessary spi_device_ids.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
