Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85250C433E1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 598DB619BF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhCYQl4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYQlV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:21 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3C1C06174A;
        Thu, 25 Mar 2021 09:41:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 12so1534942wmf.5;
        Thu, 25 Mar 2021 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OPzdS0BZuVjzz5zpA0akhJTbQna6KzdKZ0ifPMBA74M=;
        b=G/7ctoLhmSP84RR4q7afIf6il7apjpEgOCwfVjSesqvj7A0TsbK9VcN1MPey8dpg1j
         lJEDBiCwGbv7aKhE/42F9YUgqqy0Dd9M4qj7ztceD19taQTSU4yWc/Pkdi7ePLojBPiK
         A+4CcuYywYEZSrCLO8NcVzo0RxXIOjzYYU12tCZ/oLLaV6FYFwsN2qMyEycdCdFUpKC3
         yXUeaOMZu9uOhxDYBQV88hvih/WE3A5Cm/km8UTS8qKzqjLpP8PZNt2Pv1SebWINvUtt
         wwYLewbXulIBLRnS/nkQbsvzE6+pmOteFxLadVuV8U8bw6+mFCa0snuQceMnYc1gKqr0
         CVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OPzdS0BZuVjzz5zpA0akhJTbQna6KzdKZ0ifPMBA74M=;
        b=SafPIEckr6ePIU4Ib3kqHuCt84asZ+GhCqWhZ57POA/wsd8nc/hBdl5SIGy47rLh/J
         hR98hjYXcbLgO3CZSMpzgU77CtQKacxcGfMExtt/hz3AMKJg33Hjqqes1/1ikMmL6A67
         xIbvdlpbB0Mc4RnERuBci2EkRHkrN1zpxjBLZSHRvFU1bc7r2nKfgRe07WtDyerFa76i
         Q9/SXh9xM167er3+gCned9I4PhQBLHHmKW928bBLwPUjqtiSDqJWq8FouhC+xiPheAkV
         BjlCDV3UJ0lf8oj9dnokmswGeXs0vFI6Ye3FDlZAqrptqB7b5Q4PHhGe9qvXirrbvBr3
         ibqg==
X-Gm-Message-State: AOAM533FOkbBup2mDTlrGylb7MG5Mo4HShaclwjb/tB3pbkClkCJSBmH
        aYYZS0srwfS/9Z4Tnvy0gQU=
X-Google-Smtp-Source: ABdhPJybCAx2KsEH5ARujBPMu3ypk9FAutXosozY6u1qfZqL+RTzMIwChPGJ/VQvLGdpRJXNJg+O8A==
X-Received: by 2002:a05:600c:378c:: with SMTP id o12mr8970266wmr.69.1616690479608;
        Thu, 25 Mar 2021 09:41:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q207sm7074912wme.36.2021.03.25.09.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 08/13] dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
Date:   Thu, 25 Mar 2021 17:40:52 +0100
Message-Id: <20210325164057.793954-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
PHY driver. It is a phandle and specifier referring to the Tegra210
pmc@7000e400 node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 38c5fa21f435..b62397d2bb0c 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -54,6 +54,7 @@ For Tegra210:
 - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
 - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
 - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
+- nvidia,pmc: phandle and specifier referring to the Tegra210 PMC node.
 
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI PHY
-- 
2.30.2

