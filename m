Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C173309DA4
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906992; cv=none; b=gYdbECBqMXW4fZ9Qym2ngwcXlOfJzsD3Fs5o1MgATnVE46BTglJbvzX0AtaP6HIeFLMeqs9fYXPrwheQKCKBB07+eotp3cI+Zw50d+6UpO112tornjuBHdAvFeno1dzYjWe9Yw/zQjJkoIraj9ea1Orz8dpRuwlh42D0TTzsArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906992; c=relaxed/simple;
	bh=wUx1jSO6M/XUhYbJfM9D5B0yO7/rFR1cBXWAVogl9Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YJTHD2CGciQ+SmngttN33ehbJGcKdYqiJaC+mBzpoL7Azg1xTQpyKx0iTAhHZSa6Zs07nxuZU4WPFiAeBlS1rCnSkaNS0/kqWkjx1j3/RUy+PNLaqXS+42FOxGtm8bU/QR93TMtEFeExvzxmWnuXtM9cVXwTIW0Ywlf7tV7z9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AduBsox4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AduBsox4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF5jj004720
	for <linux-tegra@vger.kernel.org>; Wed, 3 Sep 2025 13:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uO5ete8qiu1MMEjZsmGIcA
	UmyFrydGrrKTx5zqvH34I=; b=AduBsox4qA8IDsiDzahJvY0xotYxnUEKvjQbIw
	7BmtLdBaUGnaNze4Nzp5D7b6hXwoBkrt7EAvR/R0dt4G4oraU+5C3qMj6UMoD1JH
	/adRCnE7GlLULzu6VxCl8GEe3xgxKrxYjtUaTFJzkUncjmThLr4EPzY6SrL6CiFo
	mT85F7jRjuaDM+oBwimUgkXeGofx7QO6pNH9kWJYpMc4rfxdVqLmLmb0rUBp/to5
	Ptw6lYgUoY3gMcWovT/3Qz9aA4oIsOImuOkA255hZbinedTegnWawbyLHL6QAnw5
	MNM/Vt9qfWHUsJlnXlP6KhlKs2FxpdK6SM9+fknhCq2JuJkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpc0p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 13:43:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2f7851326so163285921cf.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 06:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906988; x=1757511788;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO5ete8qiu1MMEjZsmGIcAUmyFrydGrrKTx5zqvH34I=;
        b=rIFDgLBL9PsS4fOEzWgq63hKmMvlHEEqOXoG5g/7oZJMoSumym8cHZsE+hlO7JUBO0
         UOvjLMioXFx9daFDoKDYRSgpwpC07FZHW5WV5VWhdzJlchqixcUpuFOfNpiokgamuQw3
         yy4/fX2bQyQk1Z4Z/ZNXjVv7Vaxi/ruDyivjwIHQ4lWwMdnbhAIXu6uq98dU4ZLq3RnI
         oGTk5xQLwqO5aKdCkwkmVtjdca5j2CsoiKAQb02aE0fxwzglVWoLU+BjOcI+QcRmZlsE
         gfd0IcPE+QuV9va5iUIrLe0zbtcACK5IbYqXmAYGrSZBMbUJDPj9MDXnqG2tP3UVQqtZ
         BFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXUmAmk4B9bDJgpjsG6RfJOplAYjxrQnECjGFGyvG/cTonCSSV0pjfAN2+yQ+gcOXgwVzqRIGrDqRQlKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoydI9Ma/x5rBZRex8FfgwuKBFnasgxwKC3NmW7cJk11gWVsn3
	VhvQVhug5qWy6dUJqeLMCD64kVUgpFxqdeyLDpd1dz7Q85KoMKSgZ/Zcjwd7o/mlDA/3hgb2pZZ
	wK+K+wHDSo3k805itj4YGa3IlyK0Ip/x4EBu0nX7G7xrl9d2/cQg2rjGISV5yhHg98Q==
