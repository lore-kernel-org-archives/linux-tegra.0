Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581851;
	b=w/2oECZtlG3OSRNztTGRBta1D/8D/QlfycTpWdwTWaNAbB8pBCUKPJ6t8k3Wh8U5A4yD
	 yzlZBPL85IM7zN2J6MCZe79GP5idKHDvgckrTebIWf0lftiwPSb+JRnFplDiiVrCE8M+9
	 aCP/AERuEzQ1RoxJXtq5ATFa354xOUheUznI824MPIIt08fOfssM0TUrUm5wJuGtn9vb9
	 KpGCzHKbu83yVRVwhZNCVG+6k0nVWuPym6CFU3aN6wRTObH9QdRyztElZj3JHd44Gi9op
	 L+ebI3XLpbv7F1uWFPgd/K4AwVaFbm2DWfAnscpgLyzrO7Y20Gw/IFtLfH82++2M3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
	b=Z1cSs5ReF3Pj/mrEMvu0ZOrjInhKxCsIekwDyQKs0wBqN67nTuI5nf4AGF1n8YrXiO9P
	 VHUDR2nZDKZqyz6MDQpn1BglR7PjX1VXlQb78N81OqcrDidsh6A0LmZjeV6ErszZtyMmV
	 L6qLibYEczjYrkUL6RblmzyuewKGGR8fhltEblddwvutzCAHvtUkG7355jDje5f4OnQmB
	 29Cy5viej1caZO8vMYLOihnIyZ3OKSb/LPxOKCVodZXGwSQrQfORE2rf5BIzFFiOk7G7u
	 v5mwtqbYtW6eRuUb2RpDJs7Wke74NOraLCkk7AfsJaU69Gs/A4ijdu+/PsJAV2f7Pqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBC606A327
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 14:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EBC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1597099a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581850; x=1795186650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=qSb2TeeOfqYxdl6INNgy9h3ub88SEOE+2AMeoT0Z55svj9LU059duuYDeDe/UJCXSv
         AFZgdxzysj61CAKRHItHwf+pGcSkwW68urD27vAfJgJZxQYaEWT0x5hE6VFZKuUzkjeE
         0AArkzF/A7J59tylHD2hVeJOQmmQQps2GdevNPBJylx2fQQlriEwbTam0MNTyZcZz+EF
         XEJ6CIlcm6NlB8CzxG9PksLd3PCERp16PL79CuBZ1rQD6261GUYJ6upd2nBt1at3XZsY
         OI56TTWG4+V/zEnpup1Ku2pmPCaSKGDBD4vSPqUZdqVGNpQ6j6iLzfSlC/eilQLhEA3V
         U6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581850; x=1795186650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=r2xsfk0fv50uW2RSEQtsP02mMNCuMFbyAYKOBK9a3GaXynH3kEjvwpSZBMEvcVshHR
         ZNUgg7pkeXvo6a9a6cLB5//b80VNwXxfv8tLXpRVM+whGa/f4EJAz7Oc95AlhU6+BKPA
         6ymJuaj9LS4kvt7cuaTqaOXLp6MvAjceIVWjxI8LTFWV07DvcGS2YqlFkTp4tPx9tX8S
         +k+GJOYKGVTqPnNnEMU2hXeH27bhOMjqQD7dCxorOytHumHRypa24lvUtBXWx0MrUZRC
         2GWllegLjIF3wPNf7YHHpZm8az41IzwgHbwrHDAGp1SUQFOxa+3NtKo0vz5AP2EzruT0
         YGOg==
X-Forwarded-Encrypted: i=1; AL+hErGM4vPEg+Sb7btdp25kLnZg4/7lJ0LpY7slIRLzrkfFJ2d2BoW6GRlRcGwIm8EbdpQ41f3j1QvwzEtsqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zTlTuApfxJJaTVaM1U0mDcftweQxG8xnpF5X2Kr7Y/+NJSTsG
	CHHNEbb0RWGxpyKc6DumAXEFGTWUmvxymZxX9nUMES1QdAuidgej2Uhy
X-Gm-Gg: AYBFou3I3e79mjtkOH9/nMVZ2+8DHhFm8AGQYmSHioZRVb24RcJ4xSWezDMXeNJdewT
	QgRj+DeUfkv4fztMBvvBe/F6rCiIaEOGEKEXRVe/tuD4Qb4WKSIk5e+ZfmhVjr0yZGqtP1qb/Hx
	S7MmrpdC/vQUxDnnaQbZvQrLTZKPuzz0+1ZrgzfR5X7w/5sz8VJb/6VrvKk19KbxH3f5bMWxQSQ
	VtGnZhohYbqMcjfeeE2LwP2SAMJ+zocPJHoVK3a0VzYJCFdQve0vLDFbKhtYxJAbLTuZ6l71U+v
	ichReDbU8hjUIN5luDaiXwOcXgXDX3yRRjjNQS6oYEWS/6zIaeeVeL8SzNznODdoBqIQtlzacaK
	LlDDKxUE4HFXW1ehyVBHYmJEcnPI0Tz4lhTRgFtgbhTPMGq09FGz0l/siwza/UxQbbgjBamupPE
	3W5tjNm6h3ELoel6uu8wIfyYLVYhdInsimAZuI/k05Xy4XPoabhJVZwTp5MM7RSoFKazxbuyTxQ
	5euSzFA0EHLL7G6+yT2uOur+0kN8LvD4fGSPelnHD/vgTMkwd2yB7nzktz/J79o3lLO9eokyCgK
	mVudscD4gdQxuey8CvB+bkWlG9EM5iSwqrW3Aoruo6NlVRSFfbQV9CwYcWopdjlfvl5J3OkxoMi
	surPLAEpyEw==
X-Received: by 2002:a17:906:9fc7:b0:c50:521f:13de with SMTP id a640c23a62f3a-c5096543e9amr251235466b.35.1794581849950;
        Fri, 13 Nov 2026 06:57:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Fri, 13 Nov 2026 16:57:07 +0200
Message-ID: <20261113145708.261530-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
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

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

