Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59F3A6EE9
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485705; cv=none; b=DQMjG6RgzWjk8nLMqStnfvCuTkaj3netHWbJyNF6Cn9Qndg6bqvXe9ibVQCtIqg6quzzZ8Z/QxaSnZCBzS7tWhiVNLHnbZbsjK2sc63rwkJ4/k2T1IRFZt9Z7rA3PjRzOrSYGXPnv0CsrHmq5Ja6CoowLe1ckHhDdWvZ+e5oFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485705; c=relaxed/simple;
	bh=Ql3odu4X317kGtAlvz5t35MK/7QwNDcP1Ox2KTKUr9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyY+2vKFqKeaw7+9EmT1pIaXpQWWFsoPgx7gQMA01F13yoMGCH7Dopp8UP0qceDG5r0NqoMx/QwQCcEbHYhwE7JyUVHuw/XTsxbll7S4x9dW9kSYgpGF3bIrz5kueXeybBKrQuHxHk29JBBh2yXjw8ShNgkT8beYSuxLu36pPLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQs3jl74; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQs3jl74"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a87782588cso4565265e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485684; x=1779090484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
        b=NQs3jl74/rBCoZWKSvBNC8HgX5/z3oUQraDROaRVRw86Qyv/Yj5566b5fOmuxDXQEw
         6RFLE5YHIH5NN74wSgjEbk8Bc5iSpKnxOSFKHYjN0A5/GgFZXO0IiRw/NhbhpHirFZD3
         QKj0vgufruuEISGa8hfNvbDM39FIsqG58xdIaL9740P5YbOvkgm4zkXA4frErpGtimGW
         nMkvR7FRIliAAL3ZzSCV4pqOVbDgirqr2d2di5flIX2vnh+FuBFoYfc1cxEDolvby/qY
         whK7PB5lUXCOYmzLs9DZ1gtE5raGh5ciMApTUa4cWHymJ2eXbW9wfixXGx42Xz8cffvX
         IjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485684; x=1779090484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
        b=Z5IMNvypBRUO58mn35ZE82BbaKjxsbz9gAm1XDsS32JwzBZcFQRQd6NbGdqaH/pvvI
         hMv0jET1VI2QggR2d6Y9IHbCKpZG2uT7iweJ8I0HlP8CbijGSh+zS7ionzWQ++9Xhw31
         Ofmuf/IrKI4zOE3wwqOWkD/5oHP3+5F2hmeJ0jZA1zUodpSkPNMr6UHNnuRsh+GJ7KDb
         jZADIj0MquLD/4gLP+alqul7gzNCbp0RTc8DTuW/BveJ0nNOCzXabJEAlVWip30Qk6vo
         120ALuhhLAu7W9C79VjRcc3PZMszmy6Rj+eWZZ41uMiVVV6nQWyiAUYAbBInhKpEBUWx
         HE7A==
X-Forwarded-Encrypted: i=1; AFNElJ8CshJDwIoOGZcotc8SyOVvNYfgZtbie9ZLsBYZNeFH7DZNUEt8luKT8ghYNvuOA63gFbtGVI7uj98PAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk598JW9sF3/ni5zQFa7lUdHbZt/lkuWp1FU5lnD6k3EWuBINx
	J9PSkdbuD79/K/Gw2lhrcrqEo6bX6XnCrybG8N9zZftcOkbBJ/aOWEwn
X-Gm-Gg: Acq92OGF1RNY9nX+5YWjjLo+o4f402fceahyy3UE3pIRIST+Mf603e69PXOucK1FKem
	Xz8BtKsVxD04WJO0vzHLf/1bK5iRkrQFwPCaeLf+gE29OXk4R5WQxKwMD/KyMkgWeE0pxOKsopr
	dovdlEmFiHA38wWL3eHCiWwOrh/AcIY016Ci9zPyfjkZURnU5ES58D9izRGkAymXgWeLO5Rlv2O
	inWKyLYkSiHXlQmWRzaCNhMsfUkwxZ5RIdS+haIbtiussq1P0p4RKgIfMxwj2asgKdoAFt/90g/
	lBZDThzBf4DAcb9EK5k2OpDeM7LN82LaWi0ornHP24LEP7dJs+JgR+h+B9JxjA0joAab5gcV82A
	0ESVPyFxjV9c6FHRfKIVghlLKIqY0htFmrp36ZmAB0xI+a5ncl6F9IfQWlghcx8Jms5rkVavJQy
	bVnt3rBNWWz0PR
X-Received: by 2002:a05:6512:2350:b0:5a8:9672:e297 with SMTP id 2adb3069b0e04-5a8b70926d4mr2897789e87.26.1778485683830;
        Mon, 11 May 2026 00:48:03 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: display: tegra: document MIPI calibration for Tegra20/Tegra30
Date: Mon, 11 May 2026 10:47:48 +0300
Message-ID: <20260511074752.24745-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
References: <20260511074752.24745-1-clamor95@gmail.com>
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

