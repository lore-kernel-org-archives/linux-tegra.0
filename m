Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941852EB854
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923352; cv=none; b=YtfIRa5cG/ozsHpPLSox3LlBMY8wijsKjtc0oeXw197b4y+ygSUsP29Oysw/rYBYK7MjJS8xDBvtKb564897+v82BGjb8CrY1XBNENIlovFjJf/Y6uhbU6PioHWSUcsnUcp1Uu9r45640Tf9Y/Lsw41jaDjW6V2YkWnAZ2Oibb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923352; c=relaxed/simple;
	bh=beKfTwsNCPyE7PSl0N23EKF859Qyx63lSZI0D1sTGRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf4f+tyOMuzI9Siis/f51LbTn/Ey4ZBvYBVvI+UO18TCef9XPRVQ+xlDLIqfbII8X0hLxtssMiVh8Wpilpmqnu59OzVZDYjfvtwthuVfwvjI9Qz0+UO4aRvDLdFChEqiothRKAKs2gfjKBovNk95tjfBqk0M0hHMRyoUBZdSeYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpA8AWJD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpA8AWJD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-56088927dcbso4872519e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923348; x=1758528148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dckPa8UvKXh/PkQbc3E4s0LWUnXV82LbXi43pcGDFzg=;
        b=FpA8AWJDyGEFSr0KZFv0KkL8IpistoFE1ZOvdo4AgXVmSGmfMMlQ/PQntDe5wSobiR
         vfYakOndEq45mHmnY9lkvuomlin7e6ZNUhHe7Ylb/OGdI5OhAo4/7gNQAbrwiX/nQYyQ
         D9HiRwAj7ZkDqS8c2hiMqFW0N0kn3P2oyynNCq5F9rR3xPt+eYNqIWCnv/UG6o2mQtwN
         YHXLOF/sBY4uVCGNT4nTPz08M8y596+mnppFxInvSeXLNya3KDzOT0/7abe5e/dHS/24
         sKJKjRdoxp/eOKZL3uxcqXOTLgOUu7yB9Fr+7hcXEfjZYai/nBCVzJ4szRArSLCnphUP
         xvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923348; x=1758528148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dckPa8UvKXh/PkQbc3E4s0LWUnXV82LbXi43pcGDFzg=;
        b=W2zhomEgzXT35MLTsfbbZwgqXu/dgoP0zR1sUfaEO/znzy6P+JysMtnkgcJJw21Hc1
         Gv31YGhFav2Gi+UsNvoC4BCpft9GyGLJSHOFCRrfm9Qxs/bknAPAcoOhKpYlR85jX1SM
         WI7r0Vm4utDsOVHsZokdx8j/Wldy8AeORqtvmXOIdtrFbEQMENH2PT1D6xjwp3dk+GNh
         OHWrdM6AlfulB4xLEiLFvz/4uITVt8caCp8rnLL8rVVoBth+TFSJhIF8zCmwwmhCWP13
         ZCDpm7fmaKKGbgKOH8ReH8aPV8EcLvhv7A7J/GmxJu7LIQA6ynSx4VdkQi3zIMjQvZuC
         y1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXxPMf17vGxlXPFmDQZrijCRSuz5bc/l4hQPzGHe/OaYbXutZFlfEqBz1q6iHuTW1S9TDNQnsDhxvaaJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDP+uy7uQwI/EtARepwzuPBFvKpcjjTOdbT5xmDj+WsfvY7C4
	zWtzdfyy99K39oqf2TqUCEKz7QbKvLJArC2IXFPwp6pf8tv4rjs1CLDS
X-Gm-Gg: ASbGncufsgjBkDylIicpnK75T23T0bnVTSZTQadWcw9+dy69lOEdc3BN+aa92a4rl8P
	t7zrP+PA6LhjTKRjFFxJLsr8c4r+/xcneWuclpdiGPIpYALYpSpjDsYJ2A6/7hc1E59G5cBW32g
	aAqEHOD2IIBa2v3+34naN58htwBOs65F0fQsjam9upYEPugn6x09CL3ytm/WvarZwRpx20yAYGX
	hqx33LdjCUCQjqXDQ4khk4xCWkGGh31OlhXu3tWFY21YL8HOR4EqKUiEOc2qsLHdJpcZwVD4wuk
	XfP4nS4aFdvrcq/znPsMe/fuYmSFOn85971H5H5WmCaO4IqP0kSUVkZRsjUtopAQ4ParvjcRIfQ
	H7mTIHNgxxdmU7w==
X-Google-Smtp-Source: AGHT+IGazCIVLo0zyQ0tjWsm7GZ9jY72tbH4I+oPJP5mjUoJWYRI8uNVJSkfeTbN7VhlxwayTzD4Cg==
X-Received: by 2002:a05:6512:3055:b0:55f:4413:6f69 with SMTP id 2adb3069b0e04-5705197a783mr3371473e87.50.1757923348259;
        Mon, 15 Sep 2025 01:02:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:27 -0700 (PDT)
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
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 05/11] dt-bindings: memory: Add Tegra114 memory client IDs
Date: Mon, 15 Sep 2025 11:01:51 +0300
Message-ID: <20250915080157.28195-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
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

