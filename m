Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841528DA2;
	Thu, 18 Jan 2024 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588036; cv=none; b=mz6HV9Ui4Hrxn4wAHObEZQkuC7d9McJFuljzOnEhDathD0WspnlmHwb8jd6I0ILeCPPRKMLs73ejKK1ZhMeKbm1Xw037SIvKjNO/k1tP5xn+ZZjtQ+0lJkFeFpxgBs2IGLHbeHDLyl6tFZ5TVEeoxqvW2wx1McDvmwPCmkAoiaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588036; c=relaxed/simple;
	bh=ArYdL5PIjdacMWQIjZ3vdX8WmxylPVL+VvMknj+Av0E=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=BMW6M7r2S1lMmDb5dglrS5ZO2Uguvb5xYaEHZJjKe60BsZioYDqODn2H1PLAFAWsSqGAPf+7ayWt8AIoVu6P2CYrH9Xc3cOyEbGV0d+8lf4fM1hPn36Szpg7XftH7jyzLHeFcIiiywbPoC15dV/Ftm2lX4Lo5KE/a/6VrRL+XJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1NclnWB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1NclnWB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so12569711a12.2;
        Thu, 18 Jan 2024 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705588033; x=1706192833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78IVCKRXca7thRE7ARfIyH1pMO0QE5lIEZ3L5dbnlKk=;
        b=c1NclnWBqbJnmlBUVxDOIlysr2yrIFAwz+VKJIu8BmQsnWX5YHwHb7K/6980d8A6mZ
         7dr0USSXmqSWchpJhxBIZz+GJiZB/7DwnX/0qY2tQ6WhQyD3rt8cJao5NbFH9FJq0o2q
         vPCjU4A+ZFKPzg363UTVaGVHuLMreX3M7tgUR5gsul16cj0jYklJo8P59m2GWWYmrW5j
         /JPs3eI7v3EcMrDPJJ/JYEub2y9pEZMce0Huhu2/YnVTEon4XI8nQ9FXSgl75xGiYYzH
         T7wi0EariPt7cbqcsdU+IMvoAdfa3mNQdVzRp32JeG2fWkXkbmxgcXbsa+wYgzK398hq
         DoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588033; x=1706192833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78IVCKRXca7thRE7ARfIyH1pMO0QE5lIEZ3L5dbnlKk=;
        b=ol+/9BYlBTTr7eMoxDvYnoxoCSg8Q9M29KuALiKO0zGNDZYz4b3nGBmryCbSpG5XuG
         c4OzJ6WbVkXulm12fTOgLE/nUYE7YuYhP0Q2eReJUhLA1FHwDFRgAeHCwXavJVCXSI+6
         aIkG+DjwdTnSaDGX9SnKrkfmChmCchqbF9dMnZ9DsJPuAORQz6OlXV32U3yVvzKGBG2/
         MS/GQgr9yCGSXGgwaO3EWvqH2wF0YS8hVQQ5LFaQXGjpav/0ZqioAO75tavGM+YrcwFU
         VqscoJugGU9fUvxdpjjZRtkmCQN+7Hd1Z/1nLf4/HX9R+KqEEtN4xa2np/s9vKYPLI8l
         DmKw==
X-Gm-Message-State: AOJu0YxxmkLr3jtsmg59oiFrUtVuiNbpM4yX8F1i2WfKmebyUj4XW8ET
	aM0IUL9m1pzVPyeKSF2rAtndBcBlgIc4w8n1S5Mlw1haAUb3RPgk
X-Google-Smtp-Source: AGHT+IH6ORuEmtQx+qjHZhnbKTw9oDOMB02TWbVb1eVUKbXZ7AB4RSKYDuA74ANl4jgjpy8I1OzxfQ==
X-Received: by 2002:a05:6402:1a28:b0:559:f5fe:e1d5 with SMTP id be8-20020a0564021a2800b00559f5fee1d5mr601806edb.62.1705588032691;
        Thu, 18 Jan 2024 06:27:12 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r1-20020a056402018100b00558e2a97fc2sm7961039edv.68.2024.01.18.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 06:27:12 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: sound: tegra: Correct clocks and resets for HDA
Date: Thu, 18 Jan 2024 15:27:06 +0100
Message-ID: <20240118142706.4179146-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118142706.4179146-1-thierry.reding@gmail.com>
References: <20240118142706.4179146-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The HDA controller on Tegra194 and Tegra234 uses a slightly different
set of clocks and resets, so describe those accurately in the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.yaml    | 95 +++++++++++++++++--
 1 file changed, 85 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 12c31b4b99e1..e64c99b6b20b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -23,8 +23,6 @@ properties:
       - const: nvidia,tegra30-hda
       - items:
           - enum:
-              - nvidia,tegra234-hda
-              - nvidia,tegra194-hda
               - nvidia,tegra186-hda
               - nvidia,tegra210-hda
               - nvidia,tegra124-hda
@@ -33,6 +31,8 @@ properties:
           - const: nvidia,tegra132-hda
           - const: nvidia,tegra124-hda
           - const: nvidia,tegra30-hda
+      - const: nvidia,tegra194-hda
+      - const: nvidia,tegra234-hda
 
   reg:
     maxItems: 1
@@ -47,10 +47,7 @@ properties:
 
   clock-names:
     minItems: 2
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    maxItems: 3
 
   resets:
     minItems: 2
@@ -58,10 +55,7 @@ properties:
 
   reset-names:
     minItems: 2
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -83,6 +77,87 @@ properties:
       The user-visible name of this sound complex. If this property is
       not specified then boards can use default name provided in hda driver.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-hda
+              - nvidia,tegra114-hda
+              - nvidia,tegra124-hda
+              - nvidia,tegra132-hda
+              - nvidia,tegra210-hda
+              - nvidia,tegra186-hda
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+
+        resets:
+          minItems: 3
+          maxItems: 3
+
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra194-hda
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra234-hda
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2codec_2x
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2codec_2x
+
 required:
   - compatible
   - reg
-- 
2.43.0

