Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378472;
	b=5l4r5MR5yuD+gGe74suMg9CHY0T4rBrGdWKw0wsdLGzV9kvHrjhlYX8qbr2iR8A5BCFd
	 g5G+ibRjwxRPw8IzjIGkQNMQNsXwX2+GSw6RCAGaaflr6c5CMsA80M9/FnbFv5e5JgePG
	 /0kCYi+b1Se1tSYIUWMRSBWqENoWHAm+vQyUYE45k4e7a3nBCFGF/YdnTlKEufp+hBJtU
	 OrkNu2mnz5VVvnwfWW/TvqcZ1E32+NNgjfxRFRyxex/3oHKV7SVLUjWZnzVjgJUErvy1K
	 9YTPLLbmNrne+XfLWRX3Yb+0ZGR65wJpu90AZsVGvCUrlMMAG7cB3DwO8QLR84G+INA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
	b=Zt+NALrkYnb8WzV+K87g2RpjHE4xtLq5LMqpv394IHhbxgfeWKWTtRtV4gFF0t9wkixc
	 wkK7+w+Guq8dzw8sVuzuaoR3Hz0mVAxTxCAW4Zb6KsKWS0AElMJHEyq5s0LpKmdMfEx5o
	 f2ruT2z5WvlvgGij8bNvZpMhfipodOo0Xvp89jFmErhvXeVQpY6hfuxm5J9ExMlcK41qt
	 X9BTt3n4lHDo7GpMxOV+I8rIUdBcvqsk2eLnrJJC62YeeSNjAr256egxhNgsZYkzLVvbV
	 K/G7bvVqiGmQMfoDrydmpr9xCCVmH9qrzKlpPAN6XH2sHBkFnDMQyyGR7R9U97LNUow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A6606A330
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0A6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso3042629a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378471; x=1795983271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=pDgThwnlWfNp0X+IZJlpY9eY/oosSNsnD3BDUH3Ybk5y1roHWZirM1XA5N710J07zR
         LQFfSexCEO5f8nPezjvJ4kGHNB69Ge3PvLeb4Hh+jrWY92+Ir7rWwLGbBTkp+rfdKiwi
         UfiorIfpm3dEMY4t35Dj/Z+EaJdkQec5WxwBQXYwu6y0X5MPwNwBua2sCCiKrT32ftWt
         y7mYElmVxyP5CNb2Vus1Ydr6YBD1HtTJOfuE7QbMx0qwaLCRA7ic+MTp07lDERQLdkcs
         SXHJx3lcmJqgr+DylvvcqV3pDY553xlZ7v2QLHFsVuSRWAvhHApKPEI+VV0ClJpbCwTc
         Q1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378471; x=1795983271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=dgX9JX2GJ/cLxrC7iBYK/FX8A3XLBa5qJgz+7x4ETz2KUC4gXCjVXdaP4Kk+vG8aMu
         empB61wR6JWUrjmReSdENf0UbZ9zkDOLV0afXnM0+UKOoYCyVInMX9EG7MMuACE4FRtM
         nCmlSfgC7T8wrrRqM8abxuSFEV5uisG7oS1g/EEirxh7objV1tCxwfSI+29SDbpQ5736
         lPxgHT0hGlaZbzp8kNfRYJTpLx5m/cA1eoq35F8RsnpbvXboow346YDLxuHjcKAT8dPX
         MDgaN/2Ug+GWuNs43GrdAC2OMsrlv+zf93FF8WawOsBHveW2U4MQN7qVwad+hGvObiHl
         pLbQ==
X-Forwarded-Encrypted: i=1; AL+hErEGrk1UND27GQhT1KbQmQfpZaSuFcdXF3VxdN3nnHI9vsrZyV43N6M4ZeyOX+apz5rj15kz0FazoO20sQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z98i7y3jTWhiXh77op5mv3OYbKzoJXTKOnzDZaD9nmvHsz2olVF
	ShlqZz3AXkSApasOoYE533bcxPFfOhurTQA8028qi6wtOucozoVFeWag
X-Gm-Gg: AZFdTZcIsB7Vmlingy9nyuv/vy7AWqrrt6mB1jEKoosU9BePaefe3FbAMG0J1dUt+Ww
	lbS8gfGOUVimHlyC73Pj1jQ7eHhrTd82AVxU0KahNe3bfU9r2486csuMiidohis3dkz9s42TMuo
	Rz7OJYiNGq0UbGgEjSlV/dotd0b1r47Z80k/bJfPCx0oGnrccmgbHm+7TTsDb3LQuX6N173ORjh
	thn8b4j7fwMKQq0rKlh8DjCinOUybBLvx3X1EVy2iyaxyv2iqDbmSmACuTatfqgujK/kBYPbwe4
	U7wRD5cFY9yxuObK6bkVGr+PJS1C3F4mU5mkKrR8722++F1g5+HtJaQ45AzGM5lVY8AInWXoIYs
	i2TMmH81qLtT7D68eVYzqrm9OKFKP3NGbL383CJbQoFMOeMT4VMDRl2CsnujsoigzVyy18dg9pQ
	QjnPhEttSvLCDUa0Ui/7+61zqumnmGY/XuKRU3pEoEFo4Z3qpssv20DLqsQVs7ZvXvfdLzGEf1e
	sFSyU0f+BEaqN37QSgDlxAWMG9MUhhWNDBAXhlZ2WHngVIvZKTtxFnXskAllwIoAdqnlsAQ16Dj
	kBzCD168E8gFYwoXJXHa8Y/9i1TlO2Gh7+XVlAhYMzoIkFzxRkz/1xnVawr5MD3b31i0DULfbYW
	ly8mqBCv1nw==
X-Received: by 2002:a05:6402:400d:b0:6b8:5b54:bb9d with SMTP id 4fb4d7f45d1cf-6ba37d62876mr6316804a12.10.1795378470876;
        Sun, 22 Nov 2026 12:14:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/18] dt-bindings: ARM: tegra: Document Tegra Note 7 variants
Date: Sun, 22 Nov 2026 22:13:50 +0200
Message-ID: <20261122201407.23742-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Tegra Note 7 has at least three known versions, two of which are
production (E1569 and P1640, along with P1988 — all classified as
"tegratab" by downstream sources), plus an LTE-supporting version
("tegranote7c", which has a separate board and tree downstream).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index e7545c8c2911a..dd123b0ab8ed7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -120,7 +120,12 @@ properties:
               - asus,tf701t
               - nvidia,dalmore
               - nvidia,roth
-              - nvidia,tn7
+          - const: nvidia,tegra114
+      - description: Nvidia Tegratab based Device family
+        items:
+          - enum:
+              - nvidia,tegratab
+              - nvidia,tegranote7c
           - const: nvidia,tegra114
       - items:
           - enum:
-- 
2.53.0

