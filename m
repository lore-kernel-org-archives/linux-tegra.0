Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1E3B27F1
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081539; cv=none; b=mtOe7pdjQMhqEvemVETcj/iXpWc8RcSbM0/u6CxZyGdvsb6SRqbiYe2lDUBMQJViIr+Y+KE+JH/XT6nap5Xo24aBeFQuooBkpHB/elcA6jA3ZG0/84RD5L8qQxNEn01mhK740LPwwP04pGf0hiI7DjV3J/BL370pBh90CzuUFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081539; c=relaxed/simple;
	bh=xfgZ82rjabE9Wi3S8DTrU80WTlz1niktdrkFyPMK128=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wd8APHIZfhhAWfQVMWoqFbcAS8mHoBiF1DavIZ1xUDGXk2hBi8iVMhorREJMpb4l8pf6PR1yu/KiosTrcf8IKihvmCG63aGkbZaoXzLbYZq+S2zKv+G/5wRe54FHwbA3VHL1nHbBg1YqBi6wAh2DhkSE+LK8LuizS4r6tM7DN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuF/hJlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dp5Pr+rU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuF/hJlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dp5Pr+rU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iREt867316
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=; b=TuF/hJltFN4tC830
	2w7eWLS9JaNZ5WJh7CYHTmuho/M1Q0cSCqb7SL/WN2EdTb9cjSAyrWOrp9lwC1kA
	+fdQC6vb7aRv6RbQCi6MoO77KI+pKngOEtjV8oT6GMptDz5+5EtuLXQNZ7q76irh
	9wkvJZK2xAIsMjGAJLUoKAH4HijCcrX71mM4LKkHpInj2F97tivl+zcA6eoVWhRm
	rxxZCmr8Go+Mg+/GiDTQ9OB3o448VAYFAXd9Mv2hRRNzM4ATp4Cye9yWmJRRv9al
	ac+s9gNfrAtPxWIeGL/qb3oF7/A5ID/qpD0ng/DbLyid/PFw1P8LNM/AnR9g9jx5
	Lq/+1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9067-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so4577214a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081535; x=1781686335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=;
        b=dp5Pr+rUvLIZ9XNFfesmmhA34yQtg8PCOKMf0tWDm88HkeTmR4XNxLRWtuxpFRCJwQ
         dfWobyI2Di4p6nG8HHOfYQyt6Fza4Bxb6dFBBXgk1G72CP9W5XfmDwOwwukRt5e8BAFl
         c0BosfSn274MiRMo/9hfxfE9gbGFuIcjqT996SN65/v4DhnRgTSzYniw2gr7HcjmcPjJ
         KfPa6KIRe3wU5j1GpT7Zm/AllXsxcxAcpQZuPp2FHLONzqqrRHyeEYlA0b10lGCOhLq9
         Ag3LwQbFhMphyRsSnIYcvvlY+U3CKwFPF3Q33EXR+W7VvMjJf78dbk+1DhbmRre6KQcG
         zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081535; x=1781686335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zj008DVGc5kMK82k+xOC+qfyEhbgRDy17GsHFb9DToo=;
        b=Fm4Rrv+bntILnlQkTqhLJDHZ27AkSyi1pTYaUevHJSE04uy0O/Zt3CfDTVrPUdSl69
         OlHWC8Q5r7qnziqy3XQHkNUng+egM2tTsc95WcFAIwQdPB0P2jz/LXLKYLG7sATDz6jE
         fBbdiXYZCnHfMmhwOmH9tbrMkY5uuQjs48rlEhRurkKpjs9Snn2fY3DpxyKsRMUUm+hZ
         G6zxeETTpqk8gKUxIFrtNV005bvBIjoj0wu0f09lhJOSWEVxRQvZHA2ZWIAfnhGHespI
         chM7sMTL4mH/mxvO0aWQFRGMkaAU1w10+pHyZC8TD0ywHFrJbHi6oKWIMTKU/laZm3DX
         e5cA==
