Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7719A288;
	Fri, 26 Jun 2026 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444869; cv=none; b=N3fb4ZN8TynR7lobN2Uv+PEFa9bIWr0nh1MRcrQwcmYs9ysnCtJ5bO1RI3Of7oZhFaAfl1Q/VD6tFClu/K+re5fLxeR2DoQHTOeHB/vz8J1Nj/mvHi1XM111gGVw478RedPFlCrPbacWZfrOvr9J7uHrrsm8jabYTXE4mxeCM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444869; c=relaxed/simple;
	bh=dK9wmXS3G3yPmiWU3Z4A59krRWDV956AUanmp9cQ3XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa+qMlnYq1Day2g/xedwViEF9GSekEv/dHrw8YWW8OvdNmT2LunZe84kVx3qiL76QcDm5GCHxROflAMOP5sIoCeqzNDv5ZxANwX9QvHWtFw7Nct8mqVfKqGhClAW+YqoKfln/gV+BJfGENUn06+kz0IdFjlfOoOS/H3EPUMMbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=KN0qYuPC; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="KN0qYuPC"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2lqk82762304;
	Fri, 26 Jun 2026 03:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=nyGGy2lkaw
	M/wUnmdNuyc+xklFo6aV60xR5VNDZYr7s=; b=KN0qYuPCARQyxeM+0jiT/hNPwU
	P9U+909Yg/5TtROiNwI30vghCCQqAtHzhd3IIMtQDN30uGbgLBxmZRxLpwaXCzUp
	Xk7ce9HciBCje1EQsQ31iIZAr3jgGWZsa0DkFaQxdKCMwW9Zs58XBlSk0wdrHmJ5
	rXx1MweH4a21aYz2kKpQofHaOsqUVeZ5fA2fux+Hq1Q+XljWtm11yBnFrsnDJysD
	rd4dlHRoYlAeEAsIkvSdgMOKuZbGH8tazkH7AA50FPYomUeUp5pM4QWFMB0ndxMV
	lusl8k632lg3yEhJdsSb/cufn28jUlEJYfWvut7c/98nCS+jzrFFEEYIQ9Xg==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4ex6afuy75-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 03:34:21 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gmh6Q1BnZzDRKyM;
	Fri, 26 Jun 2026 03:31:26 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmh9l0d0fz18W7cJ;
	Fri, 26 Jun 2026 03:34:19 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Fri, 26 Jun 2026 11:34:17 +0800
Message-ID: <20260626033418.520762-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626033418.520762-1-lijq9@lenovo.com>
References: <20260626033418.520762-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX381BwosMbCBe
 Jhqj4TzSB73ZXyP3JTUUJBosT9FliVrKSbyzIOPxhMM0pzPMuCFwaRerJmEVYRVFKOiWsZEwpRZ
 GOcH/ew2yvW5OiGeFJag0V8QccyH/Ms=
X-Proofpoint-ORIG-GUID: vnCoN0oZco1r8NCXMeX8Uvcbh314htoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX9j3gaxf7r76y
 ODrjBPyOTSdKOntDOr5xuLrG/JuQ7zhd4W8uyBKwaACBk2/6bax1yao/rA+G9efMRBiXHH7LR9W
 /71RmIlxsMF/jOQr13nnBMR7xfwtsdAF4vMoDzFCulrWDWaruX5INWO83jhO4AA/6VKlQWHst09
 HpugPvmtkFgoEOMuNk3Uj/qe9uE1KFdMWAlPi2Qplc0riiYOEooaVKys8K+D8eou32DKdbb6xUA
 uMrAxcI2YA7yLbuDu+wgArMaolNscobHO9Bst5DmNMvTdRFR7Kc9DmAzINUund9LkNmaJCrAkB6
 D/btS13ZOrdTWtnIxQC3fvQQC/vbD3B+HByEUkikZF4dwta2HYSxNM6/i5o3fuhp4rOXMs68723
 ZoyrOXoNJeJ/KaQ5klntTKSzpLzJnlmdoIp3l4FumX3LKc8PkabYd75fabsrxazJv6imZumNGFy
 adOJVAJfgj5syoOY0NA==
X-Proofpoint-GUID: vnCoN0oZco1r8NCXMeX8Uvcbh314htoz
X-Authority-Analysis: v=2.4 cv=HqJG3UTS c=1 sm=1 tr=0 ts=6a3df33d cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=8k6WQxmsAAAA:8 a=BIu2vOWKBFmx_kd9rFYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260024

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c068..960c604ef9a3 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -268,6 +268,10 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0001
           - const: nvidia,tegra194
+      - description: Lenovo ThinkEdge SE70
+        items:
+          - const: lenovo,thinkedge-se70
+          - const: nvidia,tegra194
       - items:
           - const: nvidia,tegra234-vdk
           - const: nvidia,tegra234
-- 
2.43.0

