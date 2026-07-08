Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C47407CC7;
	Wed,  8 Jul 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502435; cv=none; b=fA6rz5ISaedeVCWfwnDgXvZ0LkG4TuieODP1ut2a7O5J/GceefkaCKDvT63R3nGFnFsY5joagO8UkLWOht3sWN8sEJ75aMFf+aLzRfpb05dSdhEJnktFqYJcThfz0J2kwCeCNpg2FUg4WSnqn/T8NmB2BVojYdSp6kywnB5/Apw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502435; c=relaxed/simple;
	bh=c9AgtkNavzZZ8qkzuCtUIsyqaU8piuUpRM/uY2JQwPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjJfB5Ub1DG3cxOQnFQnEaBu5unqbCZlMgt2NDW0zbrqLoljy5a2Ll2Yyl6ZiFTy/nVeErAJ01fzgW/42yhnvtjAhL4OcJIV6l6C3+zt+myJzevoVXydLrQ5KGkzcPzGB+FCV3BpbpPmFzUuQO9uHoPSFGPwPPiaDJ5fX4A8KgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=S79pkMRh; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="S79pkMRh"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66888UgF2781490;
	Wed, 8 Jul 2026 09:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=QYQs7bMjCq3AxrNO0NEiBAj7S6qssf53o0
	77myy4Ol0=; b=S79pkMRh2RInBSuU0dBIKxjFYagzT203u9JBkBgdXuTzPPy1aL
	ag25QNbRuK1iZ1WxPH77v7jwbeffq2GZJzYCczSBut0cIWOTd48X9AM4LnpVIyzq
	mjnLdcIcVuSg7ZB7CcxR4eiUMh6twv6uq7yZ9TKXSZPUkYJ8nOJT8xfIIzkWUtnt
	iYddnjej1xZTKqw7UMuQsodftFcQOBOOfY3YthBsDMdt32/BKCcrB+12nmyZoeX0
	QVtEQp7fUvUnd+kJQNgzMJriYwnMKjKlFDiPv0mxAwpgRdkmOEXCciNFRTyIMPrf
	7tR+ER2axz0ow8+STEGaXYl/lgQ0oA/LkStw==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by m0355090.ppops.net (PPS) with ESMTPS id 4f7dgsxgn8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:20:20 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4gwCGc2l0lz1yfclj;
	Wed,  8 Jul 2026 09:19:36 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gwCHQ1CQWz18W90N;
	Wed,  8 Jul 2026 09:20:18 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v4 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Wed,  8 Jul 2026 17:20:15 +0800
Message-ID: <20260708092017.745545-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JaNXiMPxxRKFA7FTwamNcHbiPgAFZAru
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX5IRIe+N0nSpo
 IY+iow4uWc4ggzlZmTC/yBkfbIQfX7AaWCzgJ0Gnkctd0B7pxck9rbS7MMB1e+gQYfz69UFsRcC
 Wya2CWPapHeHKwGEpJbmv598MSwT0z4=
X-Proofpoint-GUID: JaNXiMPxxRKFA7FTwamNcHbiPgAFZAru
X-Authority-Analysis: v=2.4 cv=POw/P/qC c=1 sm=1 tr=0 ts=6a4e1654 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=1HKclyIHpsRocwtzyY4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfXxfvRdnbml4k1
 vv/jJvB63h4B1u4zoBQ70kVTEbXnMm+OJgTGjyLwT5/pY6ce1pRfuK2Z+8eYeoqQUnfLhvoKW1N
 YigUqfZIANWd9dGTEAUnLamXq9NAl3HmuzdFLuTjXEY64PxP+k05zCN14iCltYfLQWjY5GLq8HM
 MA23fbzoYoOYT0WyP4zGGgWUJzM1YRMrbLGWQtwx8ySzUUgDcnvjx6fQhawqjqD0onFIOhQoYgZ
 uokgaqetokndxNsAb55ZNreepDSKj/riB1adh5k21AkxVCmXwDYZ8Rrw4psIWyGjiaYVQyGwTTu
 WnleZaznx9WQx2D+xYa1LBZOh/sD5sT7u0bxvs7wANoATIUSC17ouQEtW934ehGd2uYRNvcWGH6
 IMFaOUVArG7xlP+EijUPTU3lftPQyZKe+HBRAdcEaUn53FWUMq4ueLkxHNFJxm0SCNt4QKRm/Zg
 gT50WFjT4EPY7w8VY/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080089

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

