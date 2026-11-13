Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586741;
	b=shTmeZ09HhRdhTx8K9/VSqtYXwkiFo0iz2vlvKv8ODK/1hnGhWntLnTUqJNNqh977L9v
	 U5Lp/RBspcU5bpWJlkrs82jGt/CefgLZbMy7fMt0as67gGdAFmU6rNLV5uelwHrLCLPXh
	 oH9uVKGg1j6aC3ihs+JMsJg6ZbUChs8Lx7nEStoXr8TjOAT3rod7tz5j7r9nNYuHqD0qa
	 2UeeEIxsqeyAVJKWVpJHORwrbCVpM144qPCjhl1uksQWEXoQ3OurGmR/bJb4iKu96r0rx
	 H3jKeZYGj56kjkb8olflR8UT3zI2bekbsKp/JNNP1kvuZsEwuHHXGaVW8mSqcTkRr7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=eOBlA4+MwbSXWNkNfn/70IMYUszzmVaHAGXIbHq3XbHfLIurOL5KDe3C0cVev22uKzkN
	 NdEniKidXIdhSQKZPAxz9vl0KMhFLfEfqrsOSeYNLXtwmCgtPXYKjaKpz/sQi36Z8MN+g
	 UBvNIRueHy1W/iE/i3tEzGp3rQFmkTSSUtLHQfR+ID17ImdS+hlbEl/8wF0BTh+yKdFCY
	 VkEky/3DecbstJPJ8Utm/sS4ESTAGa/Twt8DbxTn1z6F6ff96ENzi6xv2kwdwcbo3zE/H
	 5qOt31mNchd9/yax5YPey35dfPhIoOESgj3HmdaVNi8nlbzxNoB0qL9ikwCMOB3v5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C6860A5BE9
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C6860A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso200320766b.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586739; x=1795191539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=zBoKHbol8hBa0KV2wud8WvoWYPMHijCP/AHfQ0kMIp/6nPm9ZaoEu2nKj95ohh3y3f
         0BYTtjsu2BUiYwW6SfUG6OIZskQRV2qU5Sk95UAT0pbqgd4Lrp26EzInaCiUioNkUf3/
         h+iDrnMt1l3lqRjsvei3eOHp4NIpRha13RsA28lWMePHnmFRqiTyoNtz5ZiSaVXNOYjX
         IDgi7UnJgGeMGlP0uUBbibrMI57N7dejvOcEN/WNNEaYuWZqag0H9AddQrF+iZk2zkSo
         4W9pu+W3+a2f16KDUBXQ2Ma5P2jC5w7NdtoTqp3ey+qq6U5d9pVlQV2ZYjHYwgOxAoOD
         DwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586739; x=1795191539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=w1S5ZxcGJZPj+Gqpp0m8/cgLJx+HCHq6vG6kU9MyElVHZk0pMxPReplcY1DBkLnYNt
         mfSExQqjIahrGQTU0MCnHzoGiDbol6meXXQgSQNcdYVGFMCSa54vdO0m/1ZtnDLdCHww
         CIxgv45vTdzcRCYlS+qbNhQZwjTodmd6TGVFKy7BzLMrEOLZLNkcqtiHAhfruxQOuKnF
         GDgf6BfbLWXtP+OHxOcXlP8mH4uNtrOnubhW4M1atD/Ifd218QHytR1LEp/jpVG49bhA
         T6Y+//AlMYGQfGSCpkIwXeSfunzFO9X1CbNkTdGp5AOW2U9jyOxUTkuT+3Asn7h6aM3j
         zfvg==
X-Forwarded-Encrypted: i=1; AL+hErEGVFgMN5wpLpepvIQqiwFB414gRclYrgCyatoqpCHRScdcU9xm6xnKqUL9EmFYfoBsfK1NTBRArEhrqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jPoDcJnoOhxNfzulMJ7yepk4CK2/1npLmhexIh9scrgC80ri0
	2zyhm9XJCHjZ8OIshaT2mWTprtcUcCXGy81pa28BH31+rrg2AnZmv4Xs
X-Gm-Gg: AYBFou15LyYI0mRG/3aFQQPbPjEe6t5qpyuuv05CEDJkfDaPuWFaCrUcWn1YpyASvvS
	hrvJVvdnynuXAcOnxL5N46OYr1EDgcZKVvHOWLoIn4hHNbQtyRWyUInZ9fPGvbdLiIv9u+Cn5OF
	NPVQAtcSHI7O4l+PQTejeAutoX+fRJx02nbwj9mgZGGaoVSyMLhCDHzqgRZGoPNyeZybUXF+q9B
	noRC4hS6E8M7At0TbFdBEMPPdgPEODRLmawDHzkL9aWfsKRBKH2ChejlMZTeTjxorBh2anvLj6y
	l576S3qkN9ddwsmoHpcyYdY4zziLzYwIAlvx/Xdqz4qgoqp7g/tYpkuoEjMoyJGJwBHeYU/skUD
	ac4ivW+segZMRg4p7QPB5uVSzFCp7dbCy3s0PIrUEOrtKVOmeVVn26laANGfnuUK6rxSr2bGYDz
	g5YQRXExPd8Gi0QBKtC8s+/a42sAeTuYhV++6Fc9pu7ZVQrEnzx3UFXblrrEAE23GbZ3QAVHpDM
	KwqMwri7yNRPKkD477pe3IBing9xraME+oNcxnJDtLpNClSXXEcmuqjr81SZOwVXXmpjOfNrK+k
	1rTGd0TdI2W4FnVz6IhB0MHDa3h6ukzcJGYY8AjCrXzV4o9VSIqMjoPPzHO1OulRMVsuVOiuKft
	FM9exvUqUOA==
X-Received: by 2002:a17:907:9304:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c50963d470fmr299547666b.10.1794586738923;
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
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
Subject: [PATCH v1 10/10] ARM: tegra: Add CSI node for Tegra114
Date: Fri, 13 Nov 2026 18:18:19 +0200
Message-ID: <20261113161819.36847-11-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

