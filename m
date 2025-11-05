Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DF334C21
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358725; cv=none; b=XpWBMr2dHSOiga3XgaL8kvkab1unSqvYQeExQPmxFrmxb9U1T20Oqm0GvSVXsBNzfRwMECcgI+YIj5DJnRAgIBZkh6ebvfYTp2YfAKhjdV/vr+nAWuxMrm2BfN9MpxfIa+GX3k8AOU1pvt5WxH4s3iVZPfG1hdFIGeIYy23uF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358725; c=relaxed/simple;
	bh=YtqP+iwcKtMakzXgLk3UQKPhw4kYFhpKvW8eLwW3czU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhOZ5wlSCbMOY8pczANXSEqWSkXCZVJT0mji/8EvszBIOu0hi15eEeu0REFYZeTfiDAmMgZv8gFhd3t3izuE7P2FfBTk51XCTcQhb+BbcJ45nbOgu+7nfdE8R34MuQxur69OUYScX8EfW3rVPRJNx5Rr6saC4M5sH56yWW++xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFAWsg/V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFAWsg/V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477442b1de0so27021395e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 08:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358722; x=1762963522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi36H1hNTl6bMN6Cd06JLPD8tUQzuyL6UKpqqUX8AXU=;
        b=TFAWsg/VlGcwdgZk9J3z6itMaDzN7cG4Oq0Yh2d03K85t8XD04mkyaB73VCju148Re
         ZHmSoC2k7AxSaaa2wMoB1LEEdiCRUbKJAVJq2PAXjptso5ixrpInPIEgHzWja3GcjEyc
         lytuCs3A7fDbb2qNGkvESQlFpqwnrFGEwY39Pg4Z2o0KLmSfV+bR4T3mjy1JR40uiJmL
         n+mrCo0yWJf8faK411ZcGuk8ytByaGNAb234bFvaTRIq0MGgR4d7oxC5rEB08St/um/N
         mWZUscj1QpY7nYMJtjT32tvENaUgMP2AWMqz2GO/8daqQHAdhXu+6qwoTGmZ5YCwHKRn
         r6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358722; x=1762963522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi36H1hNTl6bMN6Cd06JLPD8tUQzuyL6UKpqqUX8AXU=;
        b=Sh59A9OQXTeoDqNMYSKOW/KAQqOl6a/poB6PQ/Gm5VfdEG+H9gVxZ59jjMNgp6e7jB
         cWRUPt2qCcX7mPI8rFwQXLxwnMGKUjDGSn2JYMtZ1a7WAVBZeU4SnmIkX0ZpvGLmS030
         Kyem8SNholIFW3HPajwTex75TTZsh05/ah0JbmE31dbCPTqzG+UpbGrrpGhSMdDxI0Xf
         27M/rxpNBk6FB6428FSp2iwDcOPWWRki/QuM+m7QXnmWyefSHFdsBnjCnVOlStECxPMM
         DWa8GcWYeb2RmiSx4WyqeIPEP60rPaMhw1bsvBBMqzZVEhHM6+TbD9CiwehSo2mkHCMZ
         SPnA==
X-Forwarded-Encrypted: i=1; AJvYcCVbA0Ee+H2UHiEBxKBk+Xh0rt7j5jHHE7+iR8QCuaWPk8XNckflrcEOmD5pqxsBh2Oi6zQGzb0VBVLVDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP65Ujn3opEoPal9tQwUAtnn+1gAF9PZwRmJ+4kzghkxVlOI/k
	DOlF5BOlqByIx3T/BmAZA9JbkUy69WS0YlcGzfixmYkoUKrbkAgcGgYr
X-Gm-Gg: ASbGncsD4CDIGQ8MnL+jkO/dX4XAS9f+pPSUlWmN/G8KD4aqMGeIjE96gJ84Vs1Wa7u
	pRm3IqOCpiFgxZLr5Zvkkm5Lw0sRNejG0e24gtUUGoFpCa20HxWO9/3hm0gCEjDV4G8awg1JKQC
	ijhRlKoW2GLj390lR5lD4974lrzUmXrs3Yu/imCMGbtkn5AGjbAZfqHQeUdAphBWcdqsgvylCtk
	F0ntcEOZftM2REp6J7IjAFkufGyEIg/Nllft8P6/0gLLJ9oRvnkCdapaX/6CAeoxZKjB77PCuxc
	hfQ/oX6/3G5CP+PzLXRvgH5YEnxaoyn5rX0OfSbu19fNpVNOkKw3SLqawIZ6aSvHJnR1cc4qTiM
	pEC4TbgSFcxUHxOwCYIBzHJez5sy/yS6QB5GsAaTbwDEAeIKRbacX6mosGNrLQGCTxvdSWXdRKF
	L1LmjvNk2l5HZ/eqGhcfYQnVREzTMUO4c3wUEbFKkPadLGSGig9B2IyuHjGYqayTTmKRo0
X-Google-Smtp-Source: AGHT+IFIw63y8/HMqfwqpMpvegHOj8/fyBrBB9+zxkNIj4mos1HOvCMf9iyNT5somnO7vFbCIP2bew==
X-Received: by 2002:a05:600c:a00c:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4775ce14b0bmr27807925e9.26.1762358721509;
        Wed, 05 Nov 2025 08:05:21 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc96edsm55240185e9.6.2025.11.05.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:05:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: memory: tegra: Document DBB clock for Tegra264
Date: Wed,  5 Nov 2025 17:05:11 +0100
Message-ID: <20251105160513.2638408-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105160513.2638408-1-thierry.reding@gmail.com>
References: <20251105160513.2638408-1-thierry.reding@gmail.com>
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
 .../memory-controllers/nvidia,tegra186-mc.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index b901f1b3e0fc..f0448d9ea1ba 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -92,10 +92,12 @@ patternProperties:
       clocks:
         items:
           - description: external memory clock
+          - description: data backbone clock
 
       clock-names:
         items:
           - const: emc
+          - const: dbb
 
       "#interconnect-cells":
         const: 0
@@ -115,6 +117,9 @@ patternProperties:
             reg:
               maxItems: 1
 
+            clocks:
+              maxItems: 1
+
       - if:
           properties:
             compatible:
@@ -124,6 +129,9 @@ patternProperties:
             reg:
               minItems: 2
 
+            clocks:
+              maxItems: 1
+
       - if:
           properties:
             compatible:
@@ -133,6 +141,9 @@ patternProperties:
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

