Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020333254A8
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134974; cv=none; b=VRw6PubLY7jytxzlIrUWuhKZ/m4cLMKbhrwePB2sKX49f5oF6nIUKrDeSI5h2jGlGSW7yB6LSSL3eOu7hLslzd5T6tg+yCbazHpRxfih7bWkBE9cYCW2U67iMgy2l4AEOwqpEMo84U3A849ijhi2QcIhe2w2HxPo6qwPQ2zh1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134974; c=relaxed/simple;
	bh=erpl9bcOmBPzIvZaPl4rPg0Qghz9qPJsoV1ZQ1A1fWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H2PHIgI75lSP0ErcqdNDUqbLUp2WwAY8aN/woZ5h3eVXEYR8/w68XL9udXKzF2Hahk8D5FXZZJSuQ/7ovyl85JAeu04kO2UUTz1MSbP6ShfPSBTuXOwrQCaxpHaXRVUjflf5s+kFrs/zWLEcUwpEHUa8ssvpM57gDMZCr/IypOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAqcjy+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X13NO1uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAqcjy+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X13NO1uq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wTGk1926229
	for <linux-tegra@vger.kernel.org>; Thu, 7 May 2026 06:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0bYlSt7DWtFV9/30w21jcxKBV6pVHX6j/yi
	YjnHQK14=; b=GAqcjy+UyF2OdNB80Qo0WASGdve03m019NIzIpUkj3xXHgiJFH7
	+5cE8HUCJKFt/xMUjl0tGLwEx+EH3MczqQLm7lagXescsQ0dXzLaijWK+FcqXa2E
	zDdQsqCors/T+WDNVwPAYOMlZvBJ6EzyRZLL9BNs4RCAT4tqBGRn4JVmpD7WwFyN
	jxmOx0ExafeeA+rs4MhPff1Imox6K+cQVxeCDhPLy0MRH4+3oNZWMOjS574zUngy
	q8fRQR7PQguVoIrr6kfoq+zn8fL/sLsMfnHwMPUg2m3joGAdNZ8DpAJz1dY1nmNb
	mMurm5YzYr/iRJnQ71s9S2/p2dloWrqKTQA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g82qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 06:22:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83565161a6eso307222b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134972; x=1778739772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bYlSt7DWtFV9/30w21jcxKBV6pVHX6j/yiYjnHQK14=;
        b=X13NO1uqUll5mt3LhhBiIoISb18kxPSfl4zZP+81XyfHK2guL2XLv8g0zonjeClkgl
         6QkE+vnDjUGVfl4gp1IMKrhKpvqlLUyL4XTzwkA8+B0z71aPop35UMosITr+d601QdWT
         4qz2cDYf5UIL9ovbU+jfQ3S1q3MDkC8cSXPn+X8ZZX7oo0uPfkT/J+EWsguXz5SRdxeP
         lSWXIQgclVjZDx9Y9+8i+L7PYzNymYrIjS7ab9DxvGBeqv9g74xLuvQZk/2MMXzA3m2v
         xDQbE6plJ3K97kD1jJkX9nS6wMvmHkC4834mWV+didxOG1fj9GC8HOhheoGNqSW7OrPM
         C3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134972; x=1778739772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bYlSt7DWtFV9/30w21jcxKBV6pVHX6j/yiYjnHQK14=;
        b=AU8PySeBB88t1TPhngIHuWYCkn2MAESvuIgrA20+AdMoZto5FfSjO5YKKVs4gFJOL8
         wU2ib2fWd1Yc++aqGR8PGWQr92A7/+Zj8TFVOuX0oy/cFANsmFVMcmfou2TpZpUAA5y/
         yuIMzGy0WAWcJCfm/GIS8zHZQ0pGtXa8/eOIjMV4+f+hRbQXb2zWYFfiELicEbHSz/hg
         /R395Fcu0oDjb7oH8ax0lomvThKvXyqFYeGjASvOtMsLPufsd+A4Sxfvrwhq4Qlwn90z
         FI7MhhVDYXpFBYKONei3yEg2nrYoI/14RBKYwTVmud8PZ2yqhmUFpB83cJR7kvPPgZv+
         75wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ReEWW/WhzRIAVSETNugi63mkTQcnL2PzIqV56cN1BZnxkGqimMN1VEYPcjOAhHw/vYVM3eH1/K95CqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kPVRR/TBMBiXvNZE3QiUg/Z04ZaGKfQs3T9GN3DYj7HJc0xD
	6O5yHka8ZmFDetiVevnRUaXkdiQgzUlmTnhfGjf/ptMA6bcADbxJ3zlN7ml1b1wpkqIrso8Y0TB
	GtnPkMVHGn/3exUfSqqlpwEKC3ePfTtyte30b4eaLYBvWimYrh8DOrbZoMIzeHR2pMQ==
