Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD818351C3B
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564381; cv=none; b=Q+82F3QwikeaGqJiTWFnbt2Q7GDJCUj6HPDDp4VgdtDBPvLLPF+ad0nRxdZgCzkJtkhrLmHgDKmv8j3zXq8CMwEg+/DkdoN8kYsOle1dtvun456bQo9TUxfGMYWf3tKPb/duyeO+psJKlwhM+2XGchxeMAETiTOOzq8he7Ol4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564381; c=relaxed/simple;
	bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkWCOPdr2/eCAHuOMF1NHE1p0E3a4gdqxnH1EMurH+FwMqSzBMP+lvAo45eztE9YAWRhOwn2i4aI5SZVD6NNUvewSHSeOZ54KNI/MH1sQG5GceQ64qH80U2lTrMkc4KS8+o0u+vuSRnaDZgRRTu2BgMPrjP8WFJSLc5/cE/NlFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUjOZt4T; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUjOZt4T"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so65437a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564379; x=1790169179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=AUjOZt4TpQMfheZN5OUULN3BgYd+gWwo58iOQKiYPCRGKxlfuucHW9uhW3FhGC7ZVX
         g9FXAcvf0bYixDSUxhFTyDbsTEJFo5ZU5s8SJWsKjAjBeGDmCF7W0VM1wcQQm4D80yKn
         z4I4MzUMIup/YdHNvina5HG/AiosYZKT6fOa7OPP9BsiDwTsAnz+6NGk3YGjROWh35lp
         GakXiaCiyP8ysD4te/tOkM/xWSfPuuu0ey81S4SfC8XfGKm08k5qW467yS6Zy2WiFZVL
         /M/JMFYcC6c49XEqa5Lcc8IpP00snQW8t5OVFGWcHzW2/MQuFVbF0xOHys5td7fe6CbH
         x/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564379; x=1790169179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=hJKu7BwANqzWFKZU7FgYs8UXWl8uCp2FrAjVV1YcVfQZvJTxMc3IJPafAOmo39Zuxt
         cSlkNUQb2+/z3RdfSU7vEaDAGmM8P3fglIFi+av6slevLSpvUxp9DrxaeOvAyPjKHLAs
         l7CDguXKQhd+SKBHYRDgNSJq/ag1XQRGk7dvzPxhG4yIcWj8JYJLH7OCpEAuD69m3xjb
         zen20NSRsaVO6kRtdWxQ+SIsDao/N1m4wX+GAcBdRKDt3yTRWt7ELe211LDIeGvJWkqf
         yojAYVQXTLAThqRDJMS+7OUiOSPlk9RHv7WumLPbGVszztF6upasV7okLQOgs+cYD6N3
         iu+Q==
X-Forwarded-Encrypted: i=1; AKwUvBweY4Bd/oZIjZ+k2wOJLn4Abu5SBwiAM7yp9+EC7glrftnrtmAIqweniasZCltSP0bB64qjEqpOptnJdA==@vger.kernel.org
X-Gm-Message-State: AFuF++kJR9WAKmA/ETnFLToZ5WNm2kJ8G51Rp2fZ65XfPCoqNd8hQ862
	8cWa0tF0DQpnVYec2bwq17QO72eDAkUYf6mr33+SeB6gE4LQk9+kQJIq
X-Gm-Gg: AYBFou1Th7SZ38oN+UK3q3dQjovH1HqYn636teDSYvz6qTA5OHf8ie3N8C4PpxICWnT
	QWzuzd0CwnDXAuPNdXViCTNBKRZtPY+wbcNYfnwb7eZewEi5uVeLDlcwWNQx75KDBfH9yFPenmi
	dVVh8DfdZMMmwHqby2/AhMkI1gMh2TzIh/l7w8CcaU2rcqlrcIKvS0JULcc706vjsFraZr3Z6Z0
	+HKmXXP16z8iY3NDqpAGspP9viTL6JEv8C0erdfdJy5Ik6GauWZNlBAveCDxlcozADgMQHZSzuF
	30OcKxV+bzcdK046009JqZzcEfQDlqjGzAcj96e8I1OJ4bn0zqgSNzxXzeWzBCpN/ir0nHLh+UF
	1EbmpFWWrvqNo8XuJYLpT8VJxsl6t3duXZ+xPF27+x2UpEMwfNhjk9uR3cIMfNVo93pnXt6DU2j
	KAIW58IGRLbShCQax5gFTPg2PaPKgTwwWsk7+kqzil+/PQeX+HD7nGVHa1K2jtusZ66MCpfe4J+
	/kXvWVFlYug/rcPWzzxiw==
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr4218286a91.3.1789564378929;
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1169;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
 b=tpEvH9KHIwfTAC1OsUi5VlGNptqy0s24Wwu1XzlMVjI2obaXalmbeok/qLK/BloCX1pzhu24l
 n4BFew6fQmaDo3lR3iaTnzSxj6vIqAmT7b7+Sj4GzU/TxtejoEVXMtr
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0

