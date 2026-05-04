Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40F3E63A8
	for <linux-tegra@vger.kernel.org>; Mon,  4 May 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921238; cv=none; b=sfk1UL/743wnfde7AfzWFuUKYUrFembHuBsmPcx9fN76/WV8ANLkOy7wwWLE200DBy+OSgV+SlCR03GU7TLiGGqX8f+pfUHvctRWO40l1r7J1PDinrC8SdC07lPQ6jSO1ZbJEL/3XQ/gAv6klReSKY46JZL99SSijgG13Fx1wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921238; c=relaxed/simple;
	bh=fuiBMcFqX+EKI8OYaT/e70MCAsuYMbqVbQy4D8ePxLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW5kOi4n8V4hgNOcL1UiIQde3XCNF8IYpNIZ3XmGjdNsJfbcWUbcDg8q81sLwtE7+8cIdPjxJTu64OccNXsAwyts3f5VWYeyO9wUO8avKvTT8+m8RrYgnCuNkYCqpQlxc1mPWu8/LFNrPvfAV4av3k4LxVOFViPFX9RIP8/MBHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV0/qdoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bc2S7ZG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV0/qdoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bc2S7ZG8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FOpRx1346341
	for <linux-tegra@vger.kernel.org>; Mon, 4 May 2026 19:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IldFjPtCERb
	x6rbCVowsF0za8EjqnO5MEJ5NVuqXl0c=; b=JV0/qdoUo/TFXGJHoQJ+uN9685M
	ZRESn9D1E8NqU3v9elBvRiFKMaTmWFV4fjxgFb4cSUAJR2ZeP/ZawRWvGu6aZBK4
	pm/2hM5BjKssXjY8DvOuSjCtEp08luyhl+CIwV0Uw5OGakuSyicOM0Kz6C4dhaFZ
	SuXpQOUrR3NXuHitn9bogJfx9kmyZGp4PrpL97exyZTiSmDp5WA0c9Ygo1Kz20m9
	xAZZ6w4I5o4ZTH7r6LV1xq7/FyE9u7Dd2z4eVXOOXjJhY6hBl85wqHx0+pRpO+4Y
	ecNzINkVSHFdHaBqmh5i8AZkEaImvmyzt1qcCDBmkBzbAd0soA7dB2d0Pqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2x8u64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 04 May 2026 19:00:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d84b5f73bso153107691cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 04 May 2026 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921218; x=1778526018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IldFjPtCERbx6rbCVowsF0za8EjqnO5MEJ5NVuqXl0c=;
        b=bc2S7ZG8NKxhBSyZKjNHwUezq+2r9+1BsqGZmSb2Kx9TxiPuiZjUUowoXv5WAWMLkl
         7dm03AJJzT3HhmIRkrDBly4H3swK0i+ReFXVXq5A/eTQqD9VouO8VQuHcpZNjTVW44S7
         BfUaZwfl/dljFY6GpktIpJSiHKkkfBdeTVHH6pkAHKXTU2MHb9JMOHwfm/qymHcPR75j
         NDWaa0JSNcMbFT5ebVqYQoX8imN3KUpJukFjVwwklC3576oFCutdngRiNNvQQiODtyzO
         yNdAGvEmJWoyzkblTevG2ng0A/0Erhw+YDJ8bjhhwOvNhSJRqME1/4tKl8YJFba68Qz5
         5/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921218; x=1778526018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IldFjPtCERbx6rbCVowsF0za8EjqnO5MEJ5NVuqXl0c=;
        b=DH/j2KTnw2z3T8Bwc0YRK2rY9CJ11yWRybI/H5SOjRDToIcmqVbOs/lN5WhbBUbBj7
         G3j0xtjvqNF062ZL3B+nwn9clNilOdEqd8I+80Lo9ELTiyLa/6+/aEc1Zb//YAHvu+qi
         tNe4NDe6Io7XSDopCFH7nE6DjUY/NqKtbD+fQsrbTjPglngSoTPO6w6kLs1UY36tbKw+
         bZfh/nPYpqdZ5xWm7spWI2jVrWP8Jvsw0NUHZuhcpvjdq2eHOSELlEy2hF6muZXb0jIh
         hLHU1C+ZysuzMjGJPtuUcUpJbQMpijwVK4QNllBYrh4eXniiHP0CEJeS9oEscXtuYhC2
         g/Xg==
X-Forwarded-Encrypted: i=1; AFNElJ/UHaR4RXCR+o5ORUirBHfJSKGxq8KM2NhTHQ24jnTNcqtqn0mLakOMoOOE0pYhTxXzFDWTK//YtuG/fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfx2KdPI9svJWhwr8RRz5yWQFV0K5dIE2AAK+EhxhdH16mX/qT
	zmuMZ0b+uR2pATAAImK8ZG6Tke1J5n3i7S+9T0smBg4Ct93eo2i/O292SGUC+FAxHKsm3U+je9t
	4U+5ykluvWqpCqs2O1g1D13GezQ7cOqFBzncebFV7CRvX0cPD8OGezAhxepoCBFdOuQ==
