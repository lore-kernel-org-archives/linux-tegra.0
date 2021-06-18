Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503ABC48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A5E761279
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhFRVOq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbhFRVOp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:14:45 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60EEC061574;
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z22so15748581ljh.8;
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wkkXxTmlk5LYdgcFdvpXCVgx4DIMcu0v6eYY7z5C8Yw=;
        b=tt6EC+ujkY6mnjxC+MBmyzCbJdqvW2oTHOteltYBNMziMd19qNh9hPIDgdrrJzEs4x
         d1Tcx+Ai8T3n7AzIBtj+kfioeSW1ZGzVmm2ktP7uGDOGykPjoFJwu+ZLaXlWPijo6nKJ
         Mnv2D7Ky/DW9XkFyyJLslXiGonRP6Kd3GgQzUQ6Ps4YCKdIRZSosigiz1OOHi3jpQYrh
         jlearcd0waupXvvMyAfGl06fcHrvtB7l3w06OHHBySIZFccWd1Ks5jVtLXnaVal1Ae9f
         qXyHQcRl/J6rBPW1gSwoeEiT/zLp4iWTxPv0AyMC3sGCJIrSQhksDN120mzOjDf/yj38
         HwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wkkXxTmlk5LYdgcFdvpXCVgx4DIMcu0v6eYY7z5C8Yw=;
        b=crk6MYdJ0KDqHW7+Y8eSNyCyTjAB0yombbsRIKDMZe048Bva2c1REMAKqhM9aHKGlJ
         AFVEwjhXTA78RJxP/PCd0lc4cOochf1MYjNSjlnjyR1fqXOSv4K3vZYsabBN3QBgl/Ql
         Vw9U53Oh/24R9SThW8hVtbb8JXd/jVCNWN6rqKlcmztkcO+gG7BWVTLo2MzAJhdgRvXg
         wRPr0Yp1nPu7tSobTQ9szsUQe0Y5s9iXj3XYlU0ZRRCTIAYTpa/TTWSiDa+BxuEhyWC7
         1m018+EyXwPH6XlIjxvxMaN0JlnKPTvXyPO/ZPAdiwLQAM9fRgJN0JMPOrMawnPsQcLr
         Hizw==
X-Gm-Message-State: AOAM5313frjPwVFVd7yGP8dzkUNcdUkeLlOKJ89zJMgo8onKp1xJL/0W
        pgoCUOpgps3LYCnEcIziJch6wNwi7Ps=
X-Google-Smtp-Source: ABdhPJxrM/5mp0WqaTc3A1Gs8rVHlOoX6nlu+7nX3oarQWvqKAd+Nzvxf26hU3bLBGYZJZqkabU8WA==
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr11313273lji.200.1624050753254;
        Fri, 18 Jun 2021 14:12:33 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id a8sm1183802ljq.127.2021.06.18.14.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:12:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/4] HWMON LM90 interrupt fixes and improvements
Date:   Sat, 19 Jun 2021 00:11:58 +0300
Message-Id: <20210618211202.2938-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series makes interrupt usable on NVIDIA Tegra devices, it also
switches LM90 driver to use hwmon_notify_event().

Dmitry Osipenko (4):
  hwmon: (lm90) Don't override interrupt trigger type
  hwmon: (lm90) Use hwmon_notify_event()
  hwmon: (lm90) Unmask hardware interrupt
  hwmon: (lm90) Disable interrupt on suspend

 drivers/hwmon/lm90.c | 79 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 13 deletions(-)

-- 
2.30.2

