Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016B36838E
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848796; cv=none; b=r4o67hPjjcVjjGcAQXLpY3R9ACQNfp43inaxNnzyhogNVl+4lBk0Q+/mGhqA/5AMetcOdUAZBwOZ68B7jC+EKyFfp9uQ9tGVDi8dqRut/1kXI6EZWwvyK3HxQYnFrkVpkwvrweX0+CgHYrBewE/rgGUsoo2V2cOPZSI4NNziCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848796; c=relaxed/simple;
	bh=BnykSKnbxL/JbVG4C2eSeMxrGBCa+WojSF98CVVbJBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CE9I962MZ3EaWZJYLDhCI7Lbq+QCr5oub0smSY3x0vY8Nj/UBT3VT3VB1MuGskGc/tocdbtZlaUzlaIgdgmDxwWUDrsTaTivW3AXD3CynuUY9H5bP58mn/J0ZMjC9jrKt1fj8MtM0rWzAtC5H5qt4LdK5sO4vaeSw4EqD3/dH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmxCudI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOtz+uXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmxCudI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOtz+uXe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UG4OqV1693358
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 18:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kxVNKbUzAJV99X9dS/+gmi
	7NdsiUJfq4YgJmO8sKUp8=; b=OmxCudI1Zx3NRN1fQg1MReXckBFYWcc0Mf8d1K
	YKMERYghQWU1ElUjQoaR+nnLfFh7HDNMHrDArCBnUI8BAXObV2ZUXiR6qjjtTzyr
	iDs+CLhv1vJ26ICbOsOOoy6tVGC4UsbDSJZkCMjjE14LHGh/cU3KH1Bbo3EL9zmd
	Dik2PAPmCRsmCfrtK6p189yDHoB4tBg+zjpQVPrlWPl3KGPZk84JJCU1NG5bMIfH
	KcjtikKfe/lMwYdXBmtvHEobE0F+QRRyMow6xEBtkKv5HMZX8wcY1wLyjPq9YsPj
	H82MyC64d9Va3ushrQgPy/NzqJQ/mWTOIP41LgClHPiS7hlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv39vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 18:26:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba247f3efso28427791cf.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848792; x=1762453592; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxVNKbUzAJV99X9dS/+gmi7NdsiUJfq4YgJmO8sKUp8=;
        b=NOtz+uXejRXu+EQcK93xil7lX4/im6/+LfoZSu0VEFh5FsA7670Q4UVOp24sDYauk5
         71XQPn9IaXdsvohjEjlXEtocgBla4dGJ30SA5a2WmudM8f0nUFDxUqmQqD0C3M5+3UYz
         GzLX6jMZlGYfIj+iWvfzB+t8bnS45s4NztufSMIces7hIFyQ8ri+Edrsz9UFxKirgvcr
         66BnUbNorn+YAOCHeFsMNrIbphCXLGc4gj/m2xQpcPoakcQ5GcSHRj3iu0TjzFdZoJPp
         adHqWRQMZ21nF2icgMkFoP3EY/Gc/QW6uR5X2UPQp8E0Dj0cH86OFqeiX0m67+HYAEd+
         OlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848792; x=1762453592;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxVNKbUzAJV99X9dS/+gmi7NdsiUJfq4YgJmO8sKUp8=;
        b=R4zuZtqPHtriS3kXs5aNrL2yk/isB7ANW8gsUiKfEaR8dXD8wrlIwGDYz1t/DGqnAH
         r9tGkvAnWwWWIb/1oVOjqP242JfSdFECPiVHcZscBrvbtJfrSAkWolU+h3807qcMA79i
         sxukN4/VUBVrOQrP2jhVYpE2oKLsnygyjZQByykc1MvQjBGy4ZJ5QpyaZf1EThIkccBE
         epgEvrCNMKBLy+wQ4pJoTFDBfSIVUflqKeS4DotFVibtSJfuVOJCW0xq+vJerhcqovsw
         IBcL3mVzdb0uHrw+HvxPx52dLFE+Rajhcs2hcGk+54ofOnrcoVfbSFKnL63TaRczvXFC
         OiSg==
X-Forwarded-Encrypted: i=1; AJvYcCV8hI5aedbzTtZTKP5AnVrJYBTCyqOTNYirnNuQzX4h0bR2jSOGDJVQvmJZ78ZubcZsy94gR+4jtKa1HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhP6qRM2syhbwa7eaXh4uF/TaqltyeU60Jwuf4gUsrOeCKNWvS
	0d8BYIdGjJEudXkO/Z7hfcjqg0CcDauSujzXnkzElq1GeyEfZZA32dX/rbB9gWLtPfez5nt9hdG
	UMEvgzz66VJtZibq7cv+88jLqzO5ppGksUTyY5/PQWMnsgzn1AOW03Q0W5DYbi4jLgw==
