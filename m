Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6E9C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08D5B619CA
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbhC3XF3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhC3XFT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:19 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B5EC061762;
        Tue, 30 Mar 2021 16:05:18 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id s2so13155299qtx.10;
        Tue, 30 Mar 2021 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hM3oGGoU1XkWBbm6zDENhRNBn2pOgCUo+5XYNt0fTmQ=;
        b=tAvQD6Or/Bw9+JB2UesVPL106yzmM4wE+EMgRYlM42jvxraIBaGX8i+kjuc6sVVBbj
         lqyuB1MXOImr7IB4NquJrZRrJxsYcWHGxI1RkqIN5wCvzQxH8f4HVstbNBY1PdEBPBIZ
         rLEfE9BNfJOKmATdTTKqipLW8JRjvK228nuplkGK5ybvHCsRGEmPSqRRzpD1tDw1TtnS
         umkvhdD8qG5k4ow4vgWG36qnMPh/Bv27KqPBT2kjqxAktc1okulguZnNDZROiaXjgWwZ
         n3dvOf+jtUhsaAT5wbjfqxAJmV0LhvWlwsVHlImm5BLhYiF1MQHKEjZZKL0IE3VW52ot
         D7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hM3oGGoU1XkWBbm6zDENhRNBn2pOgCUo+5XYNt0fTmQ=;
        b=m+eNWlnqQ5aLh9HGhaBRoCMalvCnTThW9IkwKUqaGcJSvGtjAKGKIEfICqZrRbw8Ep
         Nt2D2Os+ZQUW1l+pGWdtcsY2Rngg1A5L9jQIUlZWGvvGeqPFiHG/KEGAOqSyo60/HuYB
         dPG1+Re9hudHQpM36ugBdxABhOJtSPs6zf5KzvfI0/AEPUKNtng6uhJEmM9P/2p9uyo+
         19/WwHxicuWViacNCl7hGbykUiAKIYhM8DRFMBAc72QdMTF1an5Hit4gmBITRXeFYydG
         anp215dj4+yhaYXQCaQsgNWavljL7JD2rw8UsWZM/OmVbyUsHPk8tYRaFmIz4EQfSZnE
         vzcQ==
X-Gm-Message-State: AOAM531pOJ7LO26ZTSPZZSyY3USbpFQEUkaS9jGtFjRrCFFmbzn8PiSz
        D+DEDfqfNrsZDNJzk2dQrTk=
X-Google-Smtp-Source: ABdhPJzH6PK1fDnceudOBLmD65OS7s8i8QLKp/hZ3qUZ9FrX8lYCTQEnq80jRmGj1/h97TBzv9HX2w==
X-Received: by 2002:ac8:7951:: with SMTP id r17mr127118qtt.207.1617145517487;
        Tue, 30 Mar 2021 16:05:17 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: memory: tegra20: emc: Replace core regulator with power domain
Date:   Wed, 31 Mar 2021 02:04:40 +0300
Message-Id: <20210330230445.26619-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index cc443fcf4bec..d2250498c36d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -23,7 +23,7 @@ For each opp entry in 'operating-points-v2' table:
 	matches, the OPP gets enabled.
 
 Optional properties:
-- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
+- power-domains: Phandle of the SoC "core" power domain.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -48,7 +48,7 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
-		core-supply = <&core_vdd_reg>;
+		power-domains = <&domain>;
 		operating-points-v2 = <&opp_table>;
 	}
 
-- 
2.30.2

