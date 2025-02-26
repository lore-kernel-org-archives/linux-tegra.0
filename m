Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D726B95B;
	Wed, 26 Feb 2025 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567402; cv=none; b=gigRl3zDYVoQuG9KVEUHbRZiKbBGsAkIvRVXVj/IHv0VvKtnuJ15DDj1yNlx1SBx57e49hLrpihITl1r1iCnPwvnTo4PmUUp9sl+ZZWZ35Q/dle9x/pD3o2De2/l9xFC6xxOidEblqpkeRQ7z/gZh+NT78JntWJCmQJwGjbkYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567402; c=relaxed/simple;
	bh=WYg4WzIHfP7x3JcVIeojcyxt1+XQVQ6hmV4tlSf5FFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lq/7v0Gaqa4ZUONxbgNuXt+a/DQrIco6vlfxNQzkBWf/gi9MsMexHGINiv86wrRmvBZ+1lSB8TG+rqULrHwjf4D3Vbu4qpRPqIgF24lu73eR0C3KHRKjyg8WxUzjUjGLKxvlnpmYvNV5Yvor0YI+bOYZPEnu20nA4rPbeZuYtlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMVsx++N; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMVsx++N"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so1107696766b.2;
        Wed, 26 Feb 2025 02:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567398; x=1741172198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZAqAbKAOcuX6mgV+Z6TYPZUDeBam7S1FsewI38O+xU=;
        b=DMVsx++NDsKW0v9TxZ71x++FANF9xGyyG7S+3kZeaa/WiyqUbSqPTUbJibFfhdSgEX
         RcqODyD/skzufTsGmtCEmf85pbz7A1LUu2lsxm3/afyJyxW7gsGFuGTM8qLoK/gGhOxo
         RSZ2q7+o9828WVBA5B7bPnIjZKmvUB+lzqGVqZJ63hcobWcWtNN0ObP/6P46Uc+OR9e/
         BXx5qgQjzr0Z1q6EO7bQLHuS46itTf2pzdtUWMJc34OOJKaNehGsoHBeK7mQcD55o0Y9
         Czk6UMyJEMD8+dr1YiP1zcM211U1Jfm39UIBAnE3wWsCpOttXaIYhYmFiiH2K4DzbRjz
         Ibdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567398; x=1741172198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZAqAbKAOcuX6mgV+Z6TYPZUDeBam7S1FsewI38O+xU=;
        b=JtSqUbddzfP+g+U5yZnfJ/7clqJ0zYe6PWMI1c9kIeZ/YQ//gzSg6GGRV7gISwupWp
         mD/HL8yPJedDR9lvbpfDTnDPEEiZRw08nb+unBNWDmtWbqyp89KUKNwb4Ox0iePnGLma
         v62wxCCgzHLeaXMxyipqEyoXoiQR/ogeF5aGQoyHgITaAgQaHKThgIsCfI2www6UMmpx
         BjxfcNvSr6RrCx3Bg6xF9ZtS99n0PEbTjl3Os3cuykyS4ACtCHG9c0HcXZH1bFaXNIGS
         iL2e4ILzQFiOK+onLpM9RoB5DfuGD9T5TWTk+GmZA8deuhls5Ib14BBj1AOFOMYX0lUe
         QaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4cUBS7qKSpaaaim+3SWMxJsy0Lhdg5gJ0EAiNFQ3ERrRFKer8IRuGq9dwr274bN7eJGm3L2oT2B82tuk=@vger.kernel.org, AJvYcCXOq6fkwnSlIqHN0YdNMSGXLY5TY4pWeGRl6R9J5IY7KrQmWslqs+orXPRNR3CfrB6Q8kNun/XSR9DDAMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpqw537yyFVbM0qARR9A4arH/WMQbo9Wa8hQF+xDq3/h0imS+
	FacVhGxfD9zio8NEpeTdBLGzbQhJ8jYqF/Y/+1aie0A0iJ4N7ze91is9Wg==
X-Gm-Gg: ASbGncvYyDbjnaw5PQIwwYL7GO1Ifctx3SVDvswcQCwPxM1aj3RTyNE+SJOhUKAf7TL
	oedWu9HMYDNiBO62Gg0yMipHZBp+4DXm5QYvdsFE8NxkrtjtrEFcFvu8E4KML4jFSbdGlmrXrk2
	H4dSHTtYb5SQTn6PsaAO7J0LoRTpqMTdTrf2Pt6sAGyzBfNMsqJmkAn7drbm+Qd/jmG8xrn9hyC
	lNdGhU0WTODb8ZXYKI4NYv17BSscgKbcrubbuas6QpmlVyu2xPai3v2kODE+sNBgvEbpj9vg+UD
	Ozd1BRRz2M0P/QAQKw==
X-Google-Smtp-Source: AGHT+IE0lkuzkXcqz79Kih13YovOtUwYFslx1G2n5sYd5MfycLTLkKjB8BgbLYSIyH0PPaMEFcXtlQ==
X-Received: by 2002:a17:906:c103:b0:abc:c42:5c7a with SMTP id a640c23a62f3a-abc0da2f10bmr2421010166b.31.1740567398118;
        Wed, 26 Feb 2025 02:56:38 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] ARM: tegra114: add HDA node
Date: Wed, 26 Feb 2025 12:56:13 +0200
Message-ID: <20250226105615.61087-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HDA device binding.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 9021c6698ee5..e2623a0629d2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -642,6 +642,21 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	hda@70030000 {
+		compatible = "nvidia,tegra114-hda", "nvidia,tegra30-hda";
+		reg = <0x70030000 0x10000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_HDA>,
+			 <&tegra_car TEGRA114_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA114_CLK_HDA2CODEC_2X>;
+		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+		resets = <&tegra_car 125>, /* hda */
+			 <&tegra_car 128>, /* hda2hdmi */
+			 <&tegra_car 111>; /* hda2codec_2x */
+		reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+		status = "disabled";
+	};
+
 	ahub@70080000 {
 		compatible = "nvidia,tegra114-ahub";
 		reg = <0x70080000 0x200>,
-- 
2.43.0

