Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77D4C7618B
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Mar 2023 07:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCMH6G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Mar 2023 03:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjCMH5N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Mar 2023 03:57:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF7E2A14B
        for <linux-tegra@vger.kernel.org>; Mon, 13 Mar 2023 00:55:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbd0x-0001j6-AO; Mon, 13 Mar 2023 08:54:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbd0v-003naX-CF; Mon, 13 Mar 2023 08:54:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbd0u-004TOX-OE; Mon, 13 Mar 2023 08:54:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/5] clocksource: Convert to platform remove callback returning void
Date:   Mon, 13 Mar 2023 08:54:25 +0100
Message-Id: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yo4yph09zji6jUBdgrKcMoe7RCLM6ePyFNEQRE1Mono=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDtajP8HGpAMePs0ZnmVVLrhvd2sv+Tnd0xIxZ h0sy6J4bKqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA7WowAKCRDB/BR4rcrs CQpTB/0fklJTJiJcfqJgvfdMQaem2ZxZR/Gmruv90hj1UT6nMcstF5G68Btu/eTP7TWwYq4sQUs RhljjMAO/qioqNZL3bO8aZDgzlb8NOg22O3ggXg9+AkMkbm4fWlRWbGHlX/E3vCL/YsMugy2ffl lxg69QN0jZOfEu09mORB9tvbXwbeKHR4H/yvgpowCtiE6JqUF7otxDaQh7A6c4UOyblpQvdCjci WuP6O2hg9hRQjUn/qy4UObfEXeTYzdC1/sGxz9dXHeJU/o2WFu02wv/ggy/vN8ae+zAp6tJ2DNy mTQdLEGJjf23EV9BCefhUQkalSThsZgl3qSWStQbsGdGslP3
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

this patch series adapts the platform drivers below drivers/clk
to use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak.

Most clocksource drivers are not supposed to be removed. Two drivers are
adapted here to actually prevent removal. One driver is fixed not to
return an error code in .remove() and then the two remaining drivers
with a remove callback are trivially converted to .remove_new().

Best regards
Uwe

Uwe Kleine-König (5):
  clocksource: sh_mtu2: Mark driver as non-removable
  clocksource: timer-stm32-lp: Mark driver as non-removable
  clocksource: timer-ti-dm: Improve error message in .remove
  clocksource: timer-tegra186: Convert to platform remove callback
    returning void
  clocksource: timer-ti-dm: Convert to platform remove callback
    returning void

 drivers/clocksource/sh_mtu2.c        | 7 +------
 drivers/clocksource/timer-stm32-lp.c | 7 +------
 drivers/clocksource/timer-tegra186.c | 6 ++----
 drivers/clocksource/timer-ti-dm.c    | 7 ++++---
 4 files changed, 8 insertions(+), 19 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

