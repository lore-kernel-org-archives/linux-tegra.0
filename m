Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3638E8BA;
	Fri, 31 Jul 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491421; cv=none; b=ilkRZ2vlLH3Lu3qZ6JtYNzIrs2LG0Q6ltza7L+ZAWBWSaNunO1be7h2k9FpGjvrIViuZ7soxRuChxqxMULX6lSFneIAPNkWtAGxaPAjLknhmBfiXreCrsqcphUktOB5u7I83xMmEKykXgnYKCMm3UqSo0O4DlxhataIn/ix78bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491421; c=relaxed/simple;
	bh=Rtov3TxbChVLrvgIshYQtromkrMB0tWfEESdRZzujd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vExO0YfL6fiyvqdQNoKYCBAFMHAth1oBI2YE40r26k17hkGpclLoqUnbR/ZCRAJeexwDe7QV7JzSftnig0GWORm8nGTIC/KFS034SpYEmZqIFSszmWpdovKBL0YmHPojwWAL270HQldYb5m2/dYsPQXbRk9AfLENg+qRuv/qw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=OU++SvcG; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="OU++SvcG"
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7uuLP3075970;
	Fri, 31 Jul 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=No2g2xnCnN
	tL17DgO90ST8dcS7XLxCkAOG3J0becmuE=; b=OU++SvcGhUij6Khev2QVf5KuPw
	5bYiZRmq9b+Q7O9ZMAORRVz48Vgm5UMJBmRbV6jn+zckrVeHzyxAeyuub68ENN5z
	CjsGi/Ah30VrflSQYwU1zMqF6x9QIVsXUNqE5hO7tpbDykzzWo4moaj6eu09Otpn
	qkx5Yx12WiTVeEnJtv2D+8rkJApqzoNJIKum+En4xOHz2eeavSZ7E8eetOZCp+a9
	WBLb0OzCr4XQe2r2HdkX7cqCDytyLTykSQx+lN3+38We8LPitKS4++g1SLZe5bYg
	IArnsIBaDL38Of/m8T/ckmVtvVKAgiv/HkP9CidiQPlf3GeesLBfS/Kd4/Tw==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fnbne56qk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 09:50:13 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4hBLr503NYz1yfbXn;
	Fri, 31 Jul 2026 09:49:08 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4hBLsG2T6Nz1wCKkX;
	Fri, 31 Jul 2026 09:50:10 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Fri, 31 Jul 2026 17:50:08 +0800
Message-ID: <20260731095009.959666-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731095009.959666-1-lijq9@lenovo.com>
References: <20260731095009.959666-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX3fO1YEF1d0LS
 lMF4oZvKLadaJxzulp6Uk/EvloFwRjMsQ9feljw18hhcwIrlQ991+w7hYoUj15XFL6N6mu4BFdz
 yQQerC1yeF8L67Ho/1/+LpRAr8Ka7O4=
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a6c6fd5 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=XYAwZIGsAAAA:8 a=8k6WQxmsAAAA:8
 a=Qg7IKkRQLkjCXi5ovIEA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX4CjYVZW4zmpn
 Q3EkrhdEE7PR1O9JaErodwelyyjzRU+ggv/OxIge9eTFR0ivci6jf4U/wFJcDR8r93v97tpA/H9
 ea+hvtBMtF1LUZde7n5o2+jkpmhBFU9On6gBIIh8g4DnYlfU4MaRVg/CAdesmELrlauOM8+j+Nn
 4PRJdRjwlKa7CoGvwOijJQMbawcmvC3X40KawvCazYlZ7ZGorhXNMCtFv3Rki4ooXZo0R2ONyP7
 QGMx0aQAl7L/K4zgZBA/lpEf3E+vvlxgHq17/oljPh1f0DuCyFYdJbnuYwNcWnFiCzcdxVx2oLF
 TvCluGT4OwbTMqU3WQQWJSqqpNxd5SJA1n3SD0ikmdHSg2S8wapS1VV04plcHXvWrwStu72IFmN
 OJcfiK2k5SPRpI7Iq2wXqU8Li2GEZLJlS9/F0SbZR+ELxqo/t1u1yYkrVZqS4yg1IA1HhlhO7c2
 ryU8trE0bqt5XS89ITQ==
X-Proofpoint-GUID: RGhXO98N-rOjyD0NIiS4txPX09DqOIET
X-Proofpoint-ORIG-GUID: RGhXO98N-rOjyD0NIiS4txPX09DqOIET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310072

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v2:
- No further modifications, adds Conor's Acked-by tag

Changes in v3, v4 and v5:
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

