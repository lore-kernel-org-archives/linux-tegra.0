Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665733B947
	for <linux-tegra@vger.kernel.org>; Mon,  5 Jan 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616093; cv=none; b=N1BjjcTtfXe491kgWpE5aZlGJKmFPxdqd1kA04NBrz0VVrC0KkzNtv7JOtwViNO0NOJCnPyS3Wac1H2LVAFLpAI3cS/WEYVON5wD1CXAao7nEY3Yd1DDCg7RKaLrUg3z5OpQ7Qm3FjzcMhD8FzXnNPcrYmC5TcvRkLtxUZwfwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616093; c=relaxed/simple;
	bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Snc81vIA+ddJTyKIAVIor4L8s0Zfh8boum5o0COJnYN3TH7IreMBfmzlxwkxh3HKk7HaMFe1BdJszLOVTevqUIYu64mvSjFlbtAMaXfRS4ox+3UIhrZo9+N/u804gGn0gLeYm+AKpSAhT+jgcFi5LrWwjdLQp9/hYhXdSh9ARb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPZyalOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjBs1pI9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPZyalOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjBs1pI9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KRo63798532
	for <linux-tegra@vger.kernel.org>; Mon, 5 Jan 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FhnBgqCd894h4xDDyalypD
	S1B5tbKhHsA76XEw2zZxU=; b=QPZyalOnblB4vaPsgrD/LCt8SvD882UV71zW0z
	XdlhiHYZwBkV7qbOm/nIGDNyp1udmWPc/kfJhuFovga4cXZILGzTRMCrnd9sGi9G
	cqpDsVGpjjO6wUbZIegEEwTOGky17bZME8R++zkstSucabaNjDewwvMyAcy5pSbl
	vP8wXu4nQMBeTHu0GeVH9XN8MO07EqDd4LIN3BbaAnE57IAJE/AtaYt4W8e209IB
	OI53NTZVNBTkoU8Yh6A/xWlqDS+Uu6GUT0AfohJ3Cnyv6jz/4hwF37US6bUh6l9y
	qPFVFC2m5lpT/lmtabxI21tm+4/wuCPim44/h0NY6/1++Ifg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hx5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 05 Jan 2026 12:28:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d058fc56so231937135ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 05 Jan 2026 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616089; x=1768220889; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=gjBs1pI9kF3PcucXpNKbejnGRluQ8XbY6TEwzVSzsurWO8I8tRdr2PZVTmIh7u0uVq
         H/o75MT4CLfmSBQPOWhkHNvnUCQSCfjbHRDC7uab2a4hxuSEY8Vo2nvKd0GKKdVe4mYz
         uaPyKP2do/hClgLuCIP1NoTPfMcYpO3XtoEczCzOy70veLoatdc6tDr+h11ic+AlC6nY
         DLOoZTI749msm/BwkshHtomjOD2r4VMDhsbTT3hkbwH5KZVD/aPQGeWvd4lFB7CcC3ww
         Ga7DFRMLv4/1nSIeIL6ZBaa+YJiJNGyhtFKwwTJZ/HNEO5N5qVXSvzRwzPKTlVopbmTk
         N0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616089; x=1768220889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=NrSc6PF1CapxTZXJM0VDzGFisdjiq4ZiVlGywHLwYJwIuaRUKDKkoQ7ekboyMdsbeE
         F/uAhuJhpj2drJXYHrCw/Ei5rAapKVUkydEOtdtXhh9Ci4NvoAuXyt2sPseJ30NpvztO
         tjgvU0jhrdnF34K5bf2i0hKDNO54KGeGALKFV5O1P/Oy/KaLTOywqybmqqf8scaAL06B
         cYlNogbRYQknkO9t8o7unlWJx2Po4ADf6V4HqIZh/3+zfvQyP0e9hKEoMtcei8H9jqw9
         VCyxiMtKyJHwH76HVkppMwsJ8AGxy2EP2fc7ftIEO9YNbCArgH2oTZPyVnOVowEPNCcu
         cVhA==
X-Forwarded-Encrypted: i=1; AJvYcCUYN0eaT+0oPzPQfnGeBNNqH3YScN3nM1Lpp0W2A+ooaCZk1ETgeU4Iil2T3Wya0gzr55oF5OvzyvLS7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpSrg1SOOZhGc/AXWG/WHTkPhMBkxTHXwzARZl4ytPmNyTlQQ
	I9NRa76RTDSJQOyLa0mQlVOsZiKM80pdE3lqlfWg0nNyTtLQF2l9Roic+x3eDDjklwxTFWEb1rw
	tyD5tI+o673xXhq6mbYDnc40EoC3bopAThdS4kjmd5R+t0QO16MJYMdrB3j12zVzw1A==
