Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492B3E7145
	for <linux-tegra@vger.kernel.org>; Mon,  4 May 2026 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921215; cv=none; b=sgX7t+jmEkkxx3IsfBSi6nkBbngHDsMaZSQUt1k1e/uhDOzIimPGYD4ZK70VvgLTtijzn0S5uxYOUigLbu/eCpm+47A9ks+c3gWihbT28ZX+tIC7CEW/dt87zGdvRo39cgYxqF6lSVdy1H4fTf3eYMoZRySbdL65zWVeN3TRBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921215; c=relaxed/simple;
	bh=rhkAj0+0uw80V6/71DOfXd9ESsZBH+TI2rR56De4lbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RBbyFLH5ECMZM5+xaEdaGE2bECj4cFwWFM7sydu20JghfJeODMK07n4F4YMIO2GKUuOcZOPvwH91CgZepxFamBI96wjNJ+tZbISspW+j+Nn+vcGwUzucuneuNS5YYF3z7HzmOn52okq2pqbqXJ8omQlL6zToIY4pB7ui87uoirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLiudyen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rd/uKHtK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLiudyen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rd/uKHtK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DrK2e331251
	for <linux-tegra@vger.kernel.org>; Mon, 4 May 2026 19:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3AGBR4RTiOOZHXO8PM+os3
	gG1hCr4zVelaYWYDfiLRQ=; b=lLiudyen0ndsFEDXqt+Bizv31kYU4ZzAJ2SXmc
	IRLEx4scxELg0ozqHBAZecbbTfsXoL119pNi50zHi9w178JC7G0yP4viuWMV2s/+
	fyYC9y4UojujaeAlPgUK9KNL7pFiD/E+dZgjdFfLMyp7Vq7IDdvgwtlfUvT3ZhA3
	F1sBpqik7tbY6zzxL5e3RSFS6+kCxi6oYYv9P2SDWBd9ReSNmFkk0XcyHwAI+Bxy
	UPb1Z4nifvPHmdJzJ+jm/MK+NNoIujcD3p4SA/wsyjBMN/n14EiKFHJjcmAMUQqL
	A76wAiVfD47cPLIHw4+bcLM/UsIOJRAXZrNlHeV2izObbncg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1974t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 04 May 2026 19:00:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso105691351cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 04 May 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921212; x=1778526012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3AGBR4RTiOOZHXO8PM+os3gG1hCr4zVelaYWYDfiLRQ=;
        b=Rd/uKHtKaC+Ru52kg56/ce5QVpFBP9uRpuXgoh9dIP3IQHFptz7SkIZtlbVKBLalR9
         2krDNBpK4SN5XIylEdkn9k0syiR9/4EX0hnBc/3L/gTPMYsLwBUGktzBENprbDbU/ELJ
         dCYeU7Cq8iZ/q/Hv5zJrVi5VkYAAxEV5zDL1suic8ndyP66Ryr1niivCpldCUyR9Q30u
         +IWZpiPpkS/bwkFGs9FPZJeXXSeKgdghWLlyNrlfrHYqw4z/hx97YQa0uIeF5grdxf1l
         4/hIFzYwTmUgHXr89aeg66gLDpgUp/8yeHaXCDzFVws1s2DDPOSyrveQKE0MxcIdMKOX
         SBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921212; x=1778526012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AGBR4RTiOOZHXO8PM+os3gG1hCr4zVelaYWYDfiLRQ=;
        b=mcvLkZnAUDXlKVc1fOa481oOD6k6d3fgwgEvttghce1P4HsSPnVUYOlXfw37fQ1trk
         FYbwcHlPV7pqw5tRMKB3GSHL3S1dg8ofDbblhjUiNCmB6hBS51AjR/RHTRVXtqw4Kc5n
         raEqqmy7xODo/xeU7m6CUuH0wnzfJQspeN1Bd5XigLEJN0kJY/KcZKVLa9T6tmTeb88x
         2pfAiOyYAR7p8AWhazYggwDfqZHTZ5GlZazH0BVcDWEyTKgOmYpmIWdjEQvDTHj/9V0e
         236wJ3GGI2J4RHsBjS9q6NcZ4ubgxQsqw5NAwJdaHoAgGphRo9P2ktVVL7j/4mboJzev
         LFaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tIc5GdC9YamnNsM8hnDAy242ypjvuMi58bZSN/+/pLV+LJ9zVoQSGCio4ovLbKpV0E8kPnIZHqVQCwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymkW2wWdMd2XFFwtCdYO59u6ZeNJJMnjEOOjMYjPEkJRXL2a5l
	PwsHdClziok0eAdssjKBS7C5HiVpFyjC1+yX64E/0xF61pEaLJxEjZmZpMWcVA9lIIuYBuAe9T5
	oxvWkHIoDW8TyOXC44ll9DBGpcPP4G7CFxnRrk59tY+89FSKr16jcVYyB6iJ55P/xJA==
X-Gm-Gg: AeBDiet6norLHhzOGOxuiIXq1UcsE5zwAOr7JMbBZq7Uc/LLqKzmRtttMh/x7RfiCMF
	m1aKfPSkxr9pz4J8Nzb6C+IxhtAoaqfSidEiIGflhK659NVQPNcPzTPmJYWS8Z8H6oSwdhw/4wq
	Gy3VnMjJbQYpZoweIx5meUqW//IOlHc5GzSrJie2lOg/8tiE07x7X4SbZ7HPRFJ+ok3kW4bK7O8
	17Bi7tuckmkmKEb+W+uEl39ZuhVU4xIdXqNlsyVYq4yJRFtN63c3tUp/EpU0EQi73Veh0hG99g1
	bWZ1hJX/8n6PkrU9hClgKPVmSSfpwmk6kWKr1p8Cucb15e39ON1omwIaNEw1iYRHNrveg7Ijw7X
	dlurNY3wO/pLr6omaYzHMDATs1q/8fILdeRIKcrDIFKxdTIU=
