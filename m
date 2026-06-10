Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4D3AFB09
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081527; cv=none; b=dejTingSsPkNdfCUEPzv2ukEylsrc4cEGyo66rlW2ppev3TXPPUOsBk0kbZwHGz5S3K/JCJrsomMDH/iTsIkERlzs+Q6TbTD4A6wNMGKJsuXzXl8xQAmitlfZPy4mph5f4XfxcKnKan+s4hbx5azqyhQQk9oTtZ/rHRZn6SG05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081527; c=relaxed/simple;
	bh=rQeDKu5d/zePq0blKftknYGNVVtCbY71jBzQDxxIzk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kuzv+JPuAv2ndJJG1e49Ax/jkEfwbynax1Bd9qbo4DDqNpUet3HexPD9/qNeN2Dtbh4SxMmlnN5nzXlwuPFbvr5wIUzYlXvcQ0chroNBuIoIrd9voBG/4f4XyI+2P5Qfo6KJ/nj8CvcVU8THLmGXfouGbalSS9RrHpku2RU3dKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azUaAkRE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Jf7NFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azUaAkRE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3Jf7NFC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i08T991008
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=; b=azUaAkRE5t+/5fvz
	PLwsA/3+jRNUPKVPL4YDG19TJvdpgRcbAVEFhjCpxXG8ZEZmtGBNXQ4+NC32EAPe
	maq92V9Cq5WWz1IKAkDvemHjGyE/qlui+r23KsO+TSWK8FPgIVqpz9e4s8krxAwJ
	8YD3Bkm14Mc2G6csrWePkLvjeIoygPaD16COKt3DhxGFGl8zunFRZlxMZh6Q5ko8
	3XwnpfgiFPhT5TiWZLKvM7kdpY1QihZ9rg5bDoTEzUw6xniOK5+ROYGmzbrrxcTt
	4Lyi+LCKArzoFJGPSDy48yQrKvgwVqrUkirPPkM/JcETtOfenpoJJbruBd8WwsOu
	VkPXtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0r6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so120402285ad.3
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081522; x=1781686322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=;
        b=a3Jf7NFChOUhUmEHwXFGKcgGdTiVM2EgYeZqlGpKIWRq3TZQOVmh90NjaCtPcGsyWN
         +REeWCQZcFE5jktdEEFLf0nYg60Sa2pWq0Atk3bo5MaLAzA+cpinu92cEgEQfG73Eg5A
         ad1r5scIXQY95SDzFJObdp4epNpQzaq4ikJHeUhZcrXVYspTenwbnRK5nl6txhkaOqyd
         EESrhqDxekv+2QXIS2PAlDgJdNCKKXXT4dzfYwYEe4QQwM57m7yZRLQ6aES3J2SA9zls
         UgI1iydhS2IdMGSixlqO7YsDe3cxJM3/VACQP+67L+AYewxBSm3vN9W/TvQz0M/6h+no
         Mt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081522; x=1781686322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=;
        b=j/ajZVssxAGz6EnLLyq2qJ/Hizme2SwS9bUAocZDZ9E4LBHgv3uQ50ruMvm7EUm8qE
         cjFAmlwV2yrZPAyVTedF1AlL5jT8LVvUCfNxKkX+7ZN4KjqD6zcHLUcVapU3vVzE0i5l
         4Ro+SR19iCE9FaL4EDAcs802ggVOS/f07o0xdXoqRpz8OIWBRU8TsUqE3ZZfJsJsFj/G
         aGznYYYddr2hHIsFzdCVW60nksmrx/vCA4Nu7/x/0PzWehFuEqyPmiFUvJqRsu1fNrld
         cNKWQI+PTYvZgRMNBGx6aJyO+RNusenuEHOPO6M7KXLLyQMx5Y8vhQ7XotmDYbsaWF34
         6YXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jfxyV8JHQrrMY1e3l85EDRvyUClpN2d1U7zX+Qh4bHDp+76STJpReFMbcesoYaMAWdqA+lVvhqqRukQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUG9kM1J8oAUjGHCygJd01bZ62ZYm2SDXOa1+IjKExaGJ9l15T
	XAj6wT3w+JH0qJGGlaMp5QT5l1XptHxk+5OJ8Ew8gbtbYOvYNJFwV7BB5m0CiwDnraIPcD50IsJ
	1XlLBff7u7wykHv4F7ePtdBULhU64Zq8zw19/UKMZEl8WZQmUfvL0MwPN2g0VBNnrvA==
