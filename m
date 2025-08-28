Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6F274B5E;
	Thu, 28 Aug 2025 05:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359870; cv=none; b=D0W8Ldd+Qi+j6lL93ghNuXixVVVTY4DZdwhr55m+b5RNbcWh8uRky+W12psQdJN0dEpVBX5ocqfuRXlENNUivxTJGaD9Zt6ZBpograDrmBwYJlUziW2l5lRCLGqmCK8SSUYp5mxqJVv4zWDh9MyrXLo5ySbm7b+cSkjHirO/Raw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359870; c=relaxed/simple;
	bh=Y9X4/pFEZ/jqNHGzT4QzO8tSkZUPgemRkLLF2GhJ7yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1a9oFapcQ94en9AwO6T6TACb6kqkJmzsznSnbrCJK02b747heq/YAK2L4CH/tRlbUKlfxRtOV4FZb+1GDgOfwTzWlUdU2KLpzi2nj/OhrPf1AOrwjA+gseI6LdfM6/VSah3QBqvA2cWEoR4YXZbtBALOvM/7GjEioswuPIFygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1M2e97g; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1M2e97g"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61cd3748c6dso842839a12.3;
        Wed, 27 Aug 2025 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756359867; x=1756964667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFa04zWUwS/vePGbar2eG0NQLNdNc6lautBIfeJ2nEg=;
        b=S1M2e97gKha+cEldhWyQBUemzhPutxAsJFDzUSHXPI55DFlFIHJZ+rPiYiSJ61THbR
         9nV9lj8SO9yCDdfuKzS6rtCM7m5ml2EKwvYvAqBK0HH7Y/bRUvh4tBDF7SD/4lGpFC0V
         qoY+Tn95Twon2QBeGM/gz8xPeOC0huwyBRCqUnow8DPFyTi5+9jPhIVDNBLAHbE/dFxQ
         cZhCKzCl4wmeuq8NFFRki3Y7/kJMtmMbEsjMWrCbFuTqcqYgQcxQMvZ+M7XvdNRRXXhn
         49J5qniTVhF1cCEuwsGjyH2lVfzOOjd+xHOZfc+fAr4A9o1zmONO+cru6F/FnnlcjqtH
         uQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359867; x=1756964667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFa04zWUwS/vePGbar2eG0NQLNdNc6lautBIfeJ2nEg=;
        b=ClBsWm2Jxvx8SjOHrA9jLi5TXP3/ggFdtS1H0GUgdxwQ5TmsquM63pfa0s7D2g6zpI
         k03cZg+wmggfW1ishbMRYSHPVimri4DlmYa4loVtOThXx4DZ5aiFA/asJBkWDGLlTyQ2
         wupKIvKw6cvYI+9axWOXfa6QRrflKE0yeCkySliv4qdppdHH3IusjdOE8blNH9AM7huI
         H9U0vKlcmIcwivgBX1UcYfrbjsATBYJJIEnFpLR1+71xaaflxeIifWBj5ATAWmyaciTB
         VqJ5Ya9AFex5L2YlL4fzwev5s9Trlk75g1XnU3CbM6fzODNuPGRoQCGnNj26UWd0x9fh
         DRag==
X-Forwarded-Encrypted: i=1; AJvYcCUBqjtrDqLQ7+je3NtRndT+Pw3XUvlIGyezkgzf7KIX//dDyHgoNWKDkbs0vZA6GQCRKIJ2L+EJEx0KCQnE@vger.kernel.org, AJvYcCUfoS/2GPKMs4FyeBSJz9HwxO+QlsM+I67SfLg2v1zP6/VHcM1X9rwb6EBwSs/3iDX/k+0lyUwEkAJF/2M=@vger.kernel.org, AJvYcCXhC1nl0e+a4wPZH3vPb29DD1IWJ3a0TZszeBnrPczOtwfoOFPzh/U8+BLCZFxDylSmWwj34z5h+7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj74cNfFMyNng0J/L/Kfu1hzaAMXY7IEtK1XvaTalHmrRgEjl2
	8/KKIjZwg6L3j1baF/ruAnImzC7brX5JhEcpyeniR44dI311UUH1dIkQ5oGmow==
