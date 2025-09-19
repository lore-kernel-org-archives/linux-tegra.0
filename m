Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB225CC40
	for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302472; cv=none; b=ixdWNB6tLLtxQsm+93tz/Sb3stP/zNltWCdslLaWLdSWmyaoXpN0vCLSKfzggJ0srw3+8oiCq00PaFgN7u9WfYY7WEq8jtWYwMiwdR3n/XAZd8emfAp8cHzc1H2O4yA+cgtT9AdSOt87tubDfduSdDET9mNJqjeGDHZqXtw4/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302472; c=relaxed/simple;
	bh=BnykSKnbxL/JbVG4C2eSeMxrGBCa+WojSF98CVVbJBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oualkSJhFCs1uPLwZhfl/Mw07B+uoN1OwY+J+xpCSvOKsSMZa0Mua5gl6f3rbcdc4WWe4FBy0Odj5SWe/ptWionjsoyw56CC/HO8Sgw4YstGme/9FHZFEkmL2squ6AwqQM8fekLZWQgIe6hs8Xr1MH8Rd3MdYK4oVyOJa7KOm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwscmKcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwscmKcX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEl91N021413
	for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 17:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kxVNKbUzAJV99X9dS/+gmi
	7NdsiUJfq4YgJmO8sKUp8=; b=NwscmKcX9Orgtckc3FVnSWRjrXacPIID7ZzxjZ
	joPpAUIMdp3ncl716dr+7KTk42qi2JQxSEBiLvDYg1GRN2sShViQeFIqDB/BJmCN
	0r0CjcP+D0JRpU9cgJID96xMaoE9+szUT6VI+wXXZ2Gu5Q13pDYpblPHK0C2/wKF
	WtUyVV7d0CxVKy1U2swytQHj6lMhsfrY3DbPvpf4g28PKQ/BBdRaB/rkjf4x68eh
	T+M7mXxwxsGxemlqFOuaJ8F2k6JVO200kkeLm/HyZlQSc4Zry36Fq/wEVoqZ9UeS
	f9J1CCaibeUIYdryqo8zPVL00QbNM2q3mQ6XljdmlM3JiGkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5k97q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 17:21:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4bf85835856so37803901cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302469; x=1758907269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxVNKbUzAJV99X9dS/+gmi7NdsiUJfq4YgJmO8sKUp8=;
        b=Sun7CsvE7K4Ki43AE7p178lrQj0mhnsbK4L4nVyeBcYipSjdE35GtJUNtxg2szvYHR
         s05+/0kmnJp+MQVcqgnCg3BcABJ5e5spuiuOB+b9rjJleXfWDS9iusVuieE5FLRAmwFw
         S+OHZAvrjWBHdcmRd4/GuLl2FsF1olCIcY6K0i799NWthzc8IFmCspwn6yCm1uS2+Z83
         8QG/FAuGjNIV5ReoT/wjgqfduhV2eQqRLH5JghiabwlBpwTD9bGd8aYPCGi3YJRfKQ3p
         2Ufc8zJIX2PFDcrXoDi4AVMDms+s3zdHdQRxTXq4xjeKAzihjcf7fVGt5j4ytgRCCZW/
         4lEg==
X-Forwarded-Encrypted: i=1; AJvYcCUy+LpyqS8Hir6nITumy7yE8j4GNFUoMOcPv3ZPZGivUt/5mEc9UfylyCnDMpSlXZnzy5PLMmYPwL6Zgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3dTZAHFH8qZtGXmp3407tB4dmNZJZpcpPARWQDj4ULXRBms/M
	+gU9h7yTUZ4X3Er6JNQE1V1n6MSibhMua1Rq7OUPcucc/VdFywP4OCVPMTgu2FryGolV2MbG1nY
	v3yKLSbSLTrH2aJ2+tVMozjPUOQ8CU1X1Pa4ZqCld2sIn1X8Udo0qPvOX+Qmp6GoE1Q==
