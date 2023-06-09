Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B5DC7EE2E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 15:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241986AbjFIP4k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241982AbjFIP4j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 11:56:39 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCBF3589;
        Fri,  9 Jun 2023 08:56:37 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686326196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KIUV9oosXC8jjvfEYxY8IasPYL8JpSb2etfKbNzqL34=;
        b=OdihSM55AMXY8dGzzEXFSMzV1PEUNm+dWoftPbA1JsWdv0ePhFvkFR8kmOWVvyStEnM7lG
        hvqZtrHeltbGkW0vFgzrBr8LcAw/oFnmOUrw6q/gAt781lilFcknOQQK3jJtsqgeQ6nbQX
        a4f+GR/FSgE2Hv8E7H9ba8utocAw2CWgoaorn9JqCz3r+4SiFS7YXQkDk5aPnMF2gTWRQ0
        98Bb4S2uNowOmIN2UZ/1N46RlbP5LHGhEu3tmZpQuMHyDEKol5RB5SxpC5rZ14gQwN+luK
        o350VwMvoDH6kX3irkqWBV1bR3nxfSLYn8/eMqG3tTrEZbX7uMfDJRXGMprlaQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEF0F1C000B;
        Fri,  9 Jun 2023 15:56:34 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-tegra@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] Small of/device cleanup
Date:   Fri,  9 Jun 2023 17:56:32 +0200
Message-Id: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
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

