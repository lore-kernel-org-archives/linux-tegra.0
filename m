Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387739E18F
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404630; cv=none; b=j8KXbOZbcBqQHoaKcBOSmJclzrIyZ7Tn8TumPupZw7sxVDazeyt2SSHf1yjwiBxDROas5v+m0Y9jD0Ot6h23X3VkvChp95sLlcyqEnSMtSF5deEfe2SXpPf7z/ypsP8gOy9r1we4cX+249kRDWKFyKkP2rcIaT7EIZ4JClIMat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404630; c=relaxed/simple;
	bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1A1HcgUGLXwSJ056rGVA6h7CguqOkZtWPv606rO37F864vVnd0Mjnp3TKpsgZYa9vd2JtBj4fpTWDZjHXuCPSByZIiIgCTOg8/f/tvDBMxvuFaHS+5/WZVUOiexm8VGN0DPNfEQHD76F6lcbBbVDP574teDZnmp7d9ExCO17Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9guE2VH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMQSBCmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9guE2VH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMQSBCmf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECsD1f2736494
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=; b=m9guE2VH4qUM/cRJ
	F9CSne1yWYFXLejgSGprT79ctgmVOvU0Un8d+0E8aaesqKyWhy39p/Y5Nk+zgulz
	Nj6F97jEeXMdB7O/77IKakV+NC9vzbhiwyv0+JxNix0O24cIR3nPDmsy2ToeuooL
	eg5rtcsqs5cHJVQRQsNOMX2C29hm+J9lhkLUgwwKjku/sN51CRNUJXXhiP0Sqfoy
	ypK0q0R2Lu2+oyU+x76U7mJA9dHP9si/D0jfLUBBlngAHXOWYjQdmWkUXTJ/Cuy6
	hpIlMQ2m9ih2/r4ADu+T3z57erTicOBqKkLRdQ9hDxgyp6sNsVw+p5Or6YsQ+5tK
	PtqQ8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5ggns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso2600840985a.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404626; x=1769009426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=gMQSBCmfhkBwYHSCkXHPNGk7unzDAYpArpKU4L5rru2Hs1FHJXUIXPg/howUZI3jZt
         Dipd5yExe+fbbFQAVdv9EpAEl1Za5EwvXXrE3yxOufmQJqjEo9zk3G3vFRomRXINrZE8
         DQ49+DsaMH5MBSMr2gaQsEu9uzWoBVI8LnNboiaDqekekpJNoZfULyLFM3ME8uPn4G/o
         BLzSaouZHwokNqpKV4yIJdc6QiPHlbt6XikDsZFQQW3RyyDdJidnsBvugu+tlPj5yLgA
         1OY0wPsIUbRRNjHGdJ9Y6yhvCUtMOkV3NVzfkC+g/UNEQ6np3wBd9z6wCSP1m2hhaKVM
         1FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404626; x=1769009426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=EQF48vKwMcx4fKYfdW4kigPH5Q1rJ/w00LKUKexIuPu+PvDhjKXoevtUvi3V2zhoS/
         WYdLLik5mPCHnnQyOJtsVa6pbjT53146LuXa7ASvVUrNbQu0t16QhmD8FC2M4sB13G0d
         QTyEUg3zMbIY8sJGK5zeoxPOtccLnI2MQGRq+uSpo5Gmhx7yh9FNZT8KYruvdlaBUhqu
         6d+q1tAQ7jshbAfNm1R4ViCgmotFm0dt0bYyf5/mhRbSFr11KOd2Cjg9ZW7AdUTy5y+q
         uqOGWG/hK/4ubUSa6fQcc2PCcHEfodmxoCVOUB2qXGK9XwXfXjTJTonZ5ccapjdnISms
         zXNg==
X-Forwarded-Encrypted: i=1; AJvYcCXMJg7gkfLWL1uizikx1eo6S2GwTvEA34bewtfK9TWOfSGrVNRoaS2gV2GDfCB4eQ2YaarCHXf3GUiMCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoh2dEVkPiJcVupJaXct8hCIObPr08QDeYi4I5tE5eNJz0t5sq
	wHtLF9SEE63AuclKHnLcRgwARMk0AX/v8/j5qau8btdP6HhIoy51rElIMkTTA6cpmXyFsqwiUt3
	ONGA1uX9EOxmQM/VrKx0rmYTU8fw0Gjw5hudGOOrjPN3hawfH+FMQqGi89Sa/E96k4g==
