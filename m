Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932935AC14
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jun 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781870223; cv=none; b=G5Eh0bk18iOWOPdEeIsAl6enJYOilNXYrvIOFPQQ/qSjjkUHSnb9+mJUZrLCU915M5keTI3e7L8nEbSWqSD8kLUKHWAgg25ebIMr6oo65s78/dWky6FflNahtblD2HmOV3xPpR/yITaTzpo23iNtPSEUE3FOKRnnHzt9rhSuwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781870223; c=relaxed/simple;
	bh=8Re1w0eS312suReq4vC8ktynZim/mtXhjhO5jp1GNRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJAaAxNmBQZYeIMJPQqLKUhiaT29uB4J5ye3bQLwmlmH/sp1byaArznuiSLMIEU6bt6rvvssfu5SESoPG+Ip007SnsakO2a3M3TpHfLp4v/kj1uIEeN5RSc7qeOlEGD23L2L6oojvnYGIVRHAE6SLIxmtdrarVO2c/7euJ9iQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xlzq+cFJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xlzq+cFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781870221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1MHA3WSG+EmdxC49RdeJjFk6tA5YD/wWphvr816RWw=;
	b=Xlzq+cFJ3a/8bNJqYg37k5iIEuNO8Hfza+TFSBAI1uVmqKMLrlxt4gzE+L/LOM+VCJcL2b
	B+P+nCiv0eGKGrsSYC0AGc9wgm87OjC8XXQYp8okwEzfWi5CQxmc4IuwuRzpoqkI7JwswU
	CgTZXiYWgXxgogKaYM6sS+S8dryqF2c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168--00ZuXx9Mj-Np4TZTpkL1g-1; Fri,
 19 Jun 2026 07:56:57 -0400
X-MC-Unique: -00ZuXx9Mj-Np4TZTpkL1g-1
X-Mimecast-MFC-AGG-ID: -00ZuXx9Mj-Np4TZTpkL1g_1781870216
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5DD51977520;
	Fri, 19 Jun 2026 11:56:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBC5E18005B6;
	Fri, 19 Jun 2026 11:56:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 19 Jun 2026 13:56:51 +0200
Message-ID: <20260619115651.167376-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added changes to files in include/soc/tegra/

 arch/arm/mach-tegra/reset.h  | 2 +-
 arch/arm/mach-tegra/sleep.h  | 2 +-
 include/soc/tegra/flowctrl.h | 4 ++--
 include/soc/tegra/fuse.h     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.h b/arch/arm/mach-tegra/reset.h
index 51265592cb1ae..92a89713d5e57 100644
--- a/arch/arm/mach-tegra/reset.h
+++ b/arch/arm/mach-tegra/reset.h
@@ -21,7 +21,7 @@
 
 #define RESET_DATA(x)	((TEGRA_RESET_##x)*4)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include "irammap.h"
 
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 4718a3cb45a16..e332d261c1dbd 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -38,7 +38,7 @@
 #define TEGRA_FLUSH_CACHE_LOUIS	0
 #define TEGRA_FLUSH_CACHE_ALL	1
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 /* waits until the microsecond counter (base) is > rn */
 .macro wait_until, rn, base, tmp
 	add	\rn, \rn, #1
diff --git a/include/soc/tegra/flowctrl.h b/include/soc/tegra/flowctrl.h
index 1aacc5c7a9dba..2a60bd4934c32 100644
--- a/include/soc/tegra/flowctrl.h
+++ b/include/soc/tegra/flowctrl.h
@@ -39,7 +39,7 @@
 #define TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP	(0xF << 4)
 #define TEGRA30_FLOW_CTRL_CSR_WFI_BITMAP	(0xF << 8)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #ifdef CONFIG_SOC_TEGRA_FLOWCTRL
 u32 flowctrl_read_cpu_csr(unsigned int cpuid);
 void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value);
@@ -67,5 +67,5 @@ static inline void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 {
 }
 #endif /* CONFIG_SOC_TEGRA_FLOWCTRL */
-#endif /* __ASSEMBLY */
+#endif /* __ASSEMBLER__ */
 #endif /* __SOC_TEGRA_FLOWCTRL_H__ */
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 8f421b9f7585c..c4f7a1b97c547 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -24,7 +24,7 @@
 #define TEGRA30_FUSE_SATA_CALIB	0x124
 #define TEGRA_FUSE_USB_CALIB_EXT_0 0x250
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
@@ -122,6 +122,6 @@ static inline int tegra194_miscreg_mask_serror(void)
 
 struct device *tegra_soc_device_register(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __SOC_TEGRA_FUSE_H__ */
-- 
2.54.0

