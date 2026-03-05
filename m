Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22527280A
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691654; cv=none; b=Z+rw3MwJIxzlLkGhjJxnzqd4RZ6dZF5wI/hjbsIgF68mUWPScRrEV36eUhiR+cBV3w34WQUenU/C5/SPZU7NHVXTio4+AYVbMWQpNQwPukNIPquTMYVVUnLd9qyJPlroaJ5an+3jmdLjGu4qptFB7euMau/hRpDPs5cqtifsujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691654; c=relaxed/simple;
	bh=pEc/tNwHOsDbqggAZEgpmAYE5s4SuUbHuqybzx9zRvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=azdmrIJR6/AXC69pdKr5nafr2Di6Fr+g0+baJsI2OdVRvurPWpQkKU2lWF6X/fcJFbZtWZxFbi33WsSifq2t6NrV+lxm4VSa9jfjMFhAJBamIyouriq59CJOZxH1KwKXE2O7S+/VzRuHFNib/9MBO1yw/mtDrLor0RowR+Rv14I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AD5xkbI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYhNMk3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AD5xkbI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYhNMk3Z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BZSs2665149
	for <linux-tegra@vger.kernel.org>; Thu, 5 Mar 2026 06:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zvXOPXCbQlaXN8adhJ+Ra5
	kF6Tz5uWjU0aflLiqlQuE=; b=AD5xkbI9PgWUA3qQDSOVYh7+ftEHbxze0S45yF
	v+S+cN46Y+BxytsEZczdxVlWr9L/TsdO4+K/vepzinK0cJAPVrHTVN+S8+YuuQdy
	WTEjkVaAuUpLBbWaTMPOUTJhtwt6R/d5oSDp+Cn+FGw3Zm/gg6cJ0dPqxmgfoqdT
	Jb8aZGJOCkIcTwZuZmmYEzqGb0Y1H7kdK6zbfMGixNnmKYafidNyygRJFWlusOzF
	IUTMHH7XBf0IN6wGRgYXnk9vurPMi8/KV3m1bcsXDxEHG70a9m5AvOQHroZGinxB
	swa3Veeq9QbfhGe/0AYUzFVE6WFjJ1IBZpSJ/gZIuywdh1dA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb1ges-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 06:20:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so8720910a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 22:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691652; x=1773296452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=KYhNMk3ZH+Jqo/IDboj7dPdcHnDJnLnERPnzw9NbItD06R1QGKCyAAjjbvZPYyTZRR
         qOp4Ep+jiBbSGIk/Astyq+LfuCM8E51sdKGwEKjMyID6w0O5X8xZjDS18SbTb0YYbZof
         N/2Yy9+wmz0zZH4qNWlhA/mn2Syx/9uktzXy7FPEkJst5EB9JIo6lzPAmOqbj78sI3SG
         XqITIb18XSLNGQ6rpdpHS2IaeRtQQWhSaozg/LzPYLaE9eYuaMaQVTf1t64tOpmbj27f
         TO7oOdoXMMN7pGB/6JnrxAijqHLDgA7lytfYkvpP52DU1YO7Bpz5as07qGzKvp+ZuxxD
         T31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691652; x=1773296452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=f0RSFzg+AESGugd2WAP7i7YuZKbT/KlNqsx/SWSPXgwvfBEHEzvPzquN6rS3877cBF
         jlQskUtCsWXRq8xm9m68F3G9LFMioEIZBvw+eoVbOFQmDOXmwYW6ikDQr0DBbKIPo/ra
         IUaeqEYp9MJpw3vW/CUpue4UMGyA0cTUYhQHxSQWzej9c4HQaL5X/a8iKsbn7anGA+iz
         4w9N12tnemHPK87hXfC62mLNe/HdhWrgJ+sLRmPxlpb+PPc2HdpJmkDMHSN9a3IYwTz4
         8XgRea54fAviKNqZht+GDVw1Z/Fq4bftekRTG1gsF/e3fvIqNU+CP1GABze6Q71gMMu4
         oN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYDH7PFp4E4PK+QqcmUrpjhA/8eSKLbUL7YLwa528sT+o3ZRBynHFIXX7BWHS24cPjHflHANiTUu8DCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjyifbuIU+umm6AS608qOYDVUJZqh5o14AXuenXee9wu70rXuJ
	C0Unw8KRrBboxRV6eZw8V9jUuMZi96hxl4PvgBN84lPaEypA7BK1QsfSmYYN9ret83fWdQhE2aX
	Ve55dCjzgRuUA6ZocuCmWmw7ztrY6Gocwxp2BSHnE+owdO9oSFGydM0S8N4tl7uDCnQ==
