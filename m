Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06108C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0D3060FED
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhKLMI2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbhKLMI1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:27 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911BAC061767;
        Fri, 12 Nov 2021 04:05:36 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d3so15083320wrh.8;
        Fri, 12 Nov 2021 04:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1fM2asPYVp6TKl7Cuo7iMmJkCjg5Vo84eJYM0+zhpY=;
        b=edmXG+VcaFX5+DPoCYtZJ2vW4x1e7ekCRNlK5S2LA/VIeGZAKbA6o1v51A0K7dsxCH
         Q4bInydoZ8yvB+Qj4SgQF37xuht+IR4MBVpc1t3SW+TYnPJDidjdYr/BG/6Ot7FnxbXA
         djTzzhMr76rMfrCSdvjn/uTAz+OsvYV9WZifTuJoOQ3mXoszowEtnGFdOxemhMR4Hbb6
         SL7EfWG3n4xvn1zN0VcJQ8fym99ZAleL0da77J6uHqU00BigJG558AVFH/cLFV6u/rRH
         9Lo98A/+N+HiT5FUH6YH8/PN77edbOo3oVEdmt+JZRa7pBLLrIkrzfXfv3ipzamzbpG3
         ndnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1fM2asPYVp6TKl7Cuo7iMmJkCjg5Vo84eJYM0+zhpY=;
        b=NtlqaoE52noaefjL852gksRQvufuvNg1mTCi0jIT1GerblyuwxwksdU1lVQvFKWrYK
         gpPVdBcFQf7oJAhI9r/WF7Za/qB3mxx/YxwRh8sc6c001grB3CSuYdCGRZD4ZUTsPcDc
         qiQQE1MjY6OKd/n1ulzrMT2M0fQs3qcCkTe4gcIBkZzQafzg72Fy/GFHEw73RPM6bUsr
         yjlHViH+0Os5/a7Bxd/nY4ad9x6H2ViqvMSlMURzjXlkg91R5KnURmIe/axCLwxTmMyD
         MTvF2OlEccSUEHSSextOELOZsdSMwzQFOt6+U5HkDiwYGwvzutuL+v+ww4K6caHi+ovR
         tq9g==
X-Gm-Message-State: AOAM532201I64NPb8NGoVYjh99x2N8/YvePap4luXQbJri05Tyv/c0zN
        4ROoNjNaPycV9kFrRZIp0/FfnNLUfkhY/A==
X-Google-Smtp-Source: ABdhPJxLgtOiEffui51+9Tf1dQtz6X0lYX5fJYIpzGpmRsVnW7hwyec/o7M/MS2kCjAVV5EMLWBCzw==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr17472362wrs.219.1636718735231;
        Fri, 12 Nov 2021 04:05:35 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t127sm12011408wma.9.2021.11.12.04.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 04/15] dt-bindings: mailbox: tegra: Document Tegra234 HSP
Date:   Fri, 12 Nov 2021 13:05:07 +0100
Message-Id: <20211112120518.3679793-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the HSP block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index f5319f4e4393..a270dd6ddac5 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -57,6 +57,9 @@ properties:
     oneOf:
       - const: nvidia,tegra186-hsp
       - const: nvidia,tegra194-hsp
+      - items:
+          - const: nvidia,tegra234-hsp
+          - const: nvidia,tegra194-hsp
 
   reg:
     maxItems: 1
-- 
2.33.1