X-Gm-Gg: AY/fxX6aRDPW+NEJiiougpUhh753DsDkSW4jZB46uWsgu6HU/zLjNPhn71xM/TSMN8S
	ufC7In6zgTKdyuq1OwePRcKzAkHVqx7WPjBt3opSYW/Y30VZfL7b+2J5Eff5ZEl4UCPNFwo30+7
	bTyw27AzkifAKjj9/OVotq9SG4VR2lmEif67MoFxwYzpfp6Isw4ydHmFKAQDkP2UHIADS8HblJB
	UiZDFZezdaMAkwN4LUf+kJeA71EtSWfTg4aQakaG4TjxDx/MbBLopBDYQOlXlsMZbDNajP5SutI
	KN2QEe2J1uU0ZVo6HNPc965hJWYvJjmrZi6KMbCGXv7+/LAesI5GrThG1LC2+6hse/r6nLJaWE3
	mmW6QanKlmX5E8W0kavRAPNIMOESxtRXVScQ=
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391761225ad.58.1767616089423;
        Mon, 05 Jan 2026 04:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET+z4gvln2AUwlbFjFw+MzhBkeuBLY3bqxJej2pC+/8tWtSlxole94SJbnplA8xuBW7zdQcg==
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760755ad.58.1767616088758;
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Add multi-port controller support
Date: Mon, 05 Jan 2026 17:57:53 +0530
Message-Id: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmuW2kC/3WOy24DIQxFfyViXSJsMBm66n9UXQDjSZCaTArpq
 FU0/15IF53msbF0LZ9zfRaFc+IinldnkXlKJY2HGuBpJeLOH7YsU1+zQIUECpTsT/Loc6Wk6wK
 pyNANEUS9P2Ye0tfF9fpW8y6V05i/L+oJ2vbXAmAWlgmkkp1G6nUcYBP4ZSxl/fHp3+O436/ra
 O4K2tqO12Ak6513JpAZbsH2xYR/zfhfgE1gbPSBSTOEBwK9FOilQFeB7gk1RUIi++j1Brpr0BA
 RO2vYdfFO8zzPPxbKniedAQAA
X-Change-ID: 20251010-dt-parser-98b50ce18fc1
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=1933;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
 b=WU8lb1IRlgnKDoA9DoKTUmSQTgI6f7zeHzmNW0Tkt7aRJYhehUZTwlR+K5OXYgJ0gdfAFYhjX
 qSneDuM7UF2AaUjsAqusdejjuvDVr2QpTc2oXVQufADAoi3I1PrM2Fo
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bae5a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k2kXPNx1VYhKFT5-HLMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfXy53B2tLNhevF
 wz0WuVvDnbTBEpNRXl+MqS98iYo4EnYrNl7E9bUYDlzR5JVUqXxn7CkFo2A0rBdPdWrgDWeA8xF
 t00v0lyIQdAK7VJ8VTAYBbUiijFI1rO+yEeiS63kEF1YiQpqH7yCTCUACV/miTZtHBJTCpf+lgb
 EQtZBj1XD6e7DIjXtKBVUyKhhxedJqawfpq01N34vaKWh2V/XoSevs4pA6YwMsxlNOWTRwMKdgy
 eL8GWh3M5Jk4qg70ElaQ5iJ6RQRlIu79whY+ANwF8UF5nsZ+O9aZv3QOe9qs8bUuAZYqu5UMINS
 fqpOvJtfLUsLkdc645cCMl2ssT8CqWXnY72bKOrGkK5duVkNgTPR+2NVeXFcu/B6NJcEGyEikYk
 Ku70JGAjYIfL9Lx8oL2LMUkOQvfB4V4+QFTUzEoAbA10jRkM0C9r77L6RPysHB+slbFSjPkAouc
 1m+3poc7U8JaaU7v42Q==
X-Proofpoint-GUID: kDBn6b0Z89cA25j16Dkgg-SC70h749Hx
X-Proofpoint-ORIG-GUID: kDBn6b0Z89cA25j16Dkgg-SC70h749Hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109

This series adds support for multi-port PCIe controllers in the DesignWare
driver. Currently, the driver only supports a single Root Port with
controller-level properties, which doesn't work for multi-port controllers
where each port may have different configurations.

This series introduces a per-port structure and parsing API that allows 
each Root Port to be configured independently via pcie@N child nodes in
device tree, while maintaining backward compatibility with existing 
single-port bindings.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 168 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++---
 drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
 drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
 drivers/pci/of.c                                  |   6 +-
 drivers/pci/pci.h                                 |   2 +
 16 files changed, 226 insertions(+), 73 deletions(-)
---
base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
change-id: 20251010-dt-parser-98b50ce18fc1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

