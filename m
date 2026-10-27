Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102469;
	b=RPC48+OEX0XhuVV3C27ffbYLC9jp9z1XhxkiwZ8noDlxCFA/ldRvQ2YeKSxS3R1NTlU5
	 dtAbSLtOMXEXd5e+mXPWie0LV02PuMKT70XVZPcFbBSkMInuk60ZOUXcoJJk+Qat3uFJy
	 Oa1VQwTKWnz7BxjnPfJ+KUEgzN7cV0Zt+EgrMQT1H74+yNJ86e75leJ4IIaq4lEw7GCJW
	 jeSheU41kzQNwo1+J4tRkmDoxpMeYMrxER+Ze2J3UPSPsYNw9J8ukGvMdtkFcLYIMTbUD
	 CXVOfC/AKCKOIt5TNf06LttU4uW64Ui1nhfd0/lDKcExc+bpwxLLzTSG5ohTAlbn0qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=jJfn823svAGk53Ac0Fuwo8xPc2/Iic4pppGS3hWTrK9xlDrAQV5HkukHrLvzdA3mEP8O
	 rYOwk0XT8kyxPnUYHlIV0KmDSzX3Tiko+KOVE5Zs9nPi67SgCiDrSSvaHPUgNiZJYD7pO
	 SQDjmed4jbCddfhRzrOqoWFJz5qytUcLc+HGhtXLDLvBdHDi/IIAVwrXBasz9hsX1lkwn
	 X9Jh8p0uqwRtX5ANIhHhJNEie/VgGIQdAcR7uFTfuWK0BmrZ5BQOBHTCloKCSt/sSsWMi
	 BJycIn2H3xTuYGT2eZoVvrkrYzQOQakrKvMAgZQ6WC+VtmlkI3TDaG7RXqnGb82dFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f/lWBDEk";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590D60A381E
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B590D60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f/lWBDEk
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so6678158a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102467; x=1793707267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=f/lWBDEkfIPYFql3vPWiiT0rc3kWE1tCkHjWfg1CKxziyIZSDJ3v+JAjoHedbkvtho
         8Cm/kuiTJKwJvHx6CCRVdEGS1z9ABZ9tUjnKP67gzJA31Rd7eGJaCVkvqC5m4OM5Fy6t
         NYXMRa8we68AinGC9pbbxsO5Z+xeo/AYq/QoqXNtOCPutbu5qnFeAflJi0Eo4Ptc2gub
         qZUcENewFIXSny4FMvENO4D/KDg4YI77snagNteSZRUsl5PyWekoAEt7l1kL5qNtx/wy
         MmRTbLXTQWua3o+U1KtLi99yEXXzgPTjtO74lpJyjKd/DJ6OcI5LnyCuTst+PYNCy4uW
         tfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102467; x=1793707267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=wblTzhmA2RIY9hZ/hS/8lQ+pzmraeA4HTx3yQvMar+5Jw9whlXB0GGlEyuxx97SEGN
         GCEDdF8sMpYlGNnBVzww0auCoZGbdc2jK57XEWl1uQlevWNzpXzJrPVPVY1N5mPpPTEA
         vw1elcxYm6wvvC2Aqb0HzLQ98uwJ6mijSrSsvA/Pvvt2GhBq1pQxOU976cUZSDAPzUOo
         1Fyy71NGywlND5zYOpsHT0t80jauNTMuTyuNaSrXCaDN5gB9YVQp4Nu8BqHSJGh7IWJx
         R5af56IE5FVuQt/Df2qC051plLnbRIqe+bXnsa+ezD1Vj7T+zVLnOLbrbXhsbpcWqGrd
         oxHA==
X-Forwarded-Encrypted: i=1; AKwUvBxNvmPMTyFklfL5x0P7X6Slt+7iqbEVFQnFuzPIPnhRcIIbHCS/7fLf6y7dX4vCyZiY4CvIHoE6Yq+/TA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3+0cXRmMj0inhnYfl2JA5cQ4hGs53eJqMWe7x6xGNoMhgF7aO
	Q4vxTCyC7LfEYifiI9HZpwvF8X5LEeH1O5BXkMbJ+yxk6xyQ9RcWxzQ/
X-Gm-Gg: AYBFou3aMVXEleLhYs2kmeXAMhy5qQoZBFZGuXwL4v3o40jBuMhmKk3+f6wts6IiAgU
	XgCIdQ+37IwoIjCo58BLtzibZfU5t1ZO2zRnArwEj1K00jlzX5hIyxPJOTNOMWjRuDJ1unA7+47
	rIxbo5tyy9IiqyG8dLFoQgoSDFmtTc2OFbIEKwRT3QsY7kcNQhR81uLMuTHcCladY0YN3LSKcc4
	QmW6ZBED1oGmHZti+t/cHZJyYexHs7CqMlT/yuahBz+B47RhDuaZrfn5vwZqDTb2l3DG3drWMhk
	9yRygO5n6sfpBiif6Rhs2vXm2581sm6QYSuyOkwsNtZ6GDgx/GuAbzq80XbtKHOfZf953Ocumdb
	8Jiepyof0RLnxKKH+lLpPN2f/jKeK6gfambojCJ5S8iF5ybRzjoQ+fL4P3baBhPB7cAeEdWH6Ha
	z149sxnRi6TFCNhkaOEtyNJil6L+FrYBYFu2y2ryWBgByJ9iyYSfcqrjM5jyrjLPtrEFxTfrqU5
	IDIp3wUgeQo9ME2nIxCUOMqHM29whI/QG/ZoUrxv2lEvCeFe2xaYi6j85vNwgVC9SS4M24rDu5U
X-Received: by 2002:a05:6402:a6c3:10b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b44324f449mr6887681a12.34.1793102466212;
        Tue, 27 Oct 2026 05:01:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:18 +0200
Message-ID: <20261027120019.93611-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Tegra20 AC97, Tegra20 I2S, and Tegra30 I2S controllers each provide a
single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml    | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml     | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml     | 8 +++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
index 4ea0a303d995d..19e242f6cf028 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-ac97
@@ -45,6 +48,9 @@ properties:
     description: AC97 DAP _FS line
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -57,7 +63,7 @@ required:
   - nvidia,codec-reset-gpios
   - nvidia,codec-sync-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index 68ae124eaf804..9a17866da7731 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -15,6 +15,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-i2s
@@ -49,6 +52,9 @@ properties:
       limiting number of supportable audio rates.
     type: boolean
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -59,7 +65,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
index 89c3c6414ab13..fbe4cd4619683 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -42,6 +45,9 @@ properties:
       - description: rx (playback)
       - description: tx (capture)
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -50,7 +56,7 @@ required:
   - reset-names
   - nvidia,ahub-cif-ids
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