X-Gm-Gg: ATEYQzzhnDC00jygo6p9n0jXUu/CC1HN5ss+c9OVDVfsFT85Y1lrtCBKrqUuM6RqsRP
	sOI+RLqumYFslnle3Roiuup7tDzM581+fxKwrCLnLvAbR2ya7btI0tEpb9wBhNDlG5bGfOoVtbq
	nAZuEaXhNWi3t6el/8qyCTmsASd6t9QJSMR8+TLYqUCtFG+gXbMf75GonGR78XxnXUVXOG3MMcr
	F54MJAOX50Q/ZTMra2zDQmjf1Hi6ZBIiSw9mHScxiKvYO3j69XJdy4DYkviAi/3KwPlm2CPL1E6
	xwkmJoy6DZWgFoTPS9Eky2HJQTCJuJLfCthJXEZSLdUNSmd5VVfbQXz0NeJHzwu2xf5nYF2VrJH
	tyRixIcPlpcO2vVBPB7wc9I/n6svnq9RBv0JTham0b7KVkPQ=
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234070a91.13.1772691652239;
        Wed, 04 Mar 2026 22:20:52 -0800 (PST)
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234022a91.13.1772691651634;
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Date: Thu, 05 Mar 2026 11:50:35 +0530
Message-Id: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMgqWkC/32OQU7DMBBFr1J5jSvP2GPirrgHYmFPJtQSbUpcI
 lCVu+OUBSFQNpa+Ne/9f1FFhixF7TYXNciYS+6PNeDdRvE+Hp9F57ZmhQYJDBjdnvUpDpXSoUl
 kWKDpGFS9Pw3S5fer6/Gp5n0u5374uKpHmH+/LABuYRlBG91YpNZyB/dJHvpStq9v8YX7w2Fbn
 9ldQV/bcQ0y+RhicIlc9x9IazABsLecSJB/g/P8Eb8n489mnJud55iErEC6IbBLgV0KbBXYltA
 SExL5W9NnMKxBR0QSvJPQ/DV9mqZP/33nPNYBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=2442;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=pEc/tNwHOsDbqggAZEgpmAYE5s4SuUbHuqybzx9zRvo=;
 b=t+bdKd9rpg456k4BQVhND8q7IgX2Q/VxxdegM8QDbAtfYkujEJcMPuMBnFidboo8oaraGHI+l
 fGr4D6tEANDBwAWNqyzdV633zxWT7xdh5IMhQ6/B5lDsMAcYO7jFdNS
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX8MgHFDGT0mi5
 d6ccIz6ch6AoE4b6UUJUci3UDD4aug1+9v9aPz06DZxAFWHcq3lIRdUk0q5hRjCIT1AGo1k92Km
 ME1BNjE9GqxhM+U0jH3X+6pX6kmXn0lD3D1SaZuzmoLqdSlpy45F4VRmcFTDe/de8yuGc/G8YkT
 VTuIgALlLglIWFc4X41NE4AzdS68zKIUSOQcFTvZMm0iIogDjM0Qle8zFYeLRkEWqZfVxQHdJnx
 gaFpUA0ZS2zRHQtUOilWtvaxYIEuiwSge7LdmYUinKddDvmOFNkFlsm0TGN/ESAzK96PqlT/EqE
 TfMWUvCH/lU9GOwc4p6DfhjMgt87PK7LpUEDvvZ8ffNvIzpxMyO1TmeDdKvgudHlWfcZzfFiNPx
 Ry9JFI2eTFNHMvYfsxficQQ/iz6IUIU5upvNQD6B6To0dKEkcivYZnVkS6+8hMFQ4DlRXKz1j9z
 oyiiiDB2jmO9t3tCZSw==
X-Proofpoint-GUID: YEp0F4q36v7vDD97lFlWtvnnBs3oyMUr
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a920c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s_SlZju52n3xP1ZgpLgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YEp0F4q36v7vDD97lFlWtvnnBs3oyMUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047

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
Changes in v2:
- Fix error code preservation in dw_pcie_resume_noirq() to return actual
  error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
- Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
- dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
  failures fatal for now, add TODO comment about making properties
  optional later (Mani).
- Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com

---
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
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
 16 files changed, 232 insertions(+), 74 deletions(-)
---
base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
change-id: 20251010-dt-parser-98b50ce18fc1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

