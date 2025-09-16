Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08F1DF261
	for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026516; cv=none; b=TCwQvfzwloQ6P274iI/VCRnG+9pgQm8KgvGyJlzCnPpwjmHURYt64pq+CvhBIrMobuY8aHtUHa8KjCUAt7hILg8OCz42ZTJxNdTuWWJC11GZDOM1S3K1/Wc78Fn3CM8bDZXhM3AVolVGpnRy8DQleHmEQZwVGVLRploabQJAw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026516; c=relaxed/simple;
	bh=xV6c4xU+fLhW9GO5Uf+hdtT9Gy4K5wxlXEfxI6H2CKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ut8HzmB07OWPf6NCPnJDKTt6GQ+EvTBiKN3EYvEi8/IBPSzWt3G6nGsIC6jme15FLGBvtIi37lIsG4GkPauGNUrqAqc9DD36rKHWjzLzPKwlsWFC6WgbceK8FtlKMlqkCj67oWULAVSqFQPMWiPSX+I04Z2HVcRd4RnN0UdPbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p1BHP+kF; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p1BHP+kF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758026511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPCT1+TcCxAxBd09Xa6o7zuOImvO2FpODExXiYxCmOw=;
	b=p1BHP+kFWiRNGPEZuCadMZQDTJ9B6l+VcKizdydVaak8Mo7dRFDvV1i4/H88/8aljzECUV
	hhZ/FaeGwBe3lqoApCLVQGDkCMODzWeV+ud1mZ8F8Lc56UtcgEUfUcWMnXwLlF755EwaBq
	X/Cb1cywqKnWDOyZ2uv2yILieL0bjZs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PM / devfreq: tegra30: use min to simplify actmon_cpu_to_emc_rate
Date: Tue, 16 Sep 2025 14:40:58 +0200
Message-ID: <20250916124059.2489125-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to improve the readability of actmon_cpu_to_emc_rate() and
remove any unnecessary curly braces.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/devfreq/tegra30-devfreq.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 890990e03335..a4041b9d0052 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -326,14 +327,9 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
 	unsigned int i;
 	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
 
-	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
-		if (cpu_freq >= ratio->cpu_freq) {
-			if (ratio->emc_freq >= tegra->max_freq)
-				return tegra->max_freq;
-			else
-				return ratio->emc_freq;
-		}
-	}
+	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++)
+		if (cpu_freq >= ratio->cpu_freq)
+			return min(ratio->emc_freq, tegra->max_freq);
 
 	return 0;
 }
-- 
2.51.0

