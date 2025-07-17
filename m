Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C492E540E;
	Thu, 17 Jul 2025 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762126; cv=none; b=YfGRLVHspPiLW5KqAm84V69RzP6TF/e30d7u+BKYx03Z7e1HvrGDFBgGq/vWrder39s8rsJ2D+ebSfKFuRHCU5ByhUNAOD5grQSMvJ8ic6hV6Wi2GfQHIaXp4Mj+f7fT8Ak0rI3xinkzUCr6K4l73WDsm/Lg2czwoRdt1cT63NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762126; c=relaxed/simple;
	bh=Ql3odu4X317kGtAlvz5t35MK/7QwNDcP1Ox2KTKUr9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTTIJihuICsTblQj4Gr9zXAeMjG4W3aHW5vaThu5X0DrOqltZhdaSBFuOee0RI8gxAmimHgW4oIWjous2O6KNywvGaBMOiCs0COsT7Eo3Z59RtJZddnmz8aXr31L9h8zOXwDqnpe4qo64GcqmEesW9iLomIQ4XmnaehAaE5/zpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yry2neFB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yry2neFB"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1057282e87.1;
        Thu, 17 Jul 2025 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762123; x=1753366923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
        b=Yry2neFBMG+BD0OXVEPCOjP52v8ZkAgVEP46QoLPZ1WSKRdhKeZR0ojfuAnqxESLWJ
         Yx0Er0lJMx1PshFAHjOt693xOOOLXK+ImWDQ7+u2PBVuBGtPlUlsI0ZK0HmBsgzaZ+cc
         WYqTGXc/ybrNJ47wssbpuhrBBJLt9lCkOctBHeckOMxgsdERz9xBFbOIchA0aKbETQnf
         Gihj0HIeBYSjwP/PTw+3wmcVHBmVcDbb3K7v1/FDv2Oajf6PoIYOs80c1Au2YsQ43/Se
         zCFCPbVc9pbfsIn8rA+WVBNUjVajKg0XxXYL0vPyUpGL8ipFGfFwBBFBFCfjUlNODO39
         3fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762123; x=1753366923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
        b=SQjU9Q0tIIXyYCrNdw/cYk83Y9xs7vdvaFe4IpksqNsR9YzhyggPGufwIWUMg9aWtZ
         Iw1iJ2Vpl0XVfn2ecLLnKDDGA7WO0DlCgDxhdVSMtYF4LsV2uN6FGPVExWEPuX6rmepF
         X/xvsy7v93leU/o8kncRPXSFoCwmM+JOTKq18yKDlVf0IYxDAffcdNvOqIHGj4Fdrjb/
         qp2supjIDDG2yUia4GSBkgKBpFSmhh3jn7zksY7EaNGF5lqdsJzvCZi1nZqyeGkLdi4B
         uW5MUUddZeFEVXo2Ywn3rEi06eohmb5aWPd0CA7o3Lno950QRaomMZ1OyeAEvhw19goF
         6xUA==
X-Forwarded-Encrypted: i=1; AJvYcCUH/VlPe0kcrpbf2fEAK5HRpNqfItH8dl4HIMsyip3V6rLBmKg5DeVtHa87pGniVSVzBwAayGBXfC6P@vger.kernel.org, AJvYcCUawniHV0Akm6r+OLXkw2I9/n9c8c6S/hxZK/fgbbNygqqB4sk47bxUmMz6RyDiYJZMtLHP0rxHZP1bbbdI@vger.kernel.org, AJvYcCVOLpV6NyuRhu2C0lM9yZmyN02FsRxUDsG6lYn3HZS94jGdHOeZNtz56E47CbRXKq0OmSiCG27gL17lmak=@vger.kernel.org, AJvYcCWvwKr3nCxEYCttmQctD0fPglkC+HGkCKNVZgaRtAKt/oLxL9JSX3P6sHVPEPz70/hNXw5RtvB4OL+l@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNenfBFarosBOw+/VnYAPVBdUXwkKYtWTYgXZo6GEFz/XEVzj
	hHqRqgmlNZPvGW4rNgu4RLEnG+I9k0N/Pw5++fN6rqXRWJCU0YKz7S+B
X-Gm-Gg: ASbGncvHlG1le+gqSOdPVkhIUG9hv5wMeKiM5oH039cCm2YTFyhUUwGe5ybnwre3ijF
	PgwYL+ND4jNLQ34xTU82C+A9f+OKyym5owysYtiADY+kqF7sNuRbxSD3jupbBo15A/+TLweY2lK
	WQ/0SUYlkH/2QRCOqoBctGNhPpxotTVFICdKCzcJkxFvtoXFGNMQfJqQ5DQXhPEqxp91RkhpOpq
	zYUncLnIjHbzoKSn2p4+JuLWkBUqrm9DAZ+nIsTN/PO+yqyxJt7l3xKqTv0JFCRDqJVX7gvnadF
	9667K17ABLEtTdruX7PJx0E39srdmdpUTp1WjLMV5qkloDNpwnnH8ObyuEGu3/LCiEVFFoI5mFD
	M38Eq/2XEVZJcyw==
X-Google-Smtp-Source: AGHT+IEYk+/QbStoViVMLJIO/p/fftz94aAho/XA0aw08ZkztVpXmEoajpb3l1K1Fxb88pX9WHm7QA==
X-Received: by 2002:a05:6512:398d:b0:553:35ad:2f45 with SMTP id 2adb3069b0e04-55a29729104mr984896e87.50.1752762122328;
        Thu, 17 Jul 2025 07:22:02 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: display: tegra: document MIPI calibration for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:35 +0300
Message-ID: <20250717142139.57621-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust Tegra114 MIPI calibration schema to include Tegra20/Tegra30 MIPI
calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++++++++++---
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..ddf1b9fff085 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -16,6 +16,8 @@ properties:
 
   compatible:
     enum:
+      - nvidia,tegra20-mipi
+      - nvidia,tegra30-mipi
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
       - nvidia,tegra210-mipi
@@ -25,12 +27,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: module clock
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: mipi-cal
+    minItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -42,7 +44,36 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     const: 1
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-dsi
+              - nvidia,tegra30-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: VI module clock
+            - description: CSI module clock
+
+        clock-names:
+          items:
+            - const: vi
+            - const: csi
+    else:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: mipi-cal
+
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.48.1

