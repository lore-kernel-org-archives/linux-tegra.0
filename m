Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F01231A55
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951860; cv=none; b=Jh6w8kTIfD8F6yyVMKCX1o4TnsW/moFKjixV6a+LBgIMvk3Dm03Zt6Q/EgsY0FCwuDdnJ1eyjPPOz8nUycHHOTf0CWihqzgzNkEnwgFuVC/GclbztYx017H6Mse+Lq3eol3ZoE3S5j9EqriKHzT7nwd43cp4lcAB5oXyp0vwYD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951860; c=relaxed/simple;
	bh=In9ZWwzHdKPobwGSTNurFlsX8+WfCzcf4pnpnURGnOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ag3yGeRyfjbsxcubfve5oWxFB0H5fg3c/t6mBfbelw/43W2y3JCqGzp1kRQepuxxc1LSPKIjKTQpy3fXFYvPTeAKOD2zF3KUp/6P16Tqn/70DHLbFZfQEMrguNroVK3VN4eLeqVHssZ9AeukYY7ZWQD+stveTbzWvi0Ya6akocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nSY3xb9b; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nSY3xb9b"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450828af36aso2348825e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951855; x=1749556655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=nSY3xb9bg5s74aRkxAcDpMjHBWfWaddtoqQ5C2nBNn26dJkAVB4/WK50h2QboGueme
         Nhdmk5BVgZpfh1B1S9kY1Hl7Q6aeD5+tiYTGF3t5Tvh6N/bWc34/aYhdBzkWI9rDJ//l
         J8kOQhSRKniE3vuqPiGp+ga1ciyeBVyONqXSZjK72RKWtzLvRWzA0qkyVmjdYik8EXAK
         DGDYlhO9sZ6LdzHZBW+CUcJ0uBJi3O1LLKmFHt1pgvDSk+Df24NiYBVLDpnX043ThGWN
         ay7ssQVtbbW7zOAIf7hYlE/xPIw83fjxpkbLVtAfDjGOyZpe0uqqOB6LeeKqa19UkuqR
         wFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951855; x=1749556655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=Ca0Fp+6d/CvSq2zs1Xi8RoQkIshNtfSbdXDUEuin2dgUT8CY8j+WNnFqrR1ZIDJAPR
         OrzioXPfbn3LbdEFYmO5RuprzgRg936gJcfok/GNcRsVx9/60vTzdscjfrqyQUsf/4RE
         TIeC9SRVi8x4Fsb4PSUVHKvv8DySWU5OoTWewkkBO5yV+PI+hyh7dr0PWO9YLmqlDh6m
         WSI3yaquNzivO3OaCKP+hHqmgYTQP/pNjn2XoHrReCwSfLshemA5s8/6l/LOSw/WXims
         UiNv3lFQ9EwH8DfMDXBiH3VV7LJELIrHwqcCjWgeQUn19gYjK+iZZrF30wIWjYIUPZFk
         Ggsg==
X-Forwarded-Encrypted: i=1; AJvYcCVEu21DTw8Asr3bqvhG8UIfyI9fijQtstpIiQt4pgk2efQka8IqMugAMdbmDNWaWrJKHS7MGnjRyGB7EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyovK7tAgaukZloaowo9DP3dfvSH2qdEPiMr+gZLYw+yVfFROQU
	DkJSFm9TQxgMBPqU3Nh5L6FVgt/4+Uffp20jpPUOkMUhnNEvcYfhDlUltbXxLLMp8zw=
X-Gm-Gg: ASbGnct3/0ZYHNfV3PP6Qo8dAc/qZtyQcGBO/KJAT+uzs1Z93MBe777vpAhX01I9y25
	rdu3jOWiF79G5kXW2Sh7Qh49x6i9pCoy8ucPfCmVx+Xsxu0P1WZas5m0PIe9W8XaZXQCAjlg1mR
	syeJqFYbzB/mDM8mAwOJjyXuVEfLAQDOWJG3t3Ns6K6K2sKggjUAHiCblP53a4AAEJaEp82I564
	oz/CqTTelzdIw4NoS8SGrjwA/CJNQyG1hbHffyRPQr7EOHORHLW6DCuAzwVaoLjaiNJnFoWG0Zh
	ucUE0FoWPINM0baEOJTgnLWavrWPIUVUhDZgPJmUHMrGK0BAQw62UluX+QVjAKdl5hQy6N8EeWR
	DXzYd5aACZ8BpzoQaDZODzgy30pID0dbN
