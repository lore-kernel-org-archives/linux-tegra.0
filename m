Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27AC3E4C88;
	Fri, 26 Jun 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465241; cv=none; b=NaUVCUyaXj/DKu5ggfLBwpgjZX1REWjsHSAonlihZ9l37GITfA0eKYi7aGFlrrlBmAzDgbKHcQPcaMT6Ly9shshu3F7QBrrkwV0S5lrsA6NBtnICt6HYdGR8Ud3obPp9CoYvrBNIyawyW8c54MYIbO8pi7Eau9nKAzYIhT8NG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465241; c=relaxed/simple;
	bh=rTLWB8BtHsLsEyqyVRcyg0eMPkNbjVtxbdAuxljLwUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POawCJ8Qxqm29wfO8muv8Wy7NjjL9yWh2/UenS2PAYp2H8ODJhYdOkZTvpZlVa2IRwfS9aQbxeTssUnWm1S8KwXmEumw/MqW+cSNHaW9ryEqq/+jr6LbTJb5SpIZ0o9CNtsYIAJF3ugJwnM9qT1EoZDpphaWzuWJvlDr5jBgrz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=ftBEJSKj; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="ftBEJSKj"
Received: from pps.filterd (m0355088.ppops.net [127.0.0.1])
	by m0355088.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65Q6SlZH4060073;
	Fri, 26 Jun 2026 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=ohhoDpMMkLbELWAJtNS4OkhHHOv9JUL45V
	v5DaMNqRg=; b=ftBEJSKjlJSKqwJ0x3TAapDTDrWKfa8IbZKeatR2Om42H43sXX
	z7L+ZT0CH8J6e4QC1sRalVfaeKLGsOIYWzpzqlxKnrLkdZcVd31+zX8C7Jy7MIsB
	vkMU9ZDOyBrHwC12p4DgU3MXJpeqyHnj3NK8hDuVQYucvQ3GurAXyNF0TT0Clu1l
	I2GeRcdgUP/sgW0bFx2xEhfA+N8VFQoZy7pY5Ue4hcyl6Ijpw1VSTkhXLuCuKWx6
	51CADMFU79x0vHlYbzeHX8TtuyKfihwJpkc3N/ZMON8a3HuUz40Eu2K3Pd5YFIcP
	9cQYgSPasMvhXaPJZp/4/TBfzs624AyQl+Cw==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by m0355088.ppops.net (PPS) with ESMTPS id 4ex81s4fys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 09:13:53 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gmqf96WGfzDRDtX;
	Fri, 26 Jun 2026 09:10:57 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gmqjV3xkYzkY;
	Fri, 26 Jun 2026 09:13:50 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [RFC v3 PATCH 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Fri, 26 Jun 2026 17:13:47 +0800
Message-ID: <20260626091349.570091-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bxEvJ6sDXVljKNFx2x3irV7jC7BFjepu
X-Authority-Analysis: v=2.4 cv=QYJWeMbv c=1 sm=1 tr=0 ts=6a3e42d1 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=RP4W769tehEb9jLPIooy:22 a=enxzb0fkQ1n0ENVBIZgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfX6oHq3aOfCfnf
 r1Cdl4Aef820hYZ6HDOa2q2r2IlJXCEAXDWm6FMWBDG1KspDnbshK6cDcBLgzPT2TsmOWmWM2H9
 PoyHmIDkxD9HHwW4/T6s2czKyAMVEfs=
X-Proofpoint-ORIG-GUID: bxEvJ6sDXVljKNFx2x3irV7jC7BFjepu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfX8P7WiPLm2JIH
 IwPjoC3g3NOfYCAJ/YyWzLc0c9l/VUB56/FFJrI1IY30WVejWuaZ/24cnuNmwEaGVLZI3JQDVWI
 MCxWaBseHE7Y2WpcTIOVj9JwzHSqyBfj0bTRecJdnIwaHoEpzQNpdpYREhYe3gGUSDd9V+qzKBV
 eSd+bW2RjjZtm5HsTxlQMIw+/3usS/bQXSOU3f7jXfbBl6jMGPjqd/g/LOXSK0Anl/Vx7FN/LHa
 IItKG8MS0WsFCxso+KJ6vaV9g5n7cGozEZYIFykQKXe74DKU8OoKsjpCJ6AW2B7gQb1YQ5Bt5mt
 y4LzvSX6T5GYp5Xj/Kqlgfe70i+SiKq7y4mebMdbQ+GB5bPeN7uezNkLnAXl9Q3yvkeHqAsXq+f
 wXq+/Z1abIzeQhz3IAvHn46fvT9QOFDDg+x5x9ZG4T8+JhQzqfXm53RxOvjz5YYLYbZ1l/0LHjj
 KiL6JpTDEaC0v4Rsh4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260073

This patch set introduces device tree binding and standalone DTS file
for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by
NVIDIA Tegra194 (Xavier NX P3509-0000 + P3668-0001) SOM.

Patch 1 updates tegra.yaml bindings to add three-stage compatible string
matching board + SOM + SoC, aligning with existing Tegra carrier board specs.
Patch 2 adds full compliant carrier DTS implementing 40-pin header pinmux,
400kHz I2C bus, dedicated SD card 3.3V power regulator; disables unpopulated
PWM/tach hardware per real hardware layout.

All static device tree checks pass: dtbs compile, dt_binding_check complete
without failures.

We maintain internal downstream DTS for mass-production SE70 hardware.
Upstreaming follows the same OEM contribution pattern as Google/Xiaomi Tegra
boards, reduces long-term out-of-tree patch maintenance burden.
This industrial platform has a full 7-year production support lifecycle until
2028, Lenovo will continuously backport DT fixes throughout its service window.
All peripherals rely on generic mainline drivers, no proprietary extensions.

Changes in v3:
- Fix all Sashiko static DT violations:
  1. Reorganize pinctrl, put all pin configs under pinmux@2430000
  2. Rename sdhci@3440000 to mmc@3440000 to match upstream
  3. Move pwm-fan disable node to root level
  4. Remove disabled overrides for non-existent nodes
  5. Drop unused #address-cells / #size-cells from fixed-regulators
- Extend compatible string to board+SOM+tegra194 triple format

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 124 ++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

