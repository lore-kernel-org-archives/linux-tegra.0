Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B933A03A;
	Tue,  2 Sep 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828030; cv=none; b=ZzkRIw6vBg/W2LmvK4CQLtoIQGXmZqu8gtYRDTz/BRVdrMoZJ1xWiymwGoyu91zMNHGrlb29911nnEGkAs+oqm83MdrgHWrGhDlWu56EPfK/EMATxFVcALFhng6gogPgkqiVHiWn/acWIpRUaWD9Pzda4VrNjatdyr4rWy1BTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828030; c=relaxed/simple;
	bh=ugwepzMssA8bjA1Di/jdtW6g2/MI4FZjDeqSIbefDv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8JleDdg2SfDQOvM41rUOGdHiErEOluNWdj1VFWDQVb1Ir/rQdBwzzU3uxttXqcEhz2SZ/KteJonHPo6vj78Rcq6jhBbpInvFvxiaTP1vcvR/3cpbsKC+qugbeCSkK6imtKrHYG21Mlz96QOdC+o9eR1Ol48eS1yt4fT4yS0lbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPMQCY9t; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPMQCY9t"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so24402295e9.0;
        Tue, 02 Sep 2025 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828027; x=1757432827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR4jf6n49qoeIQa6xtB93bVvXG27Wam54T0FJ3gzKRg=;
        b=MPMQCY9timbG8xMhO1oUKPImneryF/vxBEI9deyVfipF8aNuX9ZRtd5nc5k1NVJYb6
         pLn0MuRrmsVA/C00YHE3PRnfjS+G52HaBY2m/pd1gSR2ND1JUwVFOZFjz+BLP6T9WApM
         GkvmIucxD6BHkafKt3TWdnkXB2LwxVhCiUT/BM6ZBRcq9FqMvZ3K0Ts8KnLqMGDnVVAA
         2orlR2NN3tqkxy3WEHnId1U/81nODW7xXyA9adDjNrhK/n50rvFt0h9M1q7fA9LSWCuH
         KhxulD/T/IFxNG4x62JiS7JrUYLUQGaQEReHNt9IsUpIeGwrdFQYh9yMF1DMfzwRHaT5
         8PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828027; x=1757432827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gR4jf6n49qoeIQa6xtB93bVvXG27Wam54T0FJ3gzKRg=;
        b=miti2kWlcsSLxVkDHQ1vV5QZhwxPA2uUKtRDD28mzD8fl75lWh6S6OgIHuoMvU6uin
         mFxzsAY4r6nbyc8CAxxMpa20KSoCxOVlFNdEuTaqmcKZ+akZLqtACGiLTpK/6dqcjlCM
         IoqQCnW6iTVaj+JHP7SqkN1O4z2+IHFLSP/KQkYsYBmdfqUOaUAfdR7Pa5tPntENbZXV
         xTUsQH91U9HxsGMHZ3W9RgcPLSzuo6Ah8lP7OJg1/xQ8rRzbFPLCKkmMnoVqBiNowSsz
         ri0VDTqn+TLya4qSDnrEyLhnBsDRQDxkn3AcsjXocZpyeclWZVlNatdlKuGOVJLG6D0+
         va2g==
X-Forwarded-Encrypted: i=1; AJvYcCVNpMWr1bL+e6QWJ1YLEsiqflI+MCdIwJ4V8NuZP3N8QCZPv7vyldhCE4QWQIldoNIPcdM5rMLoV/lN@vger.kernel.org, AJvYcCVk8Lklc8EUW8ODT6V0C6kt7rS2MzjmGiKQuzSv6Na4QNLz4fk4lQ04UWVZVBd/dOg5RhGnWY9adJRtWxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjLhya3/P1wa8q72I/qTxStBS4RABr5WUldVxpAMuAymDDveA
	+etzfDnTrqyWR8XGcEc/y0oq+3arntyDpTEUybXjqKWK6iyHQnZboVK7
X-Gm-Gg: ASbGncv/pmcO3Y/rl77LbF/3EaYkVHRVf2C3Ql/7T6lsas0H7bwGJcCiMW9RxJL9E8e
	CBcEBegz0IMFa+kCj/u2l5q9GYGqIjJaIabPleXHLVRwvreu4btiTz5DzTA0eFq68C962ehX68V
	JYqzm5PDYgEZvzR342gKNjZPzwkcLtFYcf82YdwbbTxxhLIldHIYnC9uk6/ldzARzg275hAzcJi
	CewX3gBX71eUMRaIGSVrccG/lgBJaRCJ+DEMVBzl/lRLUTG2ItNkXAfvvKcfvZ0u3YG+C/LVk4H
	9cWuGSP0u8gs/fJLDEq98Bui8HZjy0TbrX1mkyYEcvjj8y5sFN4+0N8fvZHwofLCSkrtKUmYher
	xBCSZ2Yccn0zppf3Yc22PiDpjTxZwOVeQPq0w160Z6uARb13xkwVp4csxO1ak2uf8YCjGbfmi3H
	S+EsrrCvdQPMIjHg==
X-Google-Smtp-Source: AGHT+IFNHaA5Mk/OTIBuSkxqD2TLa8EhamiFfXy+xcSVyFlskbg2S2fkWFhv/WICHcU/8LVjc1jWCQ==
X-Received: by 2002:a05:600c:524b:b0:45b:8482:b9b9 with SMTP id 5b1f17b1804b1-45b85e429f4mr103133785e9.35.1756828026881;
        Tue, 02 Sep 2025 08:47:06 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6b1cdf05sm163708975e9.1.2025.09.02.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:47:01 -0700 (PDT)
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
Subject: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
Date: Tue,  2 Sep 2025 17:46:27 +0200
Message-ID: <20250902154630.4032984-8-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 4d572f5fa0b1..4f8031055ad0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5262,6 +5262,23 @@ pcie-ep@141e0000 {
 		};
 	};
 
+	gpu@17000000 {
+		compatible = "nvidia,ga10b";
+		reg = <0x0 0x17000000 0x0 0x1000000>,
+		      <0x0 0x18000000 0x0 0x1000000>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "nonstall", "stall0", "stall1", "stall2";
+		power-domains = <&bpmp TEGRA234_POWER_DOMAIN_GPU>;
+		clocks = <&bpmp TEGRA234_CLK_GPUSYS>,
+			 <&bpmp TEGRA234_CLK_GPC0CLK>,
+			 <&bpmp TEGRA234_CLK_GPC1CLK>;
+		clock-names = "sys", "gpc0", "gpc1";
+		resets = <&bpmp TEGRA234_RESET_GPU>;
+	};
+
 	sram@40000000 {
 		compatible = "nvidia,tegra234-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x80000>;
-- 
2.50.0

