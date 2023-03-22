Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388C1C6FD1C
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 12:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjCVMKx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 08:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCVMKw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 08:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7891D5DCB3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679487007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hZCSBOFZs4bkOWaMU96a/OIFoJth3tDCdyrQdmx4OyE=;
        b=TjPl9ny8M8Rr8soHQ6GUfisxAf7KXxzy8Ujb7o6glbQMB+cq4XZTiFJpjzNPO6TuxIcxY4
        ZdBlKi0R2LwunekZTlh43ysuaBQym43nRIuFHvLdZRVKHhfgq6qCf4VSof3uNtr60wJEPl
        wsSaaC/wysYtUgcoe6vGJiJphEUv8dw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-HYPjLWZpOWeilNxLmH8v9w-1; Wed, 22 Mar 2023 08:10:06 -0400
X-MC-Unique: HYPjLWZpOWeilNxLmH8v9w-1
Received: by mail-qv1-f69.google.com with SMTP id c15-20020a056214070f00b005bb308e7c12so8031732qvz.19
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 05:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZCSBOFZs4bkOWaMU96a/OIFoJth3tDCdyrQdmx4OyE=;
        b=UxhQjb3KhgMTmzwbs9xukvpcb7Hqz32vO18SVYAt25/Xeet7qQKsKIBL/loD4VP1M+
         O2x+/jJLIPSeXx7EFCw2qc3xxuSfzADX03vq8S/JFKFe7oQcKRPwnt/Foafaoqs0uvPs
         d7UGmYTUls0hiG3JkAQXHDCEEHr/oPSKGcbqqkqji/L0PXX4WWDbfSy8Sm1WzEBV31rW
         NkSHZ0GNAAAN0Yt/KhbADVT7KuEvE1FvFqxFqptg6Kl/wohRjI6LIXyiSdwGRo+WeoZw
         peuB5n+9tben2TzV+5SdQ4vDMSxxaCAvxcbdd7BwFFdYWngay1axcdP7E3pFyX3fPnVA
         7s6A==
X-Gm-Message-State: AO0yUKWX3xjDTp31HKDvb0lhN3qSP5O2eVAD4A5xuc9t7HZOqClRA1KM
        Argw2yIFbCILBV6L4+KMP9WieOF8NPb1m4s8KfbJkmvSHNRgAiTMVidD4juqW8p0FEE5SFrQa05
        c6dhOuHYXTFeLnFXgKXl4u8k=
X-Received: by 2002:a05:622a:1354:b0:3bf:dc7d:2221 with SMTP id w20-20020a05622a135400b003bfdc7d2221mr5538834qtk.47.1679487006015;
        Wed, 22 Mar 2023 05:10:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set9kJIiglNnHWmwnAgvPqP7BHrdzvpjmZvpPWl/1axq5Z7bYHV045R+cDjo20tgQiJGFKa42Xw==
X-Received: by 2002:a05:622a:1354:b0:3bf:dc7d:2221 with SMTP id w20-20020a05622a135400b003bfdc7d2221mr5538790qtk.47.1679487005680;
        Wed, 22 Mar 2023 05:10:05 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id b17-20020ac86791000000b003b9bb59543fsm9757855qtp.61.2023.03.22.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:10:05 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     ldewangan@nvidia.com, jonathanh@nvidia.com, vkoul@kernel.org,
        thierry.reding@gmail.com, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] dmaengine: tegra-apb: remove unused tdma_read function
Date:   Wed, 22 Mar 2023 08:10:01 -0400
Message-Id: <20230322121001.2569909-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

clang with W=1 reports
drivers/dma/tegra20-apb-dma.c:236:19: error: unused function
  'tdma_read' [-Werror,-Wunused-function]
static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/dma/tegra20-apb-dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index eaafcbe4ca94..cc6b91f48979 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -233,11 +233,6 @@ static inline void tdma_write(struct tegra_dma *tdma, u32 reg, u32 val)
 	writel(val, tdma->base_addr + reg);
 }
 
-static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
-{
-	return readl(tdma->base_addr + reg);
-}
-
 static inline void tdc_write(struct tegra_dma_channel *tdc,
 			     u32 reg, u32 val)
 {
-- 
2.27.0

