Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99F62FFDE1
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759811; cv=none; b=SXrjjqGISeB2HRpM9xcyj0ehK9/A3fAfVRMHZVEaIpvfO4i9v8HxaytEkEfI+s99bCN3IfkzEDEZRnZxVjbD3vrcQhPmRpwD/8uaJS1kyu+LbZI8cnGTm2ApKQnCw1WJbN8Va4baRZAUIobOsKp2wr/rx6tLOPhfLtvpQYwdUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759811; c=relaxed/simple;
	bh=7QVsX3meH/ya2n+MBwkYR1pzRXVW1X0rbx6284HAjYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjOupvZP5aomNzMZzDe72/XbrMgN+K0rtmKNH43aedvwzsam1LNVzQoIIIkfCiIju5JoMHe38w42DG90o6Z+AO8+Fd3EPkmSpZ0jG6PDEsXzQ25iEEd71YuU0Lz1i9NYlNw4ucYlOSGoUu06OyK2ExGDYYgIVG2JYn3HcPffpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL0a1Qb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZyLaTjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL0a1Qb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZyLaTjx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I1SmSd1945939
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=; b=eL0a1Qb7gDs4Ddve
	0NXzoUo9WM/0fPiz+owufJ/TN7UB1YorGCL5iME/3xC20RYpToTyzU9rMAl69/cX
	p0se3f7oX63VGOYHAj579mzRleSJhJKqA1K2iejV6rNmmjQiZuwrXiluUYJeYd43
	p05ezSi73YZu3gmMpnkbK/NT/g02StJ2p+xr68eOs+RhPvxe+nqM/+kqh171eNhf
	e1I7pgMXFtt3HuLgyHGwJnoLoHWAQ8vKfYIWwT6yLRTTp7thQtJU6gCSi8EfTM55
	bOH6F+Br1a/t/yoE7EIMymmpb2Q/8yYy+chJp1osPlgMqMctqVegdOP9YCBrenu9
	NTwUXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36darrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a291e7faso309770685a.3
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759807; x=1769364607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=GZyLaTjxGwiQgDRbu3sL/e4A9c1cd2ag/n3tCUItndGWxgVlEbRHWEvzdgEkjWwUHC
         RSaCn8pGvF3evR3IJmm197i7F4VUSCAPYJEcjIJBJPlOQeDn5gB8vbwna7aqqzmPE4Iv
         ya5K/evDv9sXUCxfTdVmwXQccOwGzi4EQqKXVYmbypwsQhc/W30heopHNTdoVJz2tOv+
         VJeIiCV3OKLoUdPPwFZrnURG9Rra07ZUr5aueZAhTwRoatyruP687trtIkWsJlOPTEq/
         QbaARyT4SxweVda/mapTBlMBVCF87cSI8TxzRkG4LlIOFxKCmjkTErZ1kW8xJ5xTly//
         oW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759807; x=1769364607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=o8Oyxk6TPycMBHF3YIAxp/QvtA602Z6B0usJFOpNrWhtu+ZF53x+POWaJ5B0gnf0N5
         zoccmHPUfqvdhQ3IAmeoL3bZPmt4gqtP3SK7CDTiwEnRrbsYN5c5+blxR1hzonehDCQW
         HxuyDdYdS0kG0pXLxWJ3PcsvPVFDz6csCq+pbpnHii5rC3EcL6Qh9pWcMwMHb+8GbhmU
         Rr4BsbtB9K6yudbVJfhip5797tFSmIex2S5Gy/GNRQpMtS6W59wKzMOYW+epWxVEReXo
         k/EEGdB3Ys2bxWGK8gvPXPR0/WcuZIyzFNxHC0tBCPQpyPVaoqy0KPb+2+8i/j69QNX6
         jKbw==
X-Forwarded-Encrypted: i=1; AJvYcCUHGV3VqTHSZhqEMNINnbMN0IGlG0HHqNmLWYoon/mhDWtWPV50II3wsDjor/cWW7Grd515oWTukwWVAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Q0lXIs+h60Hd/zgoTGU3WfEvS/ZSWj1h3Y5HKq6RdbN5+8mB
	ohon/PSFsjdEnnujNu4ZbYI2hraLZeCP7E1Jlawevqp8Chs05497zARgsNuUB6jGtOcm9lK9D00
	QnC9e9L1xsUfH3bC2cMYwsiwRXnH/8KYYKUYrU4CLL2igG9mEL7bINPvk1BtEHKYIdA==
