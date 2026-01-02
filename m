Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CB431AA87
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358233; cv=none; b=figTsIiyYZ/G/ExvGpi0aoU6TMVAtgi5RlX9cFtUMK9rc5Cov8IiT6sypjs8Pmz8cg/LTqGXORcVJCcIbrYpN+zHVe0yPljxiNPF2g140yDNdY5DeEcVbX+Rcg2EF2nbTGm23KhdpDfWDPnv2KC8PkscZom/qYKM53j88j7eQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358233; c=relaxed/simple;
	bh=G++6QhRZ5imG8eXcnZ/NJIXfbsUE2B4hGBJqUtET6a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hlHSeERBkkcgOHmCwNYheJAIqSuUkwr52vX1Cqwx8GV35Wh+7QaNg6i2AZ9ifXyo5w/nT6S75rD0KYM24Mflafch+YVeZx9+eFUHvm0o6V2OCdR8v8l0XcbJ6ppoMySpm5/USyfx7YxyXiq9gQ0rXTjk+l1O9dXb4iQrG7lhfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUJY17V9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxtmYNRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUJY17V9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxtmYNRf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WMFR824735
	for <linux-tegra@vger.kernel.org>; Fri, 2 Jan 2026 12:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VN7qYPnJns8CI98+8Cw+t6qzyUJ5Ba783GJ
	xo63JT/o=; b=OUJY17V9rjV2ROB7tNXZEtORBKj0lDERzP7YXg62cSvox1CZ5ap
	XpBfg006R3CBlc42aD8ZVaGkab4nd+Lh8Wm8mfp6O0kV2gffCZLgdmeJeMT2Y61q
	DO9y/loZk7rnJHa9aRsoI2Smb326IAez8DpuYcTO6WqiTD+kSKRk/IVkzU2xcr38
	pfI4whoUu8Hy/fQXHopX1hF9DorXoucEA1QWDyQ1ZgSCMmtHDdU8ITzYxtkWXlh5
	kUf605CqT1Yp8t8i+Pnl7NP9LhusAfgbc0nztjXAfYpSUEX3sUOjVqKWRFSWsKeM
	xVi0Vk0xSe1X+xlYRCpf3TVeuclx98kBI3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 12:50:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4fc0d0646f9so77958421cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358225; x=1767963025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VN7qYPnJns8CI98+8Cw+t6qzyUJ5Ba783GJxo63JT/o=;
        b=ZxtmYNRfpPMA/AtlCSgxPpLA/pUwh/kFyqJWVj4w3mUbK8MqI8c2BvYaGjWodOxXwf
         SYG1o3wIdM7tFZ27GZHqm8mjhzA5qYhC+T3KWJYA2AZAHQZz2kMGIxiziNjbwul3Jajy
         VY4FCSwzCjwjRXpe+5O8GGlQeYmlSlKNkRcrnoUMg+GaX2QijBn5yBbTzTneqrZ7i5i5
         WWRMwubrBlgtLRdNhxNrXFANhI1pMTy7/38NAo67J4pr2tVdOK9RL9sGcOS9/8Agtlvh
         tDcItmypyaK/vZ6hkphSSblsl+UR2QdeugUP+uMKR8gxPcqd3ledkRx6tjhURH0WvL1j
         +Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358225; x=1767963025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN7qYPnJns8CI98+8Cw+t6qzyUJ5Ba783GJxo63JT/o=;
        b=jO8fJKpIj/XOZny3n6gz8Bc0W/zeNODFEf2xKrZ3Do/aEzcIdp4I0BHrtNPaHeGx/S
         oNzr6CRGCBwEe01SbeA1HG9Zsajd9fXdCIYE6GUx1mBzr6/U2FlpNNzJRUvSVlyBenbF
         XYaPVDI65a5GqMeTk1R9KdMQbsl2W/oqVzNHvOBTxQkWlweZ/Oi1iFQFHWSdRMulNPbk
         WK+n0OEHSzoZh+Dhya0Mxm+rRiYICLUeV+Xoq8XS6JPOrzOl1omLBN/l12BP6iy8AyK8
         2/0Jy4VOctzSNcywREV/D/lulR1GPqXgcjCHBTjgah/Nx2FLjVzoBVg674fR+vHzRq2q
         IbRw==
X-Forwarded-Encrypted: i=1; AJvYcCXDpzwALq0bHvwS5st3Nj/cx9Z2bxMyCzMS1VaW4MulFjBGiNt9nC1mmY2BlYHRRem3LhnLe1zV9i1QJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EjsxCdzGFxFqLzKd/p1sa7K7sY10rJuaUr4uRgQCDOJf2l7Q
	r4KSOSEiNO02nFfppp5xAoaA5oiviXhCtd39EM3SR3jLf6a8tp6Jy7cVRmnOSJung1CDWs/ZCtl
	UNMjDGV2PEobmwqwd5vtJZe9lFVhGqsmLQ6MnDJ3zWSAU+dvnFxzX+5fdKMX60YGEIhlVPgPn4g
	==
