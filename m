Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B06379EF7;
	Tue, 30 Jun 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811087; cv=none; b=qNlOPkSA9X3NgBZsCDLcLPcSXzmceah5LWvDdjgoii6Ly54Do7AYgbP5iCnoRWu2npF/PWzVnWXaRYiyDN5jVvBwMDuzLgaQgHfKwO3A7xt+60uyJmV87CD2aJGWD17r1qBiNjCVCVPUuxTUikNRLqB8CKRCEvLdN4kEHHTVM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811087; c=relaxed/simple;
	bh=ZAaBd2TcuwIX8sIznd1GOCsJ7sj//4TIDCpzRWgXRXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGIzRnBxKz8caWzDHhlILvwqUB1ra6aU10Nup+Ir2I3vTM8U8hUZnm1ZI+F0+/Vao1a/hlmgpmLEvTyIcHKqTUH2oPDF7NwGf22lhgCGVRfIaOUle5Up2TfIQTNyk+io7uxQo6dS8ONG8cn2PxTXpknWgOpXys+/R+76nZjAwVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=poBZ4DKZ; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="poBZ4DKZ"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5avkF3213379;
	Tue, 30 Jun 2026 09:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=LWckY0ss4T
	MTuB4E1/NQUtPKIsg8m8B+5KiAV+wQzjw=; b=poBZ4DKZ4aPJ5LrqkQFtOf3WEa
	4d9acYAXuLCv12TctoFtsBUvxExzHdjKqOFXDLcdgfgAKSX7K+0No39F4r99P/Hx
	TUBQmEwOPBeZCg4EVBDD60zTyZDVxCl17t+XTFaIsM93G+ORCq9/2Xuyp1jjO09N
	V7jZ+g3pcwSYierm/ciEWy+F8bSSW9ksIYbXV+XZ8qZhYdQ+N+5ZKgoK766DoTsP
	V9HvSdVUKQvJ6nwMpl6Bf67WnTUOLbNj22NWuXLTI2931MP6ibz/EGIr3uDWdklh
	qgF3tAodlGklGQGXaLpcKkMf+hix81ctx42xFL/YwSO9Vt0p14zj+iHvY41Q==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2umekv5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:17:47 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gqHXq4zB6zDRDtg;
	Tue, 30 Jun 2026 09:14:51 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gqHc845QMz1Mmc;
	Tue, 30 Jun 2026 09:17:44 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com,
        thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
        Jiqi Li <lijq9@lenovo.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Tue, 30 Jun 2026 17:17:42 +0800
Message-ID: <20260630091743.657388-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630091743.657388-1-lijq9@lenovo.com>
References: <20260630091743.657388-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1o5w+uHtPq8L
 5Pqte3MqYOoxf2B3XcY/CbzttvQGw65cCl6goBdlMbOL2bO1HiweoPQ4iOLnWl9mqRDNjqL3Dda
 MJu0DatWrz3achfuObpTK7yeKXeQAiA=
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a4389bb cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=XYAwZIGsAAAA:8 a=8k6WQxmsAAAA:8
 a=Qg7IKkRQLkjCXi5ovIEA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: xWhMZeK5KuUfRhTptAeU3sr-AutfLJz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1g6XZ4mjB6tG
 Dz3xOuJ0FG3zIqTLWQpFe3VtofFekqeS2wQ9iBG+Xav42xh27dHi0ItmEYw/cm74q8IZG7N/V0N
 IaSYMGBJjbQnRkDH86jiG9rWKdwOyEGqsTjPtm8Xjo6w/C57ogKVtFwaAHTt/WZBmGkimtOygI3
 voqZ5qKi4NNv2W7Rom5pJmnU3urVQkW+VnSQMOmi/ZqCJZmkVrljo6dd741Yle4SCLp8+UyLeXJ
 2OcbJm31lFCX8mt5r82t6olAAw87ZIEMicDonHKZNtc63AeNJh0obry35KI6GFXaob03j/O4MQG
 AUBnNGtZnaGCDYJbE51mGUF2rZzklZST9UIP9DOVTOZINuSKckK2RQUx+rrz4PqfV8Jt5ASY1si
 YoXk24Zrwy2GOVDGN9IScoo/FWTQGMGcbVwXRPIXl/lsaWnMrZXWuYXNR0/03H93KZIvz/Zgb3C
 eHBLw4i5KYiw5BYK6pg==
X-Proofpoint-ORIG-GUID: xWhMZeK5KuUfRhTptAeU3sr-AutfLJz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300083

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v2:
- No further modifications, adds Conor's Acked-by tag
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

