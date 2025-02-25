Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2403271837;
	Tue, 25 Feb 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494137; cv=none; b=o3rTKotWkfV2zTqDJhYkZwpZr+2ynQxH58Bba8oCgfe/T4RaL+8zrd5NriLOLSsjunbfgXji/nANOf9Zx7ohn+nIraq4cxceN3VQHBbWq3EX2fJiDik+M09ul+1qDhFsM2u2KAGZbD137/uQhSm1lfuh9i7S1q1xu5SwajnfybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494137; c=relaxed/simple;
	bh=FWdhXI/+/otGQgQZEzu5OQ0xd0/t147DiZIxONFhDvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJicompU07hth9dJScWwOeMqDjZeLzLI+pU27fct68cKKHi65cZF1KRHTkYIHQDXeiUrQm0S2Av94lcGXFfIfHQNhzcW5rUBVTAcaEg/GGcnORp41ca/AUeW3DcFm+R6e/UzojZbjb/IMuUU5nKHW1Z1udbIbslSumNwnPfiOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx+hpsg9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx+hpsg9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so9310471a12.0;
        Tue, 25 Feb 2025 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494134; x=1741098934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmNi23DcTQcUoa28fxQLB6Tq6I0RUSlHsggiyOQz4p0=;
        b=cx+hpsg99UHSEJR9f7yq4HzPxj/Yv3OHsAcrHTaAAytBB3BtmPy+PkAMmqTrch1CHk
         pcV30Dc503WbVbHwQELgN7fLuLVGtV0j97nTEfkhtJrBLdfFUJ3oUhDR4J798DXTNes0
         3pMwtdvmI7+JnD7Jz8ffsxRKjcBlEaqK7RkFf9oipkvQPzCe0HnVLxCXCo2vd9/93OuS
         T9G+/4VpT74YeGsEune2UnUKrMbQPxzpqnfKAr9T4LkuIiqeZp5cYDIAGT+Vz7NSnOm+
         IkrmXfzVM7R+cPfcso4FC/PSCPQPBsWFvQo3cRhFiHKNBw5+nxlIMkTsP7Te+XVv6fgO
         QR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494134; x=1741098934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmNi23DcTQcUoa28fxQLB6Tq6I0RUSlHsggiyOQz4p0=;
        b=nUKcnwPd0leOlHHUurmALdWaUEqBMqybMT/nayAuKEo+mSat6Zb8+dsFZYfUcLaTH2
         z4Sa2HH0LsPgaHw4sEMRGw+qq7KEKFFzaCqVOAQ4+yp9Ks7nB+7YRo7cX97opaEDfOoe
         w7HFFcSzgDe1ioQJdgoBOxFhUnJW3KZkPiZvQne+rxJpJ8i15cf8QcPExUBT5DdLLN6T
         MYn9OhCMiYRtV/OFYoCHfhCBu4FOtzkrGaJD8vfBaABBHE0tiPUv1eZc1dsUlZec3xps
         LdoGws8CFz2sMyiCSbpRwTQ9WYXbQFQCTeDXpKDlQLPM7R0fwFUBMF93DOjlOL39F1SL
         SRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEy7238E9PkVJh6EVIUYSbYzT2qN8s+76HPb19uwlWRMVGoR9fPdEak2+4yrPUaLUbhUS4XBH2v8Vh@vger.kernel.org, AJvYcCX63+BzZANyEHah4mNQUBvMfJdmaBsx30Lf7uwzz2Hi4HeYWIYhziu0XFtId3PfUFpdFRAIGRGEkFjl@vger.kernel.org, AJvYcCXTETfKEqjA7gSnvdhorMZPg0sP4YtCZp8LNvtbJ1t+ik+iV5yXF7SCosZt3zxEE16UUfjgvJOF9WjGF8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFRdM1nnmuKZZxNWq4R/fmgu6UL1brvGJV6XF5xKU8rycvMsz
	LZeASIpkofbC4b4YYKHI5nkrGdGacoKcHRk3TL8rzdkw4TCDcHqy
X-Gm-Gg: ASbGncvuwsx+3g0uK4YY0dPBazewbDyRz1uAOiXKDvDq4ffzJTt4I4VK3wmsSqVXIn2
	ehoYGtK1TxTTxqvDy+hVV3c8mpvNpuMny8s6yOq4cZaJ/RIdhHcn5ROJTFG52fdMEmNMaTb8uKm
	3/mPqa2b8Cmd0EzLalYEQ9Qb/xK6u/U7VbQ4SzkN1WSdBIIbgfWXUpCb8T2s5lX3Ittk+tgzgYj
	ssWWKYxvPVFrVaoMgyMO1piZNBS5oG7UCx5pO+qLe1GfPW+k6dvwU6MPHgNi6jUr8jXkx/6kF2R
	mwNlweE+29a4iG/0wQ==
X-Google-Smtp-Source: AGHT+IEVefg+viIi1vYKMETUBx86p4c31N5AJfMmnyQt8i75EbK/DHphWrCGayyLBtbfSNmCFp7+3Q==
X-Received: by 2002:a05:6402:35c9:b0:5dc:81b3:5e1a with SMTP id 4fb4d7f45d1cf-5e0b70b5fb0mr18078322a12.7.1740494133754;
        Tue, 25 Feb 2025 06:35:33 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:33 -0800 (PST)
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
Subject: [PATCH v1 4/9] dt-bindings: memory: tegra114: Add memory client IDs
Date: Tue, 25 Feb 2025 16:34:56 +0200
Message-ID: <20250225143501.68966-5-clamor95@gmail.com>
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

Each memory client has unique hardware ID, add these IDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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
2.43.0

