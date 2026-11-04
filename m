Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796077;
	b=IOYyAA4n0YRvhn7sYRzK6m6ThN8lIACycZimqXH+ukGMcCif2pYJjGd6dRs9/4RPXUBm
	 z4I8iKqzJ+LOW14VA2lSRZBAu+f5lcqBrcQ5fbaFQ5V4CPwjsH1HaJzeBjqZeV4aVns5N
	 YS6burkzgueqtTyl8n9SRbnvl8brjuGHyOIueW608ZKOiuu/Pki2eAF8iOgXAyv+y5vfd
	 CR5gZRtpt2IMrUrlsqbYSqQ6pEuKhB6SQn6TUdmQZFB1bKMkHq7a8VLeaMrjDTDrkT7dJ
	 eglyCeTuDR4qAwxJxIL8I3wrF+yI6jUvKG/xzjXikoJRGgiIEVKKTUEcx4A4D4mf1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
	b=o4odQRFWo7qtz1cOlrJgbbllop0ONP/ZOxdMN4O0r901E9khlS6JeYZvpR8Mw4RTZWgD
	 wH549sw0pl5fvXLoAaDAi5/QU5PcyC8gkiDuSa9Tlf85rMKyX5n2zm522Q2skJyg9gfNT
	 4rxtiSxzXQT0fvZXogJA/B9cOS2RvP3uAQpnjQY8FdCTW6jHfZ2OtWtHnvks/WBbMuMgi
	 sSzXDPvy1mzFnGxBaCqHN6sE7yekcIrlFGkgADPEwfyatyf8GhYfC+QPCncF2koylsWeG
	 6XOCiaYDZXZJo7wayQE6i6Hyx1vEYS9dcU0Rs9fCKPwROWoS0DgwRDQ2Fj1pdvdd5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D79606D806
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D79606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so6646245e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796070; x=1794400870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=q38I+c12QN5Ff+QPekoyCZn8Kf0bFBhgnEHmqjpngz0F8BLwabeeCpMCt0d2t0ExEK
         IIofZDdHxQW+naBfyhbdhYK4a/oei6+W8Vynnxok+eQ9HpPBqE7ihesgtaQ+tjplk673
         MMDI95NW48fGyQP6eSOCzqkyvWhMLoUWJ9YjztVGahHBD6IwKzKcofVlRRIlE++lAYHS
         94BvzjIFU5XXzYsdyRVRIFyMuZVvDoYbigyDOPljOu79AeUlhfDNw1bYKukXsOHUdB26
         hCz+l1jYWxVeCFTr8o4yrFY2ElhgnvTIKUSc4t1F/qX1ibKvgvElAEDu7o+eipJgNqea
         G24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796070; x=1794400870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=VKThJrX6Qqm8+JP3tatPOBarU4rFMOAuQyPmWrvvBlpJlFdn2ZmMPxP/SMmP1IjVsp
         UW9gKPOcL6LfTmHmUtHfj3IJkWFbS8Z/zxi63x+9KFKE8mnCrmwFH3JnwlT5RjQ7vwMv
         GhTvl0EIVNDmvaqXrWYZTRnMfiznYPXbs5N1Co84FQtbusI9oSQ3f2CevoJkJYJQilok
         zFNnI/mUxW1lpDtovCN0i66g2mW+Dt6F/Xfw9fV2vry7u3NIH2pc/ENvr45pO5oNDRAs
         1Y2mf23cC2YGy4W19zkCMDwXZtS5WD+crYAoVDnvDWYU4xYtsEyfOJMQQ6r0mx49v8P6
         my/A==
X-Forwarded-Encrypted: i=1; AKwUvBxCVRSD/Jm07QDtbW5NgRpnaJvuZK2ZV//2T9VJpZ+7TdPXEiDUKE5/W/n0Txs5OB+V2K9fUFGH5Pl42g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CQZO4Eoi/gjWgNftG5ewTfE+uNHRFqJ2gR+xL231gufY7u1Fe
	ptGtgAPXMYmC6Evlfuhus3njE1ajQOpng7e6klWerte9zzHJWDH8aFap
X-Gm-Gg: AYBFou1TrjhsQ0OeGabbF6C+IOprdQ0URll3fvAug5wtitFC8ReGqRRJ1qjcNj9ubag
	G5OKrnpbfmLGLQxbMIlIhFlPCScRtYxZCfzplcor+YmGSwK0JEUqLAJ3r2mdm5/dHwNBom85ya4
	Sk7aP8T8kFLgiUUxYATHFfOAXwLZt4KYWbS5OFGhOEMUZkqh3arbGTYYFPltYKlldNsGDnAXxbW
	F/wIIr4qAkxiBgBmRgPYxk9laL0cBTW5qbt1PfVZpBu4SPMSis09L4ooMLYiUVFM8LQiL2KgHAi
	DS54IsCJoukJxOSlFiJbZcPHLt7+vz1aLIDcralnNGSe0ca6hp9iqeN0dh/xL/2Nc34Bgb1QTfS
	1DX6pRSoA4FvjCWjxVkSNdNwWedNM7lWnk/1mHdyCUrY5Af1tpEUY/Btv9+i1wlIUMQpAoKyEGT
	k23FZZlT/iW+vnEjBBzy/lbPghgocjPK2ls48eH/b8Y2APpmdtxq8dMLQntoXJnm4thK0G6kBdi
	sC/5r4g8mDQShgheM09QcqbCAFB83jyHQ44PenMVIkcFoPJyWSKGLAzbmLfxISp2f4m0LxqFr7n
	mQvwRgt7bOIWkxHr84IOLbKF+uJTlT2RIWYAa/0/XJZV2TCepA==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr385065305e9.29.1793796070249;
        Wed, 04 Nov 2026 04:41:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:09 -0800 (PST)
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
Subject: [PATCH v2 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:51 +0200
Message-ID: <20261104124057.240288-2-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides two DAI cells.

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

