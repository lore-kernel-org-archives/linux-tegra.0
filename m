Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706D3EB64DA
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 21:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjFVVcV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 17:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjFVVcS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 17:32:18 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1BC1BDA;
        Thu, 22 Jun 2023 14:32:17 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687469536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=gI8+di2ZW7hiarP206gQ7pkYayhOYFiphXl+YOhjKug=;
        b=mn76xpPG5B4swl/xneRHROoUU2hzJOWfnoWgkO4Llr6pzI7Dl0lcOzROhlptFbO0F4r8Qw
        nlPAfWHisW9HLUhxFD+tAOF6l+vDNOB0h8zQQcKZ95RYdmwt4QPkaZsenB04KCZ6/mA9vP
        rX0WrVX9TmglJZHqSQ+jLMo+XKtdUmf/r/i3NnDrTxBIM1IPziS62wwo0E/+DNIqMCdeeU
        wj9GUr4cWcpEq+p5J0RA+XBe0urg8D1lX6NlRlD0WRmc+WOkukIMgUwc/LqsXc8xds7Bd9
        N+crD8M7Kb3UvaazD9QL4AYAEuUSV7VWlebSIXlI6MUryhx3TsEHROIWKcLrbw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 966C71BF204;
        Thu, 22 Jun 2023 21:32:14 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/2] Small of/device cleanup
Date:   Thu, 22 Jun 2023 23:32:12 +0200
Message-Id: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

My previous attempt to slightly clean the OF core wrt device structures
was rather unsuccessful as the idea behind the discussed cleanup was
more impacting than what I thought, leading to most of the previous
series to be dropped. However, aside, two patches seemed actually
relevant, so here they are, alone.

Link: https://lore.kernel.org/all/20230608184903.GA3200973-robh@kernel.org/

Thanks,
Miquèl

Changes in v3:
* Fixed the dev->parent referencing in the host1x driver.
* Collected Rob's Acked-by.

Changes in v2:
* Dropped all the of_device.h/of_module.h changes
* Directly used of_device_uevent() from the host1x driver


Miquel Raynal (2):
  of: module: Export of_device_uevent()
  gpu: host1x: Stop open-coding of_device_uevent()

 drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
 drivers/of/device.c      |  1 +
 2 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.34.1