X-Gm-Gg: ASbGncv5ngdNuZtL4+cMGfHiyAKcUa1bAXTG5wGVmWIW7mz3R4ZshF+mRRgqRF5Xm1S
	cm7AkcOIQv9C/D6q5Zt1BcMGyY7fz2w+0l6/tU5d+li+fS4gu1BnGmaTDsPcPRB/3F5uXYQppft
	qUXTEdMN24qN3LRk6EsVT/R6nViozg8EhOzBOv/lWeLT+wRhuxuEu8csVSXnAWQJtGQzmdfftqm
	N7iEThofbdNinUY4e+svkjmmqx+puTixDET8nZ9/Fa+99L+7SA/f6s/nz8J/qxLPf14vZI/aDFL
	TXz0tJxgUPUxkaBCw2e/Grxhqyb+mT0QkzrwdLeieQrDxikTwgqH/+e+HJ1RBd3RpxQ1WWETjKc
	NYtsmNmsUGYDW2Qk/uGfn6wXu0iRe0lc7Df6D8jWuFA+Vimz+je5R
X-Received: by 2002:a05:622a:a6c4:b0:4b7:ad70:238b with SMTP id d75a77b69052e-4bfb25ec815mr60645681cf.32.1758302466988;
        Fri, 19 Sep 2025 10:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4d98CBOBqf2FaOXuHvtl4BnNL0RixaCIYvrS+wV5YsTKL6WDAJme6mX7DEYtUHRmlOxiN0Q==
X-Received: by 2002:a05:622a:a6c4:b0:4b7:ad70:238b with SMTP id d75a77b69052e-4bfb25ec815mr60645051cf.32.1758302466296;
        Fri, 19 Sep 2025 10:21:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a25d7309sm13737241fa.15.2025.09.19.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:21:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 20:21:00 +0300
Subject: [PATCH v2] devfreq: move governor.h to a public header location
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-governor-public-v2-1-37e117ac0060@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPuQzWgC/3WNQQqDMBBFryKzbiRJKyRd9R7FRUyiDqjRpIYWy
 d07dV9mGHgf5v0Dko/oE9yrA6LPmDAsBPJSgR3NMniGjhgklw3X/MqGkH1cQmTr3k1omdPW3YR
 WvWoU0NcafY/v0/hsiUdMrxA/Z0EWv/S/KwtGI4TpnNKG9hFSqrfdTDbMc00H2lLKF/ZLUTi1A
 AAA
X-Change-ID: 20250903-governor-public-d9cd4198f858
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robie Basak <robibasa@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8969;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BnykSKnbxL/JbVG4C2eSeMxrGBCa+WojSF98CVVbJBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBozZEBhVKPQ9g1zZIP+co09QhudTAVGqHOjB+NN
 9PiH3VUg46JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM2RAQAKCRCLPIo+Aiko
 1a4CB/9vza4es6gtD0/SDV0ZoohF521+lQIW3hMvrnTfXYtedHzj3OMGwBiAEZphEQQbXgJEx63
 nYimJfZnGaxTlCZb3UZE6GasGwC8kVdPAQrYjoBzW/cZzTeQXbooxkU641RwJJDjZ37kAk+5/1N
 w3TWJkiDMMM1wIWhyseicx9WjRHi9SGKAKJNwe14kBAGEMfNVG6zjDrgLNoDrwLnBq6rjGE/fnw
 FlvHOSGsdA8D66U7/ix25D4CaNg8W/HjkPxlso9R/qkLv4BIULtj4w+nWo7NKoMR4CSUWgFJjJ6
 ojfuwFkoU0WC8fwg5e64128fHVLN+aKLYjjnuRSD4+R2qMuR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6fXTKMOmTg-IXGe8YICxZ6HI2lI0METs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX68b37Tp7pwOe
 UNfcrNcRKmzepszsp2bpKItn/VoS8eKv57ga2382+w41f/3fMANOI7JQGwMsr2gCdbY4Rz+cZ6h
 6RMOkVVTRmgpI85VhiQocoAtaFqq/mFRHT+v2lOhHLQUmlTU8v2gUmCKT9HRreWaPPaHb9KCUJ6
 BIHyh7N+MCxbzDKrP6C8AGW54MZW9ft8U6w4UdifAC9w6oydWs7Pa18g7RS0Jmj10MRayrzRzGd
 pwzmbJqZDAMhdG3up4zDO2MysdpcyWkSQ01Hq1ttdqE+GzZ8rsKiATaKKrWTqpB5cN3AfcxUIeb
 3O+ZVPpkkgkD516qqdt0JHMsI9uls/Xlrs4zJTb3aJ82i/oyZBYyixcE+sKI/lk1vB5fUCMumTZ
 RqCid+f1
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cd9105 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8
 a=hD80L64hAAAA:8 a=rlKpfLgfwYsX6qVZeg8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6fXTKMOmTg-IXGe8YICxZ6HI2lI0METs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Some device drivers (and out-of-tree modules) might want to define
