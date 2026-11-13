Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586735;
	b=X5qAfFEYIPtTC9XfYWpb7IGmJ+LSW64IaCP/be7UUKBWsh+Q12n/1bLK89qMP2lomnYn
	 6sIGDzEaO5vkRBlcIMXJSdg7Ndrl95stP4+qaZa01B5lI5Ntdv1m/W1XPr/shbaidDAIF
	 DgBlbjCqEli1opSI6Ec4f60JKVZ9d763vbTq4rkWFp2namL9TTtRKd9pyAWP5CCt0uUsh
	 RGt534FX9M6JwkTmbQw9A0NlTRnlk9JmC23APw6aNZeewxdYJ9nl8phNIhLO/3cf/MFdk
	 MlFBlTY7UfJoEE4hS0BZ3b5ZEAZrIpJfTTujkFsTW+7o+Fouodaxq+9fJ6pqZHN4Vcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
	b=3XOHPFd6Wca8Fi+oevngZyiSVJiZaMaTy5dIZJy+H7ET4921+6VjCTsk9zGvPZQ3QYXJ
	 LEIjHL8ynoWOfdqJJdab15BpW3WPvR+p+ffGyDIK5INKpB7Nvi3ODWaKXZpeBWN5eue6b
	 90BRmEHcDHvGJjenjZ0kl4wkg6wGZBEq4tfBKqlhDFsebdRkpYVPt1NfcA7tNkw1BYIfF
	 XgZVZLqBB1AZ82Bu3EJ9Z2u1CWCdeZEdFaIQCPxmfgEzob9BJcgqYc+K0D0MjR4+6e6i8
	 RFCcbX2pTv1LkIRzsVu0Ji9hjzUmiXCOm005LuIbpQUk5BOvmYK5coKq98R0R9AGh+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B56070233
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716B56070233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216152766b.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586734; x=1795191534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=P8ApHqub6qGp7W+FFebdVrJ+X5iLbPmacffloHi9fTC0HsJXY7rSMdfof50ekS7ma5
         n0CDtUxTa0CC4Q4nNOGSpnUl0HfOeZHPKL0SXehFLng+heyqaRIn2Mz7ZAw/6ZVcE7ZP
         iNFnqariIlA6DrC4gcyGg/2D1pBSshzYTdQ1bWvEHsHedrWACgysTbNUuVTYyXtLbmqc
         92vsk1zDxV/C7SAT8Nd1NZtnJn8rbJa5wLroVgvVrmlYuhfpGuO+Aq2CHOsopwMjAyZ0
         OKHNz0mtuFA/3TwthJNbgyRMxZ/oK3bMMORNrMcRu1AP2qITEXEM8WsMI5E+PkuLgfBe
         7q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586734; x=1795191534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=uC+zKYBW13PpbvPEgvUlNGhudj+0l72+0WkQnXIe4PpsYMNHTD5OvyN2qbdUbqwih5
         u7fnpiBuVQWjuqLQG2o/eQJFIgpdHTr8QVvPfLUpHFim/G23vgecpCLWD+9PdJDo2Veq
         HsgqEic2VIX38cEVjH6o6FjrsnnYObkpF84+RUiXZz+WWDGkFA0qmqx4MV/KckQ0d1VQ
         +KR6iA+eKsB5w2TkCQcIhKqg50WjdC0UFNEg8b0HLSfYxTL0pzypc/D6zUrICMNe9sFC
         FLTeEnTWa1EW3W03cejbiJrkhKgtE3RVUTVUGyWueoGPzXRnAnPKtkoO1i2UkSDH8Zbm
         fp7g==
X-Forwarded-Encrypted: i=1; AL+hErHfYIxt6vWjC5WEuWVoNAjV1UXebN1O1dXNo3/APrTIGRmYLlW7HBo0QT6TJmqVq8QZM5Jy3EWb/6Uwdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fnJNcqq8i1te0B+3/K6VuY5xGV07eJPlQqhxNUaIntAiC0Tte
	OAU3iSd2rJjiLZgff3AaliS94ch6Jv4DNUmKnbnMNKjBdmzB3pwG6qJ0
X-Gm-Gg: AYBFou059qhkFrCjrmG5dFgcKGETYMxShUN2MTTpM91sNWB90UgkR9sxMP7IXwHQH8H
	U4rjx50G8/SU3oITDWl838OimXQ4ONex7ALO5XBltMzFMSxhu2CnVTfXRUT5qst2AijmPy2osht
	okza92JdIyfUwYusueXI0Zt9wCJdjgO4I/1GLSnZcvqO2d7ncr2aSju8ARO79kwmogB9YDM5zna
	SLx+JwjcB/R4zM3Y2m7mSxAu4Rs1tbjnEZqeYcwOsU5PPEDZqKjW/GlcuGVWXR7cRNRQh92p4mt
	vDJyLVWzhPV127kwk81ce+Sa/XImHshUAWzJEqDT70XHY9NXMPYfvL1kfxqBzOmKk+2rXjQ5qgn
	7kX7a9FEFebtlkIceKHSumTR9WVW0hKEwDtmGs4/U/iZTDv+GOR7oCU15fcpcuUdOcWjClKqMQD
	BdnF/lM0w0xZwJj6gDOFQ4DIe2OjJpS1iX8ZoXDJyEPz2isYcZFkNUxSGJnhej2Q7kMgKW2uTDd
	2ZxzeIM4aPcNIu16ZIuoFeDHyhQ2wVB85UEBBBrusy94alup05HCxWls5vo1M92YJp6sqkolvng
	o5sjw7Q0ZkzR6457h1l1nEijYA58HOvqsii0PAgjvllIbnvNGS44QYH8dt4/FweNQzMcdKJWmOi
	DDa8quFTkpg==
X-Received: by 2002:a17:907:3e9d:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c5096396e4fmr271748466b.28.1794586733814;
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Fri, 13 Nov 2026 18:18:16 +0200
Message-ID: <20261113161819.36847-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..0c18ac81c6d6f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,18 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
     items:
       - const: csi
       - const: csia-pad
       - const: csib-pad
+      - const: cilab
+      - const: cilcd
+      - const: cile
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -125,6 +132,22 @@ allOf:
         clock-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
 additionalProperties: false
 
 required:
-- 
2.53.0

