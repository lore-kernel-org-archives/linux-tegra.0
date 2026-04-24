Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4DE3D564E
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046445; cv=none; b=c33Civ5xYSbO61kRg+MvZck3LtGYnCju5yD6sfJwUb+icsd0V5YMkaEucX7lf/98hpmCiA2tyxCt+M5FSosN+D2xuhJ90iHpG/EHOIf4/ubA6JOzSvyMq3V2hQ0sbkRBabRGt8GEuBprmiaZ+FicupEHdXJyb/Li0Ie+FRDSVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046445; c=relaxed/simple;
	bh=tfQ80EpOUgxiBDCFkb17UhX5SlzGTcK/AArT6gv7o+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiqA1+l04zAJHzEEezk8FKwWEDAvSATk3jmzDOR7M/KFByfc5wvi/NYvfdjsAs7wZRygkF/i1KsYs1hulezpdFJZyOaYzhwAw8yAlrtUB8V3bqUdyQukJZFl59UfkePLHMdjfUrQ/ray4ykhKgfL+6azdXHx2E8L5uYHC3nodEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxERZepF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEfT3xyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxERZepF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEfT3xyr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OFolqE518371
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rtXoSblsbaF
	WN/8XxSRRAiVAodNjpE2GqTEHjcsMM4Q=; b=VxERZepFz6f2PiZqXq1jGRVtf+l
	sCZsfWYPORpeyoXtA8eMtCoWQKL+ag4m8WInuCRl5wdDzlosnMnSudSrv2NeIRL/
	32kr+KyUmk8QelueH0qa4Z5MSdPJgrrIe/5i7TfgUarA5e3GziiOKWHHZTwO8a/F
	e+nBpfpCEb7caTv77JevpWsN2FssCy+NIh8YNVDL/Ho/5fYAuo9TE8Wd8tcPJVnU
	2pdnQIHBWL0Vh/brh7lEVuV9INDeR47rCvi4c/TyNxmvVRz7zJ49YXmNDTxlvsAI
	tL3GdxKOR0JZhDshkYd6+XiOAJHxKxAoFTy1w2UixUxk7+fkFDJFV2lQ/EQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnjx1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so103848651cf.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777046442; x=1777651242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtXoSblsbaFWN/8XxSRRAiVAodNjpE2GqTEHjcsMM4Q=;
        b=AEfT3xyr9b7mw7iiNWW/AMFxRobmRAEJiVwFJDaapNxDhRt2Oji6Ep5PwaZG02bwpB
         69fzqHl6L37flgIncXc5IELtqmAQFmwMOBNzpcMbh8+RgXMnJg8CSDViKyIYE8G0wUzD
         MbElaXvwn5klUtbTYrYcIMlkcVuruTR+xq/vrVuh8P0RghVvhYLqS6x16BhiGk3Y951e
         jI9zG3MkR2n07VKurC6NmWNkjoKMiWVU7mBTS0Psp+J2w8R9Nb50Tc4zH9/OtkOw6gfQ
         dRDd5ChNoglGyDkaFJhGslTBIdudx5lFsOHwKTCYB8IKKmKDWzzwXVPGbKGbzIR1Vora
         vWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046442; x=1777651242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtXoSblsbaFWN/8XxSRRAiVAodNjpE2GqTEHjcsMM4Q=;
        b=srJ0nXD2lxK4OqRnOrh2HIKhC1iP8wRZSVLHYUDN7j4CSbXQUF9A3KE46JE5JtwYX1
         EYtCnWA/i+zoqeOQDtl235Dt3hAyMMwgwxU2sCDqFKQtLqdCcqCFPWYksfgc22eCJJlZ
         T5WttdJ5aXndG/O8cToezQvQOklbRKd2m95QGRtpGWHHY/GYM5COxbOTHlxaLOsmJXnt
         ESdvi6fbRmb7FPo3TcRMppcMcDwoOkll3F5kUizMxzFZuqFDnWqA61b2E7kiDMfvr332
         wx3+5niyUwUZR+RC1b8onOa5QFHCoZNguriN8GxDOiREgF+kGz8XXNdp3wZL3UOd1JxQ
         dCgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uJg+KR2gqt1PY8ju2iN2tRGp/bNDBGgLFXrStHUdDbAbSgp5lEE9BtAsRIGqgLsEeyFFLZWmgiMzslw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSSgtkmWIOYkdHNHz0C0JGMQnZcEs3qIqw1U8r9wqeoW5cZE1
	O1pu1QG8WFAT+C90kXRXnU9rbg4XTGeYuwDZXMCyU8TzI4GVbLkkK4R7KFKQaH4lhYiznIfFRyL
	Tei6l2uJmweL9YjiCxCtZq9hGmC7BwwBK+cd/UL5VJ2ht6Jw5ChFr1FWXDX9IjdBm0A==
