Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72222FF59
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951854; cv=none; b=FQtAbXEf4JG1GXwFBB96T7H1dPepRaWs0tcUxl23f775iA8XEyJwVvtLuDeAdvJBBq6/tMgr+RJiFFxNXiSYSlD4J0NoMWW5EgTk4fwPK40QwDo7ZSSgWOZ0726jJ5S7F56HtGacmQb1i0pyruNB2dh6EAfp9EnBxBHneyd71Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951854; c=relaxed/simple;
	bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bElXkMgnAbPJMTUElW5pijf2yhf0AyFh4RWBx+0aaMV/LI5jQs3qlPbuiEMmNk6W5Gpsqmx0t1/2cwAEc+lCOTOWhDVFmUF+nqfLRU1cLCF1dGJHTdMM9G9wty75etFmDqEjm0zKey8ZXTfiEAmXb9dIY0bsM0ixk+wbVNLPdZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLihSSRE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLihSSRE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so621260f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951851; x=1749556651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=iLihSSREAI+7rdTpPTk0/xTDzi+FlOfeeBX83JoAFtLmW9HE04ZXhUw29ibgSmoJmh
         CbQrIqu/YZhYj7VXYXb/fWwTbneOmsKmlUFcW/RC7kzH1/J5hDI8d3WKd2+EJv2hU++O
         J/2odWmkLtxBsR+N/NRtmBIAHHzL8AZ924Iu8TGtCEut+c3tTyrLoPj6fS0UivaULyvy
         DoAfWOE0fur1UaLXIDbRsPEDzT5lIlSknQDWT9LpI41GaAjPmVQxqL1uOHCHPgx0XaEX
         1vfAzJV24Ey64w4m32tMVajDZbMn+/XX/blrStzuLAhveRzYhGhdyXazOTkNw+jDmaE2
         R8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951851; x=1749556651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=sWwcCHLHipOjwF5dJ0upSOT1VY8gQW1vE2Kg+DdUOg3K44SYWb9Cb/1R9JhIxozqUB
         zQSml4ZFwqxoK8qAgWb050CkyOHTxc0SuhcwP5VWlNv3ODMYFoNgRbpAjNMp2i+++eju
         Uky/3kTgzhO48bw6fbz1v53BnoC3rrtpaz56e9c79yb/F96o5m+gHEBPjeAZjEzvkxy+
         F4zHvCobZaODQN1QqUooocGe1vbKJCI540yaNtQEZPFjNhhSjFQcYz4Rq8elXseHfVrf
         oXIU/FrQl6HysXL6FBbRoAyHypWvQ3XHpTs6PMrESaiQoYNiX2DFwTO/9xXINihRgnOk
         c2cA==
X-Forwarded-Encrypted: i=1; AJvYcCUbh+hSCPHVuZBzcJhEreKm1jyVngL+aHTbVHviYH3EdP8q+qSSVAGnXcq4pfKMZlZXs46AmV5ZWZATmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfgfDDOQC8RxNlvF5vpIAuMdizIfhe9JXbhi+RJ7SNxYQr4v/
	vkVYeFsLArEjO7c3cx0acsZvPmP7ESHVs+Nd8Inmjk5617fufxvD+F/21jt9a3GCHhw=
X-Gm-Gg: ASbGncs52UvDQZmX3aakpUlXYAuDDOR54vfB0RaU4tI02KHMTmMCfEG3N3kPMf8S/zz
	/BOl4njn16vYJPqb5DrD92gzRhbnMrC1vXwGF0mvdcYT9zTJp35hcUWNWCkkJ21Ufb9+ARA8Dbf
	PVymSlKqPsZq06OYe6IeEZVnYSls7ShQkYymIRZzEGVp7XEPmvTV++YBcQBXWZPEodmOGr0fvjs
	+yIjhLjqJquUleF+bdIJDG+ebymSN31rJ7xuQuAqa2KBa5FyuyQheci31W2clW38AxweQocn1qN
	19z2tPIqdu9g6Vhgpm2OhC3E9kHW1JvQeW2zHN5RZYXrTlA59fSFXmYhpeSyeZSl2rt+GiJoInT
	FEid7fBo6NJaqRQ9foOSSyg==
