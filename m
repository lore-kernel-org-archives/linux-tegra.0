Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC0401A25
	for <linux-tegra@vger.kernel.org>; Sat, 17 Oct 2026 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219843; cv=none; b=FA/TVJ8zNj4BFdA0ZMQ/nVFgkdkLwOdmmljhToZG7bAYP37fUNEjnXJPU9k7Uvu2a/SHDQ7jui8scrP7Th3nf4UQKKJbmRAGupBAxQtu0cEuWuvs0Ov/UpAyifNRZYp57QHUz/sKkZslzbRvn2rW1ZCNTU2pqmUWE2opO6CdH54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219843; c=relaxed/simple;
	bh=WwNugc1mChyUIwd61uIuYKw8rawcpidRYTzrLbgdtzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M645tu/Za3DuXx+vwkOEslR7UQxgkeClGWssJYaz/a40JG4NKC2f1SJuPgs2Ho8JPVBfJzbMlsY5eMZe5/nxRKpPVY2Zi5iqvGP0i6nJGCdXjlxVAFWNIgkEDM7bEdjj0ibwskRot1iTBPVWgZrtV93nNB8mJyCqQ0Lo0p+KHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Au9vb/h5; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Au9vb/h5"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso880014eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Oct 2026 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792219840; x=1792824640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sawSoGb6Q0aMwk+GPR42ByjC7uK/8OA0+XJaAWB2Ug0=;
        b=Au9vb/h5/2YfW1JQFPzhaqWiVBANLrGe26L6wf+1jEWS+IN1HXmkpuI+grJSUPSmF7
         3ZsaPWNAxbpPYQ0ShnniFcDPDFjQggEmm6Y5zRq9nj72w420jFE7S0uMLFPF8As0BGzS
         K/c5El9qQmDJnxL/PQzAVvnKs8u5MkURAvNQsYGW6bDdZDN4F80rZyiFTPwdCJx7aFOw
         1KN8sZw+Ub+8uVxLlaF6A0zWM2skgbqMYLwCkRVtZuqwn2kuDkS7ZS8srRMMnPOSbESQ
         JPOSPFZ7hOfKbI7PxV8zH6uaOmO1ttsl6MRJo6+W8YFvqFChXysme4OTZTg6eUp+uloP
         ahEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792219840; x=1792824640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sawSoGb6Q0aMwk+GPR42ByjC7uK/8OA0+XJaAWB2Ug0=;
        b=KE/Ft/D+EOzMWeRBdlNL18NEWUrJmgTUBUNeMESty8eIRZuGEvuaz9/AiIUb+QmCXB
         ALv+bv5+kM1AZDmlDhSFdJ3nR76Ru+LttT1qfUB4OjVPcOP+ffyMLBeqQKCRmSRqizDT
         MDNbSXM8xN3rv4ytSIKTCWmvvvE0aNHwmIkauq8gTQxeOSM2z0UZ6dsbG/ZwJ2+Yv42M
         6e1MfavHdj+Kq1cMA0opf4cbFnrWqeyxdsDzR21SwvDEKX3gkQCfiRau82qSfhF0cFkc
         7SGsPR3Kf2hdQcvVG3nrI+CCraoBoPew3mAJR7b/z51HDJFtXj19+iqHvwa8BOPuuKnx
         XAKw==
X-Forwarded-Encrypted: i=1; AKwUvBxwjaN/Kzllkkk2iGsMHtqG6PKDHbPlrxqvhL3oskwT/Y7OTparZLIvkLEhSuSXdi1VLvx7ZN/G/j28gA==@vger.kernel.org
X-Gm-Message-State: AFq9FYImhur0U1cKuH6KSoIL4cb6FtPE57sQMRZziQTgjMC79iR+iNtn
	3IwFB2JgAD0v9p+KA+SEfK7xic9+g2Cf2+5yaxAJ4LEzD8VVFWe0tPRR
X-Gm-Gg: AYBFou1TZcTDYyaNYpPgWxdB1YovP4NdoFQ8Qd9bYQUSPjnuyXOpMEOREIX/iPLwPoa
	+ZNoT6UBrkaNY8DJgpA4q/l0dO73YFe9VnL4Sl8GHZHSsOn23KKmo1n2EnaTW2X72XXLMyqBvsi
	srN0sRnKV/kxXHr7Sdtrsa6iVsjBT6yvgNtft4/zIO5SluFqSryBCInW/8OVkIcaJ2/+5zAIGVT
	N6hFsNYl1IyP0UvzqXFsdx9Bvm5/iCG1PBL12YiHVMJCgMgQuwHTnYAJ34bXZgWXaA7iOEpyZeh
	t77r0dRbKsZFQZAc5mdwIZ5LtTwnze9CyVmOBjZNyC4f0QW+kJtA+Gfbg6qfLxrnF1pXGIzafVm
	88HhQCQBii8FyGqICAkwqsH41x8y3A1PoDPBEPlC6bDA2/KAkLvTfXLUOKICl2iNCLyUOCgFlSC
	LV3BMBCBE8DFHmmJVQMsx5Uqg2R8vMLjZo68eiqsqDrZAIICFwkySA9+g8vK5YdVeOQYyGDtPf2
	54ZTQGWhjK3CXqHjTzK7Iuw3q7PvyRizeWKvvg5FvmFXTbjPkJ1WOXBi64smJ6pjQeSqpcEGIg4
	ugAdUW0bOxL0/7JnG1z0Li+YJw==
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr2827792eec.24.1792219840075;
        Fri, 16 Oct 2026 23:50:40 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm13471690eec.8.2026.10.16.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 23:50:39 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: anrao@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Austin Schuh <austin.linux@gmail.com>
