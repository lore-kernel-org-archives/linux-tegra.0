Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF3C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242896AbhLIR3j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbhLIR3j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:39 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D44C0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j3so10998024wrp.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CqmeljCsaHRRfSCLYZtSqKe0mpkNe+/a7pjyS18sDo=;
        b=ddx03jKQIwjLXHlvtM6fR4uSgZLZE7LFIbb/3crAxummiCH0RHbW/GxzL0goiEjiCP
         vzXzrdfN6IqtugbLMB8ytGJm5A26rcfPwH577LUtpCmj1D/DCooLZ9ALx4x7hwrnT2TF
         xOu+KohkZy1JLjC351souVmsTWUjCgMszNb1gljOK6FdmD9ED7PJBTCyX/kj6/arV1SJ
         u+wfNo0xTGVl4TkBoiKNueZIqIl6hry3eKYYxLS7A0hSfARzkasmYmhdOEoOlCcdWyvx
         fUwT9atkjCJgh9RgoAy/WmA2lk9TFpwegqoEGcmx2bYyceBFLi+3+gb5mO+/atduyYD4
         M6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CqmeljCsaHRRfSCLYZtSqKe0mpkNe+/a7pjyS18sDo=;
        b=UcdvPvoZKZLK2YmY8C4dbdfdf9j5hR9cjuOxMEKgCNn9Sn+nG1pTItN7A6aA40T0qx
         2bwwur4NWof4XZUEW6jaU5zaTsDUqFa7q5VeCpZypFMjOApWlY9bLcUYk8OpE25hpqDr
         MVMduhohCB6EKdWCUY6jMhRkpyQIDMmb59q3mLdXKFXfoS0hcZSO95aZWFwOcjZy2DTr
         p6/+pKzov0T+hviS3asqVm5hzzXnV+rGS/NrVhzZcuy81P83Va1Y3pKpXyIK6+UwOOUV
         XLkC/s7yuKJcurC+g0rT1MKIC3K4TI2YV8c0+trlPYCu4Ae9mepLocLeW8yu+WByJZGO
         Vpcg==
X-Gm-Message-State: AOAM5307qeS40oNmlYafnkWN7AEpNEsI9zQ7mNHQdarumd2ZBa9WYfN8
        7vmtNk1WzqByc3NNKb1JFJQR2sbxdWuVSg==
X-Google-Smtp-Source: ABdhPJx2hVt0olWYg35rlU2uLFNBUK2zn2S6NcOug4PPFkCIwLdH9jNCyjInr7nO8wJvkB2/e6VEdA==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr7761581wrs.273.1639070763566;
        Thu, 09 Dec 2021 09:26:03 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b14sm441673wrd.24.2021.12.09.09.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 23/30] arm64: tegra: Rename GPIO hog nodes to match schema
Date:   Thu,  9 Dec 2021 18:24:56 +0100
Message-Id: <20211209172503.617716-24-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

GPIO hog nodes must have a "hog-" prefix or "-hog" suffix according to
the DT schema. Rename all such nodes to allow validation to pass.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 5cfbc0394173..10347b6e6e84 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1383,7 +1383,7 @@ gpio5_6_7 {
 				};
 			};
 
-			gpio@0 {
+			hog-0 {
 				gpio-hog;
 				output-high;
 				gpios = <2 GPIO_ACTIVE_HIGH>,
-- 
2.34.1

