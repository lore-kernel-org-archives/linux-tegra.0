Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79670C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6461960FF2
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239794AbhJFWvN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239878AbhJFWtp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:45 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC1FC061746;
        Wed,  6 Oct 2021 15:47:52 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id t2so4365001qtx.8;
        Wed, 06 Oct 2021 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQM7560niPcf8GUHkEig/paB8tgdSzM7i6A+3PQ9XbY=;
        b=hg8bhTTE5qBnrf3lZR007SY8CVmLH0vOZg6JbB0xRJgqIpFbZmfqljIW6uFYD8eR/2
         YvTSGI5D8frNscjItkcbEGzxBY3RnNApBQ8+UZjJ3gZiOEHltb14suJEArb2dEeVVz1k
         5WaG7hb9peUdJqv7oRrGeS0qsW5TYIaIqZblwwm86nTPWy8vE6L0SFnLNeesenY1wZXk
         eQ7pgvNcmjqY3AGLYo9DBX9CWMEUxSGrL+G3bfQNyzudCTBwhItBD19jXWzILtlgdG3Y
         dYXtIF/kLvHRwQ/Av89+8iGmH9GZidUu3CMraw4cAu9m/cwJQoR/AwBy/eA4paB2R0/w
         F1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQM7560niPcf8GUHkEig/paB8tgdSzM7i6A+3PQ9XbY=;
        b=OTjE63kezNFr8XnRnAd1FKgTggACfyqRH92z4PAnDbSHCxGTkAYt1QGC2yWFH7MAKN
         X4LaHQqsHTTUG/o6mb0HKY0+wUTvfC/VuZIY/VV1iWBMYtXziq+5+Hw4xbFs7YFAkwKw
         0o5Z4gbAianGMM39rQhUeZhqwiGPWHIN0/Xce/ntpc+GVSzZ6jBhaeTidYWg2fkSPdqm
         4uxuRg6XrAatW0vgQGjuUN8iVSdTIV9kzi3UpVASWcVMN/DDWw2RBb5oLviZT4ieIVBE
         on23JmonaWeXRW8pGA8VD1tm48+7DSE7KyNN91s7JpCsCjY21FV6FKYOUtgiR4qRDSga
         hwAQ==
X-Gm-Message-State: AOAM5312XRzi87L5KpC5qMBgMU51dvnaiyVu24I7PMF3Muw+uk2qdF8v
        0dKuD9a2GPo+pdhhrT5U5TY=
X-Google-Smtp-Source: ABdhPJx3TKarn2N0JlJAm2nUsoZc5nhWb059k0jDeQF+6dCC0MXF5M3cfa++vnU4rqt6TrF2xjas1w==
X-Received: by 2002:a05:622a:1046:: with SMTP id f6mr1007570qte.113.1633560472234;
        Wed, 06 Oct 2021 15:47:52 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 6/9] ARM: dts: elpida_ecb240abacn: Change Elpida compatible
Date:   Thu,  7 Oct 2021 01:46:56 +0300
Message-Id: <20211006224659.21434-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Vendor prefix shouldn't start with capital letter. The Elpida Memory
compatible was never used in practice, hence just correct the compatible.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
index d87ee4794f83..9698801cbcfb 100644
--- a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
+++ b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
@@ -5,7 +5,7 @@
 
 / {
 	elpida_ECB240ABACN: lpddr2 {
-		compatible	= "Elpida,ECB240ABACN","jedec,lpddr2-s4";
+		compatible	= "elpida,ECB240ABACN","jedec,lpddr2-s4";
 		density		= <2048>;
 		io-width	= <32>;
 
-- 
2.32.0

