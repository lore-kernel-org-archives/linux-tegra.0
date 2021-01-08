Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EFBC4332E
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 09:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 256FB23435
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 09:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbhAHJYE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 04:24:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10045 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbhAHJYD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 04:24:03 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DByL948DFzj5HQ;
        Fri,  8 Jan 2021 17:22:25 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:23:11 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] gpio: tegra186: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:23:55 +0800
Message-ID: <20210108092355.19228-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9500074b1f1b..05974b760796 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -647,7 +647,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.get_direction = tegra186_gpio_get_direction;
 	gpio->gpio.direction_input = tegra186_gpio_direction_input;
 	gpio->gpio.direction_output = tegra186_gpio_direction_output;
-	gpio->gpio.get = tegra186_gpio_get,
+	gpio->gpio.get = tegra186_gpio_get;
 	gpio->gpio.set = tegra186_gpio_set;
 	gpio->gpio.set_config = tegra186_gpio_set_config;
 	gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
-- 
2.22.0

