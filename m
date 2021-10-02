Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65009C433F5
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4900061AF8
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhJBXhg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 19:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbhJBXhg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 19:37:36 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4E7C061714;
        Sat,  2 Oct 2021 16:35:47 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m14-20020a05600c3b0e00b0030d4dffd04fso4227116wms.3;
        Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJLRmXvXpDieM9p4IfNVMQWSXUi92X3nPkKdYWz2iRk=;
        b=dqFnPfjdfHWAMnleVoj0KScKX7p6/vhlBE0vXQN+6NwMhtmaEv42mDcebtV3Ndu/S3
         9pPGZ6WfSTA2JPmzncn9GHuxu6Yz2bq28ZlAWZrWo43lQx9GBGjrpE3crdMAqa/zu44P
         1S/JGe18EUfEY5fMzJOeX2Qpfs2ylzPOOJ74x4zogblZcp6GBKDrikJHNSDum9nqnROC
         HMV6dsBbMZ04RN445ChK04TwuAs0squOIhJxHRnuW95EIQ4VYdZS1vLm4jWFLaAWqluW
         8evW1OWhU6fm0sAQVvx//7a47psS/mPs4C2di/N1fcz8Wi+MMSIBQYFJlQv5rLxYMCA8
         JwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJLRmXvXpDieM9p4IfNVMQWSXUi92X3nPkKdYWz2iRk=;
        b=NJwqR64c8V7/tsI6r7dL5SRMLP3sRFfXx/3zFrRZUR7G+5lGsqNOQN6xVRvh6LCD/D
         NvY3gZ5itwTCPsVGWljBRIAJ6BONWB6AFNoSl45SAfDIYR21eso1oBdinrijxHlk5umN
         nNreEpXbd8owapjPY1+4X2oyQxa6H9IeSDIzavI2P/nkDdnOJ2ZQj9tWKhxZxfc1g6Vu
         ED9OQZCywmXlsAOGxy0sr4yc2DC+SEdjxvNPF0IuAxizNqia3N9tStmZIMrQL1ce2Jqm
         voWIlN4pYXXbvzZCmdsoRhxRzuiO5apmADlcGmqywiBO2e3pHIdPvx3acZZpQDY0dN0f
         YzRQ==
X-Gm-Message-State: AOAM530+85VbOQJCVLCGEdX/R5zW5Zt99RGl5T2Qn4VW7pZKeJrzM80/
        bL1MITvoG5fuFOlC+PqVT7YvdoFLUm8=
X-Google-Smtp-Source: ABdhPJxqno/bpAL3KvAxFuikauLNUkQ2rUI2693qHcvKv693EkSXRaxLRuM/BKXaUwl+PCc9NCxDgQ==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr11144158wmh.58.1633217746229;
        Sat, 02 Oct 2021 16:35:46 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:35:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
Date:   Sun,  3 Oct 2021 02:34:42 +0300
Message-Id: <20211002233447.1105-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds couple improvements to the TC358768 DSI bridge driver,
enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
ASUS Transformer TF700T tablet, which is ready for upstream kernel and
display panel support is the biggest missing part.

Dmitry Osipenko (5):
  drm/bridge: tc358768: Enable reference clock
  drm/bridge: tc358768: Support pulse mode
  drm/bridge: tc358768: Calculate video start delay
  drm/bridge: tc358768: Disable non-continuous clock mode
  drm/bridge: tc358768: Correct BTACNTRL1 programming

 drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 23 deletions(-)

-- 
2.32.0

