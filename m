Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E33009C1
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759814; cv=none; b=dO31IDpP3uhAWgGcweLAi31KSZKOj+pzB/ezyrqMy7wWDQ+HSxA7wFa763tP/buNUeX1LfSJnd3lmWEnH8Sou1d+n3oKeAefZ9wU198I/8doWhF1oW1HRAdBdLv2FQEMZwZk1AtEKNtG0MeBpOQqHBfCQN3frJ7utbQrCuBYpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759814; c=relaxed/simple;
	bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6++tdWuKrBMRrws1sK8OE4+jAm1Hslp6vktTv0+RsH+pU7lG4v6GfLtZnrje/qQ0+glZ6wbVk1L3TkCCsc6/BcxrBpSP8vlZaGnUErN/uItF2zoylCKbuF5n6epEK6ygQ3whHJofVDucL8uTPhJI/7gAuqbgvaJ6KiPMrujjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKd0XTCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RG4z8RuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKd0XTCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RG4z8RuU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IBX6pq2016795
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=EKd0XTCH2anl67j7
	+xoS3zAwyuw5gexTX4UDZDbMLnC5kc49ZKBvo/PRSfX8H9/mojr8PFpvgc3ME88b
	6axcSF5oETo3Ez0pN8KFbvoEFyhPrF7c+uSatRaUEvMLzXAK644V1AGsZn56bvQS
	bCZLsjvXGEqpYS3LnoXqvUCuqUI7H7Y11WJLUaxSPHHwguRGZ4Q7IimJmipOt+50
	Q6aw2Gwamt/7NCO5mbtrghH/O7wwME0l9ThG+ASTltN1oWwT7WSEvV1+2j1EvAR2
	nzqjOBiZ1kktZ82XgQPuWYmITvwpCe163Q9AwYzYfAfXeJQ2iw890FeCl+fRz5AT
	mTlM1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqysjb50u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a291e7faso309783585a.3
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759811; x=1769364611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=RG4z8RuU5TN71yOmLLOTXsJ8ckqp6YQaHQCzDcKF9XoU+dWlVDRWQ7I+jdMUSMFosG
         hDWsSjJPT5LZ8cjfIWRf0mtT2R25mM3sl0qHuUNEJ3SuSLQfpgWwzxr40WrWia5YDQaf
         Gp95zPas7X017rLQFDYg4uXeUZyOvJMTUWryjLZPlW5rG5Y5X+XjPDkw4QWJFADfy7ZD
         JfreOTXnc7n9Z03lY8GdPpjuHXzApK9kWY0v1IIqheqVd4H0+WQ+lxnX2snkErKhuxhm
         22R4IjM5CtU98x7eJasvjQ8C77tZVGuAWPSnYlLPnvKDb0RueL/7jVzu1djijkw+7/Pw
         p8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759811; x=1769364611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=srA9jyNfgn6bZAsEAPploJwad9E+gpOQWE9YpfKu2Sd1xlmg5dnDOJTU7tHnC7ZXAo
         YpxCO7aECyCWjE6ebc29nbEyQ70ZGRNFdJK3AVFRIFqu4+lil5c25ep/FmYcRRcu+0NE
         FHdsaNVlo9jIeO5EXeql/oX/R8vWBPUsLuRFTj01GO9dAi7dEAnH/4rn2RIS3B9doUTr
         deY5LH7LfBOggYmeKElEm3oLyAlrxACNg8pvn9D55MVxU9k5Bmgwfe/KhR3TCBpN0qHw
         c/YP5Il6flEVIOndKZh4KkPWsZnaCT84jqd0xr7fCkVRzNDGfJ8tAXAoBB2xhMNo0MUV
         itFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJCuoni5YSjqaqJuasAGhaX1p5zDRWGj7m7+6mk0bzxmYorvZEisENxEbCmeUeLvIZKVKhlw4jP3ZHTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGlKlNJrEXlpQdX3Qf+BGA6X7uoV/lzeOYcQtqCJns/KZeQuv
	b1XDKi3I8Cvn5EkJyWgODK0R7bbOVg0WwaFk7F/FZLbPnOw5IENPU2Wljc9qMpnOxhYWi01I9uR
	dhjDoSI954jONTucXTp18NvMIrKsI9nRTswmpj//coRcGLWuj+Wif7EGw1GZwm3S9RA==
