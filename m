Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63419156F20
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454491; cv=none; b=WzJb0CZea66geD1C+lSXja9ltCMANcrtzSrcBuS3ibHCOVwFqj2oRjpD6ioP3QuCwUu6oSA7phusrNWShh6kx5R1IXj2RP2/SzNpd9X8e3Ajn9Umjnu5KajwdCr4QUzIXW/4Im/T377HuoupYkaAR8/icQ2RYhYDKTMBvM83mtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454491; c=relaxed/simple;
	bh=EpZL32Jyo1zVK7iE7f/cCfj6bklP2cCKT0AbKLrFi34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECNmeyJ2q8brXIdsa0bdzdc4Rh1tcKyY1S0BSxM81dhvtFov3v671acMBmJ/Qu4vOgYsl4nUAwKRsGCXsTl+Y/vvqsZINpjmCk9KdLKeQ9ITwzw1VPjkYzpkoRTY5c5e6+PQjNwdXgV25QHUprj9qmx6UBwzVaGGoGDfkcO7nEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTQR7gpY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTQR7gpY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435a11957f6so4019513f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454488; x=1770059288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVffN9Slo7nSA6jMy+HnfjnzdqrKlZ/cdmvcQBPmzT0=;
        b=KTQR7gpYu/RCD2MJ5rsMNPwDfvod7sDGilYSHHLM3B0VRhTObBTARnWRvvKj/YqOop
         U4uM7rir6hEQztda0U+v217aKZAcWmeGt81LxTyB7Ev0G1XL6gsVkKnUh9u56fyMQltI
         /5NFdYoPLINkyY6BDbYA6js7jrcmpBlZIGXim6x6813H7hHA5X7ManDbBmeYU1EU3c5S
         1k3ef5vsYqDZ9cw5b8J5d96ekh/d0LpeS12gMidZzinO/7hK6OOFKK51a3u8qnAx66yL
         V/WowpUq+myeOboIM60df3Q27R2ONkYqhaBdEbwegX855V6D0zX4u26IxAgRjwa4IOQz
         KTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454488; x=1770059288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVffN9Slo7nSA6jMy+HnfjnzdqrKlZ/cdmvcQBPmzT0=;
        b=gZNMMV3O0dvWP/FOiCxwULbpJpP0wGxPnXW5kkvn8t6mvEVrVwBe44XXjQmjBdgaXO
         +tFbS9+Sh/62AGEpydLZ/bFg85lj5Ry5a9KJlsWfncWKTUYhfcBWtAgGvQhlr9f+UF4/
         6wpGJcdCOLgK+iNb6MwtTdowc4TRJxKsLS9kzhrVc6Z6n8TV9V+0J0BzgHgYH+r+C23j
         I/Z/RFTdmhoEM1sOrBRdqyYCS3S7fuXshlak3HqNrYKIBiFpjz69KPl1NbmJ78aXXGl4
         0hfR0Dfk7iXTgTxwDOKBT3evEiUIBj080+akVxNrMsUMM72aYxB6Z2x5aVA2HRsO592Q
         hLQg==
X-Forwarded-Encrypted: i=1; AJvYcCUItdh8hnmYl+3broQS7vLmLGe98YdD+5GRSYU0ojH06J1aIESs6AF4Kt7YE1esVT35LLsNUwt551jFxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXBiED6nAZyFa3aKhpw8yElAv896mOe+Euv+wgLGnyGwIvqMi
	us6q0RUzvGPs0XKt6EHypFIGFr0Of7peysi/armk41Dqu5bI7oWB0Ear
X-Gm-Gg: AZuq6aJ8VNO6PJPCA/9YPSRifmL+2UiVPgZk5AfusO+OQMEhz5RebSGIwCiKavU2egW
	pvbO0KXV7WK+Ak6x6P05ICA606K812ki9PPZh5tM/Mi0p803d6ay2ttvJPxnkuo4pPCjds582id
	Hh8GmX3lhsCzaQ52eLd1zmjpiqe22SUafUew5lhe3EsEoJ31Xr0ykJfiOHa8V63rUw6YMTWn45U
	QYNwuRANtVEKDuG1ZME1aoSZ+np545OAp/rZB4LZAD9oKmZwZ3n1EM2Dw3OhptFR7L7djxc7IV9
	X7nzzeXMPe4W8tbPn9fBSdXCYOgNnvcNxXo2tSs6q77wUVgYe5XZZny5ZQdaIIjwuG6W3lXvu9G
	fD6Udb116WRE7VNTNT8aKEXTZXCFf2DH0VY6E6uloUCaX3ztxi7oF03Nmdxzl7brqyrQfcKS9Fj
	dh
