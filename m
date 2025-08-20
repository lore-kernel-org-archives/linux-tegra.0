Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3E36CDFE;
	Wed, 20 Aug 2025 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702832; cv=none; b=Cw5OLD+Sw0cM+QX1Nr6KQ+EJwv/y/tojB2KQU9hqCDw1cTnncj7/jF2exM7iTppxueZUtPY6+vONLpYvWBYj4We4Xw2Q70nluuyYkCIUY8/JzhtACZViUxvK2x0RG1fgnRi/42ImytQtxEukqpkCYZq+m4o6MbqCpmfpd0iEdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702832; c=relaxed/simple;
	bh=Js3cLUSVYcHZ2mO0r8v+chIajpGsCabrLHXS+9LEwdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoeKtEoTmLNxYzGwV4eYqomarnFnCkYiMX9ORAGWslettSNtPbc36ZW3KD3C60c0bIHPgEOuwmvh2HasVAaCTox6yXovG1V9V+sJhtQ5wT5zq9RsK0u39iiM2PFEG9J4VPs+QwEoLpxLtnOTS8lVWfg0FPkTnb/gNmirOKVf+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf1Td2GN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf1Td2GN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso943698966b.3;
        Wed, 20 Aug 2025 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702829; x=1756307629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY/FaO2KN+Sxe3po4HCs+eKPdtOX7shaV4WlGSenHAk=;
        b=kf1Td2GNOrhz7H74neWAhVjqv18s+FsFbsWbxGN3t7IXNjzAJEsBCs81OZvkpYNFQO
         wDHMdK+2Or/0bNZ0UXh07yKwmcKEOwwhDpu4ybDSWDI30xmqviiVqjU04i+DEPkE8fD/
         N9LOD+3SJcVhgJpYiY61ifria4JuOwtQ8QN6IwUwd6kxjWDwhX1rZ/jir/ex6CzNL+eb
         NJUf25eC8K7vhvEk9tqoLnusOSwasNl1CdQTN97hlXZOUYjDnJH0onqUI6KF9gCNXRX6
         McUdFbTSerED4ufUjrT/mLkCFVKluiPhKH6V1B/CzBKIhGWs3yiYz6TGHCuCrqkgCiU1
         DIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702829; x=1756307629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY/FaO2KN+Sxe3po4HCs+eKPdtOX7shaV4WlGSenHAk=;
        b=B15cCiH9nL2G4v/BPbTgey62TjIaovU+o9ItmYB3mvVy8Z+Mk7p87reIAOjc88wRNt
         pVbds6oxpMIa2qru+7gBcPw0Be/RV00S9ECRkhUrcQP6IKHbngIU6V97kThoSCRzdciF
         TPMcC3nBD6beyohCibiapb2TfupKkmvGbriUKX7uCG2qQC0NFJ0OdrmRp61hbrZcW+8C
         Lpz2u2hVN5/dEBelarSQKuOnX++GkM5OX/ZJxvueCPu3RwLVT713d4/jionczJWBqUe8
         ve/wp/F0kSnx3/RPs7qDxwUr1kI95pVmBQeMixbO20K9/RRbDT/NHPJF4SmernqB+UWs
         AKjw==
X-Forwarded-Encrypted: i=1; AJvYcCUJL0FRx70UOUH7DBnsPXrVB5J852wI6G34fD46s+FPmYUBVge9F7YtpkTuAQA/Ey4hJMmJvWoCuA8kPRA=@vger.kernel.org, AJvYcCXgZkndB1Yuk+B26DLeIiHby3dML5gKef/1EshQSrttWObqhNvx7i+V78TEhEGSBys61T9A7r4siW2a@vger.kernel.org, AJvYcCXswnL58gFAb8KOWYg/CIMQ4YVizwqVtYJAfiCN1mhKB8LAZ3BIbrF8YMzbesJ2TvqIV9tv25saiKoA@vger.kernel.org
X-Gm-Message-State: AOJu0YzERYBUVjNZ2sB1wIbCbLutlkqmX1mYl5VAnJBglAkXbKD2uuzx
	PWFgej64EaCAnVbQB3+yZVxNZDl5mT/K840mOPDa/aiFFfP14btFsk6V
X-Gm-Gg: ASbGncsTHlNuh/fxHS1zT9R+VhH71KGzuFsn9wOR87blbdfDwpGAOUQJwiMeQLH1UHH
	S4x7rOcZe7IlnelLWhvJnh/ceTjd7Z9GUOEh7WwApiL9ObZHNJu7to30sA2x6Rx2Euczz+WCcX8
	yEiBhH0VsZN7eMJIhUe8Hk8EjrAzrGvbXV1z997SGzZGicFnO9uOe4fF7VHzLLDbXvbTEfMBGx2
	cXIIEaa2gsc3n1o5H/x9DxC0FJrHjJYjXTBs9/DuIqto9C7EVdR8fDUQEQRd4respPQRUuHcSuC
	Qb9DxwkAezyQnz5p9XwfmGhlC2EL+ZFfuwNdlJo7J06d/ArZfG2Ako3XaLntX0v3zPd9YVe7e3w
	VqYjp8vgOLmX49Q==
X-Google-Smtp-Source: AGHT+IEfYQ7+28XDMoUkAG/5Na+6SZxQcrOzLTUfW8xIWh4jZ8Qc+sbBgP7tK0ulCSMSg0KM77nb9A==
X-Received: by 2002:a17:907:724f:b0:af9:8438:de48 with SMTP id a640c23a62f3a-afdf0206ba6mr299227766b.48.1755702828514;
        Wed, 20 Aug 2025 08:13:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: memory: Add Tegra114 memory client IDs
Date: Wed, 20 Aug 2025 18:13:18 +0300
Message-ID: <20250820151323.167772-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
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
2.48.1

