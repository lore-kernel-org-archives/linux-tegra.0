Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F3EC433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1072E613D5
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242887AbhDPOiZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244243AbhDPOiP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D36C06175F
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id v6so41184249ejo.6
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=61oKXxvl+24t+oBgcuj4NfG+vBqO/3mKOMoXwskYVGU=;
        b=X4BXqdfG23NXa84B1Vlw8fBJx1H23dD737fq31AW5KzaRwv5QkDL16paKDhgU1wF8W
         GOL7iCorZFDYIS0EemuA5lDQa4FHfNL/wr/A1E0/ig2HuqDN7oxizMG/QdnscB4oBsDP
         5WIgMUlhpojZQs9TK06RF1Nrwj9zyQTJbO8BI0VWmYwcphGIQsks2Bps/emwiy+CH/Wk
         o67Nj1MfKAlRF3jncWbu3AUTyN36ebEjkndRCtA6nkAWNOFo5+SKbfsQIh4rpmjt6Dow
         F6NMyDFABd2NhOpbIqURgxg4QjDROUlAYJxrkg3GXO/KZ9XSpWXilAKay+z0Aj7Zc9lU
         0d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=61oKXxvl+24t+oBgcuj4NfG+vBqO/3mKOMoXwskYVGU=;
        b=VidBst+pJq3pRRQsamDdgYGBp37HB0byYYBeHEDp9f9VP1p+MmeNugSO3mw3B7/8fI
         4nRTlGBVbz0hHY/lGqHZAQqHNN2UixKjD5kzJVaIsxB6J2ZLvS0W6eZOUKylYvEoTJkC
         kbqyiNViWBVrcJeHYw2n0mNsLZ6/EmoPZqoDE5u1oznAtTdNFNf3qwnGwD3oeHV2ly+n
         9EzgeSyU2/8/oojNsmYtCHQE4VKbMJ91LTZr+SdJb99ujKMdA48agTrSqoCO1UgbziOt
         UrHfaWAQj7WnxD9RyY7o/RF9XFNxUTK25i/lBcChaPSFpoDkrvAuB4p6GukXMWwvEk9Y
         yk7Q==
X-Gm-Message-State: AOAM532XLHS6jM4tceWqoE25Cq5RI66pvxk4T9xd5wqLucXHaEJhHEYR
        nA5ilb8kqc8zNcwN6w2IagtBjpZp/sZQlA==
X-Google-Smtp-Source: ABdhPJxfs0dO3k/tSuzZR0zH09FpnzlHYRFLRl3kEj7fOswxtkCOFLd/lE/Wsujn8Z016ric4zI1mQ==
X-Received: by 2002:a17:906:9bd3:: with SMTP id de19mr8318214ejc.329.1618583868141;
        Fri, 16 Apr 2021 07:37:48 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:47 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 17/40] gpu: host1x: bus: Remove superfluous param description 'key'
Date:   Fri, 16 Apr 2021 15:37:02 +0100
Message-Id: <20210416143725.2769053-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key' description in '__host1x_client_register'

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/host1x/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 218e3718fd68c..e293b68acc348 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -761,7 +761,6 @@ EXPORT_SYMBOL(host1x_client_exit);
 /**
  * __host1x_client_register() - register a host1x client
  * @client: host1x client
- * @key: lock class key for the client-specific mutex
  *
  * Registers a host1x client with each host1x controller instance. Note that
  * each client will only match their parent host1x controller and will only be
-- 
2.27.0

