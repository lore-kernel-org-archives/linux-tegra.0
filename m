Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BECCC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 17:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49FE8650D9
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 17:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbhCPR7E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 13:59:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55418 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239422AbhCPR6s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 13:58:48 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMDxu-0003iW-4M
        for linux-tegra@vger.kernel.org; Tue, 16 Mar 2021 17:58:46 +0000
Received: by mail-ed1-f70.google.com with SMTP id bi17so17977188edb.6
        for <linux-tegra@vger.kernel.org>; Tue, 16 Mar 2021 10:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yF86hItxVjdF00mkSd3V9reGH3tNOZvxmWSGP21D5c=;
        b=rG3wvuy+O4nT1F69vKd6CHeYmXQoayRxF/7id+vflP49tImvTtATsFvHZHZy9AbINi
         XTFsdorYjWfX1L5T4t4fUL9fN+FwaLygpm1Z66m2zmBYAfxB55Age5cXL30cWWNrPo6d
         LHcC2Su7uF279oWYMJvqjDVs2y5JBm8pWHIzPzoCTS73iApqwwBinG1mbQnQBQYm77E5
         +56Z6wdNRnGWce77wPGq3i3dwnjaBxv+fZk9vg43veD/0ckNwo6WM2V8OVCLCaSMp6JP
         mNwqFQ0xGIyzcJH9ND+zky2B1ZVLXKShTBYnoVB7Hn2Br+RZx/ksuRTaACLlGtvC6Dxn
         Ghng==
X-Gm-Message-State: AOAM5334D69q0PgiUclkkNLQUcOZV9iMAfh4phR3FiZTkxk/t+aNRPkf
        tEKeIecjj4OrK3PxdgpW325Cmx9vt4bHtkdRkVMRrZJomjGkjWMqEF++AEHgfM2aSrYhxWYuX9R
        PfA5lQkaIFrHK/ZZytiay8gqQ3ybNz5Lj2rMCeB8G
X-Received: by 2002:a05:6402:8d7:: with SMTP id d23mr38353360edz.256.1615917525835;
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxizmFWFc7QpRfLd8R4IVOXUZ7C6tYUXVLXOgwdmYrenYqYy0+6m8vxkgzfJFApBbM5vwKsHA==
X-Received: by 2002:a05:6402:8d7:: with SMTP id d23mr38353340edz.256.1615917525678;
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id bm6sm9927848ejb.50.2021.03.16.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix compile testing
Date:   Tue, 16 Mar 2021 18:57:25 +0100
Message-Id: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Ralink MIPS platform does not use Common Clock Framework and does
not define certain clock operations leading to compile test failures:

    /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
    phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/mips/ralink/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index 2f9d5acb38ea..8387177a47ef 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	WARN_ON(clk);
+	return -1;
+}
+EXPORT_SYMBOL(clk_set_parent);
+
+struct clk *clk_get_parent(struct clk *clk)
+{
+	WARN_ON(clk);
+	return NULL;
+}
+EXPORT_SYMBOL(clk_get_parent);
+
 void __init plat_time_init(void)
 {
 	struct clk *clk;
-- 
2.25.1

