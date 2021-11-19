Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E10BC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B09B61221
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbhKSOmE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOmE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:04 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BE4C061574;
        Fri, 19 Nov 2021 06:39:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id a9so18540513wrr.8;
        Fri, 19 Nov 2021 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVh2KvmWaXSrzgI1sSlud1jjLQ6p4L1rLolhS5vwJb8=;
        b=O6K596yWMS2nsG/LR2+7pdf0h3mdaBjQ9suOuHbbr7BYXTjdAtPXd+GF0Up6bw3sHu
         Owy/1c8JW9SqktScF8YYIfTUFY6pk5KdSPnWoGySQIkn1ZnNUjj5wQQn271EeCEumkW4
         7eZ11OLjMHAra8B0phkqCuuuxYtBBjD+UQ3x1BQXIY1TNAEXsA1LwQXhgAe1LBmqHD54
         rbZKeuG4mmgF1fk72X+aiXE+nLeXKuoIoSUH2lrJTM5eIj77s54awRx/qXiDhQfUZtj1
         Kk6OJ7/biQ2SedlmsStzl1PVwE1RfynFW5IQJQCYysYBCyGtn4OCYH/+u/0PouuPauNk
         GI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVh2KvmWaXSrzgI1sSlud1jjLQ6p4L1rLolhS5vwJb8=;
        b=rvqQHFBq024PmeoiyYdv51B1px6G+fuPV12TpuDI4W0PZxDQA5rq2NK6sICdYy2Vlh
         +LWXj0EP1jEs9XoghkNsi6baW7vzMDJYTA9lZ/Qw82pNPulbxmtn78eai7/+8NzeH7Cl
         AGyg/dTAsapvg21H35ANiGJ1l5y7Iy1+hoInk3z8ehpAQ7v2JLdtFjowDsUchukWoD2I
         TRt80qX4M2eGoEBhF6kkhgMxTJ6VWY6Uh5sjaB+p+5+cv0yYRRy8xX//CLyhAJptN7O+
         ukBo5CyQd7crKiRGT7Hoew27Qf0bCGXZGtIdTj/+CAVSpl4LT3iVu30FBOStOCeFqARp
         KTIA==
X-Gm-Message-State: AOAM532rtQ89iK7rKEoQmJRdSIFcaSQ7AxS0S4oc9hEhuILx5t/GrgAI
        iOcf0snyZOjY2ycowKFPC64=
X-Google-Smtp-Source: ABdhPJzjGQ5cR3UNBSuKToI93jmDRFTdW2NdPvANlHWV/PoaQYz5997qnivD6f3btDjIcEeaZWtSOA==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr7658411wrp.368.1637332740578;
        Fri, 19 Nov 2021 06:39:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l15sm3042986wme.47.2021.11.19.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 06/16] dt-bindings: rtc: tegra: Document Tegra234 RTC
Date:   Fri, 19 Nov 2021 15:38:29 +0100
Message-Id: <20211119143839.1950739-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the RTC block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
index 94266de73cb9..17d6280e5515 100644
--- a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -27,6 +27,7 @@ properties:
               - nvidia,tegra210-rtc
               - nvidia,tegra186-rtc
               - nvidia,tegra194-rtc
+              - nvidia,tegra234-rtc
           - const: nvidia,tegra20-rtc
 
   reg:
-- 
2.33.1