X-Google-Smtp-Source: AGHT+IHc7vfZ9Jls7pqd4J6k0aCDh+rQJvsx6pfapU4HqG5Fs2nmsdWERExeMcxNl0cV1Ifa/yfWyA==
X-Received: by 2002:a05:600c:3555:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-451e3132b4amr12478215e9.3.1748951854649;
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:12 +0200
Subject: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=In9ZWwzHdKPobwGSTNurFlsX8+WfCzcf4pnpnURGnOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMfcaFZwH9bb0S9dNAm40CuljsCWcpE+w7CS
 Rz+2L02tMSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHwAKCRDBN2bmhouD
 124kD/9QeML755TJwa+q6NyJCG2/dFgpT6gEYosjiRxkkcvC5kezgKst0oA8mPhfT7+68lSwqel
 wwVtZABbKsDQn/IZi1acleKCkZjAf2mI6XZNNhjl5bwSR4Sz+Vi9/NADv6xDv+mN8jZ+ICjwu9y
 tdpxGOFN791CYC4LlqwPfrxkCTXCQ7KamSyPduvwkULCeM8ELDa1xNwoHXBbgH7vObF/mJbMonF
 4hGz19dD0HFoCZ3cIf1YhezaYF2U+1Eej9MW5x1Zu/ErlISqCOlyEXiHIuhtM4JgxMTqQu62oKD
 gxaCDQ9ddIICmpY5a/OHZj5Z94FAroXzhsLc5v0j/qyopvezq47jKqztcpGsvbqY4bXBMKVnqP3
 i1wiFEQrhf1PGnJM0ZYmlPUgMXp2E8X58tgqkhBIiVxmczsp+qMpTyqSMRWJQEE203EHJ2KctRL
 CUSj+k91UZbE1qzLtVzBucvP70Yz5wh3JNr85Kjj/gg8hvDuWnn20lukNzd1xEr33C0Ar++BEgX
 n/JtchllxwY7IFYq5+5I09kqV+uLPaMgWR+h6YcYQIJXGmCn2f5ODOS2XeW5MQ4lQEafpUwpfGM
 e6A6q/4CpvTsXYxz10mwer+CW8mornr2kBt6RLRQE6QmE/+wxLyk3ilI/RzAMnM51geNFpIQnjG
 7k8TFFyHFeUL+hw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Providers DTS examples should not contain consumer nodes, because they
are completely redundant, obvious (defined in common schema) and add
unnecessary bloat.  Drop consumer examples and unneeded node labels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       |  6 +-----
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     |  9 +--------
 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml | 10 +++-------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb..3a387d5e4f065e6fe1bed7e402cb236f4e13ef56 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -108,14 +108,10 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: mailbox@3c00000 {
+    mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "doorbell";
         #mbox-cells = <2>;
     };
-
-    client {
-        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_CCPLEX>;
-    };
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a58a018f3f7b9f8edd70d7c1bd137844ff2549df..ae28ba44855f75e83ea70ce3c670465ae145178e 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -200,7 +200,7 @@ examples:
   # Example apcs with msm8996
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    apcs_glb: mailbox@9820000 {
+    mailbox@9820000 {
         compatible = "qcom,msm8996-apcs-hmss-global";
         reg = <0x9820000 0x1000>;
 
@@ -208,13 +208,6 @@ examples:
         #clock-cells = <0>;
     };
 
-    rpm-glink {
-        compatible = "qcom,glink-rpm";
-        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-        qcom,rpm-msg-ram = <&rpm_msg_ram>;
-        mboxes = <&apcs_glb 0>;
-    };
-
   # Example apcs with qcs404
   - |
     #define GCC_APSS_AHB_CLK_SRC  1
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index 1a2001e58880d2fc26954b26cff8ed53e7667f33..8504ceb64806bc7e25468597acdff99624571e9f 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -242,7 +242,7 @@ examples:
   - |
     /* OMAP4 */
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mailbox: mailbox@4a0f4000 {
+    mailbox@4a0f4000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x4a0f4000 0x200>;
         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -260,13 +260,9 @@ examples:
         };
     };
 
-    dsp {
-        mboxes = <&mailbox &mbox_dsp>;
-    };
-
   - |
     /* AM33xx */
-    mailbox1: mailbox@480c8000 {
+    mailbox@480c8000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x480c8000 0x200>;
         interrupts = <77>;
@@ -283,7 +279,7 @@ examples:
 
   - |
     /* AM65x */
-    mailbox0_cluster0: mailbox@31f80000 {
+    mailbox@31f80000 {
         compatible = "ti,am654-mailbox";
         reg = <0x31f80000 0x200>;
         #mbox-cells = <1>;

-- 
2.45.2