X-Gm-Gg: ASbGncvfNa41PhyXoOHyh/IfsojpdNo7Fn3z3fmDWfvcZ3LNGmw9IhAKsRU8mVCUPQq
	RCE4SOuSWQmDsKPQh1DBNUnACSzkni+5Jvpydg0osRV7edUB1xK1tbqeyQxbcbTHWhhilbuJNoX
	kPh4R4GIGd3Wh0mRl+4JTQZdQjbVBxgeGZJE2Ff58V+L/eZsYu4yEd6dRIPZ905Qwc0GE5N7L2a
	u1QwZ4xmIivpeSxf12rBOFS/W5GENbzMyBFor5bnAjp8uj0JIdJYC5D5zgZFJiqJZe1dZcNkQZX
	gz3EVTY3qtduKhdoLrLpqIrxyVHoQ91o3m8AkttARzkMrwBNEcrbzx7QUYpfK3GOpx+RG6dXoYD
	Esdbp5k/f8Lay4Qy978loNPVWCpPOluSGkAmxReQvq5R2Nmd0eD7x
X-Received: by 2002:a05:622a:44:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b48eb7b057mr37856871cf.58.1756906987994;
        Wed, 03 Sep 2025 06:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8dyuJNvXUcySA1g/t4iEXfdk9uva/nKCZAPKAaGUDsiY9OQvJ7pPMN0f1YS4QiwDLuRI6bg==
X-Received: by 2002:a05:622a:44:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b48eb7b057mr37856281cf.58.1756906987323;
        Wed, 03 Sep 2025 06:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4ce26sm534805e87.141.2025.09.03.06.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:43:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 16:43:04 +0300
Subject: [PATCH] devreq: move governor.h to a public header location
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOdFuGgC/x3MQQqAIBBA0avIrBPUCrSrRIvSqQZCZaQIorsnL
 d/i/wcKMmGBQTzAeFGhFCt0I8Dvc9xQUqgGo0yvnGrlli7kmFjmcznIy+B86LSzq+0t1CozrnT
 /x3F63w+TVSWVYQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8752;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wUx1jSO6M/XUhYbJfM9D5B0yO7/rFR1cBXWAVogl9Bo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouEXqv12gHCHUxt6nYnBtMjSwUs1xkqAG/7Cz1
 aOTZH1hz5yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLhF6gAKCRCLPIo+Aiko
 1RgJCACnOgLYTo4HG4POUBPN6KkOHftR4PGUVQZSJB4zx0s02kEFCKjp3j6IpdqVFhyqYgONz9n
 +CYC4VygLgVfjYyQHIpDZxaoPjOCgsZKuF29lZXR9yAAo+xTj/xe/1xRgID587uUM0o9DMLett3
 h+TWVvdb82iDJ0B9FqFcjW4dpv5iaGty8H59ANc7D1Fwe/rVnNex4CE4EizlyqdBjn3n/X2UyXC
 MzMKnoLdVJqRKvzs+QumKqjyMGGEar55OZlf18h9Z0kMOlx3uKWFGwLhbZ/fiyAGMSgziuWUC0L
 Af2wMTC0sjNV+sP3l/Bytf6cSo82ABdHlGrO5H/+od0pfnfL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QBV0-PWp8uFxRRn4SRX9JsDZVxcp___G
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b845ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=rlKpfLgfwYsX6qVZeg8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QBV0-PWp8uFxRRn4SRX9JsDZVxcp___G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+5I+qCJTcb9x
 /rjjU0rZmo4LcERRDFdulqL5KPyaGVL4bgY/YLvwomUppkZrvEckAjXNMzBZsDiVCbn0+sqjUhM
 kP46vqPbmJEYzzz6CQovDiojL2QlHldxEnaEj88q+3dcGQeblYIRPo4nse6LafcYEwa51LZnTQs
 WlxV5Il8onAcNtvCDj8W5HWrPK0fEIKySyyqy9bT+dkN4djYt26m6JTWB5P38go/ruZZ0WPq2Ps
 fkB+XkpbbJNyCvOCdXEQ9mM6VnTgWcgpTvYq9vBWisYfqi9d2HYWrajXcIgG0nf890Gfm4Rcz/M
 xp3wsYbJUmUcemlPfTCtabCX59c+qd5oHlMxWoqKNaKVPUs2EnN2Tzniwws1WYxjdQm9YuIAOGV
 XAY5expx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Some device drivers (and out-of-tree modules) might want to define
device-specific device governors. Rather than restricting all of them to
be a part of drivers/devfreq/ (which is not possible for out-of-tree
drivers anyway) move governor.h to include/linux/devfreq-governor.h and
update all drivers to use it.

The devfreq_cpu_data is only used internally, by the passive governor,
so it is moved to the driver source rather than being a part of the
public interface.

Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