X-Gm-Gg: AY/fxX56s8N84tgmSV0fGeOSAQDAHsuVqUzUvSw5cUDfVR1u2CBE45vxLGrVx28RZEv
	ldzvhQBp6Dtb6IdJnZZXJMtsGiY4envUKyc2kg1CVZiIgrIxOSWX6ZAqFvBY00Kbt0yRPEd1s46
	7DXRDe/Ikj6Z9ZtP78Opcma778rK3sJB/ojhDxE9Ep3+gg+KTe+LVlZn1F8y/ysBs4QXqB/JX6h
	BFPh+wmmUA1WKQOncwQ2ocifVr3AbtcB6tjAXzhDqS8G/MRTBa6MAL56fLsQqJY+b7bLr7hCwIR
	NjA5wnb9m4f2qME5Kik3EZ684ktTKcvG4tYmRCdOQyB0I1976ojaryxFmPqMHNjHhlTzyQxjS0H
	1GmF4XEoZifQB+sOEFXTaNbb/e9zBJj7Ozg==
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320493585a.10.1768759807225;
        Sun, 18 Jan 2026 10:10:07 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320490285a.10.1768759806815;
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:25 +0100
Subject: [PATCH v2 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-2-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7QVsX3meH/ya2n+MBwkYR1pzRXVW1X0rbx6284HAjYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHvR6NL3AOW754D5v84SJb7LIyFBtY8KP66G
 rat0rpoDimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7wAKCRDBN2bmhouD
 140hD/oDwb35yyHvtbjc/M0Lb0PMZ0C388lWdCmXu5PHWfBfqbi0pqIpiLHa/I8lydecaQng+2T
 6pXYaLCQXfyx6d6HjJ55DKT0y0CB6wGv6jNrkEel9RIEZtNF98EnmNQ16fH/1rSb9mkMC7i2p7p
 uDQZ4QUXT4LLz83NgAx9pJhb0KnfOtuSCj7ilWSVwBJAtUtjFo5I5GRJSTTEh56yE2ZABLc4cPM
 v3zF59Hm8PbD3E9MuXG9dkZ3zcW4LPXVh80oYbkUYomCkspDgpq1XUWslyrduP8BRg61ub43bFN
 D7b2pKxQcp9n4qRPG87arVBUJzO5bUdZriEhcvIwRA8g7Ty4t1XjUE2dBdcmlu1jHGR4yu0AvNS
 J7gZipSXXYh7pfrpXX5hfVYQaU0Rx5NjFvVJYlHsg3MPu58t0NRwsCZyu5njKqBnL97H23DcTnb
 OGU6INWVFiyd26HXHhgTxNPu8HbyBRFE4CXAtbLk+R38puFmLXoAIe93PD83NKVNNA5JuQ1qMDT
 03Mtb/klRnsQT786huPeUBAPeMhGoyfg8zbw5gZNhOsb7qtBjGABqQ2+kFMbdfME3WC2aEWdkol
 fQpOxqisp1hpLzun3NpNsowLGMaZelCuMxI2s0Eqx5whKM1Oq8cNrvIZKO9NQDkY4SqD/TZ+3rw
 05cWuH/pid0x7LQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX0yb/nnMesF5D
 0GiB4Qs6SLzCjhVv1YYdcBNhCbCMu7tTFKt4YigU2vzckoT1uDOB99qEdgA/W60MJ00IL/YKmKV
 O/3GzaY0aPbUnZ1oGW7ciwriD6c1Y4mHt75Iv/cmTIVwdjOKHsea/zmEM7D+3C0a559pmm2/EdC
 uS1tUuDO2ZWVa0i/G1ANvBpZ2xBCTWF0xNeaJqm5XsRbwVltn7F90tkHS5mTcV5NjuT4GC2Ow/g
 PrqWJf/kT6gM/1/ffXDQsc7DTKr0L7jX11ho+J3YXS/zMg+IfXY4Lg3VG5LmxA8zpwGP8g2jXmK
 fDio1HaDgDDkf+5rZsBmswbI/Lx0PKfkVwbJU33Fsjc1+uWVqVBON0+/bK9oERnIw1UtATHaa47
 +77ByPx0VhxwrbbmFRZj7wwHI5yJOrWu7CWzEYXNyVR0uw8RkeurS9MgSXtddEsQUFGdKQmuijR
 3UTBovsgcalP25GfIMA==
X-Proofpoint-GUID: hwTPNW4_j-okTYg_2qimpJoYoS6sNs3a
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696d2200 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Bq6zwJu1AAAA:8 a=EUspDBNiAAAA:8
 a=2Nzugx-BcEq53SDkSVIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: hwTPNW4_j-okTYg_2qimpJoYoS6sNs3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Remove unused includes: no clocks, mutexes and resets.

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
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

