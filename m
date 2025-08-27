Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3672FF16A;
	Wed, 27 Aug 2025 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294679; cv=none; b=uAkEER4W/zjAC1IaGXiv//eSkyXX0rDOjQZqdaWUHABhTA/XIN7aXhV+DFovg76GMu/V+TUXnKh+9Ha7z7GkCR9+K13tzc+66MV8YTNyhI6kVXRos3m6/dBmMO5gjTWG61J7lIf5HTonLavGCeZj4BNnDQ6iKKUnFMi/dfKeuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294679; c=relaxed/simple;
	bh=/tQ/wqmHmUwYAheMmvjzfMN49kXQJ+eJ8SBjzDv8EJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGiDGiROMoyMXYkWeSE0j2RivR8PIyOJXhe3hrcMEbmXhbhQqTN10lU1mQ7prKnsjkPP8jpw7He0A3rbIL/WeS1FdXw8OhN1YS2On7wlTyw2dfEf2l1/K0loZjkgq9GdT9UB2mL2tX/k3QQKk3DGSqGOsmTjxO5TpEH6GrktldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOOw4n3Q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOOw4n3Q"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afeba8e759eso149695466b.3;
        Wed, 27 Aug 2025 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294676; x=1756899476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0C9hmh4vnRqesYo5DwgFCTzSzopjMLbL20csj4cb7I=;
        b=KOOw4n3QvsckK1wMjAaIuM8D9Ba+OI6k9Zf8vK6KK3jIJabKq0QKdtwTLnnQEe19mZ
         2fddi8UDaUfIrCiXYe+/vICmdZOtwjqp84Yb03c88DJpiOuZenMpUkG3LyZEDoWq33zH
         I90tDgWvExHos4LuID0E+PGWgjH0izlFotyvBCvxOPAqYfK/pk0Hg86vrtaXUWZb7qMI
         nqeu9OPP6GitFO4M8Qk+RcV6auCewRTXhMvmwG/R4cQ6VkPvDP5GeLNWDmCNaEsldLrP
         d96U2bzf1dKCbzGTdIaP1EHMgzVAEPUcNjc12uOzqvHjt1xQ9pscC+aE7b6uvTf2+U9M
         uIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294676; x=1756899476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0C9hmh4vnRqesYo5DwgFCTzSzopjMLbL20csj4cb7I=;
        b=oD74mB82SxuGFahJ8C3hUpuyTsQqnBjJ1HNtVlnccnTSn+R4dECxJsABFr1FdZLqFb
         CCJ73wjavUSSjLnxwYa3Wi0+kQclvhw3oo+FpqL/+VmYdmlvQK2nLBeVwxLGei9T5gaJ
         dg01xzqwoZO/c530FZalpq76vdEBmWFbFCHEeFGAEtY5JD0qaXHW7TroJb8MCEs+GLPU
         NQEF3uGWlMbmUq66fFsKx5h8/DvnixBIxN0UVBte3phSH0BlUIxoqVoQ9Yxg0UsmCYuw
         vttSsvXnjf+yOsc8NT5GUpq6V2U8E0P5HCEF+C8S59SGgL08GpeCBOyr82MFM6Tme5rZ
         t0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXgM/ZvY953DAeSaRHzuhwdZkSR5gCTmdDedkGjZLccVYXdIV3pcTNvHJlYOYP7fHNLYxLz3vEijo58fg4=@vger.kernel.org, AJvYcCXwPns3+gfqz+pNOryvnBHrWMKBQo0Q83aL/9SMc934YywSPhzMD4VVJXoGb8e+/GfdvqbFNqPy/JASVqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4jsAjaIAeDLx+mgeKXNTQunwppzJEOSAw+T0E2VPEtKpR0z8
	83bOnqt1CCJF1L2HI8csG1WyYdkUj9+qdKv3FYEY5bqfgsCRFjVrUqJ5
X-Gm-Gg: ASbGncsyWXtMfGv3YBfpR0FPkTzdqG8hSQ1xN2zNYkN5V/1Vu5I9weQ5el4+bifCp5m
	hbmNCm997jpzrpmZb6Yyt+G9TPzPesrE//0KgtyC3KsZt5uZi3BCb38JYKt+iAf8AHFaH99O5wj
	58Nre/hNMiNLXN0SC1JXwrz8o3SclK7xtQnGT8PEKjPBngPNaVHV8JWE8aE7RoSQj59sHtXv6GJ
	kFjfeMyAHiTTYlp0sWzz0NGx8RhdF1f8JplToSFw4VW33JfM+m/RSUggl2BmYv/Y9eSUKHkXdVb
	xgXtc9S29RUYqctbaQPMG4jEJQRNnhBtQlAEq41CuDlfZxLLg6UOy0DLP+N+VtMnIcEMNXBOMgQ
	ISzB2rKpi70ero/ZXFmea1IQl
X-Google-Smtp-Source: AGHT+IGQYZNygmBI+7r9v6ROe7yL1PjnQiRPO0EJIa0L6acLDhkeVvZvHqdPYJRJr7MWuMmq2BiClg==
X-Received: by 2002:a17:907:1c17:b0:af9:1184:68b3 with SMTP id a640c23a62f3a-afe296358ebmr1875534866b.55.1756294675912;
        Wed, 27 Aug 2025 04:37:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm675607866b.105.2025.08.27.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:37:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: tegra210: drop redundant clock and reset names from TSEC node
Date: Wed, 27 Aug 2025 14:37:34 +0300
Message-ID: <20250827113734.52162-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250827113734.52162-1-clamor95@gmail.com>
References: <20250827113734.52162-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock and reset names are not needed if node contains only one clocks and
one reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 942e3a0f81ed..cbe54c4e5da8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -183,9 +183,7 @@ tsec@54100000 {
 			reg = <0x0 0x54100000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_TSEC>;
-			clock-names = "tsec";
 			resets = <&tegra_car 83>;
-			reset-names = "tsec";
 			status = "disabled";
 		};
 
-- 
2.48.1

