Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2D8C636D3
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Feb 2023 19:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjBGTT7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Feb 2023 14:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBGTT7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Feb 2023 14:19:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671532798F
        for <linux-tegra@vger.kernel.org>; Tue,  7 Feb 2023 11:19:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pPTVE-0008RO-Dk; Tue, 07 Feb 2023 20:19:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pPTV7-003Lv6-9E; Tue, 07 Feb 2023 20:19:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pPTV7-001ew5-M9; Tue, 07 Feb 2023 20:19:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     alsa-devel@alsa-project.org, kernel@pengutronix.de,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] ALSA: core: Make some functions return void
Date:   Tue,  7 Feb 2023 20:19:04 +0100
Message-Id: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fiHwx1QeMPt+DsYxhkk7Rh8I9hMhkeRIK9B2EQA/e1o=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4qQba27+3E/GrUTCtoY8yibTKJga/4v6pQi9yw9y 8kw05T+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KkGwAKCRDB/BR4rcrsCSE8B/ kB3nfLGneK7JgKBpkJOKm715kZQQMwmDYOvxE2w1QqfLmP6AizVyYscXzABq7ILR8Xvn+9/h9qV+T3 ijinLE8JYkwqFju+23tc63hZO/R2W2qsf+ktqWxUKhM7dtuCeN4k/rLBlxQosqp3Y2p15xbyVF8C7B o+n6nRReddxVoFQY8y39Ur2YlPP9tVYke+5oTGtDBp2+ZqCWQKShnKAB28Qlz4skEmLHud/nMyZ64n iZU//pEqdZ+gEUZ8QWhYb53qfmyx2vNA0epaqPcjdEx8byNHVz6xvRMNUt/kcj7NIOjfMqAZupVZAY mf7oYTZ0vibp7ftk9H6/st8cosaCe7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

while checking in which cases hda_tegra_remove() can return a non-zero value, I
found that actually cannot happen. This series makes the involved functions
return void to make this obvious.

This is a preparation for making platform_driver::remove return void, too.

Best regards
Uwe

Uwe Kleine-König (3):
  ALSA: core: Make snd_card_disconnect() return void
  ALSA: core: Make snd_card_free_when_closed() return void
  ALSA: core: Make snd_card_free() return void

 include/sound/core.h      |  6 +++---
 sound/core/init.c         | 40 ++++++++++++++-------------------------
 sound/pci/hda/hda_tegra.c |  6 ++----
 sound/ppc/snd_ps3.c       |  4 +---
 4 files changed, 20 insertions(+), 36 deletions(-)


base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
-- 
2.39.0