X-Google-Smtp-Source: AGHT+IFtYARGpAfUwedcZUr+rv2i3DwXIs+E+vyvXAOm1JZEhhjjlgKaNxSVWr0jm35V1p0FWxTuuQ==
X-Received: by 2002:a05:6000:144a:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a512c0dcf3mr920895f8f.4.1748951850998;
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:10 +0200
Subject: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMdIBzxTrvdsP5gds/d0vjogFtPZqCCBexkU
 t2g8c+MQ+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHQAKCRDBN2bmhouD
 1xFyD/9L4+1GTV5DN1265YZBVsYfGT671n0VhpafJSb91mwvevxDWPkwfY40WAvavWVSdnU+oKt
 Oul+mg/UJQ89kOSzcxD5LsRCQ9Acsti3Mrc2v+VcXQ5aaKGlGq7jt1acfeHhjeNosEAA5Q/7GGm
 eGS3YqpRuHV86siWBlHPpFj41TaROQ96ys/d/JfM1FXitBk+o3yBl/OYpWLB7yPVR2Z10titntk
 KnMS7dslZtULk5I/aSaL/TbCHAPuqYMwom+/SLCL+0+ujJZiLU4XJoZ+lOGclDgOgoRXIVmFHLy
 irFm7Ztc9RUbHsC/CWQiAZSY3kGwQHDfxSbCfdceTq8dLC8feQ5/8UwFAvJP5pHuUCGmLp4nOj9
 NCR3wksI5Jhat9TOXbmwNu8Kz2+urDI5jTQ3cX7HOojU8O4d+lByyUWVZIP2AlA/C20a6gv+e4p
 P02u3sMkeIYYEcZYgTdJAs+VqRVrdEHt2IO21B9N3257zT4/OF95e2urmhCQyJ+Bi8SjdskB7jQ
 zyl774llaFFuVkbXNBCuRXGiLGYdXtf5iES9z33x77UWRyzpUFqldA4EucRbBYnQR3KT5SomaK+
 yDnULbjaDeWyLOrtLDh2fBnybkwPfmkdFDiBKfXFCiWAmJFWEfh/RFzExHvT0ZxT9pmyAT0IrdY
 RkEvLVdycgzd0KA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 75d5d97305e19f50059e61a4db2632765885e850..87d31963c1b73c956b9782f029b1a5ad2654f507 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -68,13 +68,13 @@ examples:
     #include <dt-bindings/reset/sun8i-h3-ccu.h>
 
     msgbox: mailbox@1c17000 {
-            compatible = "allwinner,sun8i-h3-msgbox",
-                         "allwinner,sun6i-a31-msgbox";
-            reg = <0x01c17000 0x1000>;
-            clocks = <&ccu CLK_BUS_MSGBOX>;
-            resets = <&ccu RST_BUS_MSGBOX>;
-            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-            #mbox-cells = <1>;
+        compatible = "allwinner,sun8i-h3-msgbox",
+                     "allwinner,sun6i-a31-msgbox";
+        reg = <0x01c17000 0x1000>;
+        clocks = <&ccu CLK_BUS_MSGBOX>;
+        resets = <&ccu RST_BUS_MSGBOX>;
+        interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 0849799ee0c5caaeb27fe1e3e3714a630a7c2b09..79963c9878bad1684fa0810ad71554af2ceeb75d 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -46,8 +46,8 @@ additionalProperties: false
 examples:
   - |
     mailbox@c883c404 {
-          compatible = "amlogic,meson-gxbb-mhu";
-          reg = <0xc883c404 0x4c>;
-          interrupts = <208>, <209>, <210>;
-          #mbox-cells = <1>;
+        compatible = "amlogic,meson-gxbb-mhu";
+        reg = <0xc883c404 0x4c>;
+        interrupts = <208>, <209>, <210>;
+        #mbox-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 4c0668e5f0bdc1e03404cbd58a392465d30b0e8e..474c1a0f99f34777e1bed7fc0a34f89320a93b7c 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -78,11 +78,11 @@ additionalProperties: false
 
 examples:
   - |
-        mailbox@77408000 {
-                compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
-                reg = <0x77408000 0x4000>;
-                interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
-                interrupt-names = "send-empty", "send-not-empty",
-                 "recv-empty", "recv-not-empty";
-                #mbox-cells = <0>;
-        };
+    mailbox@77408000 {
+        compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+        reg = <0x77408000 0x4000>;
+        interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
+        interrupt-names = "send-empty", "send-not-empty",
+                          "recv-empty", "recv-not-empty";
+        #mbox-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -68,12 +68,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     secure_proxy: mailbox@32c00000 {
-          compatible = "ti,am654-secure-proxy";
-          #mbox-cells = <1>;
-          reg-names = "target_data", "rt", "scfg";
-          reg = <0x32c00000 0x100000>,
-                <0x32400000 0x100000>,
-                <0x32800000 0x100000>;
-          interrupt-names = "rx_011";
-          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "ti,am654-secure-proxy";
+        #mbox-cells = <1>;
+        reg-names = "target_data", "rt", "scfg";
+        reg = <0x32c00000 0x100000>,
+              <0x32400000 0x100000>,
+              <0x32800000 0x100000>;
+        interrupt-names = "rx_011";
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.45.2

