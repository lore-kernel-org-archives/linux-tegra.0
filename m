Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796082;
	b=X9zx7xhdpDboBsk0KRc3GO9ghiDmCoFJHhsFA7wgM0ndbPFj6orS9WsvdP2jJoXhNlH7
	 ukfQVxx4+3tUkobPfEnkJalcEmR2L0FdzXiuUANCKuVDozyuNEvTCC/odN3PdqldL6pcv
	 iF+tS24uxu3g4YpHY6cXq9smiCAj9d51ysghAjOqv1rPZSba9/gFj3aXOb+EpJ7RZNTtV
	 8UdMbMj8soz534RHRjGGp5SpScDeqNjs9aAcee/ggeRe0xgz8rxQE5+jM0XQgDwh1jf8f
	 WN463k9rakdDwBLhQG5k89FqRjoYgPSBQyyJZxv33i1bEVa/DgcJeafTx0W/hOcltbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=lZC0dshTgKo2WM5UL4g9nLeEdYLTzauUi9TyhXIoqetYd41wpC2FQ7NcAWad9kGbMeE2
	 pBr88HQAvJ5YqHu36G5ZeaIrgsKilfv+sS3P05yfpDahOSKinbLJFzOyqUjA4x53ThONg
	 4/Enh187XY6lsqbU1SEoOB1cOpNfYAvb94XkTGSjwHo+/ZVQPiaiGcFwXe/6s0Zhvb6eW
	 hg4Jp+O3cRWPjL8m0ffU59HKfEh+wzeDPm30ni60sQbTlYLNVfv8cFAyeFla7zLeQDdPM
	 rpswP1Ob6hqXSuN6ggdr0zwsQoFuKgXR3Q63DrGOjFTxId2id4Y47F/rSB++xrIEqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CRzmj8+/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8D606A32D
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A8D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRzmj8+/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5077185e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796080; x=1794400880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=CRzmj8+/NF/BN+I07yf2oD4T5kFJjXjbNL5RcAPCsr8/KRarKHlyodp9inl5fv71Jn
         o7SqXX4rln8aBWEqErqW4hisC4TP1WtD6JdJ/q+ad/HnKWRnTuZU05YCtv1yT1NLHa4n
         UGOqs1zvron1/mHeqNxuqiZX91xIMqNTF01XoJjsoWs5cw9WuvMLlByz0/+gwcdiR8sb
         Fu9GgS6OVoMg3398FtSLpfqztKxtrjwr7qsCXyr4KSlLxF20QjurOq9eV87E1Qaxxybo
         Tszg3VIasQAonxfHIZW5y0AGXwZQneMpzuJ2AQU6QNhYLlvfuBOiYFHEiYwQN4/YL1Pb
         dGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796080; x=1794400880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=oDPBmSMN+9ZB6IARw+4wbzn3Wf8MP8urVxZGaY6QkiGEdDjKACC/bCY9VPNgW10O24
         xZ1fllrAwul1XLFDEGInx4/tpn5guBxT4v89Zxx8ET5KAFKgm2cAfY+n157yMCvAXE8d
         qOp3pTpRRaj0aB2WAM+I+39toPKkv7/GNvLa41+y/7Kc2Nuxs7xVcLBYByFV+ZJvi/e2
         IE7Y3VINCxr/jkLWeJUXu3cRM7Z0HOYDLBawXiVNdCTAW0h72VOO9YCY1VxEwfe+MjPT
         sYS1uxFFPK9pF3T0Dpy16WFPNodnP0KT2UF/0KD9iBacSSttZFjQAFidi8oK1BgpoKfb
         MONw==
X-Forwarded-Encrypted: i=1; AKwUvBxfpXP2rvoqcHHEEiVapehRLfXnxHTyttZw4pBIhWerq5lUzKrVHH27WkDXACNFHfYfXFVSUUEfV01swQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zLagJUiMOYsE1MwDxG9OaT7/B7LdKHORSQK7SPJnhi+e9V/If
	V3yQbeLvVXDLsLbnobY7AIjdZ+hk6D7PtQnBf772B7f4tFqsGMMTOnUC
X-Gm-Gg: AYBFou1DoyKgomWgL1MfXGSaBdsw75TeJ8/gTQ2tiNsAvhN/wSQSovnzK3pkRLNOJ9q
	3wAPclye6NEch/0F/pV//+3jhlCbxa1OtasC4Gwwx+HBTFsGgXtS9VYGPdaBpXqS7RcwxZ764mW
	RUUNPoeI5mML0TqSlere4qp2fBQRYa4t7y/IbVt2pUZcHnOqF3pbpMppd7c7BTDLhQC2PuBBURI
	4Rc3t1akyPCHE8gmLl3EQpAkUDZFfe3BesPWVsidWwSvp6YIWxfcs6k3yDr2aFgjHElWaV/bPpq
	70WNSVubVRgTfFfKke5bIlR7FLpisw3kOZOVPkFxnBWOFSr5Ketvfn5JJVQpRDfwdVvaAHoRKjS
	h5NMogQKmiBKHQuOlwKzJ5fh4YRgk/3wRYANPNMgHmdCCd+gl/dMQnmyf+v4PA03cw7HijUFI4z
	BtA4Meo7CYcWQ5Te7+N3b8zCs1uwp63wOLf6u9oIvP7b/yH/Rl5u7usRTLlr3FVkaVvDDzb3Lp/
	jCy06LKFN0OLtIYBz+z+bEFX5XX1UI2FtDwhK1KkBGr2NgZFLhe9I/YXxMDtZy9O+Q7pLql7EeQ
	lGW8G5VXb1YXPtlCLQkOf8sCupCEFtJHsUWZCO/OX2yAUIvApJKLp+8NL166LWchwNHkCDY=
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr378083555e9.34.1793796080386;
        Wed, 04 Nov 2026 04:41:20 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:19 -0800 (PST)
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
Subject: [PATCH v2 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:56 +0200
Message-ID: <20261104124057.240288-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

