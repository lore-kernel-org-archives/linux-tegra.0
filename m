Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764CB3290DE;
	Sun, 28 Jun 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650620; cv=none; b=NKL29C9sjkaAVbyJMutZsn6C2PBAMJr2uOX7cjB7BM+LBf4KYI7ZdTpEyeAmitKFdQvHHyUdkcFeLAl+EfHPj47xgPtlLFXv0aNCsAzrT5fPVtXquWQAIMvmzGg4rgzDMfiUDjcpPZvcj34k76hsDVeEO5EScV4159uuiiKy1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650620; c=relaxed/simple;
	bh=tF719ThTyZ/aIrCclINmrbbdlpb+IqpORbfivkqz+go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xf3ZKiLE55iiVyC1RpZrfukm1zLPKe98jCuPlb77UsbN+weqA9XnaaPru9y6KzF49GcXY3EWECY4I1tYHFCUyQJQYZi0qLd1SLhVPnrsFMp6qjXoLAowt8hQVPL9mHhFsMnSWQJOE2p6CGsKsSNIctiKojYuuW1fJvt7AEkC/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=RpJO9YDc; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="RpJO9YDc"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SCF0ZP3192625;
	Sun, 28 Jun 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=wfaY7OHzfB4uLUu16b9TBGMW7Dsg52Bwmr
	kGyd7RnOs=; b=RpJO9YDckH81T27KksvD3/gihASdmnvD6fk2cFmnHbm84V/gol
	X2jUEupoUu/ICHnRiq8vcjC60DSq5zwLArhtD7t9z4DvFVM0QkcAqarwzvnUMe2A
	eKvkNNVXFqALDa29Dy7atdq2YMgRQGxkxz/9HfdzouhmFbpjV1P8o58AbeR9UFJi
	f4w3k5tTcxENpciUkFpCg7bZMEv+yqO/qODiwjcNLJCe+8NQJGS/aIQ5hiKXueOF
	6NyaQ7FXvh7MwHsLPMNeSEx+9h4ofG8iWmOkeJ8ZXh/hZGRK2sV2nCJxcnZy2TYI
	2fbrLLwd7Mt5rmnZf8EZ9+kta08j7hWIUWZA==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2syerdaq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Jun 2026 12:43:21 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4gp8Ff0vyZz1yfcld;
	Sun, 28 Jun 2026 12:42:46 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4gp8GG61KGzYlvJv;
	Sun, 28 Jun 2026 12:43:18 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [v4 PATCH 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Sun, 28 Jun 2026 20:43:16 +0800
Message-ID: <20260628124318.627393-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uyE2mkv1U8a4o4xJsX18IMx7jfzvs_K6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX+eYNDD9z+cyT
 tSgQzYgUKfRla8+x+S6bW3xsjHROHNZJ8wv/y+sp6KPk2K/TTloSAzRh1M4N7fe5qPjaVlGweoi
 fmL6ce6lxQBcNJa7SxKT3yxz7PzyEosIp9w8ZIqSrD9Wbwx7uLkfufrkT0ePr1o90L5KjpSli5q
 rpX0UF9UgPRFaYbzI5L3Ndi9Y/y53uC1PS4KKZrHNNjLiDoshBsF/7pDa2Btv/K9DhxseZRb1KB
 LE63xkJOToie4o1MlGPMBfLyxywa+lh0FUufa76HE+K8TmDs0xIBzO9niJwTgNeFtSnAobE4PVe
 IDKcDecmgOwBEsVzLtnkW1NXE+qb571/BK5ca6MSicE+ohBz7QE+EOLg3Jkt283aduIvPvl6NvJ
 pqxBBTq9MHOaJzcALrGbPkDrsAIXHpm1SreS7otcvkybjqrjtjhEdbUCNmzlGy4aAdbJH9koUu1
 B98h/WPTAbD1Kl5oXQQ==
X-Proofpoint-ORIG-GUID: uyE2mkv1U8a4o4xJsX18IMx7jfzvs_K6
X-Authority-Analysis: v=2.4 cv=S8TpBosP c=1 sm=1 tr=0 ts=6a4116e9 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=sSpELXrWg7W9bo0uj5QA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfXzpz7kOL6Xtjt
 eoVocWEUZjt3/Ej8vf39ZdmifHeX8rbClyLm2sU0o2gGJzby/PUgwSweu2xvEMHKQcSC9K67nfP
 MaPnk6Mxn7hLJM1Zc6Vv1tMFcY6+iPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280111

This patch set introduces device tree binding and standalone DTS file
for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by
NVIDIA Tegra194 (Xavier NX P3509-0000 + P3668-0001) SOM.

Patch 1 updates tegra.yaml bindings to add three-stage compatible string
matching board + SOM + SoC, aligning with existing Tegra carrier board specs.
Patch 2 adds a fully compliant carrier board DTS implementing 40-pin header
pinmux configuration, 400kHz I2C bus, and dedicated 3.3V SD-card regulator.
It disables unpopulated PWM and fan peripherals according to the real hardware
layout.

All static device tree checks pass: dtbs compile and dt_binding_check
complete without local errors.

We maintain internal downstream DTS for mass-production SE70 hardware.
Upstreaming follows the same OEM contribution pattern as other Tegra
carrier boards from Google and Xiaomi, reducing long-term out-of-tree
maintenance burden. This industrial platform has a 7-year production
lifecycle until 2028, and Lenovo will continuously backport DT fixes
during its service window. All peripherals use generic mainline drivers
with no proprietary extensions.

Per-patch change logs covering v2 through v4 are placed under the --- separator
in each patch file.

Jiqi Li (2):
  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
  arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 125 ++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

-- 
2.43.0

