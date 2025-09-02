Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739D324B0B;
	Tue,  2 Sep 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828025; cv=none; b=gJInE4Ay47eVAv/rCIDK2h1OVFPUSHBINs5cH7K6gr/tQEBd2oYQz2X+WJRl4Jb/1SXONE9tCqsabJjZwUQ/v/0bO9s6ET5bpEm8IuqJTRfSaYaJaWTKfIod65ak/ZsuJxE+LjbhWPmDuNttZqIG4XYG0tlTY0OXnoHFLbXK66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828025; c=relaxed/simple;
	bh=BPJZRvP8y6HqBa6xwv1ZxRbGbb4P3ahWeC3ViHAJEjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIgRvV/zXb3IfQFRFC0DUIxSMKu3r6oasdyDol1lzx45xngRP3ZuRkcafacMG5GZALNv0Y8S0N6MWAlnNi8lXq5jHCczOLNW4FdFYF1u/zCbrMNanfb0NXLHQ4GiKkW9FAGq1TX3GKURGHor8b8ySsgnAvvIHauzZh6lcSS41jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzBHJ/r7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBHJ/r7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b9853e630so8480545e9.0;
        Tue, 02 Sep 2025 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828021; x=1757432821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqVDx7JqAPgJ8o1edyCmRNgqjh3YbvmCUsqqhz4V0Ns=;
        b=jzBHJ/r7R2lBw3LAxNSxI8ah6TkHguv9aY3yAD4TYlxB1cxswI1kM4zGPLeXS76evk
         QXWt545yvxdXqc9Q7MeHoiWUfdJhyIhcXMClyN2RsEbrnrPDreofHkYHNwNn8sWpzs4r
         BAxuYKOO6evmACaQaiLESl2YoJYx5URgvUof410zrbhQF+zftxywEuzBRhlcHMT+Zrv2
         jF+XJPRHy1hGHjIdSCyGlqhp2/hny69Rks2LV05kSBiWnywxX1hjc0/xCLDuhq7VhcRt
         +OvgvhyGTCTGLR2xyBqhzqrkNZgCnZgBx/jnVAnUgq/jotyQLP985+cakNqyymkw5nk2
         QeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828021; x=1757432821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqVDx7JqAPgJ8o1edyCmRNgqjh3YbvmCUsqqhz4V0Ns=;
        b=R8xrD+zUdeIv6KRob5HvrUHvV/3ieQBcxZ5cYvPbP4dEJoBo/y28dA7LA13AqP2x2f
         gY+W/duUsSY/ub9OOLd5ECeEUJgH5LfDAEMlTieRmk8nsk/puiFSxMoM0NPK1hMKNFnW
         jEo5rI6xcGnx33utzZyq6OCuZzgxxYklIdfCLP6Bzzdom1gqcOrPzgcYZzJkg8tspW5Q
         rcNKGRwnaUXq6Um/STFvgGnxwfnS41IDClxkSDTk0TT86ey8xzK1X9/7TUFW54GZZnzL
         3UroXzyiPmpLGzS8vwq5bVFiDF9VappAHvAT5T9Sd5rcXmotqsKX2gbGCZgkBjKIkDVI
         /z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3F60hOed7+h6S8K8dLgwwKg0wvfIC5WbJl5yUvdFlbCGzPANqbRU386r+7zjzsnzxuWIMCOflYr61p6I=@vger.kernel.org, AJvYcCWOSfzGm2j7UvuibXGVCo8QQkPdJkuo5JR7DQOQUgY1mQ/vQ+HdQCqCKGHA15ZEHh0dMu1TOura+tmj@vger.kernel.org
X-Gm-Message-State: AOJu0YyifqKzaqzYOdgtUhk/N0xMX2O7n/HbxtrFPtKdgrvBgAgkY67R
	nI7BvcDglH8Nra8YagiP55g4l4S07/6g9uu/uDhjGNvdmJ792wxpHAsF
X-Gm-Gg: ASbGncvNibcF1gVxBQHcTapMhvtjI8+P2qY79NvkuRUxdktRa2GlZqIYN9qSp/R4vMp
	Kab+BkM8m+TZImgp9v2dDoDHr4C2/qnmI86Q81dx8hb3humOCtiUkcskpF/YgIaG3p6z27fZlTU
	XQeIwgob58ikt8oUydjoHdQC38x0d+ivj8KqxuBHJmmFVpPzP+es27jOTurF4N7gQlffxFOE14M
	Tq5XxtVCIDvRsBhXRo2aqligCd0b3WvSVYjM1/0ikEFs+XcOuWVcVd/yb66UaOvIyoXL+6M+JMS
	OObteuLIjFdxzm1oyeytMSg5si7+JHoPqS8fqqV4j5TJDsxAdFXE6DrH2Ccs5oU+bBQyQXvfeVE
	eKHmD+0XYDlCsYC2CszX5P/mRi7V/vefHcnAG9ekUdP09EeesB3AwzEz39VN1kTEmM1BpX+D27h
	7dk/Yzd5KEtH+JSbaPl26GXryI
X-Google-Smtp-Source: AGHT+IGhjQ61sFdI6+vTwemnHBbvz8ZNQ9haJ2DTjk2jvyEjnERfMyfPcIWCXNf5u0RiWSHPgdHosg==
X-Received: by 2002:a05:600c:524b:b0:45b:84f2:76ff with SMTP id 5b1f17b1804b1-45b8549c809mr99393805e9.0.1756828021297;
        Tue, 02 Sep 2025 08:47:01 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e7d2393sm202232315e9.3.2025.09.02.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:47:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Date: Tue,  2 Sep 2025 17:46:26 +0200
Message-ID: <20250902154630.4032984-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This node contains two sets of properties, one for the case where the
VPR is resizable (in which case the VPR region will be dynamically
allocated at boot time) and another case where the VPR is fixed in size
and initialized by early firmware.

The firmware running on the device is responsible for updating the node
with the real physical address for the fixed VPR case and remove the
properties needed only for resizable VPR. Similarly, if the VPR is
resizable, the firmware should remove the "reg" property since it is no
longer needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index df034dbb8285..4d572f5fa0b1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -28,6 +28,40 @@ aliases {
 		i2c8 = &dp_aux_ch3_i2c;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vpr: video-protection-region@0 {
+			compatible = "nvidia,tegra-video-protection-region";
+			status = "disabled";
+			no-map;
+
+			/*
+			 * Two variants exist for this. For fixed VPR, the
+			 * firmware is supposed to update the "reg" property
+			 * with the fixed memory region configured as VPR.
+			 *
+			 * For resizable VPR we don't care about the exact
+			 * address and instead want a reserved region to be
+			 * allocated with a certain size and alignment at
+			 * boot time.
+			 *
+			 * The firmware is responsible for removing the
+			 * unused set of properties.
+			 */
+
+			/* fixed VPR */
+			reg = <0x0 0x0 0x0 0x0>;
+
+			/* resizable VPR */
+			size = <0x0 0x70000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	bus@0 {
 		compatible = "simple-bus";
 
-- 
2.50.0