device-specific device governors. Rather than restricting all of them to
be a part of drivers/devfreq/ (which is not possible for out-of-tree
drivers anyway) move governor.h to include/linux/devfreq-governor.h and
update all drivers to use it.

The devfreq_cpu_data is only used internally, by the passive governor,
so it is moved to the driver source rather than being a part of the
public interface.

Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed typo in commit subject (Mikko Perttunen)
- Link to v1: https://lore.kernel.org/r/20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com
---
 drivers/devfreq/devfreq.c                          |  2 +-
 drivers/devfreq/governor_passive.c                 | 27 +++++++++++++++++-
 drivers/devfreq/governor_performance.c             |  2 +-
 drivers/devfreq/governor_powersave.c               |  2 +-
 drivers/devfreq/governor_simpleondemand.c          |  2 +-
 drivers/devfreq/governor_userspace.c               |  2 +-
 drivers/devfreq/hisi_uncore_freq.c                 |  3 +-
 drivers/devfreq/tegra30-devfreq.c                  |  3 +-
 .../governor.h => include/linux/devfreq-governor.h | 33 +++-------------------
 9 files changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2e8d01d47f6996a634a8ad5ddf20c5a68d1a299d..00979f2e0e276a05ee073dcf5cd8e930bdd539fb 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -20,6 +20,7 @@
 #include <linux/stat.h>
 #include <linux/pm_opp.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/workqueue.h>
 #include <linux/platform_device.h>
 #include <linux/list.h>
@@ -28,7 +29,6 @@
 #include <linux/of.h>
 #include <linux/pm_qos.h>
 #include <linux/units.h>