X-Gm-Gg: AeBDieu48ZCx5iUBlOc2VeOrUKAePEtFyafsg7M+hatShW2yebXop11ltuuIdUfDS4r
	p44h+QD+VqKdWDWlC2kHvf3Hlg7k/lgQOZsi9tA7Q4YsSdsBwIFCVlFAEO84D/X6aWNjo3r0rkr
	GH6P6rzfHvf4m05U0nsEj2sjb1derjg+mKZlXqldWskZnKSpBPXJP3MX8r4nRwwO2B356n+liOt
	aI8yO7oNB/Kxf2RU9L3nKs0GjZYjsENh8QuxmRq7EVn745cKPdQdPjWHYLMkJsmeo2tWz+UKrjS
	ZjHBEMdX9RTpAKccutalA+lPLDvo9tdONN57XiHn8O7WmOiiBXK/7fEQi4Jh/bP8pNkSRsFLKds
	IvfIdwC0m6RNYEi19RFF32RuG0A7x4mC5NltzzgxaB5a8gxM=
X-Received: by 2002:a05:622a:1649:b0:509:1ffc:c538 with SMTP id d75a77b69052e-5104be11636mr171986211cf.19.1777921214590;
        Mon, 04 May 2026 12:00:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1649:b0:509:1ffc:c538 with SMTP id d75a77b69052e-5104be11636mr171983861cf.19.1777921213189;
        Mon, 04 May 2026 12:00:13 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ff04927sm102847035e9.36.2026.05.04.12.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:00:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] memory: tegra114-emc: Simplify tegra114_emc_interconnect_init() error message
Date: Mon,  4 May 2026 21:00:06 +0200
Message-ID: <20260504190004.747509-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504190004.747509-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260504190004.747509-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fuiBMcFqX+EKI8OYaT/e70MCAsuYMbqVbQy4D8ePxLo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+Oy17VI7JWPQJ4lo8CqLrX9fQzT6rgKZ7vmjc
 jmn6MobvxiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafjstQAKCRDBN2bmhouD
 19W9D/93g13PilZ/Me71Xtp3ZR5gXK1KCocZFK9ydz14w6I7uCtoKkc5ndU7D5ikPDwVEmJcugQ
 LJCSWUOKnOJwKP3pYQaSariesDjyd/QM5L+6Bl1wZfuVauAYYOp124jkDCwv6Izb13AVwLPRHuC
 Tw/tK1y7wP26qUbEYDQmFF00UcNAiWhcMoM3NemI1QhbciLZ2ZGvU02R/QsXl34d8n8VgtIPkVM
 QxFYVDHKJgi5gxm1bWhzShSNDuNe7onl//PQpr5JvktGYEIpuh6pBvEtbMarkSmtAG0WR/eKbPu
 TR248qUpkcT/IzFpH81cFvADd+Jv8GJyTsN6aQPAyLBof+tAb/X6nsO+4EWBnfbLjHSFCCMsToL
 H20cYpPIBlHw0B7xgJQJd7LXj7CKjXXX7SOUQpQMultY+QXtp2LXoflUJgfa7ECOJf1Gl0V+uEe
 YKkPQp4/B+ucgGubqALLIJYaxMRIQ5JGFX/x366Pm6mSBp2hp5nxjAi/JKg8TlVpowroE/7ohY/
 Dhj7Q2ZdAMPt7sxbehrtrYYbHscC24vuaH0FfVugL5GXYwpvQECuq8pi7aRYL+reAIfJbDkTO4R
 5WN5s9NgTSkAZUXq5WSukwiDCXYiCw8AkXSZK3ivec5OM7C2ZykTetXJx3Z6KGXZwYEpsLx4QYN nIiwUkMmv1yf2zQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f8ecc2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=S1phG3xGeWsdIefihz8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Y0F_3R_CIZrJL8eOxW16RO8j__KzmWHV
X-Proofpoint-GUID: Y0F_3R_CIZrJL8eOxW16RO8j__KzmWHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3MiBTYWx0ZWRfX1+M1XQUCF0TI
 iTJWI96sqpqvHPqcyCU1di+QbaspJKoWzCdOeU9/FEUkgpqOW4qA479WYIJnaEMiDbXfQAJ0ba7
 m+PavMLYe4IGpLVyyjzfazoqjd5MzN5RZZJKMcy0FPuZW7IiVmXe4YT5tRIcjPMehgm1K5rNEpc
 ujI2bsrOGE6EAsCFvkVQHnpWLyjiGBYGb8H+8+rkESvEfiGNll4+gcHTskaHASq3niXs3JRbbpQ
 gMsE3APDnhKe+Hdp7NOeoy2IVHw8Def46TCB5iHxN2tO79kPhjrip8qXEiep5H7iEG5NnlkRgXm
 EInvyPgT3l/QlZZk8i0xgBrq6vrQaNwOpj2FeeqjmsLSW/3yMrL+LjTYskOFnwBPNn+S9GDg0Dy
 8y7Wjx7ZqS3KF/nSzOLTgfOfJt4/+NIoZg2XfLRn26egNs5zzrpa2vNQt58jrXoab3amz0rfGeI
 xm+G0pCSdzZXRFhs4Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040172

Use dev_err_probe() in tegra114_emc_interconnect_init() to make code a
bit simpler.  It's preferred form of printing error messages during
probe, even if actual call cannot return EPROBE_DEFER.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/tegra/tegra114-emc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
index 0af73dde99c0..fad82962c0d6 100644
--- a/drivers/memory/tegra/tegra114-emc.c
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -1231,9 +1231,8 @@ static int tegra114_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
-	return err;
+	return dev_err_probe(emc->dev, err, "failed to initialize ICC");
 }
 
 static void devm_tegra114_emc_unset_callback(void *data)
-- 
2.51.0