X-Gm-Gg: AeBDietnHx90sFYjZJoUX0PShwbQNEwZJ4ccA8uAuHKLxjzenz7jRDmsFxK0oZV3X0S
	IvvNm/cEeQNlBknEXBOZZgs+a6CnmTzk5ii3BbKy6x3pdK5KAhWKIEns/hhLBVG5deXXXn0YiKb
	k+xcsDQH2WPs1uxfJUIR7cZ2D0mFfN0ax2tyGVwdGCxAkFl5/QwmzK7OUeXX8dVG4xLilA/3J8K
	O4tIjfWzd3kdAo+on531Gr6i78kQL1WcFtBlt5iwo/ve5G+lnXBZE6q/9+CT+kyqfImFZJT05D8
	3Rguof3qaJFSvV1QEeyF2JQodpRLZ7f+weP2OlQtu70VQ4UbUsk37/SNY1d8+nMKbJxQzuQ4C0y
	yCeZ9PXgIxz+Rz+3LxmRGyyXgY6jW0sMLkkprDmfflrj6uerUAaEMLZwdAA6ybT91nDslfgtqSE
	tFdVxgdTY3q8zC24Lg2ELIbBdooG/V2LYH8LPNfMOvgXolqHeoY/bR2cpXtw==
X-Received: by 2002:a05:6a00:2986:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-83bb630704bmr1396454b3a.3.1778134971532;
        Wed, 06 May 2026 23:22:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2986:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-83bb630704bmr1396426b3a.3.1778134971017;
        Wed, 06 May 2026 23:22:51 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:22:50 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Thu,  7 May 2026 11:52:29 +0530
Message-Id: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc2fbc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bK4GZpSpkxiEjqyRu_sA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: tu_m42IUKv1n1oYXvrnT955KHeT6VBS5
X-Proofpoint-GUID: tu_m42IUKv1n1oYXvrnT955KHeT6VBS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXxJLuob7tm+WO
 JFucIQHP442pxYm4ea6QkL7o+JuYtgGlFNhn9m5r8UEOT+2m+X9fNGOzT9Kt4aemTXjHrVhZ/Ee
 bache05jr8QV1H2KyRuxns+bkbAv199Qm9SYM72rlUoVH8i1oT3xwueYbWbI7uchY4bWPThFD5o
 xNncQ67jzaF3yVYgXrBzgsZAcxC34TNswSJm/XXv0nJD4Xr+8fnFPXr5loozkXH9LlNf2gCBQGy
 yGVdyjEguKB47mO6IR9IEveCPh46OLPxYr3zwtWneZNSFxLRwtsnAGT7p9e6XAXPrIqj42N1/G1
 CnDCbqi8MkO0MrWNX8n9r0Axci+Rqx0vwXyAPMRL6QFP36NbCkaJtQAEiGAfm42gHBh9Kf/pPHf
 rI7/SWRj6ObEehDqLVyY/16haL/TDRCeS+6jcChLYgt0psvyIsYT9zypcf4hk1AfQj1C8HGnZg9
 S+VScfpQ57dned8zyyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060

The QCOM SCMI vendor protocol provides a generic way of exposing a number of
Qualcomm SoC specific features (like memory bus scaling) through a mixture of
pre-determined algorithm strings and param_id pairs hosted on the SCMI
controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
mechanism to control the various caches and ram is hosted on the CPU Control
Processor (CPUCP) and the method to tweak and start the governor is exposed
through the QCOM SCMI Generic Extension Protocol.

This series introduces the devfreq scmi client driver that uses the memlat
algorithm string hosted on QCOM SCMI Generic Extension Protocol to detect
memory latency workloads and control frequency/level of the various memory
buses (DDR/LLCC/DDR_QOS). The DDR/LLCC/DDR_QOS are modelled as devfreq
devices, with the governor set to remote devfreq governor. This serves as
a way to get a basic insight into the device operation through trans_stat
and provides for ways to further tweak the parameters of the remote
governor.

Transtat data for DDR/LLCC/DDR_QOS is now available in this series:

#cat llcc/trans_stat 
From  :   To
315000000 479000000 545000000 725000000 840000000 95900000010900000001211000000   time(ms)
315000000:         0         3         6         6         6         7         0        30    143956
479000000:         2         0         7         1         1         1         0         3       356
545000000:         7         6         0         5         5         0         0        10      1200
725000000:         3         0         5         0         6         1         0         6      2172
840000000:         8         2         3         2         0         4         0        12      1188
959000000:         3         0         1         2         2         0         0        13       272
1090000000:         0         0         0         0         0         0         0         0         0
1211000000:        35         4        11         5        11         8         0         0     21684
Total transition : 253

