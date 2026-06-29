Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B573B9930;
	Mon, 29 Jun 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731475; cv=none; b=HeoDQUO9V9qUoPLP8dF8lKchR9gwNOilT5PwPDpHh/OU3XJxw4erPsui9WMf2709B4jfoLfVgdd43Tg4c2ohQhE0S9x/Bea6zkhAm0Eq+YZERj9tAB9klNVftTtaCT4edIFi6ExIlQFWR0l0ulbgie2dVqsxmnHegvWNFh9+RK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731475; c=relaxed/simple;
	bh=fIRgCznQaePKXp6b5US5v7cz9XwaYRtokk+JoVpXv3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwCDmvoQZzWpitKXQpve2k8GzJ9XeoD6mHHGAsLWUHa6rVSipgmy8oIVC/wCX5Pk5zCThD9DEHE+cjpVJ4E+o+3JeazWAG1IMaKLG2ALOuTv8FaU3s8Hib0Uuivk9WteIpCC1b1VhDyVYGbZ8EIYQ3YN9HKGrlqT/OOCZBm6vPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=4NKtA1ik; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="4NKtA1ik"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASVql1219447;
	Mon, 29 Jun 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=zkeEe6Y7gG
	L4eF2iSls/tqi3BjAEiYaeI6T3Rv/GmQc=; b=4NKtA1ik14NjBlwp8DIy++XMvE
	Rf0m+WRKFnkK0HygiXnCTZH51K/W7Fh2WXy7+T34nwDayWpiASJZl4wgQYTgdT5R
	HcAtpa3ezTmt5rWufM0JOOqu18AV0QCgFaj0k6ChhXtfVwCktZJILfSo79OD1os1
	wMpltQlP1JMTg0fSHqo+XZ+RkfEcf2p420jEn2M8hb20fbcLD9/6wx8AxL/PgiOQ
	zhn1Wd2Ev1DkuAofVQ0tePFRSSS6ipx2f9eZR5b+kcFmivTG1ZEQzyYMzrvrwLIc
	7ZK2RYOf4NsCeduMwnRSqsEU5vEp9KzjVO/wMts8OssgqkOlT+zJZl7XeoUQ==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2umehspx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:11:08 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4gpk8l2rMbz1yfclp;
	Mon, 29 Jun 2026 11:10:31 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4gpk9P0ZLgz1wCKkN;
	Mon, 29 Jun 2026 11:11:05 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Mon, 29 Jun 2026 19:11:03 +0800
Message-ID: <20260629111104.645771-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629111104.645771-1-lijq9@lenovo.com>
References: <20260629111104.645771-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX75bUDMWD7L2r
 tM6R8ONadfCoQyrqUmOOHOp7NnDnHKlX5wY1qUewmU1sD/ICva1nH9vZs3c0UUjTe7LzYmMWXmN
 CNu9fmemJ4WTnSrt2iX+ODu2etR4L+4=
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a4252cc cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=8k6WQxmsAAAA:8 a=BIu2vOWKBFmx_kd9rFYA:9
X-Proofpoint-GUID: ZNOsyguwhVJW7n_yVotwfkgnGTB3-Sfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX1w5Yem0mL7tx
 92OboLmOlkN0p6X9BQVEJIbR1s5gIR6YPLXCpebyaleYI73YVBabXSKrYZiJQukR3b3XA+fAUBh
 HSD7aXWTjKsc0c82U5R9H24NuuDIf+GC+bk0FGCZ3BTsHEaNsX378UpygEPbB2otAD9NPlkRizJ
 Ve5Al9u+UvQls28Glhdb+lIurmZKzl2/I1k76QNtk2n7TPfsL45fuhFnFjCbIiHCttiaGt4GDWe
 s0qAye5olgWdLAZNlYsry4NuDqPNSLz5jpL1s3xFWSBKVMzX8Lsma7kszzR49+KSgKl8gmNlOLd
 p25L+FgU2BNwGsEFFg2fGPvpvzWYB4eJljQnYnq/QHjn/8c0BNvE7/R9oMXRFKQVaHg2EoFFTEG
 +W+snDrqO1QBQEC3MAdoc5SfJ5gAU8csJ/UVorU/Lvw4wgofHxHhZxILRlgesV2s4GmsflyJx+L
 s7Z6Dtbm1OIZpApHqzQ==
X-Proofpoint-ORIG-GUID: ZNOsyguwhVJW7n_yVotwfkgnGTB3-Sfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290091

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
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