X-Gm-Gg: ASbGncsEoxbH4zOu3IWU/uvp0kHkJZmoYVw3//udAWRjtK9NKCTTAp5TE1KBJ8UPVNR
	MSm5Y59im6ixU4fjY1NVEEWUuaM1ehyhb/ndhKbigU0T/FMEkZVMqQlYNTK4opHOTAewip6749w
	dHX9gvkXRYpQISSQRzvek7K8FxI+S+K7WvvuW1htHXO30+PgUz2avM66UCJIDvP0PttlQImVEls
	B6qWSkM9rX63Nt9sXmTqxC5on+etnLkeqiUNhBM7XzqWaeycyHAO6mrG7IcCiJX4R01Wje5wkgY
	BBT9vSWPQTAh1ioLTOFaeAp2OMqxlfLFdo5bY+6Pvz9koXukhXBYrXK8ZtFgdPpBz1NVWwsnpYX
	91wim4nWDzuR6KKFASFHnrODja9/UJdWDjfDBkql3+zLpfOttCqx3gL8Ro92B5hdqJAvSrfhAAF
	giAdFKyc4H7zMu
X-Received: by 2002:a05:622a:1212:b0:4ec:faae:c62f with SMTP id d75a77b69052e-4ed30e160aemr10769811cf.16.1761848791430;
        Thu, 30 Oct 2025 11:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4XQIu5rB4lYuW5e6gXxKW+e5BvCCeoD9TMkwsCZo9DsQWtKg2qRZV/GX4tE6qJaZApIRByg==
X-Received: by 2002:a05:622a:1212:b0:4ec:faae:c62f with SMTP id d75a77b69052e-4ed30e160aemr10769301cf.16.1761848790807;
        Thu, 30 Oct 2025 11:26:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941c7cd3b8sm312158e87.22.2025.10.30.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:26:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 20:26:28 +0200
Subject: [PATCH RESEND v2] devfreq: move governor.h to a public header
 location
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robie Basak <robibasa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8969;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BnykSKnbxL/JbVG4C2eSeMxrGBCa+WojSF98CVVbJBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpA63VUM4N6Mdcm7cO5sPgsbt+GwjbFGfEWbtyA
 0AoAkC3I8GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQOt1QAKCRCLPIo+Aiko
 1clPB/9ifR1VS6kvZxzjLYZR+ZtTuCWp953Q4scTjhc4gZNoAkNrzWgjdgGgYyM7lThMmkqzQ1j
 tFzkSqhApdZ1B2oBOMHcVQSudx+z/WJLaFTSA3EpOO6wQoUCZE/v03uV2yMAyXBaOXdgpF5zOeg
 6TPApDcOHjcuwnWj6R6UDt1AcV+DuBIhoNR8e1Q9gO1eq+cRZfsgFzbQQyMh7Vv8PS/jQ7O8XGc
 b8pOdfJTP3zwO0FMZNUMa3482a2M38ojt6nNLcGQaGhZCAk/0wdXfe0uXWaMBunR9mBbiVbnzLD
 9bq9bGyAg2QdmDlBrxDXen28dm+DXSuEhhnUlQK7vaN9Jud6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HD3XlNpESDFZMNnQ356t2OemNEFzh8gN
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903add9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=hD80L64hAAAA:8
 a=rlKpfLgfwYsX6qVZeg8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: HD3XlNpESDFZMNnQ356t2OemNEFzh8gN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MyBTYWx0ZWRfX3/M4n2K0nX7R
 Pae6jWnwCzOmkmSmUhwZVSxQwOYoUb7a9n+nvsUH8d8iNxxdkzJ3PcalzP9bDdwMDwJuer+X/Uk
 0SKZ93H1+ongw6YawyZcEnL137dKbmMnxJkVjdcwX8XmvSS7imVblItoBBKj1F2fhxYxDLgFWui
 gdwckEDNv89UaVeXtVR77a5grB5ZnkDC7aloVkG4ZALvTV2Ijs/TBNgOjAsuLnRAQ+t/mNJC4MG
 ejOV/MpCc6lkq6i/O24XqdQd5cjaoEGF5pizZipUVaTogBAPqXlWAihBDkw7xnV7cZa4/O4qDkF
 3gOrUtTFOKxeVV3UsOZw39Womd8knbIVGuRkho5o32q3FIuggtDhSKe8flZsmyOLC00Qmmnad3f
 89UfJge4ivZOhNGTv6BPulTmrFNmJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300153

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

