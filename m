Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605996;
	b=GKygpPp7yTCFdTJU1STS/s6ztw+9xU9BIufwBZaq1MnK04imLV0cLd++QoMuJ9hP+C6W
	 lZnRxhBtFEEJEJwfnuqUodvSXGcp0tJJA2xUUNye4EsZOI4BcSp+MVxvKDzK03Nt6Tame
	 I6j7Jatro52Cr7OrbwCXN9Q1npNQXwXFekq7ztK+xTEGL7cjHerqJDYKRCxLDo369qRGi
	 SINqjRlkAlDyzFYxYNQISKANYqaNGh+1UAQT6QyxigvCL4YscHNNgW6veJL8bhN/4fnY4
	 7rK1rSaF5+ZPZ420QsOZevSSAqgFoAbdUolcVNRnDhzAMtsL9U9XfUfeCNltamIEUCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
	b=TB4Q/lx1TJsFjLQ4rOTgBB2yyzpcQAhp0xCh2syo3hPjt6uTaGbAZ0h5P1cjGgl3gHhT
	 ywuK8bnbzmvncbSdF0KxyXE/5brnZjXW0tDHGwhtKbtl2IjtvlcZhg79FTvfXHToreaoz
	 kLZ7BxLOiVGUR3+8unnCgpKXkdmiSySLp4HNZ4iz8Le41Z54FPYhTACdRYTd3nOt/NhG0
	 IctwuWDAY+dawPpVDsp0q5xfBpn/TDWRyOpAExl/f1ElnKh9ISWM4zNoSA5HvxJ3Xdrcd
	 vezRNKX4PmyoAtq0uYgl3s/t/9qH8WILLAINYebEKxZJoIPYc9hsL9Ag8GbQJXHw6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2A60A262F
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC2A60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1221589666b.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605995; x=1796210795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=QuwcP9VLjjET9UqnaCB4VTQ2KnNQAGTJSJ3bQCTHzKaIYapakl4ZQWGsaACsILb641
         W7KtxrisONpVDq4EpSVbWTvDXy86CqnaQFgdLrlYoSRKHlIEdQMtMDh3jijgGpFJF1yh
         EVxBpkbnO97KVy0aa67HyS/In4fpz0Sutuq4O1PuslmAC7w+uAGLD12pCFNFvtKF1c1A
         fKiicqVlZygJkGR80dlBjz1dOvPKQ1ObQ+qR2AxlVaY6MY5TvgX2iFg7mLF7XMYnoGrL
         tp2c0sQwBLFx7gQ6YUmGiPGoArhrmeIw6QsLxL3k4jTsuJKME1vvwF17PuVO+18EfydB
         JsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605995; x=1796210795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=bfLVnLrlRv4VtUobKVwAc+n9lSigD85VkEBo/zJ91nJgCOCKph/jxd9UMdQjk8J4cC
         RDrH7jf8NjRZuqp3Wqm/PJxUYAlN6slkwyuxwEg3dMcea1Qdgu4oicWoowS/vC93IUME
         8Y7Yxu75IETSTuE9iisQMDnkbM9YkuKB5H81U4nq/Qf2AqgoHn9GtYfKNP6Oe+OYBi4x
         S3tHf59+Z27B4yFFQYiEDmm7baljXrMyiTLL1dls4BYuBmnCes3xdiazFIztdDSwwwgE
         vPeMzCq1K8rtxj4AIvp7TJSwNfPt0WI2UYkquWhvYGloBdXANsQ88zYDlv3+7CczGqpu
         fhhQ==
X-Forwarded-Encrypted: i=1; AL+hErEa7a/HeuwGjqM06KJxU68yOu9ghAsTsz9tmvF/0iJSAJNVWFHEJswxH78i2A26yU07y8xEx3Gx5RvLSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++9ObJ06y/z2Z16ONJB2Vpzv3+iMziAlzCjJGsoJcm5k/CW4bo
	JVnY4/5PNzXKxTLyCB9lLW795RERNTCmcHq35O0OoMhG/2ZoZ6rVDvyF
X-Gm-Gg: AZFdTZcjDhLZjItvXm4PPfemhEncnmPbsxoDAyTMiTbnobvHfoDRPa36cybFd8vsG+D
	tsSeZXaiBfIO7NxKjIdA2yhNPH52GhJG0Omu9g1u8WjPMpdBfyBtEbGpAyiFVCmb74yjxoLLuXT
	SxMLfYG2yx/7OR8Peg+CLb+wEyjyGq2QBL/pWjin70jM5BxVNvxUnm6NVxrtYDGOPffGvWbQszL
	qerkV3TEaJpiHU72qBWNA0qgJku+RQtKS6/oZ3jkHgZLO9j4GU8j+xJ5AqjQxjHtl8A2vHVzNyy
	5dhOktK6ViqRuCxmABG5B2LgqpB4Bug5U2vks7x7rv9/aUKAxsntzS2QRpcdZa++OvKbeWMOUzC
	fVJk/5XJrdhUh9umYflyiKfPS40fJSvRBUEM6zVuwy4wAkgP2bB+1RTxxaOH7ZWoSVVsMA9SXnc
	t9zo+cNjTCJQtFeyQ9SJ5sByK6MEdndeFtEVpFLJp1sxSgC4+74siECwRor00+Qj51BRxODkCjS
	G3ZCH6N1IZLo7evJdcHwoeLu3C/HLFmLUlTmg+XhthqDhPvsELWbFMWCbnfwzftlm+d/t9gC50G
	PHuzlx9+Vldj0/lJWWZPEssDICp23MK9vE0HRwLTabmjc5TBXeJLYu2qYq0Ez7X9uzQi9+RdS4i
	TO6t0cO76rRpXAdfnZkbWgXTHxm/ADFI=
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1522656666b.8.1795605994515;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Wed, 25 Nov 2026 13:26:10 +0200
Message-ID: <20261125112613.237333-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..6296f3ab1d0ce 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,12 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
-    items:
-      - const: csi
-      - const: csia-pad
-      - const: csib-pad
+    minItems: 3
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -121,9 +122,35 @@ allOf:
       properties:
         clocks:
           minItems: 3
+          maxItems: 3
 
         clock-names:
-          minItems: 3
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+            - const: cilab
+            - const: cilcd
+            - const: cile
 
 additionalProperties: false
 
-- 
2.53.0

