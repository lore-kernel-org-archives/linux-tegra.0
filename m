Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457A3C49EAB
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 00:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D5061AC0
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 00:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhF1AmW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhF1AmW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 20:42:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDA3C061574;
        Sun, 27 Jun 2021 17:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=vT5MOL85OD3uCD6pHmG/cA0FIka8DTN+aoVuSZv8xvY=; b=KC5xK9pp7yov9VZkLVaVvSpGzP
        tqgXnPO4xkgz8Xsx7O6Cb16vwx6GxBtu0rpa7F6DwV9lE1p74TyV9aDmF+SpLa38FmLHgp3K67SDl
        ykmb82F2M2iwaQtoegDWyH0RdADDBqe8Nl1WyHjA7M18j+jOHsjzYP1VMfAOUwUnKp6BV+qmf3SQP
        TcFsAfMcrI4fyxqOzTICIzywp2N0nwejD7UjU/fFz5FWNGqneAvG7k+cZ4SGZfgQ3d178AL4qcMHr
        L1BIL6Za1bapbvGXiVQVU0/yiQDcV8vg64EUwE/eRrIeQr/yrAxGCc1GG2VBCFKp2Tzz90jf7lYQL
        zZMMCizg==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxfJd-006MU1-5e; Mon, 28 Jun 2021 00:39:57 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] host1x: bus.c: drop excess kernel-doc entry @key
Date:   Sun, 27 Jun 2021 17:39:53 -0700
Message-Id: <20210628003953.5456-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix kernel-doc warning in host1x:

../drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key' description in '__host1x_client_register'

Fixes: 0cfe5a6e758f ("gpu: host1x: Split up client initalization and registration")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/host1x/bus.c |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20210625.orig/drivers/gpu/host1x/bus.c
+++ linux-next-20210625/drivers/gpu/host1x/bus.c
@@ -761,7 +761,6 @@ EXPORT_SYMBOL(host1x_client_exit);
 /**
  * __host1x_client_register() - register a host1x client
  * @client: host1x client
- * @key: lock class key for the client-specific mutex
  *
  * Registers a host1x client with each host1x controller instance. Note that
  * each client will only match their parent host1x controller and will only be