X-Gm-Gg: Acq92OF/en5JbypXjymuwCPbnimFkwRnEO4W2S7BR77u5czf7jh0bpuWO6IVhEkw80w
	KWxa0w6kfD2zXXTSrsYM6D4qRd3QiDkyvAQM8dKHgohqduu9948kpMWptmMxD8EdeO0kBMOxH3i
	qwGij1cDG8GK/3UuEvce6CJ7m2RQ1CwMR4WNaff/MR8VDxvyk8O1EuqP/cVSmGXKVUMLeWJcKF6
	yk5YTJzpD+Dtych1jdwmHBuTFQnDpM40631aPOtUWOjVOjh2YFXy3gJ8e5EV5IwwU5DMTB8YbrZ
	DN9Fimm2kQp3l2yLSB136fs+4jBurwTpzLyHJ6ZOdzoUVDoosAILwAciEoOW9nuGpeFXvTAma39
	/glFDQ3NaupOLB3K912BJh/iW/68AQMIi5qr0eCtS3ie40RhxRGiGSBqtaOpYxzwNEhkXE4y2fB
	7zOfknoU+LjJa2g/I+ZbMG3Q3INCBK3YUQo6yWKDkubjm57YHjDmGI0ljgq4I=
X-Received: by 2002:a17:903:1a2d:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c2bd7fcdb2mr36628635ad.21.1781081520989;
        Wed, 10 Jun 2026 01:52:00 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c2bd7fcdb2mr36628045ad.21.1781081520095;
        Wed, 10 Jun 2026 01:52:00 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:59 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:28 +0530
Subject: [PATCH RFC v7 1/9] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-1-f3f68c608f25@oss.qualcomm.com>
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
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=40905;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=zvgtiOY9qUjQklvu4UM79+owpYtVrSbxEet9NtPp8R4=;
 b=GAtvnH7zwKmTtSpg2u3qO2YkWuFKMbIpUbicIcK2WPrXvry2dJ3dtB15O4IQTevm4lfj6aryw
 u+apweTqsJ2A9L7vaRb9dYU9zhUGs8jD0c05XqEVTTqST1tiWk0NRia
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: E0NbKpsLrbF-7h9wPD1BIBeYAsPVv7zH
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2925b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TLQOcO4xEgnVrnW6FtgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX91c07VPsPf+K
 y8gZzOhNDlOa/JJEv7twW749BRdXa1hTSlPW1L3F2rjl0/9ExlmJg8zaRlVYy3h0QKj9A8O1ySM
 gJVbdVPaf3WAFkvycz5ZP4+TWd/qOixKZAVzNUCuvqUyaXqjVAt6CnUOvAvHNUYYK6RIJiEOoER
 Dx+tXe/Oy70Hp7Sl2C4aRMhZ6ZwBACN/NDo8O1APBuzpVUlN7JWzkCO29PtwWeXGRQLo7V3NLlW
 g04agVcoHgSk64hVipSG5UYZMITM3cYVhXaL129n7b2lZvyXAYPmd2cXya8nUZmU+qHmy67pBP2
 S45lGHmLvO9xpMtCXfWyoi0uCBF2jB/9wGKtsSCubn8aKD5IjqJhZXcgFvY44aCk07rbqs39u9J
 HRy+PB4wcZRMYta4Bz6OoTPfNQeqoTZx8mTfrU18LCwlsrjE8YIj/SIFlE6N+jkg8ryfvdWf0MW
 KRnk1+64FrPEUGvKpMA==
X-Proofpoint-ORIG-GUID: E0NbKpsLrbF-7h9wPD1BIBeYAsPVv7zH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add QCOM System Control Management Interface (SCMI) Generic Vendor
Extensions Protocol documentation. It exposes Qualcomm SoC-specific
features through (algorithm string, param_id) pairs carried over a small
set of generic SET/GET/START/STOP commands, alongside the standard
PROTOCOL_VERSION / _ATTRIBUTES / _MESSAGE_ATTRIBUTES handshake required by
the Arm SCMI specification.

