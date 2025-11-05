Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94D3446A3
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372430; cv=none; b=Sv5eOC5eHj/UTg6E3vuI8xOSjJL4eEm0qkEaYc8mwOSKpaREZk7YGe5ZZko9RJwcity9L9CIOaL1RQmXwF8C6fAcGYyJs0efWDZhdHNFRxcO/4hnP3xhaeCecjCTWGg6uxWfPAZr24DMpnBWVzYjL5eN6COPoLWFh6iM+1Ndifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372430; c=relaxed/simple;
	bh=nDSXbEA14YH8y/oPR/w0Ky3IfyZb62yKNCJf6xw3JVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIK2dIkb7YIY7KlbHpmbxMCTtCOIw03AXh0aTxCQ0y80rkta5CR2g5+Xhj91qtmes+T3hni0HHBdQVh+RfOaYK8W54K4ZNV/q5FDRA4K6Iao69Tf+O2xqMxNiYwC9q5ssVxHw6gYPsh0v19tQgA0ZWMJJ9z57s6+Vzb2Oy+hi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR3M6Nur; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR3M6Nur"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso2237540a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 11:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372426; x=1762977226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pd56Sg3/Jvfa3vDkf3Vd7se9qoe1VrMEgMi9vGUT6M=;
        b=RR3M6NurjgLhsFewFKWAqIkvuVfGfK20BGPpZ86YwooXUgMOdWXUCn//tujrn1QfxE
         UmAvE06IglcYdlGm23HQzlhoOnCMLin8fz25W+Uz90U4zAeEu0PfMMpKKAeX9PaS5oCy
         VOoKBnFtRVivSr7n81/07xX0jVRpyK+iMr/6y3m+ZXH7wTaLu9htKfvNGBqW1+8anc8L
         oXBKyLHIr9xK033HI1GH3AxVVsrTVrdtEW6ak9plM+d07xFahCTB/X72uNpDQMJeNK/O
         zZGwAfxcTZs+zU0K5w8hr+jGKm/3VLcL5bIiH6fo6/KlhmYhPYwDOiiQh7gk9j6Yev/8
         4GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372426; x=1762977226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pd56Sg3/Jvfa3vDkf3Vd7se9qoe1VrMEgMi9vGUT6M=;
        b=hXa/J/aK0mdOVSAwApQ4g9CNpz/x0gy8s4HZgTQskw7luU4+cZfIcIEcFH891XS3p9
         Eca0ZlMsWpcaCTczwhBHX0QEjLTUIfdqAYgk+9/fR8a2zzp5YsBIxhnRorq4FkHE01jM
         b6Hu790ms/Qkp8yU9XCvUvgVH5M7wgLeidvkNXlCxF07qhVUdtSnugAGnuvza6nboo/7
         yysfQTG6EC81YlIXvtYaNHAbg4AgQUnHrBBARyJj/GS9NTEPAAlld9TtsOSdr127ix35
         WSJshnZ5tlAOCopsnjE0D6l90fJuLDGTjDUV0UInpu7qyoB/wU8Fa1j1Hm0SfAw/TPD6
         coBg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOPy95NFK2VlhdsnE6++C/Q4x5yfjqBhJ6pNgH86FSjiYDcYKA+PTQxhmr3i/bBipg2uX3DW0F4g1Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhwk510UfgHuczM29LQvxTLM560TsuRsRD6C18+eQMaKUzCYCx
	iahi3ccz5qNZZHF2xZwsRsaRfyPXLfHekZmrKllC7Ytb9JZ9kcyaIsJG
X-Gm-Gg: ASbGncsO5aMUZQBJs+9dfle6tXecTCBr7FO56LKbDOd+245PTn094XLoXR6kziqsfiv
	G1ZXVs+GSXG+1WguFV8wPcEthD/fBiDR9/82XdVqPU3LFtfA606X9Fb3/uWKw0RBMhqk9HPrjjm
	TC+tYg3leucCuUxf9yBzOJeRNdsR2s+Lkh7u/9O6P7TDvZIYhVZ6kYxcBpt+EkGs5/OiB+lU9ZH
	0usMnck2A4FstoHwIFjBfu/f3DPs4lwQoNQIXM6y2N8p8v/MdpChjC8sprP8/E3NNECExk9vWFR
	K1UoVKWz2worWJm/9VagT/mANMsB3B1l+3M88oG3A9IWKF8PHq7JkgyJdkDKgRoNIZOKfiTwBLC
	FXIbAPEBZxQ3bqLMvH90Xq1+geyGQ+38dY0D0j5OmwumVoo9mWpsZRyCk38I0cHKVgfW4JfXluY
	LZzrfpj6PAS69yadZAT515UL9G7ns7eDjXZrJL9o03ScmY6xDSTgJKz9z5ca0QT6fn1Hmn
X-Google-Smtp-Source: AGHT+IHl2DGJNFaE2Dcgq/4tbc2DNROR6L8XvbkyXGCf9Y61motHSEnIlgJIQXhK9ts2eFpVF9FWNA==
X-Received: by 2002:a17:907:7254:b0:b4b:dd7e:65eb with SMTP id a640c23a62f3a-b72895a01a7mr77632766b.25.1762372426246;
        Wed, 05 Nov 2025 11:53:46 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937cc82sm39812566b.21.2025.11.05.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:53:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: memory: tegra: Document DBB clock for Tegra264
Date: Wed,  5 Nov 2025 20:53:40 +0100
Message-ID: <20251105195342.2705855-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105195342.2705855-1-thierry.reding@gmail.com>
References: <20251105195342.2705855-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Accesses to external memory are routed through the data backbone (DBB)
on Tegra264. A separate clock feeds this path and needs to be enabled
whenever an IP block makes an access to external memory. The external
memory controller driver is the best place to control this clock since
it knows how many devices are actively accessing memory.

Document the presence of this clock on Tegra264 only.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add minItems to clocks and clock-names properties

 .../memory-controllers/nvidia,tegra186-mc.yaml      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index b901f1b3e0fc..7b03b589168b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -92,10 +92,14 @@ patternProperties:
       clocks:
         items:
           - description: external memory clock
+          - description: data backbone clock
+        minItems: 1
 
       clock-names:
         items:
           - const: emc
+          - const: dbb
+        minItems: 1
 
       "#interconnect-cells":
         const: 0
@@ -115,6 +119,9 @@ patternProperties:
             reg:
               maxItems: 1
 
+            clocks:
+              maxItems: 1
+
       - if:
           properties:
             compatible:
@@ -124,6 +131,9 @@ patternProperties:
             reg:
               minItems: 2
 
+            clocks:
+              maxItems: 1
+
       - if:
           properties:
             compatible:
@@ -133,6 +143,9 @@ patternProperties:
             reg:
               minItems: 2
 
+            clocks:
+              maxItems: 1
+
       - if:
           properties:
             compatible:
-- 
2.51.2

