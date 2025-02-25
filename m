Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D3E280A2F;
	Tue, 25 Feb 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494144; cv=none; b=r4nPyckg6FkJyVsb3nvYnBJfe8K+IbxEfpTEDhosprVQR5h8cMMVtZOC3m6gQodnNL9T0f/DyTxjB+F4/vpW39qgHMAFfyLmHoYTAf3EBTPd2vy+8uMjhQqg5brLHdpmF4GRSft0QyVpRSWCcmI6axgGnbZ5KIiVe62xc+BKOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494144; c=relaxed/simple;
	bh=AhcIJhV4yLswOEUuGSGgPF7pjwa852iGWyL2UiPULL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mi1QriLOz16Q8MzcyhI2vu7KX0m7nA6gqxzqzhtik5mX62PStLvwjgLiFcAeEfjAzMriCdJmrwK8UWd/tBDAY7mI5v2SoiiBvVdab7tnTOdTsB5lpd2bBTAx30e3gq12UJ3GsX1NrjRXS0eX6Y/Q/0GmC8b71or2nw3xI1xMZbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiUKxTy/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiUKxTy/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so10639190a12.1;
        Tue, 25 Feb 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494141; x=1741098941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+3H1MoTfJUW5Vok3BUIG/mXBVTmp88K5j121VYxdZA=;
        b=DiUKxTy/TURQiDQl5pbExPvN5mM88ZWtPVdNP87MR5/iqoC/qy/pvqoabPA5f6L3Io
         jyJSOLqXtUTpW3quP1kBdct351Gi6bgpt/K7o3PCSK71F4MwAMMb8pv8B0muZtScpl3F
         +U7IFbp2YQ6FSy8TJjUjjAmyYogNCoAd9l7+ov7TOiFeZ4d45af3lAuoLAZTq4I3re5P
         S/yREnxdjdtDpnEu3yoAN0HYOXOi5yF9zIS1bXUc9HAfSFxw6hlIXJ2YCbqIR/WYOoqQ
         bgU2/EXQ6QgdhM4bWO7PJ0IJvLWaTbFH8KF+nqYy8na1RKYOaOsNqMG/yvbwRE+ji6zM
         tMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494141; x=1741098941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+3H1MoTfJUW5Vok3BUIG/mXBVTmp88K5j121VYxdZA=;
        b=jOYPtXZFKlL/LM9oGesKHY1jCdc/1prtXmo9rpj9zN8M0wNNc7p7F7CBuUJM43Wph/
         It5w0b3KI71stH9tWye5VFmq/45tZkJFHdzJdg+PjxsVtIZ2lH36JYRVHT6do7AXgD4/
         RUQ4iakrK4QBzNhKLDhyCw93Qadx0CFjfTJ/kbPE36fq9VcC9G3XOXmMppVNyzu/3INC
         0+DJoTgtKjC4U1/Rc3A/gwGXV/i8PUB3VtZzWAYuvu7az8FscrWpSfG6aFebxiTR3fs8
         TitXx+2CTP03fqMswJhEJLDF6gkUhfFQWApF0bzYQkZZTQsLNfnssDL7gxtb/S+7isrJ
         S78A==
X-Forwarded-Encrypted: i=1; AJvYcCUyoOHfmBtR9oTvVLIYbmNLWnv9LP6o5iQLBdRV0gij0K0UwbbSyn3BUjBDrcQALIluz4cVusMGDK5W@vger.kernel.org, AJvYcCWYjQpE+MR/YWehmCl7bnAfARcBqYQ269mneX+HAKoPzXv5RgjuejIt+NTXEsuK0JR2pATxRzfMibkvb9U=@vger.kernel.org, AJvYcCXJCKnSczcKXjoqxwwoleNBX2uHsopuTXzsVzk/d+lB0irJaHDGoXuowE1ZJKUABr38unJHKEASn7KF@vger.kernel.org
X-Gm-Message-State: AOJu0YyMk8keLOC6beTrllTJY+4rSbM2cJrVGD+lDBV6ZuByU1u2lYix
	IWaThgy/LiwErwi87QFnVoX0ehe4w4wCL1X5AKQGCqSVrc9WbNYl
X-Gm-Gg: ASbGncuMb2Z4kBEuX6xs4ZL+Uns7CLDQgy5cEMit3UmT6i78b/qtAG6/Ut9WsW4OB7G
	Qcyug3RI3x99CG8OuRCV8sT2Af/yR025e8uM35raDE5m4jMtEm6i/abJwptEFZUmVxPeOF36sWp
	KCA9w7RNh3war4djcsJUtXf0U8QSBjEH0UCyMi8bdQ8tiv6qWV3ossUjoANet8+KtAPeNfbUQ/z
	1u0Z7RQVP9QBSGeBGVInVAco1mE4WzAL1HosMsQ1QEVG9dQB9W6q+fbyHRD4zaU0N2SHx6p0utC
	kX0ow3QyTghXuHy9GQ==
X-Google-Smtp-Source: AGHT+IGnRuSR6Fs7dfc2FP4u8JrslCMC4kNB5ICvHn2Ldkys9z2rkHNE06NEhCeWvro/cO2gw7N9nw==
X-Received: by 2002:a05:6402:5213:b0:5e0:95ae:af91 with SMTP id 4fb4d7f45d1cf-5e44b66b888mr3294900a12.29.1740494140688;
        Tue, 25 Feb 2025 06:35:40 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:40 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 8/9] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Tue, 25 Feb 2025 16:35:00 +0200
Message-ID: <20250225143501.68966-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index a309999e7988..caf6024d6413 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -193,6 +193,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -588,6 +590,16 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	emc: external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra114-emc";
+		reg = <0x7001b000 0x1000>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "emc";
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	ahub@70080000 {
 		compatible = "nvidia,tegra114-ahub";
 		reg = <0x70080000 0x200>,
-- 
2.43.0

