Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A43F8236;
	Wed,  1 Jul 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896813; cv=none; b=D0RjB+JRzbd3T1KoIwkWG+B5f4j3P5OPSm30rCgeUwxyQzif6LOA+VUr6r+hkrfDBjzeMMBJJtcUPaXHSPoOlWGBBVHd7wpKkErD3IeZvbxb5TW6gGnRspLX/hbIWjqMDuc6rRig/rqkYh3yzVB64nIQetaBg3yoR7o5km9sVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896813; c=relaxed/simple;
	bh=anZqIdI0f/wNdBtZur7DYyhPAXyOxZm3N70DD3bqVCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vlul+1p0CcLnz+O0y+wli+eR+3OeV4UnFVvQvCSK7SUtlAvrhng4YPsrr4pDWC0OmlTw845INq6nxY8ODg3X2Y7apRmB/D/3gkMPhAaGc6akP0m+lfEpK7SHOL2GVFFfeDqwFtoh4Wy5XH6dlj4gYLuAr91f3mMv1i9OnAr9r2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=1eAwUuYz; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="1eAwUuYz"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618C1cl1872113;
	Wed, 1 Jul 2026 09:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=tJfNhG+Ngb
	9+E1bv8F6ZJqomPe49hO9dT7CKaDnuxQc=; b=1eAwUuYzdc6XtDFNzIR66VFGf/
	7rd4JNh3UGizBhHadYU7Ncbz6OCpkkKmIBR9f8M8Yh7jy7jKEBIe+VdX9GF8wOm+
	JKHS1zX/7aku3MCcVswhTMwQWOhG1XuPFHhheSsId+VI3Ye050P6MEmjRkQZkzQH
	37wLUL5lDLyZFU4lr2bwkV7+0WGr0+l4j5+J8NwZD3ZY9qrvbzGakJSzJtHPrCFq
	nsetNwNK4y8AeXraF7w50OAKb+KclW0R/Mm4nBxZiY9z0P2Qbrta51ZqGOgU0NI3
	sisUQJGba70fb9TfSVLxg2Y7fEU19Sw2iuy+Nd2sSPjHzVmiiEGcn+NCcY/A==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2umep8t8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:06:43 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gqvFb4DrbzDRDtm;
	Wed,  1 Jul 2026 09:03:47 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gqvJw466Mz18W7cG;
	Wed,  1 Jul 2026 09:06:40 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Wed,  1 Jul 2026 17:06:38 +0800
Message-ID: <20260701090639.669524-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701090639.669524-1-lijq9@lenovo.com>
References: <20260701090639.669524-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MyBTYWx0ZWRfX0L1C65+Qq0kY
 UcYy7EPc6g0SBWYo+DYo+iRC5SsCrDH6Mr5xofKMhf3G5alfZgA2LcketdsebEpioU+HIj5/Fjj
 ctDDv0XpT3eRjGwyHv5m8PcWrwThitw=
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a44d8a3 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=XYAwZIGsAAAA:8 a=8k6WQxmsAAAA:8
 a=Qg7IKkRQLkjCXi5ovIEA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: 3QddehoINYvVXf2WKPTjO3LvUdktkvxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MyBTYWx0ZWRfXyUIhYlfD30rQ
 LXjClIueeTHV4n94hNSDehHFTbM9kvsKjkILXXAKTtwfbMYw1zjth+F4JMYjrFXBG24F7NDh+TG
 hkV1ZhVTQyyC7c4nDenpWLpD6eBrwYD1zcXURJ7qAEroxzyRDTHkP2dIBt9vBvPO4TUamL6BeIs
 9MgeeNTlGxiWqW+lMJ+yXQZJ0/RIiGWyhfHAum++WO/ias1bZqQslxDpvEzvnF7BhWylYpKNQKS
 L/q2k9x7Z5UHNT9iWG7ya9zUJlqiJHj8kVTVpUBzz/EOQh1DxRuigHNouFQXPN/LMfiNJ/RxsZF
 kYHMmcWTgALe+gd6n5io0wPHXTyC6FK31syutY2NWLs6ARhXr2rpUG+AN3lsYsPlF0SC3RRlz41
 hiLieK2Xb9oszMxKsuM2u3YUlWtaHZKrXsSeQUEglM67NaG7eto+0E/iX2VL+er5K6j3Gdu4AW+
 SbTXBTRHGSS40wwkjXg==
X-Proofpoint-ORIG-GUID: 3QddehoINYvVXf2WKPTjO3LvUdktkvxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010093

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v2:
- No further modifications, adds Conor's Acked-by tag

Changes in v3:
- No further modifications
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c068..a54d0024e636 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -268,6 +268,11 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0001
           - const: nvidia,tegra194
+      - description: Lenovo ThinkEdge SE70
+        items:
+          - const: lenovo,thinkedge-se70
+          - const: nvidia,p3668-0001
+          - const: nvidia,tegra194
       - items:
           - const: nvidia,tegra234-vdk
           - const: nvidia,tegra234
-- 
2.43.0

