Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEE3385B6
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046441; cv=none; b=G7kH/D4ZwqHAgT2JYGtw1AI9+hyaUAeghSPThKGQb38/ToDt532VifC/dOiB7MS21wc8QB5Tk3PLtUtGicufW6m1bWR2In3kzPmXDeZz2jxbKyeQe3JQCHKKIUBxnFKemGKGci7nWmUE9hcB6v3HlqTrKmYmHobBsy6FdMVA7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046441; c=relaxed/simple;
	bh=HzjZYqm7vAi1tx4pnndBYISW7omiEKfZZzMQA5Cx5yY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D27paPwJwXeDwb7aUGnkxCLd6fm3/OBuSuL9b6l54GtI0sfiv0Fk9NosG4izGr7WRJvqZ4sRbgBIYnTGYnWQ8nxn0TAvtxf6sZJiv4v4Sn7fTBE79qnQcLXEE1F9DWu8aXnSywcK8tuGeX4T4s02/umdYlSUyCV2HChaTz0+ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NePKo4RZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8l8Ea32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NePKo4RZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8l8Ea32"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAErTk2447107
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xu/Hi6gljTZ2SH/iawpgk1o2TY1lwdgvWw1
	ZQJbCans=; b=NePKo4RZV+cRhiXc+5MLx+mXJjr12P8P6ZmrevcrX2SzYrWYfVN
	1ky+ZNeS7FaHc9iBPvwsmTlrz+rZSJv4NVYI/sdI2vTSVMox1NJoh/Zk3Xx8aXJa
	ZoSX/1VkFeISlwWzKe23FKZHfmDXapu7uHXcO4VkmwDXV7KGXnBDUK+Q+V4cb5Kd
	DkWCXkz7C2w3bxebZDhxlOwfICtyA8Us9jVaGMQCdAqpWAuDiTqsiRflCNEvd8xy
	vEpqHI/jZHR+GG5bZbbUv1bEt7Ap19B7yPl86tT53M8/UdkDC3+QwFpe7ZwrxpLg
	Ixi/3WfQrG56o2gYMkbSpUiQgrClnjl/F+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6kpsc5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 16:00:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso114897861cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777046437; x=1777651237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xu/Hi6gljTZ2SH/iawpgk1o2TY1lwdgvWw1ZQJbCans=;
        b=I8l8Ea325XCV/A1NkMBRZbli7Nk8QF2YV7cih2uJ0+VZAlsMxcPvxAVsxVtm8Y0PyD
         vJfX0cdEPXvit6S9swJU+5L239cMdkC1aflQpH5KeGRAesWohwGGKogXZ35fxc2d5z2z
         le7LTq0sZDtpNlMxlwlkQhcoD8DjX5Iw09/acBQ4N4W2lZAsIVxJSzLITmYhHYWWv4uQ
         ZU846XyatAFi03Vjl6PiR1SNNpaHOgsHy1dXH/5oFrPi4O3CPK+vdngrTWJt6TG+vFsp
         /f0BFVQBHRO6NEH9TK/ZROH7oKwVaTlz7zZppOFiDDZm/PSH6fOw32xYddyZxmdEoogj
         X+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046437; x=1777651237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu/Hi6gljTZ2SH/iawpgk1o2TY1lwdgvWw1ZQJbCans=;
        b=Ei6mEUYCpoya24fQ0wlVVcpzQuGlvGdMbIpebtTkQbCOzKe7ePlO4XSf2/1n9b4bs2
         /oYWjPS1XA48MO/l9rfyYGpqiD5EpFkQtT0T7yNohCq7urh6HF9kM9GsvtI4kQg9EHvs
         QYVFoG3GMUAO//PAJzgIaKhC2P4DeWh3GPIm319tQ2pPoF9hB4W+4n/aq+xqCcaBUyzV
         UhLMHMAmg47O9ldV0lwIQqdXgiZ/9/7gX1IzQocd6oTD9AVFo450d5XZSdJ7EwwMY8Rn
         JDO+A8lknI5TK6cZZZZezgqz3POnSiILoLJLm8Tc5mwGh8jy6bhSlPFfXOY/oTwd6jpB
         pErQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GiSiHejNuY0HPd8+4NteY43AP4YkacjQCG7yq0cxc057A79WRjZ6aVzvg7rIPM9D+YF1OKh4SykHtvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZE+j/KwT7JkQLBLvxJDJXb4mI4AX0DXa3aumHtLn/HZbqDqKy
	8mmmX+PQoKOxSDRhK/+GVVaSWsDqPu2vyBKQE5SeS12I80pvqMQtx3699iI6HCyG0hAIQrhkL7M
	a6w+W1NwNoH7aw8DpAP8i02vpCn7CxKbcOso1RfNUAJvQ2Y7Ipi7uHhoz8qtQo1B43g==
X-Gm-Gg: AeBDievqAWoPJnBo5qqvVUVme4xSZuScUvTLMm0roXELimKE181SNpe5pMIFZMXqhRQ
	2qcvY4Skuy/SzYfuiwUyd5WHDQ2zSGqvPTcVHDTiTFPr0xJEKrELEgQ7o6ZJKjEZF6wHA8YF+9F
	w2s4EltMY3eQThYn2V4uuClZPUl289GZPZomya+Dhpu4r1EJTlEhwHurUynITMCzf3lw/MwDY1b
	w2VEwy3Rpy1QisVw6riAQ/M/C6SteAFYWj5Q8kwjfk15rg5sEjp49jsXB6f4t/RSD0y/uJyzTBQ
	0+JZIdHSHf4LOwWkRm16ydqjtP9VzsAkU9u1GzlZhFYQHV28JJindGxZgFz9tL2hoAqTdpuzNV0
	KEXyydsgwc3Ks4WjVX34UDtNSYJRttgIPttJMr7QHdMVDn0zxzAyGXRL2jlcV
