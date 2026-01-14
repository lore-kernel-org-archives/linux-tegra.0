Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DF239E180
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404629; cv=none; b=deBzDlfF4OdVMrL0dpFaaWHmyb30E0b7dkwvI0e8xCHgkgAQxQcxNbxILyaAPPVNhW9saYXhVkE5aQQcS6gO0jwiei/F9VIjjzbgbwlM/ZrTDQ5lYGhZUSbBjosPbx2YmrSQeI++yRL6PqnKSi6fJnAj3hARzhMZuI0gRxMaQNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404629; c=relaxed/simple;
	bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuLj8gpMrphHJ26P7u37uBK00EF+SUcYxuHB9hUpaslW2bkPO/vL7h+KOHDZWJrkljRYjxTieeaEfB3TwwRL3OfINUR94dNMK7N+SjZYSRHQa6lIcKbw8Q4CgdDOaPL72ulqPe0q4rCM+Uklx/Pl9BPmFpoApZV9OK5eYbix36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd+c0nG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBCkinxZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd+c0nG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBCkinxZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECsD1e2736494
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=; b=Nd+c0nG/FDs7XoIV
	szExDaUVSYkyrbiaHalQ7Ap9+Ae6UJ/LuHmENsYmw2Y917XAkpOSA5PDn/ucsIXw
	RLjTwBfwp+vw9JlBmnZtHYYPA+nuxAqdd1pB4mQdMxi8gLqJiqMqFue9dtxzWhhw
	z2Mh4kP3YONo/VwuqMbCWqIdg2ZulAZiBjr4/v+VsHOzRPeea0BMSLLBuepXEfaK
	4TcnFo8VnR36XVqUEY+VzZlVDB5GSRQreJSVMoii0SAdOXRljAxbNb1718WPAMnT
	H1EH+vCGRqzwWc6iLgCOM8ppr/Cv0FkS9cCCOv2YBPPewR6rimIDRchIvZsKHfwn
	UwREZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5ggnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso2634152585a.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404626; x=1769009426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=NBCkinxZKeXMDWkesMxQMbkNJAWqBFUFeed37Ol5aYgNeI2gF4HyjMLoxTvX11ijiz
         io+wzqzcI1vzZK8gRDJkNzJbJaaM3b0HxeWX8zaPJJFeB0OoQuKtT34iCPmkcBZFMu7I
         6BFG26Qwtylw0OvMAnF/DKG1U3Jfh2XGYczaVQGOhqB7pmPsfVm+TA48mQQyIaBjkcA7
         wOsoJ+ZVpXSbXWcKgx7g5cOUVkNNcmqw4EOZWgg4/uVVNpAB5Mjuqm6xxZn+vOqUWBp4
         alLIIgxV/WJJfc7bRd9GerLEggftZ5873MdnzZZ56UfLlGoev1iRrSq6IU1LfJi3zFm5
         +aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404626; x=1769009426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=TJPkXVDw3ICYUdzAH3DoT7w83kvNOoZI0m7V8fQr3fBDC3zkq+Rhllgyl3sjI0fAJx
         km3Oet2lkeKv3x8aFKf8HNAoL5sHR836laV9bmErYIqRtBlbPHCsKaCmZAapUnQo2YZw
         FETLMCZ/yMMVO+puA6SJOSnQ5aNxFaGc9xw41g6s+HKnGQAGkY4RULhEG4oo8/NauHrH
         GSbBqzI8PPMTDTKYcRqAAYIYcIYT+xtAWoz1VzrbMwWhzNM47MLOyY61jkgrGtIDF6WI
         ttoBA1q5etRKTDKMbf68LoYYK9ZsA7CzC9Q02mnqGqSWDnRNSstX6SjjHFlwYjiZO5AM
         eYeg==
X-Forwarded-Encrypted: i=1; AJvYcCW7zMfNmOXDvtRjQGgyyeT1Yqd4MRZHvH9tv1b5BBuE0XcYuVQfLFvzHxlsmGRpjJIA7SrK6pLUCpNmuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzemMGe9Ph6eO0e9i1G/WOh2lenr9W8LSgBI28spPlsQTrOjZUj
	ylOF1q86Ir/TqFNJmQ5VMFW4eeU8uA5QlTaBrtlan2sR6/MPoABZfl+zBwNdchTvfJQK4pe1idC
	eSoJxBSsxnNM7EA5x/slsq5qBzfl3PKgrPFeecTb+cLqEzrzEiyyKFkaqbIT+ZkQvNQ==