X-Gm-Gg: ASbGncsx6TxnZ7Jq/OcElsh8wtd1fyiro8OXiJ/OMcoI0p0rwxPVSltsvwbUsLf5UGH
	JW0d5fseyvNrCff3Ex/bJK8QtaExOfglItN99XeopW1PiKDGt5sBwXL9eKix8Z7TRpgdZkYl2so
	8vjRQPbPnu2zkwP3dbdCfU95A/AOlxs59t3SvyQaY9XdjJXkHQyLHGf4q4evJcTo8WvJQFgb2ib
	ESjE4i+zxJijNLzeItKLNJkAnTUcYWJhpjpDThgWV1+z9GavYqj6H6ysTnC0p8aYHTn9MqU86rb
	/JPa3UvWRcOYhm3j39TLVO732X5PBGIDFB5XC03b7/t2gAkbSsIpwgqNeTqGYA/Nh1d+/qcaJ+i
	CHjxCW9nSglR/uGvBzalAIEjV
X-Google-Smtp-Source: AGHT+IGt4WPx9nrcqzKoBcQ+iQWYmXkoofLqvlc4QUl7Ndlt3QnBbY54vYLJR83uNE6ACRdjAnpleA==
X-Received: by 2002:a05:6402:2552:b0:61c:9852:bb9f with SMTP id 4fb4d7f45d1cf-61c9852be87mr5861737a12.1.1756359866708;
        Wed, 27 Aug 2025 22:44:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac051sm2102841a12.29.2025.08.27.22.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:44:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 3/4] clk: tegra: dfll: add CVB tables for Tegra114
Date: Thu, 28 Aug 2025 08:44:02 +0300
Message-ID: <20250828054403.7112-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250828054403.7112-1-clamor95@gmail.com>
References: <20250828054403.7112-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the Tegra124 DFLL driver to include configuration settings required
for Tegra114 compatibility.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/Kconfig                  |   2 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 158 +++++++++++++++++----
 2 files changed, 132 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
index 90df619dc087..62147a069606 100644
--- a/drivers/clk/tegra/Kconfig
+++ b/drivers/clk/tegra/Kconfig
@@ -4,7 +4,7 @@ config CLK_TEGRA_BPMP
 	depends on TEGRA_BPMP
 
 config TEGRA_CLK_DFLL
-	depends on ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
+	depends on ARCH_TEGRA_114_SOC || ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
 	select PM_OPP
 	def_bool y
 
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 0251618b82c8..1405217fed5d 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -28,6 +28,99 @@ struct dfll_fcpu_data {
 	unsigned int cpu_cvb_tables_size;
 };
 