X-Gm-Gg: AY/fxX6nUBrbLM85vcPzcYDWKERmcU3ygs16fIB0uC7IBRgjPPiV8gSEFspy3vhdcbc
	oz/z+Rcr6iiswrxp8B0JKiVLZ6kr/VM6sY7L3ziZfdPMGThZQbLZAhEz21uzqYjvoO3sY0ZE4La
	ULflXLhNgxs05mJQXW14tTdaNPdi5ve+ALtLRa2dtPptbctCRi00EBlBZzyks6rzD/x6hkLwoyq
	9zHwze4+iNkS4rQHwilnnl1d/VRfM5REB9afDCM6//WyUBpFsVV02fw1l7BnJZlGR22gCDemM2Z
	eq3W9YpjWlC360gcAXd3bPXk1YN5350aC64ZjuaQvy8Ny+78oXrWVtdNqqOx9P+ZXnMv+dxwJRS
	Jg0k7hzDtgt7eLAjjhUiwFzDJ2g==
X-Received: by 2002:ac8:5953:0:b0:4eb:a1cb:7c with SMTP id d75a77b69052e-4f4abd9d4bcmr652393041cf.64.1767358225043;
        Fri, 02 Jan 2026 04:50:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1ghfnELv8mZOsBePBhtngQ2BG7jOjJV7QZbd/hjaFkH6BBctEpAf2gB03vrTdnj8AGVnriQ==
X-Received: by 2002:ac8:5953:0:b0:4eb:a1cb:7c with SMTP id d75a77b69052e-4f4abd9d4bcmr652392711cf.64.1767358224625;
        Fri, 02 Jan 2026 04:50:24 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm84524116f8f.35.2026.01.02.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:20 +0100
Message-ID: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=G++6QhRZ5imG8eXcnZ/NJIXfbsUE2B4hGBJqUtET6a0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78L0EtP2+6zqNepsXgoyP7nTIT99Z2Nf/CKx
 0TAGQ5Wih6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/CwAKCRDBN2bmhouD
 15/CEACUtp2HYLAyHIX+4sYO/cQ+Uthnc/+6y91OQdAZem5UmvxQULIUoMtGYhV6Pt3CJNznOOS
 seIEA872FVFlOFu06gNwWzL7W5GerqLMVUQh0JJbLSyoGy0oGx2JXwVyqVrPXGqn92ICktwJ/Ac
 4hb9/mxVhc14OyTu1RTTMetGJgojvd51Gg2E7Y6qD2W8h+6/VXmzCCkQxdTnEm/R3ihbQdwG8Vi
 HFJrMuVpy9I8QeW1NdAD3w7c9xkjjZ/LqSLdN0M6gF0ddA7xFiEcA32Fm+mi+ta4wVedSNsUMZr
 ooMRuvYuAzdYViprivEsFOy+gbbjeg8Q7qEuxDu0LdMkSKeK/P5nhnTUprM1GgC8hkHzhwIRoBp
 lyJx3493naS1hDTZUmO5R/llsZq0H6Uvxu29Km2DZX7/Z2g5haj2Y9b/Z4zeQq/n9sWavumBC8k
 pJn2OzTqYhuhmU9hy4C5sD1xXJqJWu+4KeGMrJh6B/awlo1pi2xlIRiBYf2J/oQD2EE5nFhW9dy
 yi7JaOGfbD10PzxvgJJaQXPjp14uBCmXIHwF58K9pj1QfGrnInDXlGgixhsgZLOqIxUCEnSthy7
 atY1MuwkQg/XRyJvKHh+dbqL9izWZ4sc8qjSm9Tybsa8Adf/VKonv83I/9BFaW+3hdMHsuIs2/I yPEutAH5ZTrX5iQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zgxGu_WOnREMfaiWbqiElcschN0wRd_Z
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-ZZ0TiKymzVxTKEiIx8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zgxGu_WOnREMfaiWbqiElcschN0wRd_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXwSK93qYQ7SgX
 Gp8YN5Gbha5YX5r3th0wxR0Kc6PLAcVna6mYJPP1jnWwKIM/AENBBV9xHIKqbcKh0pTlm5plkNj
 eUbx7Uq6TLzmIKX5JqpjXWBd5GJp+KJViuy308SBJ/xnIDIbL6KvvLs1ervRptFBY5RBKk1vNHu
 SpivrOphkxnO+cIp0EDGLuT7/i6l8QAVTOjG0Km1OZfbkm7uznk/nAw5ayKqt3Q+dTDQ/gxQaRx
 Pf+W4RfNl+wq/AuIHw9TOPuqOWuryBBj4dZFMyOHLPtegfzn4+f9kU0x4jJnkiwQqQF7KzO9fyl
 cFqdYFJD4KgnbBUJd+hDAm8CLjznVA9tcUbDRqtKcX6dvdLhM0zCMaWTM1UmDhwJrQ+dtcaYAuB
 SAdUWvdZD2dkf6+vx/17P2jezv9EUO/0r+B9iUEZr2VKbWVG8J7Nt3b6bVtV0kiuo3YUsLOQiOt
 l8qMTaOK95NRAWroI2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 2a6db0434281..2953b62cb619 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -444,7 +444,6 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 				u32 ram_code)
 {
 	struct emc_timing *timings_ptr;
-	struct device_node *child;
 	int child_count = of_get_child_count(node);
 	int i = 0, err;
 	size_t size;
@@ -458,12 +457,11 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 	timings_ptr = tegra->timings + tegra->num_timings;
 	tegra->num_timings += child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		struct emc_timing *timing = timings_ptr + (i++);
 
 		err = load_one_timing_from_dt(tegra, timing, child);
 		if (err) {
-			of_node_put(child);
 			kfree(tegra->timings);
 			return err;
 		}
-- 
2.51.0