X-Received: by 2002:a05:622a:53:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-50e3661d421mr407490111cf.9.1777046435519;
        Fri, 24 Apr 2026 09:00:35 -0700 (PDT)
X-Received: by 2002:a05:622a:53:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-50e3661d421mr407487291cf.9.1777046433866;
        Fri, 24 Apr 2026 09:00:33 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm25405491f8f.21.2026.04.24.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:00:33 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drivers/thermal/tegra/soctherm: Use devm_add_action_or_reset() for clock disable
Date: Fri, 24 Apr 2026 18:00:18 +0200
Message-ID: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cdDiaHDM c=1 sm=1 tr=0 ts=69eb93a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ggozHacZmVhwqr8k6bIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9yVojuZGOdfgDrO6E-mAr-fj2lDHwb98
X-Proofpoint-ORIG-GUID: 9yVojuZGOdfgDrO6E-mAr-fj2lDHwb98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1NCBTYWx0ZWRfXwnMONGecD37J
 954u6BuCVOuxkFIMGrrskgHz8Y2B5KQgNwQahB9qubwRovihn5TZ9DgA9bPV8EYgnY3idORy/63
 6AKm35Noq6nLFd2r0P+cNP3KC7D6nC0u6p8B5MmovvpShYJ7kuBKGPtmg5mLoyJWVzgFBtOZywG
 VkfLtOErKdbiqIrlR3h6jW4Gv6+P2IIpGUuhoQwMeLo7EnEFkrblS0vjiL36ydRZdzYr16+4uU+
 9tgsUBfMhYzytbUz6Me1zZ4xosJUe+3utEBPl/rksrUch7+zvnDLaKYOfvjYM9FFBOxPP0zKO0V
 2sySAbKy/Hct/Z6lTZxkHRXdeu3ZsjjcKpuV31v2uNwjuZ22NrGmvIazd76xorM1FcrRBHOu9Pf
 ldG9w8Mtv7nth52QZDRGpf+X5U8dIccQkWw9ncmURlxQpSGq37K7hRCXE+xrUXmeCo3n5ae4wKt
 zcbag4JHEM7YLbO2yYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240154

Replace the manual error handling paths disabling the clocks with
devm_add_action_or_reset(). This ensures the clocks are properly
disabled on probe failure and driver removal, while simplifying the
code by removing the explicit error paths.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/tegra/soctherm.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 5d26b52beaba..40c3715e84c5 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1499,6 +1499,13 @@ static int soctherm_clk_enable(struct platform_device *pdev, bool enable)
 	return 0;
 }
 
+static void soctherm_clk_disable(void *data)
+{
+	struct platform_device *pdev = data;
+
+	soctherm_clk_enable(pdev, false);
+}
+
 static int throt_get_cdev_max_state(struct thermal_cooling_device *cdev,
 				    unsigned long *max_state)
 {
@@ -2175,6 +2182,10 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = devm_add_action_or_reset(&pdev->dev, soctherm_clk_disable, pdev);
+	if (err)
+		return err;
+
 	soctherm_thermtrips_parse(pdev);
 
 	soctherm_init_hw_throt_cdev(pdev);
@@ -2184,10 +2195,8 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	for (i = 0; i < soc->num_ttgs; ++i) {
 		struct tegra_thermctl_zone *zone =
 			devm_kzalloc(&pdev->dev, sizeof(*zone), GFP_KERNEL);
-		if (!zone) {
-			err = -ENOMEM;
-			goto disable_clocks;
-		}
+		if (!zone)
+			return -ENOMEM;
 
 		zone->reg = tegra->regs + soc->ttgs[i]->sensor_temp_offset;
 		zone->dev = &pdev->dev;
@@ -2201,7 +2210,7 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 			err = PTR_ERR(z);
 			dev_err(&pdev->dev, "failed to register sensor: %d\n",
 				err);
-			goto disable_clocks;
+			return err;
 		}
 
 		zone->tz = z;
@@ -2210,7 +2219,7 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 		/* Configure hw trip points */
 		err = tegra_soctherm_set_hwtrips(&pdev->dev, soc->ttgs[i], z);
 		if (err)
-			goto disable_clocks;
+			return err;
 	}
 
 	err = soctherm_interrupts_init(pdev, tegra);
@@ -2218,11 +2227,6 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	soctherm_debug_init(pdev);
 
 	return 0;
-
-disable_clocks:
-	soctherm_clk_enable(pdev, false);
-
-	return err;
 }
 
 static void tegra_soctherm_remove(struct platform_device *pdev)
@@ -2230,8 +2234,6 @@ static void tegra_soctherm_remove(struct platform_device *pdev)
 	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(tegra->debugfs_dir);
-
-	soctherm_clk_enable(pdev, false);
 }
 
 static int __maybe_unused soctherm_suspend(struct device *dev)
-- 
2.43.0

