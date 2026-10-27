Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102452;
	b=Q3VURjdSwq2bfpwjyUl4EYSQD0Pw0r+TChrhMVLGESGeXEUAqnhmES+cLFR2xjGQf9wq
	 q0BddbLboxxZRqvJmV4GVdQfN0OjxitpazJYh0jB/3YPdS4Hx3wLmqHbyEfEwU7MSFKCl
	 xod0cBkvRsCt+1pFA+PvysAaiPDbnZn4UNlTychfDEP4mL6Zd/D9uWtZ2iRM5m6NXq8qN
	 Psy1wLUSrHMWDgeHvRegj2jd+dedSY3lrCU+HEgblmOoGrBp1eUioKmU3B9fi/wepkNFy
	 ak68YrPfOrh8TxISid2PjdY6wxMT9lLgpVXUOguJEibZRrgKvsm7JtBgi9APo95oRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
	b=KC7awsNi3RuiP9vAwTJ7+bYXLPnpMUr6HGOQO627m8mZ0FYZcaMqSrXSJjEE9TRAQhwe
	 LP2eJ1/gtWQLCEt/DimrXYChzZYd9wpqCqWJzov/qa/8etP5syOykEhOvUjYIOqnsecgG
	 FW81cgRjWmPi3hUpIExMgW5VmDImhKx7VJCA8CtnhP/ca4koydE1xTcRRBMyfOokruoQK
	 9iEUXJsLLKznP+mgw4sRvFnP7NHHQuib7PUbi2vxFJgIKOQto+D8zhR4S0LJufOr60B+2
	 wEoxvY0lT3EYcejEudxOoVYe5sfcW3Mb2XagILU4MXQeOojbb17Q/qxG0NLT396xhrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F9606A323
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 040F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5903918a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102450; x=1793707250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=ENAmsw4Nw22yhGScbFjLDocGggraBRH99Rars+0xxe2Oj/WqHA5Lji1MtwB2XMePKU
         0L5NRLesKErQISbxqHgyLlyfnbcDV+noK2ldPPhJ2VfxpDViDLvYCyBaj3SBy7NYTHb0
         y4JzqR34d2BUAPCsGiW3+xm2787/IFgQ4vfATDc8Mu2HA+II+no/Z8hRt6X//uw+KVhX
         HtPXnu1bjduugmphhrxFGxDNZnVLnQ8dvEkDxoLCDHwIC7X4qLN5MDl/aAAX87pJncAG
         6qMWZjVQnanbI2LcQ8KSessBYQKaDIA3qUxUhBPVELSHctBBeuxe3Nc1VrDRRE90mKE2
         K6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102450; x=1793707250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=DD57mlLUNxG5T72GVf3lWyVdC/70/2UMK//EwNJ9aF3DTK3CbMr0KzJi34izZ2BJNb
         vmrxo1Km3S31KmeXM9nX6sZZLhmVPv4b2Jxm6qDYZAbx4Hom8ekwIe1o5IC/QuGegK6M
         ZK3h6AEBvtHqWyL8rJv4nw5mqo6l8EL0IBgAvK5WcXMVfN0t7tmDmBQRSSiD43o1hH7P
         b+UU2wygG2bYqy5Kx8jU42RliHPG6x0oXMlPGkyQupVJNZXMMzzP8QdXTgKZKJPW4v32
         J1GWjtWSSHhlNpS3IEV8RBblRPfTs/9ilXLG+9QJnkt1KRoFDgMjP7EN7k7bZdBQHT6w
         H8Uw==
X-Forwarded-Encrypted: i=1; AKwUvBx0npPObZu9O3ba8yvqlEy1O4t5XWii71wEn0/F2Ew+oLN70VvjMVziVU1nmnHYe7LmXDR0DesrpJ1GlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLp4fAsiSi4MFZvqdPFfwm4hsX8rYYaXePEiohLIYaK/PtizTJe
	g1xess3IiKq2j+892Ia5sZLzDtw0T6YsvYeHQBlVGjF1aJfKn0nJrPcY
X-Gm-Gg: AYBFou2dO0eRozuQNRgkRPuvX2Xym8RxntdHmq9KT5NzZe/aV7RYuA8ZFgkS0FKIFQo
	IeKpaC2UUveHz2VpTeX6EGeizFgXkzyokZTfDgQFgtDxn8Bz8FuNHrPeEPotjIBi5udadvmELhW
	MZkX5Hge02bu6O1WR5OkQDyDfeW5IsXnP5yR4JUMOBs/6kC66OHQLOO5zg0sUryFjryoo0xW941
	kl3Bdn04Gv3IaoodH6tMeA6htntzCOXuVWIyNntjl/OA0SkdqWLSpGgZrfO1Rz60dZwaDFUyuux
	2vIH7d5QH3LHuhjJOU4qTjIUyI/TwWyEHvKMjvW3glXcCA6imqc8cJ2IL0t26biWfS/IK+BGllL
	Vqg8Tn+sj6vBCq9Buk4920f4DCHhpVm8inNsjaZ0ZSGP1u7vgJfLJFKkF7WRwO+LGhsSh7ggxsV
	4Io4o0iPtuEri59d5AWpU1YLJyq6HcTmmb6qFyKkpCv6NYLXKTml6hH9ohBPivd4KOBELEHTlC9
	rjt3apcFVxHwULCCFIdSddg4O7hBJhprTSClVL37sYuEwLRfbA2xOKTGKCfxgZD94MR6qmnUhFi
	ED5qdgvOLw4682bg0oZX+A==
X-Received: by 2002:a05:6402:428c:b0:6b1:ef5a:6720 with SMTP id 4fb4d7f45d1cf-6b442fcfc70mr10159119a12.16.1793102449777;
        Tue, 27 Oct 2026 05:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
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
Subject: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:13 +0200
Message-ID: <20261027120019.93611-2-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/maxim,max98088.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
index e4a2967e1e818..4d33fd705cf8e 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
@@ -9,6 +9,9 @@ title: MAX98088 audio CODEC
 maintainers:
   - Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,11 +29,14 @@ properties:
     items:
       - const: mclk
 
+  '#sound-dai-cells':
+    const: 1
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

