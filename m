Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC126C5517A
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 14:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6383B221FA
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 14:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DvX+YFq0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731128AbgKEOwS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 09:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731074AbgKEOwR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 09:52:17 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB1EC0613CF
        for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2020 06:52:17 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h22so1891980wmb.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2020 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7qK4vXzf9k749HbSw+NxCxzFALmYv20LEPAyeYzlRJg=;
        b=DvX+YFq0boewLykq+SRnhh+o0RblVNOCxqwRFP2HW2CfK8Pmx+3clePTBNvWOqiAlo
         6iifsKbFhESVU9JX1Qr5PP3j4dk/WVzjt2wT3rOzCJxtGSfqG4Eydl0yANYEeFhEgO6X
         h8na7H0n4q2V40frBQtsO3lUoXDLl2yfMTqiTyiX7pzXyTwkHKZkku74oLaqgrThJGFI
         ledlIjIxUT9uBm0nugUaAnD4Lpvzr7y5LnZsQUsg+h/5H3vPdpeq59M69qrP+c8tT58U
         62w8Eo6U3pbROKNyR3Mk6PqEF6d3dXVYNVkzALqqNEz84J82wk3bz83cXzHDm8kHLD1f
         qtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7qK4vXzf9k749HbSw+NxCxzFALmYv20LEPAyeYzlRJg=;
        b=eYOILpmfu9TUTroCn9lRTczmmtoA/tFAIyunRM0fB7D1wau7Rb/CLoH14tB3/7ny97
         2SFLf1bCbwCLCDed+OxHW3I92DY2Ivw1MY6Xr31MtWFJArdVuR9qx0iGZVnSG2llHxF6
         L/yOkBNAHiOHOxb9Bo8yR/opEHPp+uHaxfJ0QmwQwCRWMXMR7qWQh49oL8fBniTE0XOz
         s1pCrBBWT0WnyaCPUoTciZ+kzzkcIibP5AH87/YmCsQP+028ajVg8nAqBrL446DVWMAM
         l/giYdArvQMPVX3bdHlbdnM/bxHV9ea4RP69CNluN0YIfT+sCLvetpy3I43d9F+/Qald
         HwnA==
X-Gm-Message-State: AOAM533tijgIljXIqN2iP/SeQCHM2+OcUZ62x2NDtr9esqNAgnqwGcyL
        MaLN7L97lMDJurgOi/03tPJPjQ==
X-Google-Smtp-Source: ABdhPJxI3Hz+xthd1AooFfZRJiYYpYQ7WvLLajU3VZosa9/ukoyhZuoZL8CZ36qLvtZ38khO9VAoCA==
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr3136449wmf.122.1604587935853;
        Thu, 05 Nov 2020 06:52:15 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:15 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/19] gpu: host1x: bus: Add missing description for 'driver'
Date:   Thu,  5 Nov 2020 14:44:59 +0000
Message-Id: <20201105144517.1826692-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/host1x/bus.c:40: warning: Function parameter or member 'driver' not described in 'host1x_subdev_add'

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/host1x/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index e201f62d62c0c..347fb962b6c93 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -32,6 +32,7 @@ struct host1x_subdev {
 /**
  * host1x_subdev_add() - add a new subdevice with an associated device node
  * @device: host1x device to add the subdevice to
+ * @driver: host1x driver containing the subdevices
  * @np: device node
  */
 static int host1x_subdev_add(struct host1x_device *device,
-- 
2.25.1

