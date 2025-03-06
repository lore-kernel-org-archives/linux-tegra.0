Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D9279334;
	Thu,  6 Mar 2025 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283978; cv=none; b=Td0DYMr+3eh5xVvRFvD5QS6e0fBZxuG+Be/WPJbbCSS00CKLDPL34f0oYR7Qm3J723w/eY7xG0xGs3R1UyJdZk8cWlogEHtUqoFWY5NTDZZ30KZ79U65sNBRG19N8Zt+TG7nt5T0/Fh6wq5b9Zi8hkgYHWV3CPae0PpdDhGVJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283978; c=relaxed/simple;
	bh=ptnDpw6IzDY5qpO9u23TfmbW8y90ukqjVE/OfuCOJX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXLqeRjuFNwbI2b77whRQnHCVzg20B7xAUEDxUWRsGiFsAmCMblvWTbG7Jn8Rn/cwZITBFbL6KTbhLzTbmyvhqYMd7IJogNzg2WLDBR9TVee1YbOdFNKrlPAV8W5tlo5+Q9QX3N1ne9SMQb/U7oFnGwPANuI49mvhEAbwMGK+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGZGDhJl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGZGDhJl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso6475725e9.2;
        Thu, 06 Mar 2025 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283973; x=1741888773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8ydr5dwE+tPsrRKvXCbYf2D+aelQJFLo7Ib1Huj3c4=;
        b=bGZGDhJlrpodDX6A9VywxxYVaILZcyBzZLRJk1Ud0HBM/J1qfFJItQMhFiEnDQG4Bt
         7UZmCDYoY+0dnCkVb0DuSD7Y+aA74jI63vqSgBKbyhefGiGDsTzO2NTMcKbdyJxrztSl
         CUUwATYD2F29XDZIZ6oNAM++/VMgnG27Av76S0eNRlTKHNGEyV3wj6N0YRDHuKbgjDJQ
         ke5ipkMmbEUZ6re2WhzDIhr9QWKVnAveifZLtbVxYoZll73XxiuoQ0+Ohj+o1rAaCVfY
         RUooMiAH4uegBQsl5BQDU357ac18QE2u8FLaNb4ChbHEUGDdFcKTo3nNo0sVpR4kJimp
         I1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283973; x=1741888773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8ydr5dwE+tPsrRKvXCbYf2D+aelQJFLo7Ib1Huj3c4=;
        b=tmBDxoXDTOW7zBIeSJkpjJ8xsSf/EWKkFrXFC4FYjj98GWvWCZr5KwvbT05i4ScfFA
         2eNA0uGplPRKbVMxTq2R/4zsXrQNnvCDSzgQzuzMe9Z/efKmcOdRmA+JWCA/gSyOBEJa
         bHA5PdSZumrLx1h+X1Ghv5jrxNBskrp1+kl6mbtuU3rMnDBOSXZTfNFPazerjnMAzrpL
         G7wvwIPukz/Hc8/5lD/Ny/QizFrF59lqLoVH8ewjeFrIsYj1C1FEK24F+ACb8Ycyj813
         aBVAd5J/MwJzlAWM+aHhQomZdviKjcU0nV/jdC1zS6T4fJxnL7mCR+IbISAGcUCdgDOq
         nBpg==
X-Forwarded-Encrypted: i=1; AJvYcCVzfpyrejCA3w4p84jh2lQhKCAO8BvRtxDN5XxzN5Dv8r/dls1k6DL061sf/F49VG+LVwVKiWnGB4CP@vger.kernel.org, AJvYcCWdyyh7EU+1QrDQOv4fwJngsP5r8nYiNuj11oMepxM66e0fAzp0seDFeHkN1SyskMP8hfRX8c8j9UQptKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCGnQSc2pekFC9W/gJxfzZ3aRtNYnIGRdKqGR9GStlIejJqjm/
	brihIjW0038qx89OGHBGVW5N0MG4029cHVWiemeKzrF49X6i8o77yNRbIA==
X-Gm-Gg: ASbGncuZhnC/cTmmHhkgFbBy22pS1hgHLzyECLP8K7LUlH+fSmJIeWbvjzCDNxxbrIq
	+sVYxJydjuWqb7QqsMXMZsKVDsNAJEzKr6TcOItJaydUjcQWqJ0Wkl7wryoktSJ+pnGZqqbF9d1
	oAStJ2Y/l/SwxZ289cjZDGknUb1W/+GIKLOCmmDznmpHcgwM/sqPV0aJ+qXEHntrObdyDTJLFbz
	mk6S/G8j0p7t7ZqYxJGpdpqumbyUTI1UCsdZSxakeT1fyju8ZUO3IjwSzu9gGuiWXvvz8HR8Ot9
	Ludo18FaIR5s1rSid8NF4DKCxlriSCwRIFBalGuSSQ7YqiFnaolDft9PVqnctz+NrPuatjv41eU
	VR5XL6iZLMQ/yzeYtvqQ8zNiHtGl67O7nY4p7
X-Google-Smtp-Source: AGHT+IGPceT47czRVqMmIj5D67gcsz+03yLR2QEQkAhWqZem2iWegtm+6KOhcl5S7AFgcmVE7ddJOw==
X-Received: by 2002:a5d:5f89:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39132d671b9mr56584f8f.1.1741283973270;
        Thu, 06 Mar 2025 09:59:33 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c106a1asm2717239f8f.100.2025.03.06.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:59:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: tegra: Document Tegra124 MIPI
Date: Thu,  6 Mar 2025 18:59:30 +0100
Message-ID: <20250306175931.2028613-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The Tegra124 MIPI hardware block is very similar to the one found on
earlier chip generations. Add a corresponding compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index f448624dd779..193ddb105283 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra114-mipi
+      - nvidia,tegra124-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1

