Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498D2CA0ECA
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Sep 2023 10:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbjILKhD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Sep 2023 06:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbjILKgw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Sep 2023 06:36:52 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49D42D4B
        for <linux-tegra@vger.kernel.org>; Tue, 12 Sep 2023 03:35:31 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6043BC0006;
        Tue, 12 Sep 2023 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1694514930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PfNKUEe1V8KEfVBvwqyAc2BJuRiSsvuYo2fkPdeAuyE=;
        b=NLMouHSTBIAOeOHMgnmjPhhBBPCzQwTzrjQN03cYB4UQihuzTlgc8C781HPPx2gabnznG0
        FCUTIq+F+ICFMDQoGsOfch7Nx33YpYd9je+4DbXzpN54iIy4gIuCMesViV2RVP4MMR1bbL
        x9q3cDzm4Vz/v9Uu2ltIdjHKcp3Zv/27DbzZQhS6npFznhsDY5NhoIEazKefY/M7S07uga
        y6/+LHjoaNjIDEzsUR8FYmQjpe1C4wrf4BtFzVgy4BpA9zRh7wBn2W4Y2GU5l7jFV0fBFn
        GoXPg1dtvsQ/y1yqZjLq8hAZmS+VEV/6WRS8Vyhc9m6amPTk7PFkHRKzEyEEPw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Yi Yang <yiyang13@huawei.com>, stefan@agner.ch, dev@lynxeye.de,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: add missing check for platform_get_irq()
Date:   Tue, 12 Sep 2023 12:35:28 +0200
Message-Id: <20230912103528.936288-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821084046.217025-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0a1166c27d4e53186e6bf9147ea6db9cd1d65847'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 2023-08-21 at 08:40:46 UTC, Yi Yang wrote:
> Add the missing check for platform_get_irq() and return error code
> if it fails.
> 
> Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
