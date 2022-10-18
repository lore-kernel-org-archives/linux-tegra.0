Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F995C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Oct 2022 09:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiJRJDT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Oct 2022 05:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiJRJDF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Oct 2022 05:03:05 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636DFAA37C
        for <linux-tegra@vger.kernel.org>; Tue, 18 Oct 2022 02:02:55 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D3FAA240016;
        Tue, 18 Oct 2022 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1666083773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gHdFupziOKUo3PG7MT79bQw/IiggQbS86fhoDFJH6hc=;
        b=dxe+8PXmLWKqZe2LkteuMGDuvtOG5zqwpNsYyPyHZh/7h9Cr8czfA9dA5ePSApAneympoW
        obsrb+ni3kKnj88KqkPNhjnYHHdFsGdg1xXnwnjx7aFjHMPpqnyH0afXBTDQGL2xGc5x3K
        vjp2Fhi7XWJeApf7ZyBO7rjD4v7c8l1zmEjDxJJv493YSNbQtTbQpcAmani8CwIOaygYYd
        fhb9IMORlRVd0F/WAc0eN4Ryx2q+YxfJ1CVPuNgcpeHEq3hwxaARkFzUE/pTY20aH9nDT7
        pR0IYGS039Ai0ClyxfgyuwBDBRPpXx2IPcUopsitLwk9FEIRbmJU4y1WP2Sl/A==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>, stefan@agner.ch,
        dev@lynxeye.de, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-tegra@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH -next] mtd: rawnand: Fix PM disable depth imbalance in tegra_nand_probe
Date:   Tue, 18 Oct 2022 11:02:51 +0200
Message-Id: <20221018090251.393882-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926084456.98160-1-zhangqilong3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3ada71310d2c68eebb57772df6bb1f5f033ae802'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 2022-09-26 at 08:44:56 UTC, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes:d7d9f8ec77fe9 ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
