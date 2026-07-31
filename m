Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443603A382D;
	Fri, 31 Jul 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491421; cv=none; b=fpxCY9vXFcbNq/NkbkWnhWRa9f3JQS8ewtH4c5iVKYq0m1/16N67FQo1yUGqYRH3GMqITq9dTwZequOFhYS/bIIAgt5wf355KFONCZF3YafUv9PNrxyhfVrsFQ8VHqUXhfck7pWZff9UIvVFU5AB0Fspai7FZelNQVfBVtdWZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491421; c=relaxed/simple;
	bh=LcddxndE9FZZfwTHnKmC22swqjOhJVfVV/kWKlrAc/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZESh7BWdwUziOXpk9k8uM+lvJq1niFTy242RiO/hFsVGe5u6EwhF/xQofTAl6Mwr18zodfICSRezWyHfuRxpiA5e3JeVnGy+nWZb6WpYevJrMe3EZjWMPmu+VO/KXCa7QN/lbvf6VQ3Z/eTYh+mNtyo+80C6flNm2C+rGzgeZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=S2k+HAIp; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="S2k+HAIp"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7uwJw1896379;
	Fri, 31 Jul 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=IM8j0qofXTcKNQJ9GPA8wbwlhNubVF/wI5
	JBbpu0hn4=; b=S2k+HAIp5y/oxDA4ouiVbkANewXJugu9uLg9aK78Mxz4gDlkTx
	A81k+Ld8Xb5iSyHYHXKuPPLNorqByZBCRDdVd+yIZObHvBNXVBYceVREjea8y1dg
	0TovU8a/t+5sXCLV/u09jANPc++OYMNi+LX61uaaHA++8J28s4baYG7btHU57oo5
	UZBemApOYRi6w62AuSbN9Blm8oygqgM9UThHOCWXia+LwhKK7ELfUZEPJZ62ns+U
	uY9swihO/41t7fhjzk/a5fg1TQVxX8g861AJBY5A1m4e8KlPQZTiL2sw4iAwD6Yo
	rz2+yNmWZyV3YvYb8mkgNJEWQNW7Apbd3qpg==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fn8kg51v9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 09:50:13 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4hBLr5078Xz1yfbXp;
	Fri, 31 Jul 2026 09:49:08 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4hBLsG0N10z1wCKkQ;
	Fri, 31 Jul 2026 09:50:10 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v5 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Fri, 31 Jul 2026 17:50:07 +0800
Message-ID: <20260731095009.959666-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX+9Wx4J5nZ8AG
 KJ8Uph8xSQA4bhFDSdqh/CU1ByqjuW45log66B5/wboZ6xUVb+I3V7VertIyp6ZZdIiuFE6CH6v
 80oiUer1dMhe9bGNvrjXemXYmL0n7FnfU+O9Pg9QwsmKNcVm3zIfOAuB7A7unfIhBjmGOBtTLp8
 MH+me35ZX/LfLUTqnZmbKfOWkm2IifWIb9oSuqaTVfalXlygPhcSrO2bojZWeGe3Y30dyycBuq0
 Qi6QWdQBR1XWnpbVbPM6eIr0fp7S1hypWcqw51L7j4WUq/1GdtewhEoZ5qKCR05BHRPKOulLTuj
 xL8kbzFEnIRXsmC7qTPmjaxgETLzlsJu6LA2oW8R4I0woMniFf1jMjMn2WtCtDzuvnblY8j6TUE
 FfauI0v0VPVHGQhBHLGqWK5DeW1+pyeP1KK2xNrIg7Bco5D09FL+Sis7el0tAIiMsM3dCyH+28i
 GCiU0nGp7wSPcD2GvkQ==
X-Proofpoint-ORIG-GUID: NoLB2AVYNv84TBb56scy9rURp1R6MXG4
X-Authority-Analysis: v=2.4 cv=VJvtWdPX c=1 sm=1 tr=0 ts=6a6c6fd5 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=1HKclyIHpsRocwtzyY4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX0fqiAbHIuN0n
 s/IOKWwjp4YgOqYue8Vwzguu5s/Wz8yd01v0pHiBsy5sices/ACfmj4AU+Cv+4rx23QoMOzzwBO
 691cvsY13+iaB8/gpXYw0GIDJwuHHF8=
X-Proofpoint-GUID: NoLB2AVYNv84TBb56scy9rURp1R6MXG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310072

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
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 111 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

