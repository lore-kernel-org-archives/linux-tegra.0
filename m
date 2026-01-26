Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0C156F20
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454489; cv=none; b=W8UE/yIwWg46wdvoCvNwgwzKcRFiPi0YWdIr+oNN1lkkmaVDVkGgefXAqfXxXvLYCBv7+nYBtIt2V+Q6/qJarVJo1hHrWs5v49HZIMyhNpOlVmZO7yW3VcHO0WcqZDhiXQ4CcgZARc5tXF9hg9HiRmOp9aL9UzSliv/V6dcgnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454489; c=relaxed/simple;
	bh=jNDdUruLQ4NJEJ/OpjZ8iy5uqg+2jOYXB4pKKupU3R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ah1e4JnuUOQejzpmruvphtqOi6Fpe+Z/Pi5/otKgjZHje8hZSNn8NBXgASqy10pZallBaebfnuEDTFUBNUhfFkWhFyqUWaeBdKtaRolL7+AIA9VoIgFR9DYXTCho6RW/F4/J+GpF8jRBGNFVdaBtoSLXnTTTNPedZk7k/oG3pls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blxmw2oO; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blxmw2oO"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee0291921so41614095e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454486; x=1770059286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW/HnbEVXP7K0ODU5oJ6HSJhtEpR7FF8JH3bP2DOemc=;
        b=blxmw2oOAnEnW4koD+G0DNbihcMKhPRHeXu2bEJ3lL3+XiLLlFkjMFW10IFqo1CEr6
         cLs5yAHfszXLpvGuSdA/TOCS4NQjSGdW7hekY1oZvJKfioQyhT/iBl97Qwzf1XhqMgjZ
         iYUw9ObygAyxwgJ2KrG4dwLtm6RCUUCHgmii07kdJXUin1waNZGC0qOSUCDFqEoiukjJ
         rHeKiggNlhnneaf6xksI2rLX5Ir4iTW4mq3loPMFiRI4inkva0JjKwkT/qJpZ5efbmG9
         TGpHIe6VU+R43RPyP4HRkxFJOz2HY6PK7BIPGmjvUGJHN2pO8ulilAvdlm4G4+i+P0wg
         M6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454486; x=1770059286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WW/HnbEVXP7K0ODU5oJ6HSJhtEpR7FF8JH3bP2DOemc=;
        b=Mls5D/6gp75kfjFZMw9RWnW8Dag5T3q5YFmBENBdE5ieCoLS07kkdNqwPc7cg+1JQA
         /8DEYos964YVOagIfk3fe8UIkif+uXEdNScctjXxWPP/YEljGx/o6XBdGG03EuGEKR0T
         467NpCsOXAMySuAp9DwjyMj4vwJQIQsQ4JxY3wjwffCXvkotahgsM3M4lh4QfOd4iKJE
         hTtZbkAycQu1vYm3l2IB+yshjgZZD2fOAmsIbrDJsXO/OyXZ5GEjeQ5ml6AibrWvCSZo
         6otkfU7Y9vbx61mODdrGH2Q9AdGFC4/vR+ZRF6TzqwVg03c9MNOWQmiXjwaJBGZqZDo3
         kEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuvDO6gcXIqzzvkhEwDOP6YQKJJvV6DFY/gxT8LCIqmBZM46k/MzXFev7bIhg836z6Wa/K0YSKSM1IRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGiUZSi3MWiciHKoap5kXaU/0ukcT3XrULlYvbfWE9yGs90Cke
	K2BY7B6Jv4BQ6VB54SDugSe8a7FaEf6TnLVXZY7+rvYOgGxGUqfledHV
X-Gm-Gg: AZuq6aL4sBEZTiwfxPxe7TsZYAX8vkOaou6ydvtLfZRYgD/9jKv/OtNexy3ZrwtMJn5
	/iaSSIvVDBDIeVvvyGEEIcrmUGgsV5T0mVC61ZpYfnQunvWOU6sKWXMkP6pKr4E5KrcoRL2IfCc
	2aJxvlve4/j9+DODqAZbXR+RFtKDluXm+Pln59qLfDzd0Ub4UCyAgCdDZnwYVMOpVE4W+byIPm6
	Vz01zveGNrUKTGNO2xRYrX0emsux42yEJ8TO5lLhic/48kCKmmqVkblKCGT8N2SGs2iNvUlANCH
	tvDhq1eQOwvfXMeY4hgCxQbH+HD9cIkgx66K6Yz4B+mAWRMmNvpWpnqiw4CjhVlONrPyirhrA4h
	JJzMJP7SEkTLN43SZ3QcIdlf5AdGYOsdekETviFvmOHmVhEohqUDNdUry16ZyQzodI+PnsqZKrL
	uB05otSU6/4eo=
X-Received: by 2002:a05:6000:40cb:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-435ca145762mr9273007f8f.27.1769454485769;
        Mon, 26 Jan 2026 11:08:05 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm31802030f8f.11.2026.01.26.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:08:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Mon, 26 Jan 2026 21:07:51 +0200
Message-ID: <20260126190755.78475-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126190755.78475-1-clamor95@gmail.com>
References: <20260126190755.78475-1-clamor95@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

