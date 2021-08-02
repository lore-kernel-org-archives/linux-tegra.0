Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73436C432BE
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD3960F4B
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhHBVUv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhHBVUu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:50 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C822BC061760;
        Mon,  2 Aug 2021 14:20:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m18so1851344ljo.1;
        Mon, 02 Aug 2021 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8urCBMft39SinX6pTZXVMVPwus5YNF2nzxVXIu9iO4E=;
        b=ouTJF8rmGa6mR5xx7qF1nQDtISGcUvhC+Ptb8UkCTSxMUctVXOyq4ypZpYJMOpqHIt
         rF9kJ0aaVdM86JU9t1z+op8pX83IQAOYCdHQPze6cltZcm2nHb8fkwPc5qm7hJK5ThvD
         ExRNjtvTZaBmjzLuuAqN+SlJlJ73+PbS0o2ACFWbtcb8yjcjMjfodE2LK30h8BWq1Gx3
         ceY2PUY5b4Y/Xb1hUvKje2ZFHrc/me7scc19sDvXKOGQdsbhE1B5IS9zlPLBq+s3GoH/
         Jpj2dz5ppgivMOf1eLUJf8C/c20uqcjZkxbjaURabFH32S7h44Gv7S3PW8FFm5Yb4PS5
         LWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8urCBMft39SinX6pTZXVMVPwus5YNF2nzxVXIu9iO4E=;
        b=A04xQAtasZGJDsIZsDdRhu6xos8w1kutVyp2BLLRCNEQTPaUBMWt959lSQbqp23Tm7
         2hAOxK7lkxgoq8hPq68ke4h+F5bhsRW1L5UmSj6EU0SAkVi9HNWj0VOBn+U0lns8UWTm
         hB7oV0L1HstwmRW4kqu5Q/NJha2jgrvtJ64KIRKApbETSOydL0laziOMXU8OUUO81Df2
         K51dvJv0Wvvdd7AF4VJL06vTrfF/yx2BDbpRMcszzbjGSCcPhLPqEmLGuPgXeNab+rPu
         dh3vHCExt2Wc85tYiPjT0RlRPU/YN1/7vEv1Lsoj3rY+C1t1c5GQKl6iMGUH5Av6y25Y
         kd0Q==
X-Gm-Message-State: AOAM533KfTrO8VLNt4nLxji4wSqqelgLt4/JPg1ti+u2DfLE4UmGXRdz
        bZ/IazHMeql4GO/vHMsmCXE=
X-Google-Smtp-Source: ABdhPJxVGyiYZRetyOJgFGt2gDhqoYhO94+wsvn4uxeS92n8yYYHd2FdROgYHh157W15WI5MMD4Qlg==
X-Received: by 2002:a2e:a80f:: with SMTP id l15mr12825486ljq.354.1627939238204;
        Mon, 02 Aug 2021 14:20:38 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 04/15] ARM: tegra: nexus7: Add interrupt to temperature sensor node
Date:   Tue,  3 Aug 2021 00:19:36 +0300
Message-Id: <20210802211947.19715-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The TEMP_ALERT pin of LM90 temperature sensor is connected to Tegra SoC.
Add interrupt property to the temperature sensor for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index ae8300baa2d4..33985fca956f 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -920,6 +920,10 @@ nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&vdd_3v3_sys>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(S, 3) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.32.0