+/* Maximum CPU frequency, indexed by CPU speedo id */
+static const unsigned long tegra114_cpu_max_freq_table[] = {
+	[0] = 2040000000UL,
+	[1] = 1810500000UL,
+	[2] = 1912500000UL,
+	[3] = 1810500000UL,
+};
+
+#define T114_CPU_CVB_TABLE \
+	.min_millivolts = 1000, \
+	.max_millivolts = 1320, \
+	.speedo_scale = 100,    \
+	.voltage_scale = 1000,  \
+	.entries = {            \
+		{  306000000UL, { 2190643, -141851, 3576 } }, \
+		{  408000000UL, { 2250968, -144331, 3576 } }, \
+		{  510000000UL, { 2313333, -146811, 3576 } }, \
+		{  612000000UL, { 2377738, -149291, 3576 } }, \
+		{  714000000UL, { 2444183, -151771, 3576 } }, \
+		{  816000000UL, { 2512669, -154251, 3576 } }, \
+		{  918000000UL, { 2583194, -156731, 3576 } }, \
+		{ 1020000000UL, { 2655759, -159211, 3576 } }, \
+		{ 1122000000UL, { 2730365, -161691, 3576 } }, \
+		{ 1224000000UL, { 2807010, -164171, 3576 } }, \
+		{ 1326000000UL, { 2885696, -166651, 3576 } }, \
+		{ 1428000000UL, { 2966422, -169131, 3576 } }, \
+		{ 1530000000UL, { 3049183, -171601, 3576 } }, \
+		{ 1606500000UL, { 3112179, -173451, 3576 } }, \
+		{ 1708500000UL, { 3198504, -175931, 3576 } }, \
+		{ 1810500000UL, { 3304747, -179126, 3576 } }, \
+		{ 1912500000UL, { 3395401, -181606, 3576 } }, \
+		{          0UL, {       0,       0,    0 } }, \
+	}, \
+	.cpu_dfll_data = {      \
+		.tune0_low = 0x00b0039d,          \
+		.tune0_high = 0x00b0009d,         \
+		.tune1 = 0x0000001f,              \
+		.tune_high_min_millivolts = 1050, \
+	}
+
+static const struct cvb_table tegra114_cpu_cvb_tables[] = {
+	{
+		.speedo_id = 0,
+		.process_id = -1,
+		.min_millivolts = 1000,
+		.max_millivolts = 1250,
+		.speedo_scale = 100,
+		.voltage_scale = 100,
+		.entries = {
+			{  306000000UL, { 107330, -1569,   0 } },
+			{  408000000UL, { 111250, -1666,   0 } },
+			{  510000000UL, { 110000, -1460,   0 } },
+			{  612000000UL, { 117290, -1745,   0 } },
+			{  714000000UL, { 122700, -1910,   0 } },
+			{  816000000UL, { 125620, -1945,   0 } },
+			{  918000000UL, { 130560, -2076,   0 } },
+			{ 1020000000UL, { 137280, -2303,   0 } },
+			{ 1122000000UL, { 146440, -2660,   0 } },
+			{ 1224000000UL, { 152190, -2825,   0 } },
+			{ 1326000000UL, { 157520, -2953,   0 } },
+			{ 1428000000UL, { 166100, -3261,   0 } },
+			{ 1530000000UL, { 176410, -3647,   0 } },
+			{ 1632000000UL, { 189620, -4186,   0 } },
+			{ 1734000000UL, { 203190, -4725,   0 } },
+			{ 1836000000UL, { 222670, -5573,   0 } },
+			{ 1938000000UL, { 256210, -7165,   0 } },
+			{ 2040000000UL, { 250050, -6544,   0 } },
+			{          0UL, {      0,     0,   0 } },
+		},
+		.cpu_dfll_data = {
+			.tune0_low = 0x00b0019d,
+			.tune0_high = 0x00b0019d,
+			.tune1 = 0x0000001f,
+			.tune_high_min_millivolts = 1000,
+		}
+	},
+	{
+		.speedo_id = 1,
+		.process_id = -1,
+		T114_CPU_CVB_TABLE
+	},
+	{
+		.speedo_id = 2,
+		.process_id = -1,
+		T114_CPU_CVB_TABLE
+	},
+	{
+		.speedo_id = 3,
+		.process_id = -1,
+		T114_CPU_CVB_TABLE
+	},
+};
+
 /* Maximum CPU frequency, indexed by CPU speedo id */
 static const unsigned long tegra124_cpu_max_freq_table[] = {
 	[0] = 2014500000UL,
@@ -93,7 +186,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 	[10] = 1504500000UL,
 };
 
-#define CPU_CVB_TABLE \
+#define T210_CPU_CVB_TABLE \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -120,7 +213,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0,      0,   0 } }, \
 	}
 
-#define CPU_CVB_TABLE_XA \
+#define T210_CPU_CVB_TABLE_XA \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -143,7 +236,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0,      0,   0 } }, \
 	}
 
-#define CPU_CVB_TABLE_EUCM1 \
+#define T210_CPU_CVB_TABLE_EUCM1 \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -166,7 +259,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0, 0, 0 } }, \
 	}
 
-#define CPU_CVB_TABLE_EUCM2 \
+#define T210_CPU_CVB_TABLE_EUCM2 \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -188,7 +281,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0, 0, 0 } }, \
 	}
 
-#define CPU_CVB_TABLE_EUCM2_JOINT_RAIL \
+#define T210_CPU_CVB_TABLE_EUCM2_JOINT_RAIL \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -209,7 +302,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0, 0, 0 } }, \
 	}
 