X-Gm-Gg: AY/fxX7X5ZRQbujP362bTZPjzbOPZ5iR2dht2qF7jg0oc/E6HUrglKAHadqTYN5kZvZ
	iRtwd8aRMBahebPKV+SL29C7jvxQdX/aFS4wwOdz2UiN5BTJv2qPNvTFp03uw2LGs7+cq2NN5HP
	RRUCv17lC5nP3I4I/p+5Aij+ZHBCHrk5/RC1OWQkCAZPd2EdiJJmLImgs7kwASXAptKnmTDLRt2
	WFapLtVvKJ6MeTkfseCEZPW9sfZUFXnUrQFgfvjp0EUGcbIafS2CMeX/bmlKillV/IkZNBOoNWT
	GP8pDAB3S+yW/k9rMWAKCD8pBUJSzv5IiyKChiqBiNCK/cYjjQ9AjDCoY6u0dvhdJMacIb9hlWM
	Po2TOzODtcK44J36lfGcsflf78R8nKe8/Iw==
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386804585a.18.1768404625642;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386788385a.18.1768404624120;
        Wed, 14 Jan 2026 07:30:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:03 +0100
Subject: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aBbIM2DWPBQNuBnGlAmRqfublmk+ABnSOCP
 +eX7CJ/kqCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gQAKCRDBN2bmhouD
 13B7D/9HNpUgwKflmRiVEQKiqAHJlihytGsm6xhqvuPk0OXM6g4wK8KWJ7AoXqklkhVGJfLYvjS
 EVoKICEkLULEFDlMFEFKdNqN/uGc1TUwNp5gMcRJRrlIE+ZYvRo4LIknCsvHV1jT9i+Y2L23c3p
 +uDVB8dH2uwJv3IuhJUnA1gGMQM4xpw4ac7NB+UCOk2LnfcACtKncHKQ7jr4vbc3O0f3pfTQpJp
 dZkWVtWxp4BQm+5d1XuZwVzvgj4b/xAJcvhU0BzFKw41RORAakfzsVxAkTHHtP62LHFxnKZSwKi
 E8XvqOwq5O+74OFdv+vHFLcG/6f+rPsNDMLHCxupzCLkx6Pwqg6qJp9qYbsQJCEuj1EJyrotryy
 ANOtROt7QabL1HCVBOeWE7/I1c/PzdUslygkZyhowuMmtTrgMAsawR3fzOXHuQOQhjeKsN9lt/M
 fx0zuszc+shjokj+huAOTlufmrLlWzFxqM4Hu67hEma3ScG2iv485ncOEg87MQQpuFfjrtb+vDK
 ICaUVJAoHNSRifaTDmw6lMDG1ZAAU7vvujZpio8eHVdgOh3jPCnAMmeTePFgqI8N3JIJ+bkQyuz
 2wHidhJCNQckjPlFZ10HKxqor1PXsDvliPHX6i68yW1W61YZ+wIbn5bOmZ0GIDO6/jOlooNoy63
 tkrtX+1GbUIJE4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX3B1SkxOWuXDA
 mwbnTmL9KLd/1vxiWTWMOYWodEI6T2nII4QGkcuA9YMMrtrpcYUbv8cKwbjA5Fmv7yYips8YsJD
 O6G8G8TMrSGG3NtBXdLFXokNcGY3PDZL0Sz0JP8bX1K4MOOqzwCuzRS/QQdQr7+Z9Ianu3b7vmJ
 qmGX107B46WsaZpeRLQR3B2Ce8WP1k9siKH9FXBmAr0DOP/gE8SdSILwwdLfhE1Z56q85CTme5i
 8KNfgkCCTdKordoucBGgtE3zmbX7tvs6c1Ke6XTf3Dzp5CzL3l2HDh1s2rF1Q/fCPFlyAbhZUow
 ld/oq3DbFpWqgmxfw3QQVz5W4mNodbYs5u4ApBC6k7qml4THvr/fOwTBf9XCMcpUiZqLgm1vuKS
 goUY0ZYhxqCduDm3/NTFE+qgE0LIN9X+nhi2BvJ++CFLVJ7R0DzEKn9ITmLxOmShb6lgCVM8Zxd
 QRyz1xVauS74dlqVxSA==
X-Proofpoint-ORIG-GUID: EYnoe-lq-aU5jY-8HCa-dDzF-nxwpH0X
X-Proofpoint-GUID: EYnoe-lq-aU5jY-8HCa-dDzF-nxwpH0X
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967b692 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b-TtO4hhcUHcL_E8iecA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

Remove unused includes: no clocks, mutexes and resets.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 9b67063a0b0b..44f84e4c29bf 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -7,14 +7,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/pinctrl.h>

-- 
2.51.0

