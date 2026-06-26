Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B6288530;
	Fri, 26 Jun 2026 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444870; cv=none; b=oWwTj3/QolWuREF+UutkCgMLvYyab1J/sklJ4YHMyBzJFo1JtOIIuUp/kk/1FJ6Bj5C/5BMzgAT5IiM4GOxlTtqJ3YB7Xa/Du6FJXGyZUof/fOBK8m3wZx0Oy32oYOsnVjxwi4qFLhym4m0sDAhAsj36Rz4LqVy4rbtts4xMuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444870; c=relaxed/simple;
	bh=XsBGdvkc62f/VTseiN5qGDVklvO4zm2p8n+0UJaV3Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nX7XSElr4yyXZ1N59zlvga5C9N1Y1X0zzilea1gDWGdG4nyOehcpstlDR6oLPoJxKm3Vw/JkLuMnpboiMv0R5//ZwT5VUDhvgET4OX24duHIk2P8r+ka4jbb6h4Zn1pB5KvRPw1B3VPlgihuza6Zl7/dLMSCPypopnih7RHpY3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=a5sV4Q2n; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="a5sV4Q2n"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65Q2mEih3937176;
	Fri, 26 Jun 2026 03:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=S5a/fY+UjWgPSz+cq2GdW9k/I4965gQ97E
	q6TPuTeDk=; b=a5sV4Q2nMJUJSIFl5ywSsxcwlLTzzWdPqAC52jVBKqisbC6gGC
	8pajAyDpBZCJYGpz0W1VbJ5vd94Iv/ahfeYEaMbDefxu77cYHiLZ48nlM2SdEOH9
	WFHUGi5cuHoVMn1qqeeC8tYaCkj5ezU2ZcfocqUVstBlH3GQUjD7NgOReq3ozLtn
	jWZrghYsKBa+ArMlTkW3JKQOEz0Yf3IWu/n51A+K0oIC6uW50P0EC8FcveVx/GCW
	Cg7I1sZZ+SU/zibtsJIhLdWejgFMJwZEUhAdKQXQYuGLLZs7nrjhAtZoGkVXl1x+
	74PwKeBGeToga/hCAnm06Sn30bn7xgX64BVw==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by m0355090.ppops.net (PPS) with ESMTPS id 4ex66q4275-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 03:34:21 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gmh9l0PNMz9vWQL;
	Fri, 26 Jun 2026 03:34:19 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmh9k69hYz18W90N;
	Fri, 26 Jun 2026 03:34:18 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [RFC v2 PATCH 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Fri, 26 Jun 2026 11:34:16 +0800
Message-ID: <20260626033418.520762-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MTvn2QoFEfZqXo53UjKi4htV-QqIMeGd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX53HLqWzJ86EX
 KPTUdiK+Ci16tSF1e0LqTls93YSdIiuQoaY58UKz0utRmuPHGoqK9xCzwT5m2k06KrC6o+TTfmk
 0OwJpVXhDOzOEJL3DzIUu2mupg9jzv0=
X-Proofpoint-ORIG-GUID: MTvn2QoFEfZqXo53UjKi4htV-QqIMeGd
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=6a3df33d cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=jdbAUWAbH2aiuixtsQYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX5GjSxk5Y9OyT
 E8UdZazgcJ03DLGf5I7z6H1kL0v3xTxPh4ihMdGuCV7CgcVjQYLq7SR/7udG0Wi5G6p6bBBqpmG
 PUC2RP8NJWt5VICXAWlOAfOQvQ8JUhG7XbeP2R8kj7j2vfollCD4Jnk1myathiJGtXF5mKSz++f
 lThEmxACdnGGpawXKnPk7KZkkdMH+rh6+uL9sFfAontSTZLT5SmsLKfXqffoNt2KbsV2+TjBMN4
 hwa3gG3uwOzjQ9+Hs8HSPuowJWF7LsUJBRcDQmG7+7igaaek8fobi8YgVg82UTS727m0oO+Jcvq
 +L4JqSssmYjAfPOuvY07jAc9JnSKS+H7mFJcLg8RriZ95Wg6tXT4TvC59SDVgwjqDfxXhKVyQg/
 m0q4meFr/Hpt6Um2J9veZuMJmq3ppENez9xuSfGWpqV+x74GU0sBQOXPnsBOyihT6IHB3LEqCA9
 O/TKxZMbSIh0nqkAS1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260024

This series adds device tree bindings and standalone DTS for the Lenovo
ThinkEdge SE70 fanless industrial edge gateway based on NVIDIA Tegra194
Xavier NX SOM.

Patch 1 adds the board compatible string to tegra.yaml for dt-schema
validation.
Patch 2 introduces the carrier board DTS with 40-pin header pinmux and
external SD card power regulator, disables unused fan/PWM/spi peripherals.

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

We maintain downstream DTS for mass-deployed SE70 hardware internally.
Upstreaming aligns with existing OEM board contributions (Google/Xiaomi)
in the Tegra tree, cuts long-term out-of-tree patch maintenance overhead.
This industrial platform has a full 7-year support lifecycle until 2028;
Lenovo will keep backporting DT fixes throughout its service window.
All peripherals use generic upstream drivers with no proprietary extensions.


Changes in v2:
- Wrap all memory-mapped peripherals under root bus@0 node to match upstream
  tegra194.dtsi hardware topology
- Add missing tegra194.dtsi include to resolve undefined GPIO/pinctrl macros
- Fix regulator label syntax error (illegal hyphens replaced with underscores),
  sync supply reference in sdhci node
- Remove downstream L4T-only nvidia,lpdr pinmux property which lacks upstream binding
- Fix SD card detect double inversion logic: drop cd-inverted property,
  set cd-gpios to GPIO_ACTIVE_HIGH
- Add required simple-bus properties (#address-cells, #size-cells) to fixed-regulators
- Unify all node labels to underscore naming per devicetree specification
- Correct mismatched 2.3V -> 3.3V regulator comment
- Trim compound SOM compatible string to eliminate un-documented binding warning

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 164 ++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

