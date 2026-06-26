Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B343EFFAE;
	Fri, 26 Jun 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471395; cv=none; b=lv0wSRc7ekdEoks26cmvAnEv7Z3V/uYmBZwgpeSq5W7W6dZwjagur+b60FtGFu0FsGgrhM9Kbe62bIA+knQoXkOFcXpiecALQNIle0xVUcmxLtfcnhw6qW7IhQgjF8Lnicv4KyRf+ZFm/lmeMLFygcKuARCn1tkHbKUSTrrGaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471395; c=relaxed/simple;
	bh=8PPrTCdfrFNEakpTumYB/TGCwTL0/F4Ax/3/3cLNw9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4tarwC/4FIeWCk24XGNknEb7VhYhVmW22IQf/kmTEAbijlkOFmNj+FoXXPqu7TsSYSakaWUKjOIpoFOWikey4ev8Cs0xIHSI5GS1nvxdEBVMKtybBgqKGFdt0D2t8tf1uYeRLG3y/CtaOJ0xVEsqKXOCgzyVRtWP1kCHYhStXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=iFvOjpwz; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="iFvOjpwz"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9vfIx3365652;
	Fri, 26 Jun 2026 10:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=EHOP+RS+5TnOgbc5IsQSFpNTaRU0oOkewb
	sLFwiOl1I=; b=iFvOjpwz8gLkgMrps09NjJ61orUqHNAZxMo7bPjBaII1C8ZE00
	O3DsCm3z4GmOnAWmIcE3AI2IeV98MtVXnfmBnu+e70p9XHHk6guJ3wGgRupHkjeH
	tlOrFqjJg2LQdwPaME7iGsoUCTEwvbY/vqZXHD+6cc1/+TE3QTvnAF+DoIHmmZzp
	R+94TOnD8x+TyxMi3fnShVKDxnpfMB+pj5/EgRzVlLCt+iIlLWnLL63zw/lM+BRI
	oEKiVF4y+isSJcaZg1XEEev6oKxusRkhtVaL6Yh4v8rRPW4r+OegpfHf26xpoCjX
	9DAVBQtiVqXxHdB86b/FlqflsKLmRorLLonw==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4ex8mhbgmu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 10:56:28 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gmszt2L8gz9vWNf;
	Fri, 26 Jun 2026 10:56:26 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4gmszt0LSxzYlvJx;
	Fri, 26 Jun 2026 10:56:26 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [RFC v4 PATCH 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Fri, 26 Jun 2026 18:56:23 +0800
Message-ID: <20260626105625.600156-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mLIKWaYiwfcWxSaT5swghFSPBJk09wCr
X-Authority-Analysis: v=2.4 cv=LbMMLDfi c=1 sm=1 tr=0 ts=6a3e5adc cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=GBHhXPHbHKp8qQt-p9gA:9
X-Proofpoint-ORIG-GUID: mLIKWaYiwfcWxSaT5swghFSPBJk09wCr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfX9OxtbdHWOJj8
 k5+vGqNp2N6TY7rCZh+pbDBgLfBUs8Xvb5FGn9pB9zYtPRGYEv3FiIDGaV2QA/zMmEfKV1Sy9fF
 NZFVAbU7AkDzNbof6H59mOuoT+PSf9x4PNj3YiHHxmp/iGlYPKOGN5uuk9xm28MvRSWIXkRZ/Qg
 PzDp64uBUhHdgS3OhbsZdheYPN3Aei07WohmrIIfKPNr4ORAfP/JJwzpzYN10yW0Jt2eZogK9SC
 Pcms82cJOb5XBzJlLY2m6h5Zvnwh4InvasIk4Cbu+jlMo+2lcaSQNYHVVzBJAQYDdAArh4dMj3G
 juRKbLgh3x8lnEofVbfM1FBJlXEEpwD4VCTJ6fcilbMmiyjpHd7MUxBGFtTvEpZpiSN+pXAu6u1
 u4jvVQGSdjDE1cccEqijBKsnqJZuRWH6H9sStulA56lQ7XOaqchrZD+NW1mEuXDJ71juiHqpwk4
 jmdep3A7mquNfH6IuAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfX5lAsGh2seAgf
 yBe1gJycGpeA/l9iBjxHQeblot9MFQ/pWKdNgHByFLEZ86mHcW69JAIbsBNXmU1pb33cMvBqkdj
 B8JgcXiOq0GCty2kx/F9Z6EslhXCy04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260088

This patch set introduces device tree binding and standalone DTS file
for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by
NVIDIA Tegra194 (Xavier NX P3509-0000 + P3668-0001) SOM.

Patch 1 updates tegra.yaml bindings to add three-stage compatible string
matching board + SOM + SoC, aligning with existing Tegra carrier board specs.
Patch 2 adds a fully compliant carrier board DTS implementing 40-pin header
pinmux configuration, 400kHz I2C bus, and dedicated 3.3V SD-card regulator.
It also disables unpopulated PWM, fan, and SPI peripherals according to the
real hardware layout.

All static device tree checks pass: dtbs compile and dt_binding_check
complete without local errors. Pre-existing upstream DTSI warnings are
inherited and unrelated to this board addition.

We maintain internal downstream DTS for mass-production SE70 hardware.
Upstreaming follows the same OEM contribution pattern as other Tegra
carrier boards from Google and Xiaomi, reducing long-term out-of-tree
maintenance burden. This industrial platform has a 7-year production
lifecycle until 2028, and Lenovo will continuously backport DT fixes
during its service window. All peripherals use generic mainline drivers
with no proprietary extensions.

Changes in v4:
- Fix pinctrl subnode naming to comply with tegra194 pinmux schema regex rules
- Rework SD regulator implementation: remove invalid simple-bus wrapper,
  adopt official NVIDIA P3668 regulator naming and add regulator-boot-on
- Fully comply with MMC binding requirements by adding bus-width = <4>,
  disable-wp, and no-1-8-v properties to SDMMC3 node
- Add explicit spi@3270000 disable override to align with commit description
- Resolve all remaining Sashiko medium/high static DT violations

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 129 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

