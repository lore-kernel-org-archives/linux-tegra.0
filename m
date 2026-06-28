Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456403A6F0A;
	Sun, 28 Jun 2026 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650622; cv=none; b=Jb8zYTCoaor6DEzAjZdDMN1kR1QlycCIpYdkdyyaMkhaf+N+mIDD/WdST4/mCEdrOYH7NUmMZYAjMzf5zUX5f/+2ta6woGuwKU4nlX3Dh1mMYyUsJRvPTL8ruDJdbuLtW7MFRQJMiFSCk91faMgVVTApKQv8L/marLvzgTA+v0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650622; c=relaxed/simple;
	bh=mHyWrom9KWSudDPmg1gp92ImyWNXEtHt7n2Cfreruj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQhIZC8e7OFGHtZdKXqRpc0qdVGTSilG+aTWMtIN07pUrBhJrW6BCnkaa6UlMwEXJTslFOmg18BVeihg0+xMjV9gCHStGwbk0nnqz0JK/0P99WnFNHFi8GZOqDDJdLxDaSgvAwdHJwgpBcfTvPQ7cJuxhOnFkqmvfxFQMEVVoeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=0dzlkzV9; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="0dzlkzV9"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SCSOfq3171218;
	Sun, 28 Jun 2026 12:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=OlS7PpA5vO
	hJYv4cQYugUQJ2xf6TUWjwTtLahCef4/c=; b=0dzlkzV9HSFzlW0Uby+GYuZDKy
	qfLr3NuWLU4r+skNdBRQRFFNOOR5t9mmTeWvM2tQzzghU9bO2jQgGtD6OtMkKI/f
	FtftDhDVpc03owBMEnH6dU8W9CSg3x3CfTmJS+p9nE1i9ao1RnHgCv/90gTYfGbf
	Bj1KEb14S8+KxqREUKyrQnQ5OSYHF4501Kx4j5ha7jGsIiidXBp3sq4G+AglZm2+
	jJBQwbJKtr5QfCYn5EvCMvHqme8TFbdk7wri6hoKXtDGz7gOnJUYDMpNSqDb8Mc3
	Gt1Xi8SzeNMKGo0wfz3wWWLpxfX7uVPsz6b12XyZGKmzXtQzQ46rqI4HHt0A==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2umeg9jy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Jun 2026 12:43:21 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gp8By2FVDzDRDtF;
	Sun, 28 Jun 2026 12:40:26 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4gp8GH17PlzYlvJt;
	Sun, 28 Jun 2026 12:43:19 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
Date: Sun, 28 Jun 2026 20:43:17 +0800
Message-ID: <20260628124318.627393-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628124318.627393-1-lijq9@lenovo.com>
References: <20260628124318.627393-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX0WtpGK7IWI6V
 x9dves0l1Zfib6WbI4e+wT0SROzSeD/QGq0KYpU9mu8E6dKaeyItpzqDVE3FxmA9OR6ku8jONRr
 S3nSs7zp6sMfaWNAdHo5I3lct/O2IAY=
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a4116e9 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=XYAwZIGsAAAA:8 a=8k6WQxmsAAAA:8
 a=ThfKujUPgQ5VA06l81IA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: 0G3iLt7G0QUHRqgPnoo0S6gurMJi_x3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX7vBToeEQ7QzH
 StwXrf2Z4/OpqMtarPwNDLfFmOE91tmp7fsUWY9B3rTfvlK105rBD1iKGEV3LdkiIGHjG9EaFO4
 StxVYgKDVsFXK8jJrp1F464qCacuETSDV4caeAYesX4rcRWEm8MbIKVxbu1fZmj2jOk5KpIp90F
 Z4P82yxTW9oNIsX5hl3AtUEovtY6pPMAev0uhg8MQZRiUTe/X/vTG9E398wk0mRl7Ilsf2tIupt
 PVL8WHDr6s4ZdhLrxUAL2N6H5eXkOEPZ9LY6U7s0uqJoIHIV5ftx3LPNzCh7+v41iuFZbFa+hqK
 qwJY8KQj6Kq14t5aforFUzQGhVtzf+Llmk5LxavR3GqUM+gutlr+hU0GBiuApJ3YjgTHkbOKJ9X
 3iIPdAXRxT+bUh/+ZS28HaHAsxShsv6d8SphhbcB3sdlzjpm9qflDEQQV2LkzD0NO+YjlHvdMdn
 5BHJcai06NPW4sRzDYg==
X-Proofpoint-ORIG-GUID: 0G3iLt7G0QUHRqgPnoo0S6gurMJi_x3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280111

Lenovo ThinkEdge SE70 is a fanless industrial edge gateway carrier
board based on NVIDIA Tegra194 (Xavier NX) SOM.
Add the corresponding compatible string for device tree validation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v2:
- No modifications to dt-bindings file
Changes in v3:
- Extend compatible string definition to board+SOM+tegra194 triple format
Changes in v4:
- No further modifications, retains Conor's Acked-by tag
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