X-Gm-Gg: AeBDievYeBj4xwB6KtIc+D43YayzZ80X04pdqBDyUmlQEXAHu53A4wxs70H5EMEIa0/
	9+AP1R9uN5a8iPDuhqPDFLTJgTq4c+aBP+6o8QQgS4nB7DCOSkuJGwRuww2P88E4bt6hE6SLgwV
	uPcQ0zVwMIL2SHA9Wh57ygkdvY4oAcDEwqksSyIv/IC3a0W5oKa+eAHphtmYw0tM/2eZpEBIn3Y
	+kgCtDryHjoNCZqeS+kz5tAvxoNyGzkg/ArHNtBPLjP+Fs3kBvJW4OyS1Yws3Xuuo1c61IzmjDf
	FUX8Z+llFZjV2Jt+x80Z2K19BvUcTHKtMqXKSfFuMvpSyOKFJvhvg6DD02YXq7Fcit7zoTNMErs
	RGdrNN8sU5NNo3K8uKbj18HZEBWyM+u8cOYrHrVU9CDCEOmVHcdflGWLpqtej
X-Received: by 2002:ac8:6f0a:0:b0:50f:be4f:465e with SMTP id d75a77b69052e-50fbe4f4916mr184555061cf.53.1777046442007;
        Fri, 24 Apr 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:ac8:6f0a:0:b0:50f:be4f:465e with SMTP id d75a77b69052e-50fbe4f4916mr184554081cf.53.1777046441356;
        Fri, 24 Apr 2026 09:00:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm25405491f8f.21.2026.04.24.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:00:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] thermal/drivers/tegra/soctherma: Switch to devm cooling device registration
Date: Fri, 24 Apr 2026 18:00:19 +0200
Message-ID: <20260424160019.41710-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
References: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb93ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=SD-xzoykHkTshkma-kIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1NCBTYWx0ZWRfX0bZMT56clYW2
 kSWi2XuZYtvZXlgn4X6neej0JqEtDX+d2p4CV0EYlmipHZjOdjIC9LueW0O40fszK4Rlu5VOOxt
 IsSuH+kUUfrfp7UPTZB30lwCAVW7/63ovMi+syqmwq8kMOwW80iAGR7jlrAzYpb/z5DaVZBxwhv
 CQ5myi3fekew8ZZtkBj9M323+G371y6kyYRi0JxxAHTNPRez5D5hAlfxAT3bCwtnryg0DQAIzwU
 gzUQya8Pb2JxEwl5dowKw83cq7bFHVi4tgirQ7FVBKoObuoKq4FLCGJKZtVCVpZulJDGxmwK2wB
 HwVQ/O6iw+rJhZlVKunHqI0Rhy2rFqVnK7O+5qNPscOJkRxm35RyeB5Xx9ONu+6QS7z+lpVY75L
 ari5bs69YYtU43uVWK7PTKYL/97f3W1TB411HPDeMbLRVZBHf+idD0VCWcGmUPa21G2/xSSGoiV
 fxej3XxmTCV9ypICM0Q==
X-Proofpoint-ORIG-GUID: ZczV8ZasViCJdavntedvlXYVWAY8J1gy
X-Proofpoint-GUID: ZczV8ZasViCJdavntedvlXYVWAY8J1gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240154

Use devm_thermal_of_cooling_device_register() to simplify resource
management and avoid manual cleanup in error paths.

As a side effect this change has the benefit of solving an existing
issue. Before, the function tegra_soctherm_remove() only called
debugfs_remove_recursive() and never called thermal_cooling_device_unregister()
for any of the cooling devices registered here.

After the driver removal, the thermal framework's cdev list would
still hold references to thermal_cooling_device objects whose devdata
pointer (ts) pointed to memory already freed by the platform device's
devm cleanup.

With this change, the cooling device is unregistered when the driver
is removed, thus fixing the issue above.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/tegra/soctherm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 40c3715e84c5..6a56638c98f1 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1707,9 +1707,9 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 			stc->init = true;
 		} else {
 
-			tcd = thermal_of_cooling_device_register(np_stcc,
-							 (char *)name, ts,
-							 &throt_cooling_ops);
+			tcd = devm_thermal_of_cooling_device_register(dev, np_stcc,
+								      (char *)name, ts,
+								      &throt_cooling_ops);
 			if (IS_ERR_OR_NULL(tcd)) {
 				dev_err(dev,
 					"throttle-cfg: %s: failed to register cooling device\n",
-- 
2.43.0

