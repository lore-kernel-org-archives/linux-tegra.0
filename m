Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2365CDF1;
	Fri, 26 Jun 2026 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436213; cv=none; b=Zw8AZnr0EYyXG4mUzAcG3shu3tBlrHiVLHjNOURUq6gnzk3Cz2SR+OMCazukuEi7g1/0R1reRrfJ85h/SK5p/p0qsDzJyq+DcNEuDmO+0IXLzpPixUemYUMClgxJdKaOxmOyQw83aS8p9tPlbyAgmgJT7hXz5Wf8y+uxySQwZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436213; c=relaxed/simple;
	bh=dK9wmXS3G3yPmiWU3Z4A59krRWDV956AUanmp9cQ3XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lx2aEHdhOZDRM+C3JK39KscbsgYKqirRDx8KrR1R9hfzzYPnreljgGRMEccN+7GP0HrLOR1MjiRNgy+uWhL4mFjVglSZGHId7nPz29BgmEpHUwGExccdW+sYWBLHeNYlq7nAWNdNvdv7YyKdhZRfjU3ZnzPyD5pFi2jnkd+rIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=KRLuNRP1; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="KRLuNRP1"
Received: from pps.filterd (m0355088.ppops.net [127.0.0.1])
	by m0355088.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PMYKCV3246586;
	Fri, 26 Jun 2026 01:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=nyGGy2lkaw
	M/wUnmdNuyc+xklFo6aV60xR5VNDZYr7s=; b=KRLuNRP1c6ITJCeq7nRvSwT0Fm
	Sh7cP5J5ncVCdmryzh2QQFnM8cJTGtHtEjk/Nbxmw44IVmQSQ/RF6njcnUa5faXY
	zOYD9gxlAqtJYc617gCirNBP4jpHtOgWgc9buX4mwiVFNb5CLVop56zjlNbqQQ8h
	d/PaKZsfyCdNCmM1s2x2nkIBk2QIoK1aiBK1JRVrnJhDc7GN2rqiPfwFnLQojqac
	JFtqEFy/x8jp2HEosEgJlXililmhDsYkzEp55tIY17bU0CJl3n2EA5mZldTC2+Nv
	Xxy1uHXUskCU22S++jiOik92fdoiYr0Rwg9HUTr6MdUyjbgDZtZby49PFlaw==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by m0355088.ppops.net (PPS) with ESMTPS id 4ex81s3re7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 01:09:53 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4gmcz40SXszltBBw;
	Fri, 26 Jun 2026 01:09:52 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmcz33TYyz18W7cJ;
	Fri, 26 Jun 2026 01:09:51 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Fri, 26 Jun 2026 09:09:49 +0800
Message-ID: <20260626010950.459899-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626010950.459899-1-lijq9@lenovo.com>
References: <20260626010950.459899-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: buMsB_Qwn0Q1znbAwfszPosC7F4_Mh48
X-Authority-Analysis: v=2.4 cv=QYJWeMbv c=1 sm=1 tr=0 ts=6a3dd161 cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=RP4W769tehEb9jLPIooy:22 a=8k6WQxmsAAAA:8 a=BIu2vOWKBFmx_kd9rFYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfX3SrQRDZzTOkK
 lb8vPZkZRwqjyWdwXXJQpKUYeymto4TwN+7oSgqQ1Jn7/vkpSxTQPdTKgTfVmpKbU03zlNjhrHc
 jwLtUKHu0MyAyywCWGCdTh65SV/azIM=
X-Proofpoint-ORIG-GUID: buMsB_Qwn0Q1znbAwfszPosC7F4_Mh48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfX8pQY0eSQSxpU
 hL6lZWV6hbmtUgB5XNK0UQDes16BD/Sgtd7kfLJdVKrl9DmGVU8zBLFv/31rBi77HCX5dsK/9AL
 Ck1EgUOfYBmwvPPrf3Qo3OnWaSwtsJz8wlC99dqdu0yKtu1zS5HPbO+rQKs+uu/BJrfZg34wiKE
 m+5JjvUEUQ7iEoJ8VKcOjbAvl639HTso+vpEN3oBTAXP1WkJddyxdffIoikufGbdgkpnCZvMPhM
 vZJiPn1sMKtJfFXvVNF5uIWTNhlDBcTVvwCU+1i6yVaHNWnQjMR6yWK/fJO7ZnEDexOBNFRpcjU
 VKmz6GmhwkDMhYv+qIPErg1vWEPT3iz8Uf8CHChAqyzrp2jCcJPIzVvDVBpBEVXK0AFUo161+Ab
 TGEgaj29Uz8M3eQXH+S7OLodQmRo7iK+IPLVnlvLEO/skVf+tj4dCqJIcZM586qsCnjfKJmPEQ4
 A3nX2GG5Eu4a+wCC29A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260006

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

