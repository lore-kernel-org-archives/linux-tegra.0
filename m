Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03453B95FA;
	Mon, 29 Jun 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731475; cv=none; b=rGGuWo/1Wx/svvL8EhP2rn0ohudzNTxyLHmMvD3FdG7o0yOvLdlcuzDzcjJLhOKpc6OJQrcJ9CY1H0rcqu9AitEsELAV47Ml2by3lVwhAFcmbyNAng085G5gjVJs+uM7YGqLgek25j9l1VBS7nbd5/xUBNG9pcIA9rix0VbEjJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731475; c=relaxed/simple;
	bh=UUArWvFfqqxCcEGg/oMKeeDMo306Ov2MEe1bAUsNuJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cseb+59CJ3T4pKRXX/7vbdSTZpWfjGHQF/GrK5j3jezaKu5oweFswJNDChsAxKMUx+UD1ZwrE6NE2wWRTCP31JtEGV6OKYewqit3ZQS/vkE2cf9Nu63ro5i83NvIE+gOZ4o8tXwd5DF8p1gjFZRsDAKP2S+h8UvRhpUwgf3YlZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=Fwlto9dH; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="Fwlto9dH"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASbH51266815;
	Mon, 29 Jun 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=cEJzA86S3/soEhF3WOSMaIyvDrHz9QaBzP
	CooIbO78c=; b=Fwlto9dHEhGEPmIFlRUNo4a0K3rN0fRXtbkpGU7TD79UA+jyAk
	BKNPmcJQ8yuGk9Ve58nggt0L5JAv5vV/lVpiA5YWZPpQ+qSf+B4uzzbFJbnrzjZm
	6uL3JmgRfV5fFyu2KuhEf0X9ErGGKIX1ssW/8JUyIaI0TBgZj57sFN7D+plB3Zyo
	t0BLiOCj5G8q7Gx1+vhg5lWNaJv1DgvmIXbvPgeJN72/6t1sM+se0xLOGms/3c1L
	/iJZMYv7yt9PctbmBYXJ7k9SNv1gfJo8uEObN6XooiIBLfP6eRziQK875UfprLT9
	fDc330l9Y88OfEF8xftr+sLexSiSacA78grA==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2syet0bm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:11:07 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4gpk8l1FgPz1yfcln;
	Mon, 29 Jun 2026 11:10:31 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4gpk9N63cqz1wCKkG;
	Mon, 29 Jun 2026 11:11:04 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v1 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Mon, 29 Jun 2026 19:11:02 +0800
Message-ID: <20260629111104.645771-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0aTxl5TvnUp8O3s7vCBOH03XQ0-aeA2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX3A+NmE9JxOtw
 23x7uBgfUBevX2A1ahY5Isjxf5+ptdK8RZWzvdYJHa/oOLCdyT3jxgp6TtdFkXz0AVuw7yQsupX
 kgtQ0AkipLDZ7DQx/IedgHiO7I3CsEgEBcAFO7gxjK6VWpCzjFS3ToQzsUDSdKxMzRixS+SMV6k
 J+PJB79/OOg/H/D9rZVKNSbnRlenEsKHgccyvS9PCjxqIdIto2Zd1oOpndRgJXQYZY10se1xznF
 OP56OV8D3YSpUnbenMpVLAYQUpuYzlWcb3FzUZoVj1GcGKwBF3HowDqnKggI+qmCZv0YH3DBY2R
 JK1/Lsf4CgN45FY7c6mpJPyLxxf0/HA6WVxiA1pnHyb0ThTCkzJ9E203UCIyP1BrNddFAFzAHgp
 wpM1IhmVDqZhgbBLkaGdkIKeAG98OixpN6Hi2X62iR4zNHAKox6WhZWdb8g7JwA0j1SIZjuEsVM
 ZYlDu8kWjTYcLB2GtPg==
X-Proofpoint-ORIG-GUID: 0aTxl5TvnUp8O3s7vCBOH03XQ0-aeA2U
X-Authority-Analysis: v=2.4 cv=S8TpBosP c=1 sm=1 tr=0 ts=6a4252cb cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=1HKclyIHpsRocwtzyY4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX0I2CKJB5+qk+
 wXx4dq0zVayl9Y0AI+W563swvj31P4p5CYBhbTH8Q0kWBAEb9MkReoJ+TYlCdSGyPR8GpOXV6Zo
 rFn9lCMOBp8xMHA7VC6UOanL+/kP4kU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091

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
 ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 106 ++++++++++++++++++
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++
 4 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