-#define CPU_CVB_TABLE_ODN \
+#define T210_CPU_CVB_TABLE_ODN \
 	.speedo_scale = 100,	\
 	.voltage_scale = 1000,	\
 	.entries = {		\
@@ -238,7 +331,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 840,
 		.max_millivolts = 1120,
-		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
+		T210_CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -251,7 +344,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 840,
 		.max_millivolts = 1120,
-		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
+		T210_CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -264,7 +357,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 900,
 		.max_millivolts = 1162,
-		CPU_CVB_TABLE_EUCM2,
+		T210_CPU_CVB_TABLE_EUCM2,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -276,7 +369,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 900,
 		.max_millivolts = 1162,
-		CPU_CVB_TABLE_EUCM2,
+		T210_CPU_CVB_TABLE_EUCM2,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -288,7 +381,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 900,
 		.max_millivolts = 1195,
-		CPU_CVB_TABLE_EUCM2,
+		T210_CPU_CVB_TABLE_EUCM2,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -300,7 +393,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 900,
 		.max_millivolts = 1195,
-		CPU_CVB_TABLE_EUCM2,
+		T210_CPU_CVB_TABLE_EUCM2,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -312,7 +405,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 841,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE_EUCM1,
+		T210_CPU_CVB_TABLE_EUCM1,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -325,7 +418,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 841,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE_EUCM1,
+		T210_CPU_CVB_TABLE_EUCM1,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -338,7 +431,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 870,
 		.max_millivolts = 1150,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune1 = 0x20091d9,
@@ -349,7 +442,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 870,
 		.max_millivolts = 1150,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune1 = 0x25501d0,
@@ -360,7 +453,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 818,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -373,7 +466,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 818,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -386,7 +479,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = -1,
 		.min_millivolts = 918,
 		.max_millivolts = 1113,
-		CPU_CVB_TABLE_XA,
+		T210_CPU_CVB_TABLE_XA,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune1 = 0x17711BD,
@@ -397,7 +490,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 825,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE_ODN,
+		T210_CPU_CVB_TABLE_ODN,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -410,7 +503,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 825,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE_ODN,
+		T210_CPU_CVB_TABLE_ODN,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -423,7 +516,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 870,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune1 = 0x20091d9,
@@ -434,7 +527,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 870,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune1 = 0x25501d0,
@@ -445,7 +538,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 837,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -458,7 +551,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 837,
 		.max_millivolts = 1227,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -471,7 +564,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 0,
 		.min_millivolts = 850,
 		.max_millivolts = 1170,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -484,7 +577,7 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 		.process_id = 1,
 		.min_millivolts = 850,
 		.max_millivolts = 1170,
-		CPU_CVB_TABLE,
+		T210_CPU_CVB_TABLE,
 		.cpu_dfll_data = {
 			.tune0_low = 0xffead0ff,
 			.tune0_high = 0xffead0ff,
@@ -494,6 +587,13 @@ static struct cvb_table tegra210_cpu_cvb_tables[] = {
 	},
 };
 
+static const struct dfll_fcpu_data tegra114_dfll_fcpu_data = {
+	.cpu_max_freq_table = tegra114_cpu_max_freq_table,
+	.cpu_max_freq_table_size = ARRAY_SIZE(tegra114_cpu_max_freq_table),
+	.cpu_cvb_tables = tegra114_cpu_cvb_tables,
+	.cpu_cvb_tables_size = ARRAY_SIZE(tegra114_cpu_cvb_tables)
+};
+
 static const struct dfll_fcpu_data tegra124_dfll_fcpu_data = {
 	.cpu_max_freq_table = tegra124_cpu_max_freq_table,
 	.cpu_max_freq_table_size = ARRAY_SIZE(tegra124_cpu_max_freq_table),
@@ -509,6 +609,10 @@ static const struct dfll_fcpu_data tegra210_dfll_fcpu_data = {
 };
 
 static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
+	{
+		.compatible = "nvidia,tegra114-dfll",
+		.data = &tegra114_dfll_fcpu_data,
+	},
 	{
 		.compatible = "nvidia,tegra124-dfll",
 		.data = &tegra124_dfll_fcpu_data,
-- 
2.48.1

