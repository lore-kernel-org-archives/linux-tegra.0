Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50231B114
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072386; cv=none; b=s4Uq9Cm18M0k76kD5mrKqAeieYumi4JpRZ6P/Sg6kI6RVF6psKEeK7eWpQnSjK9T5vUEdgH/aTrm7qAbVgG1xh52aGSHUiBuXU8T/H9UmHpGnXGK354bqrTdEI7Y5hxXVajftHP/JcCq3XwxsvYmwsCEg/C3wPUX14g5S1OPvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072386; c=relaxed/simple;
	bh=VpB5KsxaEQJ/wbpHLSBxS6BFfx/WRP/aHkvP4DgNB28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnqZlrRjNE7OAonF4VQOqYryfXNDrBF5ggAdP0GswSzBKp/Sdn9B8iRor3vd4zF/mz50Y7uh2cBKaEqatUySKobDNJJN1doH+hr5AorT82QJRBIFWb+dRxU3BHxAncaGdZVtI7xz44o3b7CAos6RVT3jW8mGCYzskytQVZzHhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0yzHdOr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0yzHdOr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so5692304e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072382; x=1764677182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJEMDlRnAtYxOtkizgDV2y1SEbBGqjuPekcDKx32rKI=;
        b=Z0yzHdOrsXoiIYn+GnuS0arkGakh6whVbwXWnyKK0Zy2QkoAQJsNCv9e4U/N6zvSV1
         DmF72Qf9fTd9HWDssf6NurbEXIstWDxZVlvFZWqpKnMzXPdFUjuFURq2AgYTOi5FztN1
         bBN8Rn/+fL9H4RulmSi3IKRQrUqq42HtreAa3nSdC1r4rKLOmj0dFm+24gAVm6H8n6t1
         XEVvw6N+v4kXTEITX6T29oGJH0b1zgOgSFhi+r0y42gmQ24iB8MznCYNzfZ3RM2kvbGQ
         QaYYcH09r6z0TpP19yijq+moB+Ktau4C0Sh0RDVOZdxhgTZEswM5EYLQB0OT66dcnQvV
         PLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072382; x=1764677182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJEMDlRnAtYxOtkizgDV2y1SEbBGqjuPekcDKx32rKI=;
        b=rBoLPW+e5JECnAWWaj0PFwUmxP4SukbKvpslbX3nR2ogrvLVug6pXXbP05HrMIzHhm
         5/oCttbK4Ev+fwAl9fwmizBzubrb4ttW8pZxaxkPlq3AkfvjamofDRqu5KY7sTnI4iHt
         0VfT+QpJKMG4GJRP4YZH8ceIhm4M3h1SJhkK8tDb5e4+Z56/j1c7H+oT7YH41WQv/egZ
         Sq5cx+Xehn5OOiA0358syUyEO9wa4zSM0yMYAvIDSwL90r6XJZTHSE0ANKCX9M2/NG9l
         os9fVkbYLtKBdqQgb7cUfS7o8KFNJkOar5KwrHUGsXp0U745UlR4RjXuULfDJzSaaV8c
         +thQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiqHV3eD+sovWshGyEAaNI891/OGNrQYrEswWTPTSUfO1An/gJ5hwGVS1tjPxeM4ttQZJrssQI0K5ADw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBaaGXNltPn9IX3RYhTRld9WjD4qge9mDbb/0UQZOk+q3ZTYa
	dMv+agLgklFUxa59ZySthgLjIZrMYuNrg9b05oK9METzEF3FJ+FtDSKQ
X-Gm-Gg: ASbGncujYiCjsEVWJTAAuRP2LU8TTWHWqtvlG9Hd4xqmTjEiALLXKkyV1xHc9LkE+NF
	XgYkpq2AmY6jSoYkMj2hvpMJuBlpAE6wQ1Rimy9EsVRy1+c81VeMwwTI+ydl8o6zzpsxMArU9EN
	NWwQo+/WKz4QOVVfDuOsb6PAEvQQ3A06tEOXTPxlAjU66jXIIUjzxR4yyKG3ittjPMjPZEvjQme
	+6SMvcvqqjtg/Cvli3I3az7/E24LVVYPFY9qrwbW/I2Pg0pA5/UQd4UE+dWO0JFrDg0o+7Da05S
	tGrJPUv4qkiCuhA6ZgTePvkBN5Fz3ZZr/TrUcRxHhziTKpO/3AhILKTS4HLCo08Czcg7A9BUN5K
	yxJsiJoV5RWqAaiD9h2dWdI1BD36UyyWFbNSuplDUa6mlyqaND+4PUTnsrzcDv2HljM8ht+k/My
	Y=
X-Google-Smtp-Source: AGHT+IH36w3TuHWPc1jMA/wg3Tn7wl0i5GUwtK/kPIQJ4Ssaozza3p+500oaEQ3DvmpkAQQGjIDQtQ==
X-Received: by 2002:a05:6512:3185:b0:594:3d20:f03c with SMTP id 2adb3069b0e04-596a3e9fc60mr6084105e87.4.1764072381595;
        Tue, 25 Nov 2025 04:06:21 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 03/12] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Tue, 25 Nov 2025 14:05:50 +0200
Message-ID: <20251125120559.158860-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tegra114 support into existing Tegra124 MC schema with the most
notable difference in the amount of EMEM timings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra124-mc.yaml                   | 31 +++++--------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 7b18b4d11e0a..f8747cebb680 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-mc
+    enum:
+      - nvidia,tegra114-mc
+      - nvidia,tegra124-mc
 
   reg:
     maxItems: 1
@@ -64,29 +66,12 @@ patternProperties:
 
           nvidia,emem-configuration:
             $ref: /schemas/types.yaml#/definitions/uint32-array
-            description: |
+            description:
               Values to be written to the EMEM register block. See section
-              "15.6.1 MC Registers" in the TRM.
-            items:
-              - description: MC_EMEM_ARB_CFG
-              - description: MC_EMEM_ARB_OUTSTANDING_REQ
-              - description: MC_EMEM_ARB_TIMING_RCD
-              - description: MC_EMEM_ARB_TIMING_RP
-              - description: MC_EMEM_ARB_TIMING_RC
-              - description: MC_EMEM_ARB_TIMING_RAS
-              - description: MC_EMEM_ARB_TIMING_FAW
-              - description: MC_EMEM_ARB_TIMING_RRD
-              - description: MC_EMEM_ARB_TIMING_RAP2PRE
-              - description: MC_EMEM_ARB_TIMING_WAP2PRE
-              - description: MC_EMEM_ARB_TIMING_R2R
-              - description: MC_EMEM_ARB_TIMING_W2W
-              - description: MC_EMEM_ARB_TIMING_R2W
-              - description: MC_EMEM_ARB_TIMING_W2R
-              - description: MC_EMEM_ARB_DA_TURNS
-              - description: MC_EMEM_ARB_DA_COVERS
-              - description: MC_EMEM_ARB_MISC0
-              - description: MC_EMEM_ARB_MISC1
-              - description: MC_EMEM_ARB_RING1_THROTTLE
+              "20.11.1 MC Registers" in the Tegea114 TRM or
+              "15.6.1 MC Registers" in the Tegra124 TRM.
+            minItems: 18
+            maxItems: 19
 
         required:
           - clock-frequency
-- 
2.51.0