X-Forwarded-Encrypted: i=1; AFNElJ/dp0O0NHj0rV3RDIzZAPPcB3yXSYdLiYqmU+h/YgU9iGFadNBw7l96aiyex5A6Py7iXk5rXXqV4h9TsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuZLDHZm1gEw6/YHdbvMQgnfVgj2Wm7JCTkte2LgUKB1pk8si
	1Ns2CcikIR3X7j+dsTy8VerxdBhgszQV5EE2Fam8onSfZpIFuhuQIVCm2K+6p3z5GytjbwhI5ZI
	BYQ/Ibc7ZKEwNZrpatnMYHvK79rlbV0e4TvS5dDV0MVHB+TdzxG3lu8d4BP70uZ1WoQ==
X-Gm-Gg: Acq92OEAwIE+TySjodgJ6eJWJNoIYhGWbICYYfWL11O1IPaNJAzGhHex6WK5pd+lamh
	cdKz8LKfG37xQ9eIWpSJC/plCc6fW2kRQpoUgPu+InPV2WEN7vwhFItHgfDxWHESCwWEtiu2jVT
	HVOVz4+Vq1rOpxYSwzTQSPc8k+MstccK/RgeUmt5L+2iyD8Jzx+wmIUHTvq0n77OEka1fZYMdGo
	r+4hVO9Y60GsoU+jA7t+0IbynrL97sx9gqYJo8VrOJM8trQ6lsjv4TkRCSFieK2Lu09TQJwj8CA
	2eQWwXH+C+iisJ7UPxbS0li0T2Ald2iI/r1FztjVwZnVjKNsElxzbMQ3XfSiNzHTfNSPbdjlde8
	s9/kpo8Dm5Ml27KSHKrXaW+CwxMEPrb4PVbRsviGK1DUw8V0/eu4gAD+Z7/45Ev7WJIQKC3jnzn
	A0KjnsuSfkEo5jMIZhCLMtnO80VcCmB2HAF46pWKM/nKQg4Fzf/ZODm1shAc4=
X-Received: by 2002:a17:90b:390f:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37520dc5920mr7199956a91.14.1781081535316;
        Wed, 10 Jun 2026 01:52:15 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37520dc5920mr7199932a91.14.1781081534868;
        Wed, 10 Jun 2026 01:52:14 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:14 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:30 +0530
Subject: [PATCH RFC v7 3/9] firmware: arm_scmi: vendors: Add QCOM SCMI
 Generic Extensions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-3-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=10720;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=teXO5koBrmv3aA4ZyAeyCgjEEP97zvPys0ur9lr68Q4=;
 b=Y5L4HL88UbeNsfsuiEHNiHQ2Mt5BmhyjqEHH/Io11WTARLldgiF907aIgcqU5CKmAxXNOsp7U
 7MFapu/mQTKBEVm5GtRmtxujsJAFDWqgIPrxe8Foi32nFbBauMBha1m
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2925c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xTFWSTIUIKHfy7pKroIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ESHo8281UQ7xBcYPUGHssA4DWX9pWqku
X-Proofpoint-ORIG-GUID: ESHo8281UQ7xBcYPUGHssA4DWX9pWqku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX+m2bf6H5V2zS
 vLdGl5/XP4gk6z7i+A3EWojKdq0fCxthUEKHNH/ibmhOkPEmI6xoKxk3Nl5qecmGrp6w0vyMEx/
 eVV2tG/d+53JabbIqggCksZhAIRFKcO0xya8R10T1Gv2oyp6uy7RBTlafrkJtmR1XaxbICYPb2k
 lT1JTg6ncT69Qe7DzsoRdnE6p4vW+lZ8O9PfIhrUrWv6xMj6nSMqHjSb0yxzsiwFFXWS7FuNVik
 1bZWUssL7CT1NLNPjI+UDyTvCSYtNlllSrZW6BvSw7ydDxx1CVuo31bWFOozxi5VJb/A8wbnKol
 +lBlHH1ixxJLzAG6OD9miJ66ihwArRhtHGLQUH6JcolZlzoQnXmCwHrjEOuGPMz50jlBF+Xyw5Q
 XUkBAYox55Z2Jrx6siDrJrs78NAIgZkBhQVAdjvmRwn9v0MkvpIv0vWCuRKUBMjm1OasZ1wTKuk
 WVGUWRh5p8+bCJ0tDDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The QCOM SCMI Generic Extensions Protocol provides a generic way of
