Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63936C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D7256103C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbhKLMIy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhKLMIn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:43 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B067C061767;
        Fri, 12 Nov 2021 04:05:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so6605965wmd.1;
        Fri, 12 Nov 2021 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvmflS0p1AV4yRC5qHHwVEmvP4IwgGTcmBAOtxdyyHA=;
        b=CLIlCGTGslNGST3qbwJcewrSxe4dWULp547Y+Bc5kcMrIKRSA+P+1tJuMBWn07VJus
         pMHHRxqwz46rShgXLZSQrt7i2z+n/7cejveXdkKdQfkp8irt7sF5ePi4F1NPDT3uDQzg
         V2ILjGaxVJ55A0Ig44Rq/7bGZyObVgLcDd9bGbHubI/QB/A2AXePyeTjYVfjixhs+Jy4
         0ZGGUUvG0YbkwWRHhAm/EEYvrO+0rOOZ/ETCnKXFIpomig65ROu6roFmywlVW43n6JEy
         cZXO2WeppC0VMLhjWqOLHSgAyksa+RN9/ocNdYeODbyP/9cfH89xXFO5DbiIYeW7VB2/
         mFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvmflS0p1AV4yRC5qHHwVEmvP4IwgGTcmBAOtxdyyHA=;
        b=MFrrJfmblkWMHPPisMVssQJA6TqOwFIqPYcnyI+uEApY67e2H/5vHaAcAMLLHu2wTq
         7IZSlALYZhkmmr2b4SK8WoYHRG2D2CLFkt0GYPv7Av3woCnmEUnldW3iY+51YcDdYg+m
         0JkDzlzpXO8c2dv81Vp3j2PKhCQxFafk/5sWlQb0MhUTlxS9eg44flvukq49JrX6RzAf
         MsDAoFBOgQJHWOR/4VI/mKkoLy7dHrGV+i69323gIyDT/qVWIVYnrjz2xkfaLKtYRclK
         BE+7zbdhGWfFNMhuUn5vLHaSY4eikiVXHRUmBMKGMRPsQOflrSmZ0ChjEsjvtnKOBSp1
         u7Gw==
X-Gm-Message-State: AOAM533qXHC6tw3ODhlQmsoNtL++dsgs/YVmQLjnDemZzg544bXkaFIE
        Ycao7KdqqfmeiZY8IzoTH1w=
X-Google-Smtp-Source: ABdhPJzxMfk3tE8zogHO0+32wSHibNXDGLiYrT3LOfo5N9/vcWe/MiDIZY5BW/2bylKm7UvMXxdUmg==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr34034051wmf.143.1636718751862;
        Fri, 12 Nov 2021 04:05:51 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m36sm6011284wms.25.2021.11.12.04.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 10/15] dt-bindings: serial: 8250: Document Tegra234 UART
Date:   Fri, 12 Nov 2021 13:05:13 +0100
Message-Id: <20211112120518.3679793-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the UART found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index fa767440f281..3bab2f27b970 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -113,9 +113,10 @@ properties:
               - nvidia,tegra30-uart
               - nvidia,tegra114-uart
               - nvidia,tegra124-uart
+              - nvidia,tegra210-uart
               - nvidia,tegra186-uart
               - nvidia,tegra194-uart
-              - nvidia,tegra210-uart
+              - nvidia,tegra234-uart
           - const: nvidia,tegra20-uart
 
   reg:
-- 
2.33.1