QCOM SCMI Generic Vendor protocol background:
It was found that a lot of the vendor protocol used internally was
for debug/internal development purposes that would either be super
SoC specific or had to be disabled because of some features being
fused out during production. This lead to a large number of vendor
protocol numbers being quickly consumed and were never released
either. Using a generic vendor protocol with functionality abstracted
behind algorithm strings gave us the flexibility of allowing such
functionality exist during initial development/debugging while
still being able to expose functionality like memlat once they have
matured enough. The param-ids are certainly expected to act as ABI
for algorithms strings like MEMLAT.

Thanks in advance for taking time to review the series.

Changes in v5:
 - Combining vendor protocol and the client and moving it
   back into RFC mode.
 - Introduce target_freq attr flag and TRACK_REMOTE devfreq
   governor flag.
 - Add basic remote devfreq governor to give users data like
   transtat [Dmitry]
 - Drop the current design that relies on manual parsing of
   device tree data and move those into SoC specific structs
 - Add Glymur/Mahua/Hamoa/Purwa support in the same series.

 Changes in v4:
 - Splitting the series into vendor protocol and memlat client.
 - Also the move the memlat client implementation back to RFC
   due to multiple opens.
 - Use common xfer helper to avoid code duplication [Dmitry]
 - Update enum documentation without duplicate enum info [Dmitry]
 - Update the protol attributes doc with more information. [Cristian]

Changes in v3:
 - Restructure the bindings to mimic IMX [Christian]
 - Add documentation for the qcom generic vendor protocol [Christian/Sudeep]
 - Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
 - Follow naming convention and folder structure used by IMX
 - Add missing enum in the vendor protocol and fix documentation [Konrad]
 - Add missing enum in the scmi memlat driver and fix documentation [Konrad]
 - Add checks for max memory and monitor [Shivnandan]
 - Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
 - Make populate_physical_mask func to void [Shivnandan]
 - Remove unecessary zero set [Shivnandan]
 - Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
 - Use sdev->dev.of_node directly [Christian]
 - use return dev_err_probe in multiple places [Christian]

Changes in v2:
 - Drop container dvfs memlat container node. [Rob]
 - Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
 - using the same protocol number. [Rob]
 - Replace qcom,cpulist with the standard "cpus" property. [Rob]
 - Fix up compute-type/ipm-ceil required. [Rob]
 - Make driver changes to the accommodate bindings changes. [Rob]
 - Minor fixups in subjects/coverletter.
 - Minor style fixes in dts.

Changes in v1:
 - Add missing bindings for the protocol. [Konrad/Dmitry]
 - Use alternate bindings. [Dmitry/Konrad]
 - Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
 - Add more documentation wherever possible. [Sudeep]
 - Replace pr_err/info with it's dev equivalents.
 - Mixed tabs and initialization cleanups in the memlat driver. [Konrad]
 - Commit message update for the memlat driver. [Dmitry]
 - Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
 - Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
 - Detect physical cpu to deal with variants with reduced cpu count.
 - Add support for DDR_QOS mem_type.

Sibi Sankar (8):
  firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
  firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions
  PM / devfreq: Add new target_freq attribute flag for governors
  PM / devfreq: Add new track_remote flag for governors
  PM / devfreq: Add a governor for tracking remote device frequencies
  PM / devfreq: Introduce the QCOM SCMI Memlat devfreq device
  arm64: dts: qcom: glymur: Enable LLCC/DDR/DDR_QOS dvfs
  arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS dvfs

 arch/arm64/boot/dts/qcom/glymur.dtsi          |  42 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |   4 +
 drivers/devfreq/Kconfig                       |  21 +
 drivers/devfreq/Makefile                      |   2 +
 drivers/devfreq/devfreq.c                     |   9 +
 drivers/devfreq/governor_passive.c            |   1 +
 drivers/devfreq/governor_performance.c        |   1 +
 drivers/devfreq/governor_powersave.c          |   1 +
 drivers/devfreq/governor_remote.c             |  80 +++
 drivers/devfreq/governor_simpleondemand.c     |   1 +
 drivers/devfreq/governor_userspace.c          |   1 +
 drivers/devfreq/hisi_uncore_freq.c            |   1 +
 drivers/devfreq/scmi-qcom-memlat-cfg.h        | 473 ++++++++++++++
 drivers/devfreq/scmi-qcom-memlat-devfreq.c    | 582 ++++++++++++++++++
 drivers/devfreq/tegra30-devfreq.c             |   3 +-
 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 +
 .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 135 ++++
 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 +++++++
 include/linux/devfreq-governor.h              |   4 +
 include/linux/devfreq.h                       |   1 +
 include/linux/scmi_qcom_protocol.h            |  37 ++
 24 files changed, 1628 insertions(+), 1 deletion(-)
 create mode 100644 drivers/devfreq/governor_remote.c
 create mode 100644 drivers/devfreq/scmi-qcom-memlat-cfg.h
 create mode 100644 drivers/devfreq/scmi-qcom-memlat-devfreq.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
 create mode 100644 include/linux/scmi_qcom_protocol.h


base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
-- 
2.34.1

