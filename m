Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7A78F2B;
	Fri, 26 Jun 2026 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782447386; cv=none; b=u7z6aG8abUHUMTq836pK8kZ1Zo518y2/Hz6IAwVbB/LBT89yae/QHkKihIvw5xakURs+DeoW/j2ibFerLBdWaoLUxVS7AVEDDrUbVicC98VeXM+baXf992wCnF+C0bld3BAffGbjrLdBVJsOUIekGwTGrKqKEvvqMnYdER13ZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782447386; c=relaxed/simple;
	bh=SD41HtAWuhHpjv7zbR6oJUZQHyLQ+OxFUxA0WK5wTGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJKGGxXydn4YawpGqqPepNDlnbafVoh+g7kR77b05tG8sSmjDpiza6PMZc+BG0IgxkPQOkanrRIFWcvTspinAU4zuIyWIb1x30AiRQpeXIXI8wacETGKjRHvlKcYumDsVKdrohs8ITH7w+9V3KstSKtDIMuIa9lXvsDVnCPt47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=5agKnRUO; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="5agKnRUO"
Received: from pps.filterd (m0355092.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PMYxnK2654107;
	Fri, 26 Jun 2026 01:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=k6uWojxqr6dwn9XkSkMNKSoksjyLTPysi9
	r8WEDjemw=; b=5agKnRUON/ltRyuCmPSJdiYVxX/O3LfARZLuQC0Vu4mpMf9jZI
	eVFjmk0KEoAetveKq57VlaHNTsdbzDVh+Oz2ZaOLNlcy+Z0PbZhP1BJlDHasuuyW
	i3RO7KF5cO6mYSoptDrWwjOT0djjFjcSyclw8k3IaDZErZug/jiFGF6nuji9lky9
	GWXwOeTEtD4hZH9NGZqU6/PbMK+ZSuANL6MvJjXAN5wdlLnnNtT1L+JTeNu484Wv
	9/gSn5mhMrjjhdr+exM5wHfCHOgH5OrqZvBM1EaFETrti3WSkWJqIIdjJY4GYcSI
	yPyeZrn9t+Hbhfr1KRW84LYkr2X/47kMNn6A==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4ex96ejhjm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 01:09:53 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gmcvk2X9QzDRKyM;
	Fri, 26 Jun 2026 01:06:58 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmcz31pwKz18W7cG;
	Fri, 26 Jun 2026 01:09:51 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [RFC PATCH 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Fri, 26 Jun 2026 09:09:48 +0800
Message-ID: <20260626010950.459899-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfXyGV5hFbQSfA0
 4DjRcQVMFMKMz2HLwS9axxYmcDNp7r4YydmPrYRarx/Nk9SZNg1ZK768RFhFyR3wTDMyfzvALlE
 QlAuYeWYSp1BtcYJnCFS8NdXScFtK/I=
X-Proofpoint-ORIG-GUID: VAIUTSf570eYCFJ4KGnfGpWGDAjngKAs
X-Authority-Analysis: v=2.4 cv=S7fpBosP c=1 sm=1 tr=0 ts=6a3dd161 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=rq6KeYSQr_4CDViOXtGD:22 a=2OInYS7Tu0KDO6MBh90A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfX2z67it4CuA4b
 XYiYeIJdv/gUfgjNWRjCLjefxZLa1MW/Jhh0+UIkuroM2sQun3QC4a/LWV1GZsI6hwGIq2MasBb
 uO23+PGuVdPvwz5cJzUMVem8met6vmYOj2/b7aaR4nzO27uoDI5bc31ALE7McMBODTfR3N1fcos
 Uh3b76spOAJE3MgsoIVp9dFwV7QovK9t0JsNxNwhsRc3WCh0zPh2AVC6GJwK6AKUIvalGc6x2G5
 Z10aDLARiUl4sEYB7UK5JP28uwfhbYz6EvLWg6Iuo7kF/LAN+vXKHmleepr8oQnT1xYKydwRi7r
 T7TgYcqnQRVT3WHhFVSunIppx3/QoszQSVYrg5oSAohUL7tMdMScrhNlH7siiukBnH5YF/5E76K
 w+CrnC8XLmTauwCzHoclS6dlmNAdsF9JN9VdpwUTwpJsbL6Ir5djaA3uwJOEeV4pzp7ChrhVef9
 MqdqSHmKQS6n+BHXPIQ==
X-Proofpoint-GUID: VAIUTSf570eYCFJ4KGnfGpWGDAjngKAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260006

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

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 167 ++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

