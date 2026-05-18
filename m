Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B032470E;
	Mon, 18 May 2026 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099616; cv=none; b=ubzbyKJrBk+tr8g65znXwDAJMPhzjuxeVMe4o+3ETaxLhz+ArOE93j7mmr7S+2NQXvLOluTKhHyuiyAdHfeRKOZcnANO6FM7sfMSJVQQ7Wt9YcbxuFJEmHFDi/xV3bGkw2j0dwPF3nL66s22tYGr3960chx+lWbIRxsrQm0Rp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099616; c=relaxed/simple;
	bh=lnmr+Tsr/Pi3mBRQX9k33KTQHyV3H2FAwHmofyYMs7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqZDjWEw8de23t0RQL9ru5dUnDdREGuM63BK3uwOfCtBNKqEdUpsPLS8i6dIBggPMoZC/nNQzt49ig6Xq2mXPHdNDPvAN0bcbmuwXK+qrG1Khv4vCOP70YijFHKiX6hNGnAMQkuYGha7dbHO1MKBEt9cmIKkFQcDASaXJvOzB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=L0efM9Xg; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="L0efM9Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099613; x=1810635613;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=dyx/WAd/4hjOcMcsJmCxGjIgR8e2a5jk1JUwFrJZSao=;
  b=L0efM9XgRixXcbt/6b3LVqSnMGrTsEpaDjthjvw20UWUNo/aPPILw5Bw
   cDgwxXTtkPsTHp2H0MobU54Ystd7pN4X0yrX/sD0KgP5mr18cVQ9VgDEe
   XKQnrD0+2ohYIEedjdmfLMDOZg35OkidZnHQ0gjIfsXKIq++TPPrSTaG2
   VBDwUUqgOKGPYlKI0xsUHVpSh+ZCtfeHcBi75QAoGmJyGXKVBNbx2Mu1I
   wYNpPryP/s3+5GVb6IDVWhrgcQUX6v1yeVEcVzjHUXLWnLff+Z8crfXD8
   N7slbHiVCrTHRzqeFQaohgnCtT60ZKBJmzpu1KBDJqf7Xk2sFcF76xNyh
   A==;
X-CSE-ConnectionGUID: yO9V46fRRc+PhGmlKW9uLQ==
X-CSE-MsgGUID: qAL+DhRaSoOBHbKOGlzjRQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:05 +0900
X-CSE-ConnectionGUID: XQMiEi2RTcWpArWyYri4mg==
X-CSE-MsgGUID: VrHP121bRvWEDxjNnwRL5g==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041672"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:05 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:19:59 +0900
Subject: [PATCH v5 3/4] coresight: pass THIS_MODULE implicitly through a
 macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-3-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=8553;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=lnmr+Tsr/Pi3mBRQX9k33KTQHyV3H2FAwHmofyYMs7Q=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xeL6j6mXzyT/uGF70aDo31uxSyL06W1tC23mtqIz
 HF4bne5o5SFQYyLQVZMkaVUqfrX3hVBS3rOvFaEmcPKBDKEgYtTACYiwcTI0Kt24U3Bli+PBDzu
 vaxdf7+6Ick61OyqYMXqfRpLkqoTShn+ux7vjjhvIrh925kNh5vO88i5vRRa57VuMcu+FRlTLsv
 YcQMA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Rename coresight_init_driver() to coresight_init_driver_with_owner() and replace
it with a macro wrapper that passes THIS_MODULE implicitly. This is in line with
what other buses do.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Patch 4 depends on this patch
---
 drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 6 +++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 3 +--
 drivers/hwtracing/coresight/coresight-funnel.c     | 3 +--
 drivers/hwtracing/coresight/coresight-replicator.c | 3 +--
 drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       | 3 +--
 drivers/hwtracing/coresight/coresight-tpiu.c       | 2 +-
 include/linux/coresight.h                          | 6 ++++--
 11 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ce71dcddfca2..0c8698c8fc5e 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -706,7 +706,7 @@ static int __init catu_init(void)
 {
 	int ret;
 
-	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver, THIS_MODULE);
+	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver);
 	tmc_etr_set_catu_ops(&etr_catu_buf_ops);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..54ad5193b850 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1694,8 +1694,8 @@ static void __exit coresight_exit(void)
 module_init(coresight_init);
 module_exit(coresight_exit);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv, struct module *owner)
+int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
+				     struct platform_driver *pdev_drv, struct module *owner)
 {
 	int ret;
 
@@ -1713,7 +1713,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 	amba_driver_unregister(amba_drv);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(coresight_init_driver);
+EXPORT_SYMBOL_GPL(coresight_init_driver_with_owner);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 629614278e46..3a806c1d50ea 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -757,8 +757,7 @@ static struct platform_driver debug_platform_driver = {
 
 static int __init debug_init(void)
 {
-	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver);
 }
 
 static void __exit debug_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3f56ceccd8c9..0abc11f0690c 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -412,8 +412,7 @@ static struct amba_driver dynamic_funnel_driver = {
 
 static int __init funnel_init(void)
 {
-	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver);
 }
 
 static void __exit funnel_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 07fc04f53b88..2f382de357ee 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -418,8 +418,7 @@ static struct amba_driver dynamic_replicator_driver = {
 
 static int __init replicator_init(void)
 {
-	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver);
 }
 
 static void __exit replicator_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index aca6cec7885a..4e860519a73f 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1050,7 +1050,7 @@ static struct platform_driver stm_platform_driver = {
 
 static int __init stm_init(void)
 {
-	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver, THIS_MODULE);
+	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver);
 }
 
 static void __exit stm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bc5a133ada3e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -1046,7 +1046,7 @@ static struct platform_driver tmc_platform_driver = {
 
 static int __init tmc_init(void)
 {
-	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
 }
 
 static void __exit tmc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 96a25877b824..9e8de4323d28 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -344,7 +344,7 @@ static struct platform_driver itnoc_driver = {
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
 }
 
 static void __exit tnoc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index eaf7210af648..8464edbba2d4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1563,8 +1563,7 @@ static struct platform_driver static_tpdm_driver = {
 
 static int __init tpdm_init(void)
 {
-	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver);
 }
 
 static void __exit tpdm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b8560b140e0f..7b029d2eb389 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -310,7 +310,7 @@ static struct platform_driver tpiu_platform_driver = {
 
 static int __init tpiu_init(void)
 {
-	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver);
 }
 
 static void __exit tpiu_exit(void)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2131febebee9..cd8fb47a1192 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -691,8 +691,10 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   enum coresight_dev_type type,
 			   union coresight_dev_subtype subtype);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv, struct module *owner);
+int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
+				     struct platform_driver *pdev_drv, struct module *owner);
+#define coresight_init_driver(drv, amba_drv, pdev_drv) \
+	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE)
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);

-- 
2.43.0