X-Gm-Gg: AY/fxX6eNB01zyyCnYsIOpaplyrumSVanpF209s6jvMp2jxodtS9XhlgBo6IJWBI5ju
	6UWsMUDQx1ShuETCgpWH7WtvP1y3/mNepfsry7U5TEr7tUlcTyxfWGgFDsVP2ctmGwKim3d3FJd
	oUTo6cNpvJiEdmefjyc0YysgCEfmkNgzaFRdIv6jhBStENIPp5pnCtYkzBV/Nv8jvRlNoD/c4BT
	HZsufMsSDJrmwL6cb0MFCLuHNKVXvhMr/AVpqb51NSXhPkQEvyYAhOSuejRHOGBoaag49Bm+mkH
	ldqzJAOUojb9XMNRn8HDfz3KU9eXBvyLS9wbC2o6KN9hzCWCpHeIX/Z1pCTbelB5/fODXOgFssQ
	8rd6h/noXf2yM5voRs2AO/359B4wKRM6EXA==
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270061585a.78.1768404626572;
        Wed, 14 Jan 2026 07:30:26 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270052985a.78.1768404625897;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:04 +0100
Subject: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aCHz5EDoUoqxZYrNILSL7sGe0v1k0RWIrht
 2xoRozKYP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2ggAKCRDBN2bmhouD
 1w/tD/4gze1JdYhn1yRw9z1Dt7upNwMEXwviunBaUWTiyScupfZYrZZ+mi8XAQ3h7sV+pqVxDTa
 PlkvxnU6zlG9dkymlIE0QgQwLo9fLEkTv385MPjlesnC9lrc/f4FDfX+4dPN/oXA39A4biQkB+c
 +amG/ZurwftY7LyIH7q30PDuDYI4vF65nRj/b1+hVgqxfAvp9gAvZSRqpQHvBejFn4Y/0jwRz9U
 a/edRO1L1nMLZLFNbB8+8W6lcAPnWlYV4bma5tTKPxGMBTZSNBHmnLG78ad7y2kuVLduxRIgZZL
 BGStla564Uwnso8MjSs87/BMaJR+GTfNwesX1/LRok3T6S4JdM6K1/KHCtI/jz/+gWrLYZokrkU
 ecfBDZj08Vkc/2LTaQ5kpQDxJdktYM9STLZFAlNercSl7aVzW8OmmGBOw+iLV3swzbnsI1tUfQf
 kFwmjYQ0S4oqnI7TBdpuzYuPOn9N71vc66VV3r2ngU9DZFiWSO1ZhGwyfvLqDUvvLW1+JElj8Db
 jdcFgyCm0Tzu8bpsTC+DfNskjK/kXhSqapyyboNwAEEnFX0NZ34wopWT0mmkUiYg36PGz5siF3w
 nIvRqmBVbenaq9nzL8bCWZLjfudHFcAUvDUbRkL6uD45begdv/TVys2yD0mRpm6Z8qUVqmIDry0
 uvlzYRfNG+QaVoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX8VChZhz9ZGrB
 MHUUJkclCn4m2yrCgms2cSNlBajCfro+7qMqtzyhar1ZrTrhX5MzKswkajO234u7pHHDx0cTBLO
 daJw8QEWSivQlxjJoqlb8pbdHfj6kViPk7ZGzj2h+MwYNaPDZ7ihMa0mawOj/U0LFD0KqhRkweu
 1Ab4S3W+LFifdCs03gZfx2ljGg0F3UpI9sSnY5BGabBQEepmiYJlhN6ocfQCz8j9RNHSiPNNW2H
 0QktB6fCHZiCAzl4hrO9eUQgKwFnNHQ6AcKyB7blW2CJHPQ4xKNq+786xGDn+xpKEu0r+H7aa93
 vR5cMMqW0k753P40b5DTWHD9OJg51IQqBgF5u48Pwj7xlb5KmYwrCRCcUsHhP1D+FUQUI4eO31/
 Wv7msJOluBJOdDSTYqtYJD656Du9mIO6HxoTnsg0UiMtwB46xy/gp/JnO0VOmFnxQXUdJ4/jHHN
 gKk3S8BMv7qq0QAxoyg==
X-Proofpoint-ORIG-GUID: nxXqWyWRVcQ3ew9vxk64rmRieNMeIbi4
X-Proofpoint-GUID: nxXqWyWRVcQ3ew9vxk64rmRieNMeIbi4
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMepgddcWT0EFqeyVMQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0

