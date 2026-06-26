Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D883E5589;
	Fri, 26 Jun 2026 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465242; cv=none; b=tDq2R7V7Luhh6mUjFKK4EY4vH0DoN6/Ucfkjsm83CtpFjfEsHDRrvYuKMxaY/unCJjW7vBp75e9lYkfHEkKpDcVVZ0hhaKCVxNtHl4NjMn1wqdbjNwuZFqiFwH8bN4A4qGcLGiUwYJnIoLTAKynLfCIM58g05mBqNtW52Qq+JB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465242; c=relaxed/simple;
	bh=bxNP9GLcxinvfRARp2qwsO3ZckSiF8ZaJgRIXeNSUN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzBsGSQLIQov8bGbWhc5Wv56AzsYEmVNhXe0/7vcWV0E6++cne5x9t4i2xiNtOZlyUhylnEPdDaJI9iE+6ULGwc7/5iZLYG/8hed+0ySJFSs1+qnRuiDlxW5LpA87IgYTRFxOc0Lo9tzEG+zUGdrwdgEYcEfxZgUCfcfyoYKWN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=USNA62VV; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="USNA62VV"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65Q6SpX5123795;
	Fri, 26 Jun 2026 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=2M1gkMHxFD
	9/4Eq1RnCS0DRFUE90xrm0ITDLE8kuKBs=; b=USNA62VVRL7x+UkzzkWIhI41zZ
	6Er/dC4ippmZg7ooo2AB6O1T+0u68MSYTCiyTEO4Htcmmjdy8OamaJISC9bQoeGd
	KRKBfc1Aldypc/mYobYjF8shDxbJaNw/2fVPSXowPspwDGu1gT/osBUCVv1De70K
	KCQilZX6MshMIZkgN9yJj9+y1WEgRVVC1c/WAn2GeD3dZub6Y75uTwtkrli0DVyD
	dOb2Cb8tOG7ODv4GI5NAEuHQb7DuctY4CHasvmcY5C5IMKch0W3dIVCqPVuoPZ/c
	M4s+XmZI6ImTyC0r181l7uw/BhgczbFh7yCGTZEruEzgls6DK8q1TwQA5s5g==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by m0355090.ppops.net (PPS) with ESMTPS id 4ex66q4k5j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 09:13:53 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4gmqjW39mzzltBP0;
	Fri, 26 Jun 2026 09:13:51 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gmqjV5w4wzl0;
	Fri, 26 Jun 2026 09:13:50 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Fri, 26 Jun 2026 17:13:48 +0800
Message-ID: <20260626091349.570091-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626091349.570091-1-lijq9@lenovo.com>
References: <20260626091349.570091-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WpXt4L0Kdpc4ostJoL8XKGBI4d-iENpe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfX//oyHhQOg45j
 7XA9EJc/EjBXV7fv0fjyeHYFWT5vieUol9xqSU+FS7hXRHNp+zvr2pmg1bjPbUaha3qxbnqdkMv
 1yslTtiUwnETJQw7TMjBh+Z7K1DKWvI=
X-Proofpoint-ORIG-GUID: WpXt4L0Kdpc4ostJoL8XKGBI4d-iENpe
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=6a3e42d1 cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=8k6WQxmsAAAA:8 a=hW0esKDmPMssBsguHvwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfXxEf8AVXqjQv+
 eZmv8Gp8XaDeOETFMuMSJOIsjK2Fk97/VhMYsS2tXV0IDhQ1zfl9Nq75LhzLc8rHiUlc81bICiZ
 Za4ypRmLM6Qt3fqr4GZBPWe8c/AGDmGJ4gmib2I7qgzCCL4Gvl24HK9cVQOazdtmPJFTLW9LDtg
 YuMHozckzXXINVl6/XA+L7KTbdGj/pD1Jr0QKyoY4AxGkvvtY21ZtFRLdb9SelV2StsNoKIG6pg
 d141C7pGUIZW0VmkaP05TTCzMolgTo6ZF0XZQdxDKWx7lsE1pkZ9MUSvfo2TuYrmnZDhfONDGN9
 q6wCS3TT0/u/M7Uf9VbxRxYV6Ok69Vf39eo46tS8knN7Whr12xIzw8YToVpW4eweyg+1dRcbpE9
 36yuuKOVtp+X4QhlOIBXvsOhI4XLqBsxdbDbdiV2BN1/fWjydJfXGMSYcTrdtYSqY++u1VVH9ov
 nyjM9dStba3iaE55iAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260073

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c068..1a71b4195114 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -268,6 +268,11 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0001
           - const: nvidia,tegra194
+      - description: Lenovo ThinkEdge SE70
+        items:
+          - const: lenovo,thinkedge-se70
+          - const: nvidia,p3509-0000+p3668-0001
+          - const: nvidia,tegra194
       - items:
           - const: nvidia,tegra234-vdk
           - const: nvidia,tegra234
-- 
2.43.0