X-Received: by 2002:a05:6000:250f:b0:435:9a2b:53d0 with SMTP id ffacd0b85a97d-435ca1aa82dmr8665439f8f.45.1769454487759;
        Mon, 26 Jan 2026 11:08:07 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm31802030f8f.11.2026.01.26.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:08:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client IDs
Date: Mon, 26 Jan 2026 21:07:53 +0200
Message-ID: <20260126190755.78475-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126190755.78475-1-clamor95@gmail.com>
References: <20260126190755.78475-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each memory client has unique hardware ID, add these IDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
index dfe99c8a5ba5..5e0d6a1b91f2 100644
--- a/include/dt-bindings/memory/tegra114-mc.h
+++ b/include/dt-bindings/memory/tegra114-mc.h
@@ -40,4 +40,71 @@
 #define TEGRA114_MC_RESET_VDE		14
 #define TEGRA114_MC_RESET_VI		15
 
+#define TEGRA114_MC_PTCR		0
+#define TEGRA114_MC_DISPLAY0A		1
+#define TEGRA114_MC_DISPLAY0AB		2
+#define TEGRA114_MC_DISPLAY0B		3
+#define TEGRA114_MC_DISPLAY0BB		4
+#define TEGRA114_MC_DISPLAY0C		5
+#define TEGRA114_MC_DISPLAY0CB		6
+#define TEGRA114_MC_DISPLAY1B		7
+#define TEGRA114_MC_DISPLAY1BB		8
+#define TEGRA114_MC_EPPUP		9
+#define TEGRA114_MC_G2PR		10
+#define TEGRA114_MC_G2SR		11
+#define TEGRA114_MC_MPEUNIFBR		12
+#define TEGRA114_MC_VIRUV		13
+#define TEGRA114_MC_AFIR		14
+#define TEGRA114_MC_AVPCARM7R		15
+#define TEGRA114_MC_DISPLAYHC		16
+#define TEGRA114_MC_DISPLAYHCB		17
+#define TEGRA114_MC_FDCDRD		18
+#define TEGRA114_MC_FDCDRD2		19
+#define TEGRA114_MC_G2DR		20
+#define TEGRA114_MC_HDAR		21
+#define TEGRA114_MC_HOST1XDMAR		22
+#define TEGRA114_MC_HOST1XR		23
+#define TEGRA114_MC_IDXSRD		24
+#define TEGRA114_MC_IDXSRD2		25
+#define TEGRA114_MC_MPE_IPRED		26
+#define TEGRA114_MC_MPEAMEMRD		27
+#define TEGRA114_MC_MPECSRD		28
+#define TEGRA114_MC_PPCSAHBDMAR		29
+#define TEGRA114_MC_PPCSAHBSLVR		30
+#define TEGRA114_MC_SATAR		31
+#define TEGRA114_MC_TEXSRD		32
+#define TEGRA114_MC_TEXSRD2		33
+#define TEGRA114_MC_VDEBSEVR		34
+#define TEGRA114_MC_VDEMBER		35
+#define TEGRA114_MC_VDEMCER		36
+#define TEGRA114_MC_VDETPER		37
+#define TEGRA114_MC_MPCORELPR		38
+#define TEGRA114_MC_MPCORER		39
+#define TEGRA114_MC_EPPU		40
+#define TEGRA114_MC_EPPV		41
+#define TEGRA114_MC_EPPY		42
+#define TEGRA114_MC_MPEUNIFBW		43
+#define TEGRA114_MC_VIWSB		44
+#define TEGRA114_MC_VIWU		45
+#define TEGRA114_MC_VIWV		46
+#define TEGRA114_MC_VIWY		47
+#define TEGRA114_MC_G2DW		48
+#define TEGRA114_MC_AFIW		49
+#define TEGRA114_MC_AVPCARM7W		50
+#define TEGRA114_MC_FDCDWR		51
+#define TEGRA114_MC_FDCDWR2		52
+#define TEGRA114_MC_HDAW		53
+#define TEGRA114_MC_HOST1XW		54
+#define TEGRA114_MC_ISPW		55
+#define TEGRA114_MC_MPCORELPW		56
+#define TEGRA114_MC_MPCOREW		57
+#define TEGRA114_MC_MPECSWR		58
+#define TEGRA114_MC_PPCSAHBDMAW		59
+#define TEGRA114_MC_PPCSAHBSLVW		60
+#define TEGRA114_MC_SATAW		61
+#define TEGRA114_MC_VDEBSEVW		62
+#define TEGRA114_MC_VDEDBGW		63
+#define TEGRA114_MC_VDEMBEW		64
+#define TEGRA114_MC_VDETPMW		65
+
 #endif
-- 
2.51.0

