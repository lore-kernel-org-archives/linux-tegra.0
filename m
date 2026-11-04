Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796078;
	b=xmznuJq8Io1vDuz0fy0acK1pyEfHKmf6OyVgYGXa/PzL5lCW4swkxxRadW3J4we4UgRj
	 QlT1cbcMjcdmonAShzlgUGvpRbJhFxzvMvGLLk+uC+yXM+OOSHudJpGok2IJhgl9TVXsE
	 Re3axqTdMjbxZ/e/EUbqGfcAMxX7fgIllMQChL6bdQYXU5ImkRkMsIBogTLbNnfxPpsvK
	 UQwJU54xKOy8pBZsZUOZVg56Vw3EoU4fAWrdSVk6//Itcr+qNNZyqc96Y5SwI+Uxmkdhm
	 /Fy8cW+NPQXeD+uma1wIJ5k4THuSpB2AAYCwcnrlXGKi+YNixKxLb5seyTOX0r1OEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=Wa8TWrzO2caB9/m+p9AQSFJClYgoMqc5l2sQ7PeFhn4oKgMMfKpErqgnuXpAkGPh0390
	 Dph1mz/4hrktk1bIdm2reTe7ckblyqch6BwM6IYw49Cb1RljJoq0BADxVIm6coflGWYjB
	 wxjCt0xERXs7DfH9ABq7r19d2iq52RsDx98SdFuNsCJFhZzSAYySNxmqQWIX77PsR72v1
	 Eegj3xPrsBXoXJQUoVrsEAG23mr5x3OGjiTp8sn2j+/c1Fmqg88t9Ao1gWsEvJgSIo/62
	 1Hx9kP5MF5FfqkVE39YoLe32HiI1q3mwBSMUNlyjub3t3nZMvTsJdaACKYaLTMChO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC9606D806
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26EC9606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10488975e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796077; x=1794400877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=YEDYL3Z6VixFTTi2aQ1Fu4+G3ooQc+yBSLETFJPEYDRbUfbrnmFVMvzk4idoP0m/xq
         HAXfLuw4AyNe/DhdDuh50pO+Ye2UBQxQz+gI9bd003BBAyao2EMq8IPY0cxIziSjVKql
         FwKsnnxGv/GpS+xR4nHKQTdY35bcCYplrB2f24q1URxzOZG4SUgG8ux/xJ0xCJnfO7q+
         bJ506KJVp5VTdCI0HDbLOB74eMgh45Xi+C3ygm8V9AnUrgM//fiYLmsvOiimoXB6B1rr
         NIFPc7VV97IgVN67HGWaGyWeBkX7n61aBVX7x/8Fp9lMhtXZ/GSYwoZtlpJW0KiFzAfF
         KkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796077; x=1794400877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=UKYapi9SYgRWYYKeI+JbiaDSXjBp1R1C0u2mxgfKxVYdiDkkWjxdwmEFbQZqybaDRa
         pihZU2SCO99VfLsIe4CF2B6lFuqlaWyO+pTZLwx1OV7xO8xRJyw2dhwVWbdRS1kuyUSw
         I6FyDNds1MHEtopi3B37E9k0p510SyWe1w5sMKLmL2aV0x1YKquuXW7x/cW0hfL1YNe3
         XPwNq1qCOibRsLODWWNZDB6nDC5llnzXzf8gJ9sVlDek8gE9AXpeqAu/aWoRkHQj2s/b
         zruxf3xnPZe7Z3IDDr6WdWumPXzG4Sa/vD6+4xtJlg0vZ6OBxYdBvR7QVUAEV6RiYtmh
         LIOA==
X-Forwarded-Encrypted: i=1; AKwUvBxK2lvCId+8a94OIkAw/mjFvjQCfn3/ZYq0Al+TO5VEn7pRbwhDPNuAyB+LzWHcMLk8f0/jYhp+H6TMWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IqIB+Oieq5LaOuvDfQA2dPkE2RaVbZ847EvcilGEZrJmuDC5z
	+nxTzG+YiICG/I1R4gNODGzVATO8XlgUXrsmGo862XiXIKzqhWwDZmMT
X-Gm-Gg: AYBFou2IgKahUnpo57ewXqVEhhUmxvHNhNA3r+FA9RltexL76tr+BQVHeUkyaOcXFfx
	W77eJo5mu5a0qgw/rK1wAm6Rk6aue6t/n8DHOvf9QolVhkEKgd1efsrvDIk79k6Bb6P9tBNjAXd
	MN5sS1xnbMsAZO2q8BjVtfzNgsFbr1DYikbhLIWKMt4ZU9GBCBx1N2zWMD2g9lhMJQ9O+8g2pv2
	qeE/8nALWdT2NLPFl5mr07FQPH55+lf53d3E62Fi+VlfP/zsQEFD86BJhezlIihA1GmlU0xdT8L
	5TxFCmwNGfZI+8HW9rDNGjCi3HzPqfrxUldHcMhZEzHVLourbJZ7lcnApymApdt6NDUTkr4rl7K
	5YJv9Hp1itY8MKmS6EP/hhx89mRTIk8mp98w7NIt2l9GrhAr5ZVSXJz57LApIj99zwQsTOOWW80
	rZmfN61wL86dk/yfRbBmQ2xHHlBtzeVdIOHpXm8OZBjMmyBHqyJKl0DX6VQhffsr2Qj5DQPOvP/
	ZKwE5ffdaw89h2dfJxH2XW0t52OczMEUixempEnP7ForFlprW23d+GtG5nMYuU0wJGU1WDnodRe
	t228wvfTQM9U2+Bfi7h1+OD07XUDLi0Y6SRWOjnlKxFmQ4VlPwm+KMpFRjOV6p/db9CVRkw=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr348752145e9.11.1793796076509;
        Wed, 04 Nov 2026 04:41:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:15 -0800 (PST)
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
Subject: [PATCH v2 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:54 +0200
Message-ID: <20261104124057.240288-5-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

