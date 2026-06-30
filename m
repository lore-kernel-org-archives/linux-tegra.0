Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788935A3AF;
	Tue, 30 Jun 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811085; cv=none; b=XHFcXPSXZU1hWHge9ADtsLRgF/k7Zm5fa0rTu24MTk6EEfzSCe+ff+L/wQOYJMU90q1zRjGGNMLa470SIMPDYfxLK0LBdOI/VgcHYQGRQ4PFBa2Haud4H9z8oPKf1OgMmlaReLcK/FuzGJSJ4eYssSJOZKARfOPQvzCtlrBcWO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811085; c=relaxed/simple;
	bh=3s/QOz8k9wxpyJ1u9VK/ZYUNlFaOqOF7AAwXjjZGKcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIZDffZWZX2J6efW8hpMwbIYtTxlP2Ke+Djk7vMf5Vz2inK4CHXoTB9vjwL8TWSg5UIiWSlgZJ0SK81fVnAlJSILWN3pIJU+ydT8AAVvlbyNL3z+9wyiX+9FKXFgubPPqXJuJob6wen2WfN9moAYWTIv52qJQrlpb+lUVLrDALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=FFLITHl7; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="FFLITHl7"
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5axL33245166;
	Tue, 30 Jun 2026 09:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=fPK1aMyjeecWtVzAhwi6nBdLvbBO/WB1Xu
	J3AQfm6yE=; b=FFLITHl7zGdOqvRmceFMYM/DpfMj4qbDwY9TcVTnBIZ588i+fC
	J+Atut5JenD0QM0jlAZdGZ/BfOqTH1DN6PAyaOiXdxALhIiyAxiM4miciFTSH0Ra
	v4jMEVwp1eDZOpGMZwUezUQdWzmvNsSZdlHZ+J5Z2WayHELD0etwKKbB491dA5eo
	9TtB9Xz5xJaUkC14CvdwEfqqTKwDAWk2AQx/TaA9BD2TzWtEootHcEVgJDNnhU+K
	hoCvFJ95SaLf1uof3Wwv8X0Depr2KndoL++5qBsYsaSSlp/ciFbEdsM0v45FzVyQ
	lAjDjRwAyTpYDifJTFO4q1a9lnKrkHT2TAUA==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2w1dksmc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:17:46 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gqHXq2hKGzDRDtM;
	Tue, 30 Jun 2026 09:14:51 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gqHc81rzDz1Mmw;
	Tue, 30 Jun 2026 09:17:44 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com,
        thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
        Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v2 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Tue, 30 Jun 2026 17:17:41 +0800
Message-ID: <20260630091743.657388-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HN42lFtMqy1fVR2tj0Sf2XNlc5vUcacD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX5s+QVsd1Cwc+
 VIqiYv7uwTdEJfcEY94Y+Bhe98blDF1PEeG+GFbpHo8aTarG2dAiDch/4T5KZrDL0SsZK99xl4D
 HxiwVabtbq0aE1Ri6L0me/Xnxfvq+qM=
X-Proofpoint-ORIG-GUID: HN42lFtMqy1fVR2tj0Sf2XNlc5vUcacD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX5WcjkbuLVQHs
 yArS9TqMV9Zj9fZGV9Jpmfj+tDL3xrI5ljga1SbGuEsois/RnMUE1ar5wHVtGe2Q/TLimHDCkAL
 8zNSrXRo+kbDGGd/zwWT9w8oa3yaV3m/Gue3SF4QNvZt5hCu4ZlRxZ1lerUgdH4jmOUSsDGWPkQ
 D/RFqZCsv0RGESqqh8kT2TXv/JtaiODNdETrZu+maIxdG7eXSsRh1yEgylFANf6PWX0Uuaag5qq
 PuWG15QqsHFbz6f29sHE4OkY0UaRHiy/5DcwMSsgq0skKzSfJhyOeMunwTVxqUT/eTygzVIcaKL
 qk+u3+POlOAgulIO+7F0+5rq7xYqt35PuOv/wqEYwaWOF0ft1eZ90I0Q41Nfh3hUjCmLoUbM+8Z
 Ncarrcz5C9FPsK1lWQP0pX2XTQnN2jYGjn234t47n09NhqAeAIEnOPFCZvUTEtsTkGrECOhXqJ2
 VqMAEOq+iUlElsgGcYA==
X-Authority-Analysis: v=2.4 cv=Qo9uG1yd c=1 sm=1 tr=0 ts=6a4389ba cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=1HKclyIHpsRocwtzyY4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300083

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
 ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 103 ++++++++++++++++++
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++
 4 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

