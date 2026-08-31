Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6963BE652
	for <linux-tegra@vger.kernel.org>; Mon, 31 Aug 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161437; cv=none; b=AFCy0ZG9L78yQ4a1n99pepm87AFkQ1/5zVBoxgEBdrCUI9AOQ1V93iEC6lws/3FMyHCyC0I7UQbfsfR0t56t80FgSHZFGpJDG6U7HPjz/0xAvJtbayIGrY2tJdoUXkGwG9CNr6NK24UKDCcdtJKd+YVzIRuYj5mB2mxq+VTAbSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161437; c=relaxed/simple;
	bh=2B1kl82sYmAxF1gcvXNtWp/v9p548DwYxTPqP/ibams=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4ahce7XJJpv7m6SRta3quUtmEVaVV/evP75xM5eONmDYeqhcXpg2jeWPDP+4WosYmcWesr8ALii5s7ZanfBRh2Dq4B4ONPrV+9Kb28eQqLueKUidRCSgKWOVqH29aOBoJrLXYujJWlb8XVd80Wfh1l1GBjyQadIxTEY+VX8DOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so11209695ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 31 Aug 2026 00:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161434; x=1788766234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cm/3LxFAE23VmmspdwwF2dVngvqHxTwL+4Y3pEVCqwE=;
        b=K8PLhdZFhATHUv2hoxnqAjJeSTD82aoZgm4xPWD60s8QGsjnA8EcJDhITHz62Kn7x3
         nPtgswlcH3hPGt5XkXQin9pE8ha83Orzpzti2eyAMsQP8mrQa01BH5Wl4hmc80qCzDwD
         3pDMcJVCptOGwXZGyqvj8rAYadAJ6s9ov6GUIuAuLT0MAHdRZyZdIeFu/nF/oEh0m817
         2EYixA1VBfxu1QHQd77YQK+l006nNSwJBh5o1neiM/IzEEGv2EyJOulSggrgeT0ftp0z
         uu1QL9sMY5IZxKF5+7IGMxsq+j4xWECuWCVaALxz65RIbp8dJORe0LauA5BcKl/IGTab
         GSyw==
X-Forwarded-Encrypted: i=1; AKwUvBz5SnjUE2ZkI5xP0d6PMdhlYzuKN1PC0DpsZMcAgVy2rYWY3qQ1byquuLuoclMYfag0HJIyo2whvw1isg==@vger.kernel.org
X-Gm-Message-State: AFuF++l9QP9Qe9yDRusnswUswAyDaIZOc/5I3SIbs4+/VVrB2iLZOEj9
	pDwBwBemNIotq59wfsWKFqcawOvRpiRBO2SAKrQmU+yl1VgCxJthoWx6
X-Gm-Gg: AR+sD13/P0EeoDOWeL78fOmvv5uL71LAHLlNQ2ANDTdl5C2a2oF4AveZiMCV0IVCV/4
	yyccGWM8nJtBBVFkd2r+LM3XWAcmNh26r734TwGbE2nCEE/JCmwi5YkB98Ol0VR/44KNWB0pFfs
	Us7hRcTPJp6oLbgw4R9AYZR9OR4tmvaEx0TP5TXw4omuvLcUrRu9OWQd9a7dWnlcCSKWGsHSkDf
	egI+IbEUXx07DJLXdf/OTJy3leb05+yfz6mPs6i0U2kkv7ma07kYgrpq98qS4BGf7c3OQrC/VCk
	LVleZjF8IdjlcIcwJ2OENtDmoFUePP6ClS0O6gA9ZloPN6nbMd5g8BD3PZFYsPVOcmhMAK1m+Wz
	0zqHrZaYbyuuF7oxlr62yPsypYmrhjVM7kMrg78p6cPhAVRmUY7oimOWrMNdaPLhb/oQ8DrffSq
	QFHdkJYNWGnyot6w/RdZXgEatXQuW0USxrlmhrXGkADT+DTKivyTxP98MMco3vRnd2nvwyyj0Tr
	VoW3sZk7N0l3hHYxIP8XA==
X-Received: by 2002:a17:903:3244:b0:2d8:d4cd:dc90 with SMTP id d9443c01a7336-2d8d4cddf8bmr245815485ad.19.1788161433689;
        Mon, 31 Aug 2026 00:30:33 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988d184sm30107865ad.62.2026.08.31.00.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:30:33 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: sumitg@nvidia.com,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpufreq: tegra194: fix double-pointer error in get_cpu_ndiv
Date: Mon, 31 Aug 2026 15:30:08 +0800
Message-ID: <20260831073009.3772408-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ndiv is already a u64 pointer, passing &ndiv to smp_call_function_single()
results in a u64** being written to instead of the caller's u64 variable,
so the caller always reads back an uninitialized ndiv.  Drop the spurious
'&'.

Fixes: 0839ed1fd7ac ("cpufreq: tegra194: add soc data to support multiple soc")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/tegra194-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index c6375e14d445..1eb96e9f3310 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -367,7 +367,7 @@ static void tegra194_get_cpu_ndiv_sysreg(void *ndiv)
 
 static int tegra194_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
 {
-	return smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, &ndiv, true);
+	return smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, ndiv, true);
 }
 
 static void tegra194_set_cpu_ndiv_sysreg(void *data)
-- 
2.43.0

