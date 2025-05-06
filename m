Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE6281508;
	Tue,  6 May 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538310; cv=none; b=kf82Ix+WbbhDpT2OtAxoOmrMd/ZhTLn78Ngh/z6BM4rO/PsQqL/8sv7WrDMpgQS2CMCQPGzsik+yOtCSIFiSNpDFf71Jwwiaq6xdcCi9U1wOj/j71xX5fB5inMTftTFvIlIQnmH7F7ihhwXmqnxwoambrk/kARmr+6eaoEGZ09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538310; c=relaxed/simple;
	bh=k0CuVeDsApxggQmtHpKaBVAjgMPqfAd6uUYYyldJ2pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plLAnrY9sA+I4bLo4tLcDs2Yn5FwaFKsC0zbai93rgKKmyAdr06BlIlUBkVy94IQguYjGVCqGUcxZqqjJKdG6/hOJ9LKSjkViLkINmZfOYzOwLNcOEP/jfwRzqkSqv+xSyFmN3ewlC0sdiXOMei/C6qyCsmdF+hHSkK5k6kmdic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPVMuUg2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPVMuUg2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so25052245e9.2;
        Tue, 06 May 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538307; x=1747143107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jxbZ035QFkq21lpMHfGFtYoYGFOwjubRluiFPGrGTY=;
        b=JPVMuUg2kT4IlljQ3oENIkrALl8LaZI036ybg3A3aVNVkNLVYwNb3fVinlRbtksxsT
         zD1FP+LnplNBlmsqn8fMx77V8M4UV1dsOg7EsUC07s+9MMGTsQWzFuYSlGJ1alZGPvs+
         7LKEeAO8mNOE5s/TFlzPbcAe7r+nbnqdz1QAWHXcV7+Jdo9o6MUx5WUcAyxw+0IY2i8V
         rSgcC9LugcV/dkXTlEqHc3oPaLyEoVBeMHtRKCyNM2lNrQx2P51NxvalxA/MmtCJfcQH
         edLz+ekaWRbqPCetS3931onuR0+fYXa633H+HrgXjbYIW1zPkgace4gCEsRay50LK7Cx
         zR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538307; x=1747143107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jxbZ035QFkq21lpMHfGFtYoYGFOwjubRluiFPGrGTY=;
        b=BS9Z3UclLtiRjKMxIG3RqcQiQqUOLFCZkf+Ntd+SX64f2AqIPrjX4fQDyvXxxpAKdn
         mzofbklTX8aHH8cKQgF6SFa8ja0D1r2gWe5AIbyTmRsJtFCakeyBdOyhnrPuRp/ZHrok
         8ar8N5w0xBP4Dl2FWceYmm+tT9qonhCDmEO6srBDdBco7Zb2gaOC1QROYCU/+OaYpMz+
         yrLG0WBDQbPNff+0eH05VcL3/PGCOcvPti2OqiEpn+gSw/ZuPLyvmJ2WbCNaVzttWwTQ
         8nGjVyjLgpFbDQE1HkWeyDGEoQVkKKIl4NCCjQuO7w2KvqcDkASleuSA5wYnBwJbfms9
         Vnqw==
X-Forwarded-Encrypted: i=1; AJvYcCURHTzvHA9pemk7d57wZaZAjU/No4Df05gE3OBJsfBL7/OcYuXWdWL3kBdj0PDoEsbZQx1Kf7mIWzyw@vger.kernel.org, AJvYcCWMUYWJFMGmg5QOpBMwF+MlqG3EShOYjgdCVztbvG/VmdIi/9qFtHVRN0+6mmuEXV5YowE1p2j0JltL+kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wFFGR0hMZggG+cT86Xz+dJqWVGm2gBjLGyPbxflcPc1kCxuX
	qseRvLYxJabvtTweduGGAmmhtHW5q5tA+y2fW9iml+yct1fv1uFrEGqiZg==
X-Gm-Gg: ASbGncvW2warHoMUV7GqUEDhMDEzH5g1W1+2dEycOScWJ2TQNjEOFLFjbXiWn0G0Oc6
	Duwone/RzgND9pEENdRprId4/SOKJUa1KkVs4eGraPzaxOqyvvYQwmsHmA7JfW2WycIj7eN947M
	JFE92iWdjOWQ9/1r/NJUXbz2TyR2PbVi/eJXIWMPpfw9K5KS7oWKtmZErz5WjIXyAMbnSeMRWXn
	51aZGoIshcTauFyok73uqcR5aNXCFSZtbjqcQ79nhpJo8GS+Bq4Caydke74T1qcASsW8XIcEcc9
	g1qh+8kBOYNe2hCDTINTxeE2vanWkUTTtgt91qThoX2I11nswxZzKR3pl7PDodHe85L4ZdDDtrY
	agwKNfW+Pa5DNEEmNcW32dCF8rYl1R4kP
X-Google-Smtp-Source: AGHT+IEvZa9BdGXkFT5zzPGwBPqXPa2EzOboT5eW1NmG8nWLxf29uTsrdNSthXrYCAxweDBMMj3blg==
X-Received: by 2002:a05:600c:821b:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-441d0fd2cf7mr28337405e9.19.1746538307016;
        Tue, 06 May 2025 06:31:47 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad76a2sm215973025e9.6.2025.05.06.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/11] firmware: tegra: bpmp: Add support on Tegra264
Date: Tue,  6 May 2025 15:31:17 +0200
Message-ID: <20250506133118.1011777-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Support for Tegra264 depends on the Tegra186 support, so make sure the
latter is enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index c3a1dc344961..e74bba7ccc44 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -836,7 +836,8 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
@@ -884,7 +885,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.49.0