exposing a number of Qualcomm SoC specific features (like memory bus
scaling) through a mixture of pre-determined algorithm strings and
param_id pairs hosted on the SCMI controller.

Co-developed-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Co-developed-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/Kconfig                  |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/vendors/qcom/Kconfig     |  15 ++
 drivers/firmware/arm_scmi/vendors/qcom/Makefile    |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c       | 153 +++++++++++++++++++++
 include/linux/scmi_qcom_protocol.h                 |  37 +++++
 6 files changed, 209 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978..a52f4d1b8b2c 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -84,6 +84,7 @@ config ARM_SCMI_QUIRKS
 
 source "drivers/firmware/arm_scmi/transports/Kconfig"
 source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
+source "drivers/firmware/arm_scmi/vendors/qcom/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 780cd62b2f78..5a0e003c2477 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -13,6 +13,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/qcom/
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Kconfig b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
new file mode 100644
index 000000000000..8aa0efd6a03d
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI QCOM Vendor Protocols"
+
+config QCOM_SCMI_GENERIC_EXT
+	tristate "Qualcomm Technologies, Inc. SCMI Generic Vendor Protocol"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	help
+	  The QCOM SCMI vendor protocol provides a generic way of exposing
+	  a number of Qualcomm SoC specific features (like memory bus scaling)
+	  through a mixture of pre-determined algorithm strings and param_id
+	  pairs hosted on the SCMI controller.
+
+	  This driver defines/documents the message IDs used for this
+	  communication and also exposes the operations used by the clients.
+endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Makefile b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
new file mode 100644
index 000000000000..6b98fabbebb8
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_QCOM_SCMI_GENERIC_EXT) += qcom-generic-ext.o
diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
new file mode 100644
index 000000000000..77c07272c09d
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/scmi_qcom_protocol.h>
+#include <linux/string.h>
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+#include "../../common.h"
+
+/*
+ * This protocol is intended as a generic way of exposing a number of Qualcomm
+ * SoC specific features through a mixture of pre-determined algorithm string
+ * and param_id pairs hosted on the SCMI controller.
+ *
+ * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set
+ * to Qualcomm and the supported version is set to 0x10000. The PROTOCOL_VERSION
+ * command returns version 1.0.
+ */
+
+/**
+ * enum qcom_generic_ext_protocol_cmd - vendor specific commands supported by SCMI Qualcomm
+ *                                      generic vendor protocol.
+ *
+ * @QCOM_SCMI_SET_PARAM: is used to set the parameter of a specific algo_str hosted on
+ *			 QCOM SCMI Vendor Protocol. The tx len depends on the algo_str used.
+ * @QCOM_SCMI_GET_PARAM: is used to get parameter information of a specific algo_str
+ *			 hosted on QCOM SCMI Vendor Protocol. The tx and rx len depends
+ *			 on the algo_str used.
+ * @QCOM_SCMI_START_ACTIVITY: is used to start the activity performed by the algo_str.
+ * @QCOM_SCMI_STOP_ACTIVITY: is used to stop a pre-existing activity performed by the algo_str.
+ */
+enum qcom_generic_ext_protocol_cmd {
+	QCOM_SCMI_SET_PARAM = 0x10,
+	QCOM_SCMI_GET_PARAM = 0x11,
+	QCOM_SCMI_START_ACTIVITY = 0x12,
+	QCOM_SCMI_STOP_ACTIVITY = 0x13,
+};
+
+/**
+ * struct qcom_scmi_msg - represents the various parameters to be populated
+ *                        for using the QCOM SCMI Vendor Protocol
+ *
+ * @ext_id: reserved, must be zero
+ * @algo_low: lower 32 bits of the algo_str
+ * @algo_high: upper 32 bits of the algo_str
+ * @param_id: serves as token message id to the specific algo_str
+ * @buf: serves as the payload to the specified param_id and algo_str pair
+ */
+struct qcom_scmi_msg {
+	__le32 ext_id;
+	__le32 algo_low;
+	__le32 algo_high;
+	__le32 param_id;
+	__le32 buf[];
+};
+
+static int qcom_scmi_common_xfer(const struct scmi_protocol_handle *ph,
+				 enum qcom_generic_ext_protocol_cmd cmd_id, void *buf,
+				 size_t buf_len, u64 algo_str, u32 param_id, size_t rx_size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	/* Reject calls where rx_size exceeds buf_len. */
+	if (rx_size > buf_len)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, cmd_id, buf_len + sizeof(*msg), rx_size, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->ext_id = 0;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+	memcpy(msg->buf, buf, buf_len);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret && rx_size)
+		/*
+		 * Response is returned into the caller's @buf, replacing the
+		 * tx payload. Callers using the same on-stack struct for both
+		 * directions must not rely on tx contents after this point.
+		 */
+		memcpy(buf, t->rx.buf, t->rx.len);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			       u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_SET_PARAM, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			       u64 algo_str, u32 param_id, size_t rx_size)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_GET_PARAM, buf, buf_len, algo_str,
+				     param_id, rx_size);
+}
+
+static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph, void *buf,
+				    size_t buf_len, u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_START_ACTIVITY, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf,
+				   size_t buf_len, u64 algo_str, u32 param_id)
+{
+	return qcom_scmi_common_xfer(ph, QCOM_SCMI_STOP_ACTIVITY, buf, buf_len, algo_str,
+				     param_id, 0);
+}
+
+static const struct qcom_generic_ext_ops qcom_proto_ops = {
+	.set_param = qcom_scmi_set_param,
+	.get_param = qcom_scmi_get_param,
+	.start_activity = qcom_scmi_start_activity,
+	.stop_activity = qcom_scmi_stop_activity,
+};
+
+static int qcom_generic_ext_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	dev_dbg(ph->dev, "QCOM Generic Vendor Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
+
+	return 0;
+}
+
+static const struct scmi_protocol qcom_generic_ext = {
+	.id = SCMI_PROTOCOL_QCOM_GENERIC,
+	.owner = THIS_MODULE,
+	.instance_init = &qcom_generic_ext_protocol_init,
+	.ops = &qcom_proto_ops,
+	.vendor_id = "Qualcomm",
+	.supported_version = 0x10000,
+};
+module_scmi_protocol(qcom_generic_ext);
+
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_QCOM_GENERIC) "-Qualcomm");
+MODULE_AUTHOR("Sibi Sankar <sibi.sankar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QCOM SCMI Generic Vendor Protocol");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_qcom_protocol.h b/include/linux/scmi_qcom_protocol.h
new file mode 100644
index 000000000000..41632ee7bbc7
--- /dev/null
+++ b/include/linux/scmi_qcom_protocol.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver QCOM extension header
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _LINUX_SCMI_QCOM_PROTOCOL_H
+#define _LINUX_SCMI_QCOM_PROTOCOL_H
+
+#include <linux/types.h>
+
+#define SCMI_PROTOCOL_QCOM_GENERIC    0x80
+
+struct scmi_protocol_handle;
+
+/**
+ * struct qcom_generic_ext_ops - represents the various operations provided
+ *				 by QCOM Generic Vendor Protocol
+ *
+ * @set_param: set parameter specified by param_id and algo_str pair.
+ * @get_param: retrieve parameter specified by param_id and algo_str pair.
+ * @start_activity: initiate a specific activity defined by algo_str.
+ * @stop_activity: halt previously initiated activity defined by algo_str.
+ */
+struct qcom_generic_ext_ops {
+	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			 u64 algo_str, u32 param_id);
+	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			 u64 algo_str, u32 param_id, size_t rx_size);
+	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			      u64 algo_str, u32 param_id);
+	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
+			     u64 algo_str, u32 param_id);
+};
+
+#endif /* _LINUX_SCMI_QCOM_PROTOCOL_H */

-- 
2.34.1