X-Gm-Gg: AY/fxX6HBtGgmjcCXxBDwrYeso79ns3YmwvWSUloHV61D5C0N0xwy8l9rgNzvJsLL9Y
	o3KxCOXUZ8V3CNFc0JWdAv4posLY/x/Ct3y4xXDhKUaHpB2Tf1Ri7xBB+FWWv8otV0ydyCXZmfi
	xhO1d2TLNzwfTHVolxJAjP3WflX4FSovL7zlqRQzbV9Hxz9iGVDO3ZOQbAN0GJGmTtsB1ROHwMT
	xdYnmBpd67cZFeLCh5gc3LW+2rvhO4XTRcvptbf04f1We63VMvnLpxh3KHIMy0fnxXmlpzMScCP
	+f2WVlkGTTS9Gqg7Ov17DUdfJvRoSwP1VWrxFPBab35hdpRTqHjdsH6tlyAdLjDv4TBF89ChlT9
	IC42P1lONaMjGqWwPxOTPi+hqf2p2kxitlg==
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391331585a.56.1768759811392;
        Sun, 18 Jan 2026 10:10:11 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391327885a.56.1768759810821;
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:27 +0100
Subject: [PATCH v2 04/11] pinctrl: amd: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-4-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHxcMweZ49Q5Nba1wrVt3CAmG8iWHmyaxcHb
 TNtiusHLMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8QAKCRDBN2bmhouD
 10MfD/9Y8BgVbkm6bl+36BXzMgv1xbm7JsRk164MPz0v27NRR9/A7MTJxMXT6LNgShVq1djSxge
 6g8uCxUY/9zNFfEZbrbUevJi5cHtHc5/YUTCSNnot/lyVENX5O2KSCx3dYOpUdjrHDF8VX8ybHW
 wzM/tjZOoVQ7+gYxMukxqt3s8XLQOVct9PlD6qtPZmiFE1vab6GQQgLNVgM1lOYylEfR2ldNJXs
 jXDMtydYwc+g2dbP9e5rnGzbL2XkzK9qGia8zw1O8+ri8yvQ/U9eaHS+WXwTO7Vlr1QAxEc4oUC
 zKbv4wtZ1zeayUoWUv1YYDBGknxgFxwVQ+bjAyyLW+9wq3v6aKLX2CCdb7vhkv9IIbgJ0ieuMw0
 xixdCHOWfKQ+OYzmelQ7pXLN7RTHkKO8loGnPsXOAVHqo6wdt1FOQH1bb4xGl9Pd1K011ZOn4sP
 piveUlRUfW37nPiHBDROLc5yASzQBPjKA06V8RpaHwfC7I/9bVbiBuGyvVHdGhk6LBSFFKEjrBX
 UljGUMx3HN/A8uksjr0su24ucX5chRlqNVyncRJqPaYjbJAJ0zFKM64X1r9AnLRwEVfas7sruYn
 VGBFODgVsHuDAOcu5XDZBnuzDmqv88C04tW2Pve5Yakzf9c11d3W7hQUeI1nroie7c8OQHhI2ca
 a6OcgYeqNAjKKjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=CaAFJbrl c=1 sm=1 tr=0 ts=696d2203 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: M6WIckONVnZKiQe4S9Bwb4oJ5g3k-eS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXzAUZpQNmKG7E
 jZLU/0NnEJgjm+xAKWrF+2niXXuMVF+YABoBF59QneTgJ4I6GCIzgCUI5j/3ExNh+tYwtpwNRMn
 dARi/rzlKxqsyMBo3kwtHP0Ubw15DKpq92UmYw4KCx9Rn+ogABZGqxRI8J81C13VIyS5hvRKRiN
 O3eW+xbaXF2VJeLh0rBAEckvJCgNkgSpPAX3Bsfn8o9YHB/8feBCze0oYQpjUQDhvERdZtRJFXc
 K8y+3Jeu8Erp5Ldgbbqg+G/Q9x/78Hr9bZXB9eoyi8EVXQAmSdQtIgvDiMShyiv8YMlu7BOrRC+
 hOSnLgnO+K0qvWD7ZWZMQR5Q2E9ez2qazRvzK2vDEtDpyxEnTJgRrMNWL7ggeLXZKenjbDmBEi/
 Tvnw14hbWwMjrAGdLj8Md/yXUu1vAaVq+w5IBnEredCeb7wTCmDdmTfBN/jMf2/GWN7f8vbrG/A
 B1N+JwEWiL0wXnhuL2g==
X-Proofpoint-GUID: M6WIckONVnZKiQe4S9Bwb4oJ5g3k-eS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0

