Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74334166D;
	Tue,  2 Sep 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828039; cv=none; b=Ozmq9oOpcBXRVPCXtYafuI3O1S50a/Wyi6Kkqq1zjfpfKJMAK7naUzwbJYl4tk9RQbCAxQUszkzR3Gs2Y1ZV7xlKbfolcP8uEkAUDxMBvL1+G5wUilppYLiRAjnQ/V6KEqBfMV0bgfD8OmV5coUUf296cRHx7iYNmLVP9LGlHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828039; c=relaxed/simple;
	bh=ReCMCXFIwSKRJ0AnRqm/H6id5agQVj1IvyRChEXPP1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efdQGxASBxz9sfyRWnV7xJ3moVSU90hX4SnSgBR0h3VH4oL77ssk1stSvTmhRnDVY6KLsSNC/yuaN5PoUqcbUNt1DUHlfRD9pbtLWqQ8W3tDe6X8j8mKaO6zdJ1W1vexYOJn9MmvuhuusRL/xkhp5HJdr1OGlcvzQIoCW+39JKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2ED6OMu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2ED6OMu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3db9641b725so380970f8f.2;
        Tue, 02 Sep 2025 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828036; x=1757432836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg/JpW3SvRZNED9bEp4vwHJ/+yfFIdl8fwvEoOosPbg=;
        b=m2ED6OMui17LS8aM+0PZUnf8O9OXsz//wCiZ93ncUeiUy/pWMckvhz2LJZ2pYAZUod
         bLi2KuFBO7j3rgvUdqnnUh0udG3tO1A+L3Z++DlXERUNWIxthFv72bNJTACrHH2Lw14e
         XtoYr8b4iEACBRwJbfVjZ0OGvVZA3c0Rgyo2oG3Kvily87wFzWHBexBOMUXWbbI+WErj
         PdZdzl4rQ56VAIAUH+jWmd/kweMXTbpvrJ5QgHBvTxEM1RC11Wpvw7A2XSbGWzcRqSUC
         ArLS6SQvIm9zeUoyE9oD9RDmRugNztdN3zyc5yfPusxIhqu1dFQ+HtYMwjKP08UUCpV+
         NnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828036; x=1757432836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg/JpW3SvRZNED9bEp4vwHJ/+yfFIdl8fwvEoOosPbg=;
        b=tFSePZVtrHHjGEtgXVBt3DA2W/mHfoVIFCi2VYFAT8PV2aIkpcX0ceRyr4y604WlO+
         HSsUZumUzZ3/K2TC/dMXKtHSHRWsf/Ta1HiLxWDWtfswNF6aZw0E/E0wtodSzvUEs7HM
         KmibDWRfPcDr3Iu397Tzmi0vcqyi+YIdDoydKsswrkbpKUOz4a9iTZWClOIvUzRkaLOl
         ehB8Nyfry7R1+6DoY0St26Sj6IAGVUVSWTgHrQsZurEDaq4P8m1eZ5FK+QGYJnJGVQ28
         frIkh/RXw8Qfp4m/y3dH58SrjsTYPdcyFhXHb0NkVXdIgq+6LDDi6zRD4vXc2GiFibrj
         ceAg==
X-Forwarded-Encrypted: i=1; AJvYcCXKRZExyhYsWLpB1O2f3bQil27nL3haNzdxkIud0YYH0O/9cu5i1tGlLYpEDcRJu2aQOoElgb0pjCY5@vger.kernel.org, AJvYcCXi7s84yMWFIwiwQ9uZFtaLp0iqO7JIncr0NGPyLLfIBt4u5+8O26DaXt9aqK+65II5tLRvvZZVmCJpRnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7lvHT0N5J2BjhfGmAYPP9+le0Btv2hJd134suFpt0K7wXotL
	EUyzhveiVFxq2WzlLTBH0N/uDzh9WE8PsqCDEAs5RtdLq49o13WyKaXt
X-Gm-Gg: ASbGncsJ3NlikakEI1V3/tPmodnlpDQ4Ui0i5TBqDg/FK/kx5e0g6x6ikEVYLRwJhkE
	W2LI1WpdhZnUtBp0uuMKN9eZhaUYQjLaH2FjoI8pIKyI47P2N7tJqCEZulDlsHL4DsFrFeHxc3f
	eAtwu0jymJYcl7b0+77GtH5Qyy53xa9DgCipxJmNa6F1+Tk4SEIcdC3SE8pEfVFsZ3ikvs/KPrv
	ABQhSmoJhS5dUqrrnqEcTv/jPJhF8Iiv5Af6Iljak4f6RkQbXmSm1bQwPc0JAxkAyqFvb8yzzLr
	YsoiNsUJ64XXprA5Xc6//QmOscAx09ZxG9E6HyCWV/1yMaIgYIzQCTKIOhnvxLHoEkObtG/+afL
	xud3GxXUpbl8bMD+IiS28+7LO0KiEv0qMzWDIc0o0reZDAPzZ1D7mSb/bGhFOhAqxCcZ2eYm6tN
	vJ32sSs4kIsl4tVyIGYgF5xSjz
X-Google-Smtp-Source: AGHT+IG6QkcfvyEfQHcIkt21AHSSn0KPT2FNEyPTNaag6qHbdAblJtYW9hhT/NvtJKA8YQoxfOyM0A==
X-Received: by 2002:a05:6000:2011:b0:3c7:36f3:c352 with SMTP id ffacd0b85a97d-3d1df444ad2mr8516244f8f.59.1756828036486;
        Tue, 02 Sep 2025 08:47:16 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d0f85c287fsm18228079f8f.52.2025.09.02.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:47:13 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: tegra: Hook up VPR to the GPU
Date: Tue,  2 Sep 2025 17:46:29 +0200
Message-ID: <20250902154630.4032984-10-thierry.reding@gmail.com>
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

The GPU needs to be idled before the VPR can be resized and unidled
afterwards. Associate it with the VPR using the standard memory-region
device tree property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 0b9c2e1b47d2..98d87144a2e4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5280,6 +5280,9 @@ gpu@17000000 {
 			 <&bpmp TEGRA234_CLK_GPC1CLK>;
 		clock-names = "sys", "gpc0", "gpc1";
 		resets = <&bpmp TEGRA234_RESET_GPU>;
+
+		memory-region-names = "vpr";
+		memory-region = <&vpr>;
 	};
 
 	sram@40000000 {
-- 
2.50.0

