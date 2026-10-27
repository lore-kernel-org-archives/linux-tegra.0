Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102458;
	b=2+3gkoax+GQTXGb8kpzY08kKuSdQvAjwP83gfAz85rsSc4Gu/cjiN4v6aSxWEgiNoEbe
	 HEB8498bDvjxrPxoPuMcSEi51qKV7KFpkBKw1IP8pnCVqJfZYgfKFK12o/bmff5YDm1ur
	 2yUsbrlZ0ELDp1e+29gjB7TV5fdlIiqlIyGSwr7dzR12oIuI84qNFP94uhEYZc5X2JRdH
	 PSpSbqu8QUI7jAU6VV4wvu7PUU59UAWYGAwyoapELn2OZg+NYvkrrdFL9/9aI2Vd3PNqZ
	 M0XFno8eV+zEnpwvJNO1Urs5QjlqHB2Yq9O9348iFrASCeqqFKgmie16ssmdxWhnYMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=Z8TRgWBo3jg1jiph/lqSJ7IwMRQ3/pNDfOoh94uxAfk6DVaVC2Tp6w5eBASTCEgyr22N
	 yACBqHalNy4058PMAyjXEm50u5YWIZLC8PPCbhuQcwb2BCDdBh6ZSIKd0F7oJRubu5Py/
	 WZGt+7LsNuKy65wS0DvKIr545nWr84TfWKSwy/u/3TguVA7A3hPUr1yxjc1APLSe7Im4z
	 JXjqedd3oEB6z1nuvY1yw3VVzLBQsu5JrHASf2rXsSlkWMUZFleunrmVPVJgK9jtbh5pQ
	 08eq2EgtS6g4yjEHk0mDgge8dtK6zQKMla8GB8c6IrKeFPu0OBBv6qqsqtyOQnXv9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745F606A326
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1745F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso5678415a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102456; x=1793707256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=J0njOPL47nH+nuOWZgYQd1iIoRASbk4F0ijanhdpEKFSNwiQUSYj1A/63Ui9POlQu0
         BHjUVxBBQGr2/xis3Jjrqd+yaPz1vgde8hZlyQtGuAzKbIZmwlMvvV3sn1uWuYHLZ8iX
         r8qkYOLFyl/3FSZSOncs0badumBga4ckaoy5sce4lIpvacvmDe6lm6noQm0IXPDLOjlR
         YTRxUPlVjVk0UelR+bqruaPbbRT+Y652yOTQrFQ+aSbpoZA14e4lBJZr/O/BEAkV5Daf
         PusOj/huYVTguhx3ejtt36Tfzg25l9r6A+r64SbOEfDLrJZE/bowF1L7pN6ero3rSDvd
         Ajew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102456; x=1793707256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=MJvmqj1PRaSLWVoILbVuQ/tdUiU6b0DLbI8YpMDo9Jo0cCnH7J6DF8cpMYqxxxxwXb
         fvtJLM4VuOXX7u8yiBbCRuV1y4JkQxfNKNzdd01CrgQNwJ1lhhTbS7UkfhHARX/tkFJt
         ZRCZzwzZNHyYJueJBAJNshK0bj7bK2FJhnA/OQxIPnvMGon6JoEIv/avf5rToSLg98bo
         523S8uVAZHArbYstdzRt6fSUfMhXzg1miWKdV2dVJQVNuEI6S2Z9aZ0U63v6cRj8cPoM
         LXa4yU62BIsNGKQvFlXLA4dJWm3fq+dG+EoAew/eR+sbNNAFi1AY7EfdQbcdgKlXh+q5
         jHgw==
X-Forwarded-Encrypted: i=1; AKwUvBw4qH1agSd1A7xZHCs2763X/PgMFRB8t4gfS8fiG6syhGYU+zB4kQWaeRQMUxkfiSMaxh+uoNWv+iUpXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCTTglL4+D/hxvNkUTUdHBgXbgTvDcwdrmKaUsAUbW/ROE/wkO
	iGy/spb2BinwYNHvx03v3VLEz26ffL6LnOicm28Ne0OiCWQS9wS6jxQx
X-Gm-Gg: AYBFou0nApEY2E0LHA7MeI5IBaIMc/Gxf1aLD2yXy/7Vm5Z+DZRlUDiPtG+819XvJzO
	aYBmuCsB336pqAA5tFaVUL2c+cF3muSc/cv8coDydB2U96UoQ40WHuytoefqw1y6SUHRm8QEmNy
	b6ZnlMdRqeW6aEz4E8ifivl5EMcVlh+M15Hek0d3wg7gMHXZVbHzGNNZh4znHB9H2QUO0QCOTF2
	fTe3ZVIK2HrwMmfnuzjtbC70HWf4AqJDrpwdzHDBYdgLrkXKifi20WCNuVFq1pw1dO9ob5gcwrF
	ydBjRh7jWptSuOBW+FFRDAnp1nFe2t4FV0hbMbu24RoR1hcQSx6GS5pVNhq0oyywrbWPZdzAGN1
	Hc3OAVAdYRKYkUfOS/+A+iKB8YlYvEu4KnC7LzcrJpQPxAOeGSpk5Kq7NFP4OwGLNaEQbzdo3NV
	UJQK5cP63SIeD5ua1e4a2pXbIJgM9XZsfHOYTDIPKs+gRigpKn3WAIpIW0kkK83Wl8LZo7qD2vA
	8YoBkNlsxA3Ps5Ru37JUI0Iw0clb3wUxaJMdo4jyGvcxid/NHC8xzuCO8ir3XywladZkwo91K9U
	hEWL1OYw165N8gnGQWemFJSgOInQAFdWi8oK9+JOyVZGdCeBcQ==
X-Received: by 2002:a05:6402:4142:b0:6b4:8d52:ade2 with SMTP id 4fb4d7f45d1cf-6b48d52b5f8mr498029a12.41.1793102456264;
        Tue, 27 Oct 2026 05:00:56 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
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
Subject: [PATCH v1 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:15 +0200
Message-ID: <20261027120019.93611-4-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

