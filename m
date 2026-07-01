Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31033F7ABC;
	Wed,  1 Jul 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896816; cv=none; b=EYz0Jcjn7cob7oARFA/i6aAsxubDa85499H//rwbcTiyLd+YXDG6yoQfpKXXfJWdW+emiDjbqf/qTOnSoH4YrebaDxPDZE+U8eSi20Lop7WRaRAaeWUsnd4V7PgmddMmF7WwyqHIVOE1q44T6LHiOtmsle+EVhKjjpq6HPedLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896816; c=relaxed/simple;
	bh=c9AgtkNavzZZ8qkzuCtUIsyqaU8piuUpRM/uY2JQwPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKi8yB17eWpZY9g/xbzQt6Ys9OB3lWUehoOsNQRZfQ3c0xo4Ey1Q53sLEOaITE02AKslrnGxxaEMlrR/Cvb4YrUbqHP5B96fGbPjNkTcAhUxTDM2YgElynDDCZqViC5vxdMbNTSeYnW3m8RtLy6s0YcoYX2oeV6wkw08Wa2lR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=Qx9HUgUM; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="Qx9HUgUM"
Received: from pps.filterd (m0355092.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618BwEP1883707;
	Wed, 1 Jul 2026 09:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=QYQs7bMjCq3AxrNO0NEiBAj7S6qssf53o0
	77myy4Ol0=; b=Qx9HUgUMRfzF3bP0GxOhS/JNBM+WUfWoWgpWoAL7niAZS32AIs
	D2ewaABXk4arr/kjHkwW6TjTv+vI7q0Kr1X31eX4/e569R05dxdEIFhvfOzhtPYT
	MGIoTn7R/tcQThctUrfBZbuiIg0HVONvF7bt7ttujzPT2o3E8wLZC3r6f8YHI/pE
	aU3WYXgV3f0HBkNRwI1/kpDlwWwAjGzJDn8UuXQYm8387P0GpgqTX0ec1U8YE4ml
	L9qtvapCs79XFx+iDsvSh4ZDWFuLB5xIFlSZa9WR0jR5+FbVcO+I/6H806gn8Ymg
	NhnUDikc+XjMmHysuPEnnuSGeDV7oK3X37Qw==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2vuae78d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:06:43 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gqvJw3nc2z9vWhg;
	Wed,  1 Jul 2026 09:06:40 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gqvJw2FBxz18W7cJ;
	Wed,  1 Jul 2026 09:06:40 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v3 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Wed,  1 Jul 2026 17:06:37 +0800
Message-ID: <20260701090639.669524-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FkhjAxOY7MAL8vuVDDDuj3dB1NLQrWnv
X-Authority-Analysis: v=2.4 cv=T7e8ifKQ c=1 sm=1 tr=0 ts=6a44d8a3 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=rq6KeYSQr_4CDViOXtGD:22 a=1HKclyIHpsRocwtzyY4A:9
X-Proofpoint-ORIG-GUID: FkhjAxOY7MAL8vuVDDDuj3dB1NLQrWnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MyBTYWx0ZWRfX1zr3emId9w24
 BKyU+7uPkx+cp+CAM3+pF0GNbEVqyJ93Td5TTEx49yVAdD+uz+mLtkyyDf/QVtAMHdTRYBy3Hn3
 rh6PSIMkTYZkFoYyrEGHySbuV5NiwXsDCi+Z8IQiym7av3ImdSnkaWvDgz22sK3xFr++HvDuDU3
 Vb+dqGpiiWUZuJn2b5/6bYqbZoZzcnfmoQIhdY30LCIvc1+NJ998MNXmAkpXtogWQAv4pdWnMpk
 osB+yAtJkMPqVrGZfBKkEKQdUp7dXFdX7W+KHcbxdWt08P9DIbKYWz1+oZHuy7+U6X2flAEr9jp
 iTWOe58bHzzZoA62r7E/ZXAbtBushUyQgAn76t2zefFmuR7oMQl3yIOz94BzI4o6IKhDRfyaRbv
 QIBWL7x2GneS5LaecqTAaoSmqKSeGjSdoY375TPuoerYutDpvyVlQ+/HhNOIQsOi8iEWlUr3CRn
 xMVsAeBvGp/RbjiNOGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MyBTYWx0ZWRfX8enGc0IPAdH5
 PpAbEU2cX00mzV9oWLWfKLBD03thcSpvN2kdmFGPxA13QBNBRHLrhoMvF92smft3g5w+Jt+lZfg
 NkGrLWrGNSj5DyrkKcRXYGPAc7zpSM0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010093

This patch set introduces device tree binding and standalone DTS file
for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by
the NVIDIA Jetson Xavier NX module (P3668-0001) on a custom carrier board.

Patch 1 updates tegra.yaml bindings to add the three-stage compatible
string matching board + SOM + SoC, following the existing Tegra
carrier board convention.

Patch 2 adds the complete carrier board device tree, including:
- 40-pin expansion header pinmux configuration
- External Micro SD card slot with dedicated 3.3V regulator
- I2C bus for 40-pin header

All static device tree checks pass: dtbs compile and dt_binding_check
complete without errors.

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 device tree

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