Subject: [PATCH] firmware: tegra: bpmp: populate debugfs in the background
Date: Fri, 16 Oct 2026 23:50:12 -0700
Message-ID: <20261017065012.3063980-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populating the BPMP debugfs mirror takes a series of synchronous BPMP
requests, several per directory.  On an Orin Nano (Tegra234) the tree has
about 10,800 entries, and the BPMP probe doesn't return for over five
seconds.  Every device that gets its clocks, resets or power domains from
the BPMP waits for it, which on Tegra234 is nearly all of them, so PCIe,
NVMe and the root filesystem all come up five seconds late.

Commit c7fc690da6f1 ("firmware: tegra: bpmp: Allow BPMP debugfs population
to be skipped") lets a system that doesn't need the mirror turn it off with
tegra_bpmp.debugfs=0.  A system that does use it, for instance to set
clocks from userspace at boot, still pays the full cost.

Nothing in the kernel uses the mirror, and the probe already only logs an
error from it, so populate it from a workqueue instead.  It isn't an
async_schedule() job, since kernel_init() waits for all of those before it
starts init.  Userspace that reads the mirror right after boot may find it
still being filled in.

Measured with initcall_debug on an Orin Nano running 6.18.39 with
NVIDIA's patches: the BPMP probe returns after 1.2 seconds instead of
6.36 seconds.

Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---

Notes:
    Based on tegra/for-7.4/firmware (1bbcf4a19f14).  Built for arm64, W=1,
    no new warnings.  The timing is from the same change on 6.18.39 with
    NVIDIA's patches (where the probe also has the VDK check), which is what
    our board runs; I haven't booted this branch on it.

 drivers/firmware/tegra/bpmp.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index d3508e98e338..535ebbd55a6f 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -16,6 +16,7 @@
 #include <linux/semaphore.h>
 #include <linux/sched/clock.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include <soc/tegra/bpmp.h>
 #include <soc/tegra/bpmp-abi.h>
@@ -1052,8 +1053,26 @@ int tegra_bpmp_init_dt_providers(struct tegra_bpmp *bpmp)
 	return 0;
 }
 
+struct tegra_bpmp_debugfs_work {
+	struct work_struct work;
+	struct tegra_bpmp *bpmp;
+};
+
+static void tegra_bpmp_debugfs_work_fn(struct work_struct *work)
+{
+	struct tegra_bpmp_debugfs_work *dw =
+		container_of(work, struct tegra_bpmp_debugfs_work, work);
+	int err;
+
+	err = tegra_bpmp_init_debugfs(dw->bpmp);
+	if (err < 0)
+		dev_err(dw->bpmp->dev, "debugfs initialization failed: %d\n",
+			err);
+}
+
 static int tegra_bpmp_probe(struct platform_device *pdev)
 {
+	struct tegra_bpmp_debugfs_work *debugfs_work;
 	struct tegra_bpmp *bpmp;
 	char tag[TAG_SZ];
 	int err;
@@ -1089,9 +1108,19 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (err < 0)
 		dev_err(&pdev->dev, "failed to initialize sysfs: %d\n", err);
 
-	err = tegra_bpmp_init_debugfs(bpmp);
-	if (err < 0)
-		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
+	/*
+	 * Mirroring the BPMP's debugfs tree takes several requests per
+	 * directory, which on Tegra234 adds up to seconds.  Nothing else
+	 * waits for it, so do it in the background rather than hold up every
+	 * device that depends on the BPMP.
+	 */
+	debugfs_work = devm_kzalloc(&pdev->dev, sizeof(*debugfs_work),
+				    GFP_KERNEL);
+	if (debugfs_work) {
+		debugfs_work->bpmp = bpmp;
+		INIT_WORK(&debugfs_work->work, tegra_bpmp_debugfs_work_fn);
+		queue_work(system_dfl_long_wq, &debugfs_work->work);
+	}
 
 	return 0;
 

base-commit: 1bbcf4a19f1495f769b69e9569d8c1e81df074f5
-- 
2.47.3