-#include "governor.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/devfreq.h>
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index 953cf9a1e9f7f93804cc889db38883bf97ae005d..8cd6f9a59f6422ccd138ff4b264dc8a547ad574f 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -14,8 +14,33 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/units.h>
-#include "governor.h"
+
+/**
+ * struct devfreq_cpu_data - Hold the per-cpu data
+ * @node:	list node
+ * @dev:	reference to cpu device.
+ * @first_cpu:	the cpumask of the first cpu of a policy.
+ * @opp_table:	reference to cpu opp table.
+ * @cur_freq:	the current frequency of the cpu.
+ * @min_freq:	the min frequency of the cpu.
+ * @max_freq:	the max frequency of the cpu.
+ *
+ * This structure stores the required cpu_data of a cpu.
+ * This is auto-populated by the governor.
+ */
+struct devfreq_cpu_data {
+	struct list_head node;
+
+	struct device *dev;
+	unsigned int first_cpu;
+
+	struct opp_table *opp_table;
+	unsigned int cur_freq;
+	unsigned int min_freq;
+	unsigned int max_freq;
+};
 
 static struct devfreq_cpu_data *
 get_parent_cpu_data(struct devfreq_passive_data *p_data,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index 2e4e981446fa8ea39f65b09dddff198c0b8e3338..fdb22bf512cf134d75f1eaf3edb80e562dd28bec 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -7,8 +7,8 @@
  */
 
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/module.h>
-#include "governor.h"
 
 static int devfreq_performance_func(struct devfreq *df,
 				    unsigned long *freq)
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index f059e881480465b051f27d740348adaf779aebf0..ee2d6ec8a512248f070b2c5bee8146320b7be312 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -7,8 +7,8 @@
  */
 
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/module.h>
-#include "governor.h"
 
 static int devfreq_powersave_func(struct devfreq *df,
 				  unsigned long *freq)
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index c234357363675508c12732a08c1cd26c349039d1..9c69b96df5f97306e9be46aa6bb1d9d2f8e58490 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -9,8 +9,8 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/math64.h>
-#include "governor.h"
 
 /* Default constants for DevFreq-Simple-Ondemand (DFSO) */
 #define DFSO_UPTHRESHOLD	(90)
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 175de0c0b50e087861313060eab70a35b757fd20..395174f93960d0762456238654f4d356e21cf57c 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -9,11 +9,11 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/kstrtox.h>
 #include <linux/pm.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
-#include "governor.h"
 
 struct userspace_data {
 	unsigned long user_frequency;
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index 96d1815059e32c4e70a1d3c257655cc6b162f745..b8e4621c57ebc76513e4eba978aa54f2b884e210 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/errno.h>
@@ -26,8 +27,6 @@
 #include <linux/units.h>
 #include <acpi/pcc.h>
 
-#include "governor.h"
-
 struct hisi_uncore_pcc_data {
 	u16 status;
 	u16 resv;
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 4a4f0106ab9ddcfb106a1860370cbf8a3579322a..77cbb204087c970c1fec0c1597b1e76c1a11b390 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -21,8 +22,6 @@
 
 #include <soc/tegra/fuse.h>
 
-#include "governor.h"
-
 #define ACTMON_GLB_STATUS					0x0
 #define ACTMON_GLB_PERIOD_CTRL					0x4
 
diff --git a/drivers/devfreq/governor.h b/include/linux/devfreq-governor.h
similarity index 80%
rename from drivers/devfreq/governor.h
rename to include/linux/devfreq-governor.h
index 0adfebc0467a3db39278814fa66d2b1f25d61f7a..dfdd0160a29f35f5608575b07b450cf5157420ff 100644
--- a/drivers/devfreq/governor.h
+++ b/include/linux/devfreq-governor.h
@@ -5,11 +5,11 @@
  * Copyright (C) 2011 Samsung Electronics
  *	MyungJoo Ham <myungjoo.ham@samsung.com>
  *
- * This header is for devfreq governors in drivers/devfreq/
+ * This header is for devfreq governors
  */
 
-#ifndef _GOVERNOR_H
-#define _GOVERNOR_H
+#ifndef __LINUX_DEVFREQ_DEVFREQ_H__
+#define __LINUX_DEVFREQ_DEVFREQ_H__
 
 #include <linux/devfreq.h>
 
@@ -47,31 +47,6 @@
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
 
-/**
- * struct devfreq_cpu_data - Hold the per-cpu data
- * @node:	list node
- * @dev:	reference to cpu device.
- * @first_cpu:	the cpumask of the first cpu of a policy.
- * @opp_table:	reference to cpu opp table.
- * @cur_freq:	the current frequency of the cpu.
- * @min_freq:	the min frequency of the cpu.
- * @max_freq:	the max frequency of the cpu.
- *
- * This structure stores the required cpu_data of a cpu.
- * This is auto-populated by the governor.
- */
-struct devfreq_cpu_data {
-	struct list_head node;
-
-	struct device *dev;
-	unsigned int first_cpu;
-
-	struct opp_table *opp_table;
-	unsigned int cur_freq;
-	unsigned int min_freq;
-	unsigned int max_freq;
-};
-
 /**
  * struct devfreq_governor - Devfreq policy governor
  * @node:		list node - contains registered devfreq governors
@@ -124,4 +99,4 @@ static inline int devfreq_update_stats(struct devfreq *df)
 
 	return df->profile->get_dev_status(df->dev.parent, &df->last_status);
 }
-#endif /* _GOVERNOR_H */
+#endif /* __LINUX_DEVFREQ_DEVFREQ_H__ */

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250903-governor-public-d9cd4198f858

Best regards,
-- 
With best wishes
Dmitry

