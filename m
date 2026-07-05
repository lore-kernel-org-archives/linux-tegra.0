Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C53A6B6F
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280481; cv=none; b=GBo8EsxZyHrI4QzWkLg3BketANS9fR4Mwn/tRxJptFJrewI3gVX8Ogpmdp9mBfDba1T/W03N9G+mS4x1WbYyVspQw6K6Q1sKmsrEwgi0kErJEVshCTXw6kzqqwrpW1gdaTp/XA/IlwcmaA39VDGwYhvCx6jl3zI7BGKsOrYOssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280481; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXW/jCNZsnCgKuvsUC+cYngH19v+FCH7SwgDf18neZEaZzMUs0qagh6TIUDwjRAmXj9wsHl2GEsFj+d1uQHifepQpJNjZRMF46l1WgqEBgSH3wghOgQCJiYzDRDjjGHkYazku0DFDNuHTfPffmvMVtUpQ5XS/e8OeMvpSrj8HwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jJCCQ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVhvB4ar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+jJCCQ4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhvUF2190406
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf8359g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc77a6943eso38160295ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=X+jJCCQ4rZNaH2QZPG0tZitzpUKqRrCOmuWF8J6cmnJ3Nezh1CbmYLLK3XFP/GW9Z1
         NZDdKt/HmKptEKSYSuSDjjeeCqArYdiH9LH5ds5rIZGHZqQcIDd7ilrT2+NMj0H2pQNc
         YXGiMP11RX308CqgyQ9qahuXGTw35xLR9bY8jQ6vV3UPasFMOeEz4Bn6i8n3vv8oXC+v
         8/q9SY35tZd5ymgEIzC38hWwU7FPnfggW/aRH/c+Nk0ZD/ocJvFlWX1+Gqcv8vZkZav1
         l+1xsS9fA6P9cv6WvY+n+8ZjiCX7ulw0dGUd152yINSkzYgwat5NwxLIITzc5E3CrlEk
         kUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=Z96SpDK791WZTz9pF3uHF1hUAJObuJhzNZFFt2Sit2GM9HPkh0fIfzVIqTz2zGG1oA
         c51FCciHvD35ufvRFUXfnj/UlcOzxYk12lWeFV3qaFaDQ+Blpz2tNp6g2cd0QVNUQBrT
         6FhNRZS4si64aSOaBoN5EesJbUIowTbmyGpav6012MFAMZsUILlrMloWTtJuurnsyB/Z
         8iPEaIF1Kai6WnH/NSWs2dcETC43/yhdhlwlnGIA7z3Mb5cvwmErmHunyHjw1hhqZcyG
         bckyW6HlTDluxlGKh6z0qger+lCLjPqkttV7HNI7GfsMXoVG/zcrITMGYndxRCKGL/k+
         H/FQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7IQtLDKu3h1hFoahHvo/t90b45Uvzwd3UTtqmzRXYGgKGyzDDmjEcbZVgXLbZQSmL0H1//9o7XjHzHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKw7LM5/yaC/I62jDJ0rgTS89SxNZ0ywL/iVb+EdezwdhWQ3O
	4jjhak+s0BqOjYiUP4ASfnfIhrv0tYGEmPVGvcnIP4EL+EyupyJkNmCCeA6hykNkHtkiJQyXYa2
	nDHRX8xhppj4UcKvOdrYEkm+XoUNVZRYrwO9Qe+Ge/OwvoABYD9Vs0c6ZEgF301qmPQ==
X-Gm-Gg: AfdE7ckoJ6/MWHJqB9HxnXVLhXcTHwi/PDwoeZuek2CBLADYM736KA6Vr9YQ0mksd6H
	ZDFusVVTLtCDDZJ0J5vIRIpY4vmcLV0yMcI/pVAAw7SQ1fniuH5vNU0Lxu6AxgJVAS4AcTICUH0
	c/0KVM3Qpmuyo8Si5EUEoV7NkMSC4ZcRhGgr83cUjjFUZnUN9TzEB/bBDU0F5atEVRSdbcowJqt
	rrI/b+bkjfZ0EpuuzOxmjho8Mj9uiSMRzyd8+JDk6ZN2ysGNoRQtTBqrapJ+PCiQPIdFOzTYp47
	QhsIpCJB8aVRD/mc+3GIVghai8awenk0lBxDO9IgdFjY1c3A/efGI6myvfwNzWQU0IFAh2a4h+S
	fqESw06NabNG1Ekgm6L5U0iGLEsHKwMon+P2x9Q==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826085ad.34.1783280478036;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m8_hkSS4UtEl9ZllFjLG5ONeY22kanmS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+F2Dw/qIktSA
 9dcEKmSVuK1E3ihGdEjhKAm5L8ntgWu1yB/8oBngaeIalD23Bc0hlG3yQ4Pu7a6ITRfYLInwf3v
 JPW9ASDW7B2dP+3fhgM1Qrp407rSplA=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: m8_hkSS4UtEl9ZllFjLG5ONeY22kanmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9+i/he5mDIDs
 Qch7cX4azHMhHDvxEYUGmd57lpbUcVfscQm0P0NNZdk2vj8FvDaKJswekBjaykl8baeGtrvcqgW
 Oig9OMFH5wV5STcr+UYUBtn0HpK3bB6DcU8kzDCKPB4BqMyzlkK833JUbY2KomR7Pdpnvt7vhJz
 AkeaPVwDthmofbA+dic/OnSlzr3XwSpWn7hunRqr1tJ4AbpGF6W7SK90xQqR6d1jhKHAVyPJtXs
 hwv07sWzqv76sKkx2RJjarknfq/zhlOf0Gz+0vxDqnds3XItnM9a2ZZ5UcVF1NbraF7wzUNn/X8
 efwH/rXlV5c+/ly0iDbe/hUiLDJBdQzVyH8cR28IvCiZAZkLqKAeRXBKSFWxNR9f3D77SUFROZk
 puUJOx5au3lQKUwGc5pfhnEzoPKkVWI25hZP/ot5zgjHTORzNZfTvEw675yUXmtHsgJCRCpbRzA
 lNHpCc81QlWUZOIFeFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