X-Received: by 2002:a05:622a:54e:b0:50d:83e0:3216 with SMTP id d75a77b69052e-5104bf522famr152893821cf.49.1777921211709;
        Mon, 04 May 2026 12:00:11 -0700 (PDT)
X-Received: by 2002:a05:622a:54e:b0:50d:83e0:3216 with SMTP id d75a77b69052e-5104bf522famr152892331cf.49.1777921210697;
        Mon, 04 May 2026 12:00:10 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ff04927sm102847035e9.36.2026.05.04.12.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:00:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] memory: tegra114-emc: Do not print error on icc_node_create() failure
Date: Mon,  4 May 2026 21:00:05 +0200
Message-ID: <20260504190004.747509-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rhkAj0+0uw80V6/71DOfXd9ESsZBH+TI2rR56De4lbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+Oy0yqxmoNNIcmLU96BDXwku1MJVdAgyiiJPZ
 s6SsSzJr6OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafjstAAKCRDBN2bmhouD
 146xD/0f0OZFXcmBKb3W4XKS/6tOp+AFMXsmN5dovdDUuMYt7WSDMlKG2U2+VaIYbKLzAgHtVPh
 QGk92+u8b8JLY/kIS8BUO2g3U7QnLh2zKCkg2dlLqMXsJYAxGWWNv9IEQkghs+vhe6qqEODLNYJ
 sWX9LRscYZ7v07TR9LhKfe9ayUsDPLeVbKcr9sHB6hJnFIa01SBa94egnAaSrCRk4M03/xFttHa
 +X5NoH4IpDWVXJ9K89iCVQIsIVDIUm582nVTk3jLcidSKbRbZIuTOt4QNWnq0V2vW0WljD/9lZx
 F9YGjVfuYfTrxtNcyrB3rKMP35OmT67bU2XT5WtP8CgieDVEMus4hkNqHX0LD+YcI1i0HesH3u5
 Ak7T3OF4x/vx3qydRcv3Awl6m+1myXEXxEl5sPskRH2yuizGzHbdX4ZciC351Ek5O404vmzf9co
 2PVRzF4kDpoAgsRNX9/TH7KcYUQkDUmbWtNRgHxMr1JB1tOmVhyIFzZyQteWH1FN5knKkVYEZ2z
 iPvD4IlJIEiB/D7Hzl4hCkK4b8IfFjbSjlQzTnJAQJ4uBpj/Z76jKru4Fy4Pd69Oa1i0McFqHXf
 7/Vr8WTp2ZkofTHsigLInN5wTxh3MxHFbZ4KkYdIGGjU0tnfmhE2rgFlKzQ3BNYYbg+COBBrYH1 aWiJvy8sTT6vM3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dwUjlOGgo0yQ9zm9WkEE3wA3_kgPLu2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3MiBTYWx0ZWRfXyb/1iUErhvLm
 2+SEm8i3iL9zXrQvdmrXtilg6KNO9MinJLVT4I3OgrLgZwboVCwfEQPN2OsVFRt91OXDbV33vDQ
 hWzdfOcaTou+qGCBa4WgejjxwFZxK+IyzgkxOa8GySzepBpds3obeHwtnos3PHKEZBLQUpmM8bh
 C4YwOsnn6KK0kLLfKIeYoEJwY3/Uqv0wbbuAZA5yqUYel3j/XKocmn1Kd9YR7B1KrdhJIx9tsDT
 maFPlUSs16vmJuIKzfLSOMDHcSlxTBRbgXSxko4RifId9+/cxenkcGG14ETSrIl3NfjsxTN7Mgj
 jTqVCsdYoxiwgji+PS2oc8EGdFTuzelzCp8ERnOsWh5pza8fd8kZekQzUiG4L7ni9KfGHUSdEHP
 qr/0NcLuScWBJEyjpLD09Eg9OsoB0mbTnM8aPcVqMznZTTwduP2h5CZsqwO3WKDODJdV9Zb5I3/
 ip5g1sgzWPwm+/xgRIg==
X-Proofpoint-GUID: dwUjlOGgo0yQ9zm9WkEE3wA3_kgPLu2H
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f8ecbd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ydqbyjLzeJJycWZoebYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040172

icc_node_create() is alloc-like function, so no need to print error
messages on its failure.  Dropping one label makes the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/tegra/tegra114-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
index be6c699cb656..0af73dde99c0 100644
--- a/drivers/memory/tegra/tegra114-emc.c
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -1202,10 +1202,8 @@ static int tegra114_emc_interconnect_init(struct tegra_emc *emc)
 
 	/* create External Memory Controller node */
 	node = icc_node_create(TEGRA_ICC_EMC);
-	if (IS_ERR(node)) {
-		err = PTR_ERR(node);
-		goto err_msg;
-	}
+	if (IS_ERR(node))
+		return PTR_ERR(node);
 
 	node->name = "External Memory Controller";
 	icc_node_add(node, &emc->provider);
@@ -1233,7 +1231,6 @@ static int tegra114_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-err_msg:
 	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
 	return err;
-- 
2.51.0

