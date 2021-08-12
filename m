Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5930C432BE
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 12:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C40561077
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 12:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbhHLM0y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 08:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhHLM0x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 08:26:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73060C061765;
        Thu, 12 Aug 2021 05:26:28 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r6so8073754wrt.4;
        Thu, 12 Aug 2021 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odmiuzKPr5jQ/z0qYitTwKpP6yDBIGlDVV/+ilvzSk8=;
        b=XBfurDaFVTbgVM/50tSJETgdK7DBlYPzpPbedIgPTA5oQhGWUY+fHbSH6PQ22E0Ai0
         c/0y721bKw9WKYydWDbcYk0AZzUTAXDzcxxdSB1uEa3DVp+LwWDMzteJPu1plkWcsg/I
         51A9HCRBKzdtehAERljoYsLnQNldyJPBRw9V7/RXMNEluRXBmKpMQ+cRMKGgXixjQRq+
         GiK7RkiTf33Xn7d56aATStNDA0PbHmYEf1JR+ekJqrLEp+3lyKnrqT3xvchoUyCia9lm
         lMz8AQMQA1uPse6BSSaLyXX3tJEHS+ey40LFecH9vlr9EZAhK4DIpalx+XBu4WbepdSI
         uSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odmiuzKPr5jQ/z0qYitTwKpP6yDBIGlDVV/+ilvzSk8=;
        b=F5EDOaD/OMY75I1j6x4nvQtiJnnMkVGxLBw9+xSF4Swt/taS7YFSOO+7Qf1QyyYPDU
         +BVRXjGs4++SFDI46wLVmnpC+2ZuXCeo4nnoess8LrHSkcApesWPR7m0mdBAdY4IlZ65
         CbQWp7KezQaI8zEVgrlovVwL9PyFwl+6XqIstO97n6OM/zFmfF2XbbLv26IAzluqK9hl
         g0cWQRmym+zAfXJMbC6LS+elck4Z8ZC1DomFrh6G58Vmj/Nk9Dp+KfyYoUtq04GjQdQM
         dOrFDAjZ8mpFOpTOlqUeQLfz5TppdPJ91jz+4yloCtMlf9pztvIfDLkeB3LI3z23ar/6
         Kp6Q==
X-Gm-Message-State: AOAM533PQxyxoVVkBDCLGb1kre7hBR5899t/encQu9dYpHTQcQBUhLn2
        3bfi80kMS09oIgimbfuEzDw=
X-Google-Smtp-Source: ABdhPJwiuJC7qV9F0XSoxnL2q1Rl1efC5V7nI5ETcZsebS76c/n2hILJKrBWbGimpQ0E9la/2q25QQ==
X-Received: by 2002:a05:6000:1a42:: with SMTP id t2mr3709428wry.61.1628771187087;
        Thu, 12 Aug 2021 05:26:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id p8sm2756749wrn.79.2021.08.12.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 05:26:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit
Date:   Thu, 12 Aug 2021 14:26:15 +0200
Message-Id: <20210812122617.2378605-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson TX2 NX Developer Kit is the same form factor as Jetson Nano,
but uses the more powerful Tegra186 SoC for added performance.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index d99b9d513ecf..53aab932ffd0 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -154,6 +154,7 @@ properties:
       - items:
           - enum:
               - nvidia,p2771-0000
+              - nvidia,p3509-0000+p3636-0001
           - const: nvidia,tegra186
       - items:
           - enum:
-- 
2.32.0