Document the protocol so that drivers targeting it have a stable reference
for command ids, payload layouts and status code semantics. The first
algorithm covered is MEMLAT (memory latency governor), including its
memory-group model (DDR, LLCC, DDR_QOS), event-map programming and per-
monitor frequency voting tables.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../arm_scmi/vendors/qcom/qcom_generic.rst         | 647 +++++++++++++++++++++
 1 file changed, 647 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
new file mode 100644
index 000000000000..ba0c64729790
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
@@ -0,0 +1,647 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+:Author:
+   - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+   - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
+==================================================================================
+
+This protocol is intended as a generic way of exposing a number of Qualcomm
+SoC specific features through a mixture of pre-determined algorithm string and
+param_id pairs hosted on the SCMI controller. It implements an interface compliant
+with the Arm SCMI Specification with additional vendor specific commands as
+detailed below.
+
+Supported algorithm strings are documented in their own sections after the
+generic commands (currently: MEMLAT, see below).
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   |See ARM SCMI Specification for status code definitions.       |
++---------------+--------------------------------------------------------------+
+|uint32 version |For this revision of the specification, this value must be    |
+|               |0x10000.                                                      |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[31:16] Reserved, must be set to 0.                    |
+|                  |Bits[15:8] Number of agents in the system. Must match the  |
+|                  |value reported by the standard BASE protocol's             |
+|                  |PROTOCOL_ATTRIBUTES response.                              |
+|                  |Bits[7:0] Number of algorithmic strings supported by the   |
+|                  |system. Only "MEMLAT" is currently supported hence it      |
+|                  |returns 1.                                                 |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |For all message IDs the parameter has a value of 0.        |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_SET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is used to set various parameters supported by it.     |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string.                            |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_GET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x11
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string.   |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload and store of value for the specified |
+|                  |param_id and algorithm string pair. The payload size       |
+|                  |depends on the (algorithm string, param_id) pair; see the  |
+|                  |per-algorithm sections below. The response payload is      |
+|                  |returned in the same buffer, overwriting the request       |
+|                  |contents on success.                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string and the result is copied    |
+|                  |into buf[].                                                |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Holds the payload of the result of the query, returned in  |
+|                  |the same buffer used to send the request. Size depends on  |
+|                  |the (algorithm string, param_id) pair.                     |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_START_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x12
+protocol_id: 0x80
+
+The activity to be started is defined by the algorithm string; see the
+per-algorithm sections (e.g. MEMLAT_START_TIMER) for valid param_ids.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to start the activity performed by   |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |starts successfully, or if it was already running.         |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_STOP_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x13
+protocol_id: 0x80
+
+The activity to be stopped is defined by the algorithm string; see the
+per-algorithm sections (e.g. MEMLAT_STOP_TIMER) for valid param_ids.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to stop the activity performed by    |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |stops successfully, or if it was not running.              |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
++------------------+-----------------------------------------------------------+
+
+MEMLAT: Memory Latency algorithm
+================================
+
+The MEMLAT algorithm string (0x4D454D4C4154, ASCII "MEMLAT") is hosted on
+the Qualcomm Generic Vendor Protocol and runs on the CPUCP firmware. The
+6-byte value is treated as a 64-bit algorithm string and split into two
+uint32 fields on the wire: algo_low carries its lower 32 bits and algo_high
+its upper 32 bits.
+It samples per-CPU performance counters at a configurable period, computes
+per memory-group statistics (Instructions-Per-Miss, back-end stall, etc.),
+and votes the resulting target frequency to the bus interconnect for DDR,
+LLCC and DDR_QOS. Userspace control of the algorithm is exposed via
+parameter IDs issued through QCOM_SCMI_SET_PARAM and QCOM_SCMI_GET_PARAM.
+
+The hw_type field carried in most payloads identifies the memory group:
+
++----------+--------------------------------------------------------------+
+|hw_type   |Group                                                         |
++----------+--------------------------------------------------------------+
+|0         |DDR                                                           |
++----------+--------------------------------------------------------------+
+|1         |LLCC                                                          |
++----------+--------------------------------------------------------------+
+|2         |DDR_QOS                                                       |
++----------+--------------------------------------------------------------+
+
+All multi-byte fields below are little-endian, in line with the SCMI
+specification. mon_idx selects a monitor within the group (0-based, less
+than the firmware-supported maximum). All SET commands return the SCMI
+status word; on success it carries SUCCESS, on lookup failure
+INVALID_PARAMETERS, and on an unknown param_id NOT_SUPPORTED.
+
+Frequency units differ per command: MEMLAT_SET_MIN_FREQ and
+MEMLAT_SET_MAX_FREQ take kHz for DDR/LLCC, whereas MEMLAT_MON_FREQ_MAP
+expresses the resulting vote (v2) in MHz for DDR/LLCC. For DDR_QOS all of
+these carry a raw level index (0 / 1) rather than a frequency.
+
+MEMLAT_SET_MEM_GROUP
+~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x10 (16)
+command:  QCOM_SCMI_SET_PARAM
+
+Allocates a new memory group on the firmware side and binds it to the
+underlying interconnect path (DDR / LLCC / DDR_QOS).
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpumask    |Bitmask of HW CPU IDs that contribute counters to this     |
+|                  |group (limited to 32 CPUs).                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier (0 = DDR, 1 = LLCC, 2 = DDR_QOS).  |
++------------------+-----------------------------------------------------------+
+|uint32 mon_type   |Reserved for SET_MEM_GROUP (set to 0; populated only on    |
+|                  |SET_MONITOR).                                              |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Reserved for SET_MEM_GROUP (set to 0).                     |
++------------------+-----------------------------------------------------------+
+|char mon_name[20] |Reserved for SET_MEM_GROUP (zero-filled).                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: group allocated.                                  |
+|                  |BUSY: no free memory group slot (the firmware-supported    |
+|                  |maximum number of groups is already configured).           |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MONITOR
+~~~~~~~~~~~~~~~~~~
+
+param_id: 0x11 (17)
+command:  QCOM_SCMI_SET_PARAM
+
+Adds a monitor (a CPU subset that votes within an already-configured
+group).
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpumask    |Bitmask of HW CPU IDs assigned to this monitor (must be a  |
+|                  |subset of the group's cpumask; limited to 32 CPUs).        |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier the monitor belongs to.            |
++------------------+-----------------------------------------------------------+
+|uint32 mon_type   |0 = IPM-based latency monitor, 1 = compute (stall-only)    |
+|                  |monitor.                                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Index of the monitor within the group.                     |
++------------------+-----------------------------------------------------------+
+|char mon_name[20] |Human-readable monitor name (NUL-terminated, used in       |
+|                  |firmware log lines).                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: monitor created.                                  |
+|                  |NOT_FOUND: hw_type does not match any configured group, or |
+|                  |the firmware-supported maximum number of monitors already  |
+|                  |exist for the group.                                       |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_COMMON_EV_MAP
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x12 (18)
+command:  QCOM_SCMI_SET_PARAM
+
+Configures the common counter IDs (instructions, cycles, stall, etc.)
+that the firmware reads on every sample for every CPU.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 num_evs    |Number of valid entries in cid[].                          |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Set to 0xFF (sentinel for the common-events case).         |
++------------------+-----------------------------------------------------------+
+|uint8 cid[]       |Array of CPUCP counter IDs indexed by INST/CYC/CONST_CYC/  |
+|                  |FE_STALL/BE_STALL. 0xFF marks an unused slot.              |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if num_evs exceeds the        |
+|                  |firmware-supported maximum.                                |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_GRP_EV_MAP
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x13 (19)
+command:  QCOM_SCMI_SET_PARAM
+
+Configures the per-group event IDs (cache miss / writeback / access)
+used by the IPM and write-back computations for the selected hw_type.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 num_evs    |Number of valid entries in cid[].                          |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint8 cid[]       |Array of CPUCP counter IDs indexed by MISS/WB/ACC. 0xFF    |
+|                  |marks an unused slot.                                      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if hw_type is unknown or      |
+|                  |num_evs exceeds the firmware-supported maximum.            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_IPM_CEIL
+~~~~~~~~~~~~~~~
+
+param_id: 0x17 (23)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the IPM (Instructions-Per-Miss) ceiling for a monitor. CPUs whose
+IPM falls at or below this ceiling are considered memory-bound and
+contribute their cpufreq into the monitor's voting pool.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |IPM ceiling (instructions per cache miss).                 |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_BE_STALL_FLOOR
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x19 (25)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the back-end stall floor (in milli-percent: 100000 = 100%) for a
+monitor. CPUs whose back-end stall is at or above this floor are
+eligible to contribute their cpufreq even if their IPM is above the
+ceiling.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Back-end stall floor in milli-percent (0..100000).         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SAMPLE_MS
+~~~~~~~~~~~~~~~~
+
+param_id: 0x1F (31)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the sampling period (in milliseconds) used by the firmware update
+loop.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 sample_ms   |Sampling period in milliseconds.                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS.                                                   |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_MON_FREQ_MAP
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x20 (32)
+command:  QCOM_SCMI_SET_PARAM
+
+Programs the cpufreq to memfreq voting table for a single monitor.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 nr_rows    |Number of valid rows in tbl[] (must not exceed the         |
+|                  |firmware-supported maximum).                               |
++------------------+-----------------------------------------------------------+
+|struct {          |Per-row mapping. v1 is the cpufreq trigger in MHz; v2 is   |
+|  uint16 v1;      |the resulting memfreq vote (MHz for DDR/LLCC, a level      |
+|  uint16 v2;      |index 0/1 for DDR_QOS).                                    |
+|} tbl[]           |                                                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) is      |
+|                  |unknown / OUT_OF_RANGE if nr_rows exceeds the              |
+|                  |firmware-supported maximum.                                |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MIN_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x21 (33)
+command:  QCOM_SCMI_SET_PARAM
+
+Clamps a monitor's vote to a minimum value. Units are kHz for DDR/LLCC and
+raw level index for DDR_QOS.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Minimum frequency: kHz for DDR/LLCC, level for DDR_QOS.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MAX_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x22 (34)
+command:  QCOM_SCMI_SET_PARAM
+
+Clamps a monitor's vote to a maximum value. Units identical to
+MEMLAT_SET_MIN_FREQ.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Maximum frequency: kHz for DDR/LLCC, level for DDR_QOS.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_GET_CUR_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x23 (35)
+command:  QCOM_SCMI_GET_PARAM
+
+Reads the current target frequency that the firmware is voting for the
+selected (hw_type, mon_idx) tuple. The response payload is returned in
+the same buffer used to send the request, overwriting it on success.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+|uint32 cur_freq   |Current target frequency in kHz for DDR/LLCC; raw level    |
+|                  |(0/1) for DDR_QOS.                                         |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_START_TIMER
+~~~~~~~~~~~~~~~~~~
+
+param_id: 0x24 (36)
+command:  QCOM_SCMI_START_ACTIVITY
+
+Starts the firmware sampling and voting loop at the configured
+sample_ms interval. Has no payload beyond the QCOM_SCMI_START_ACTIVITY
+header.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: timer started (or was already running).           |
+|                  |GENERIC_ERROR: events not yet initialized                  |
+|                  |(MEMLAT_SET_GRP_EV_MAP not called for any group).          |
+|                  |NOT_SUPPORTED: invalid param_id under START_ACTIVITY.      |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_STOP_TIMER
+~~~~~~~~~~~~~~~~~
+
+param_id: 0x25 (37)
+command:  QCOM_SCMI_STOP_ACTIVITY
+
+Suspends the firmware sampling and voting loop. Has no payload beyond
+the QCOM_SCMI_STOP_ACTIVITY header. The configured monitors and freq
+maps are retained, so a subsequent MEMLAT_START_TIMER resumes voting
+without re-programming.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: timer stopped (or was already stopped).           |
+|                  |NOT_SUPPORTED: invalid param_id under STOP_ACTIVITY.       |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_EFFECTIVE_FREQ_METHOD
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x27 (39)
+command:  QCOM_SCMI_SET_PARAM
+
+Selects the algorithm used to derive the per-CPU effective frequency
+from the cycle counters.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 method      |0: const-cycles method (CPU cycles / const-cycles, scaled  |
+|                  |by the cluster's max frequency).                           |
+|                  |1: legacy method (CPU cycles / sampling-window time).      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if method is not 0 or 1.      |
++------------------+-----------------------------------------------------------+

-- 
2.34.1

