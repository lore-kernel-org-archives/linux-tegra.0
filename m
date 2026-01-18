Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3E23315A
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759806; cv=none; b=kkwmwQgplAOYWDDVvgXFdh2b+7VpRJFVdrleoBJ6gCp70hd9SE3+oUvm1jO4MpdKAcAzkgh1t8twmRppW+rtOs4BxYgXp5VIiQjiuYzU/MWQ2L2oH8a9wbZSevkD7WFmJC9xKJwT3bUm1zCUzipTkSplIM5qmpJHmoTq9An9yBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759806; c=relaxed/simple;
	bh=dKxtqE6F8oVTPGmj41LTMmFmCHa0XUBAz9pzJ7TKy6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QG5fC2aTPpAabF9JF5ClsATLoD+s84t/u86wfGPqCP2QnrDVPksmw8CuczxbCYPn5mp9J/HBeWdkeRVbWhcVZYUZiDgBm8UyMbcMujJ/jhZ6qYPexeSs83vg/0L6PKBECQkfz8M3I+/om12S+giMObt4C+s/aOhAwj8NmOL4S/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ln8b4JIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqLu0Wn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ln8b4JIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqLu0Wn6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I7rjgc1865030
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e91dx2Lt0A/p1SGAlZ5HpZ
	8yspCC620dBzh1TkoZPcU=; b=ln8b4JIBtx2p2ndYbdcg7hBkEyb8pP5Fi+t9R2
	NB1P7oS6+ntgck1paeRGEG8rADyKM5ndWs1zZ+0RDq5mVA20ILOZTncnS3WdLapj
	TMk3+Ewh2PB2rVic9DZcHeU5jFpYMoABdSAjGNbAWlZrcyA/s+7t0xc6gaVA8eX7
	8QSsd2x7S2YKQWVdl5sEJHTqIKs7GeR4L5HbZLzL/s61kBoysGTYHvJpvKSiyKVE
	VbErM39U3kx54UlqVR1FsyaYP+c683FhscWbonpJQ1M5STzco0LUqT54xVB3qcmS
	JyVCbC0XT7qfVkbZCwUOfTtI86DXgn86xnEgU6+1vgUHGC8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t72r36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so755651385a.2
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759803; x=1769364603; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e91dx2Lt0A/p1SGAlZ5HpZ8yspCC620dBzh1TkoZPcU=;
        b=kqLu0Wn6l2/7s4olXAKEDWG2To0vjzrk7xQLLtM2MfmpT2UAgwfjco8b3CJcYdtDy3
         KUJi4Oi3R3CmcqwN1gPCj99oOGKUWd1mKi46C8oZNnhfhJHQfrf3mJ7nJrc/dTT/H5dF
         qqG1/iXkuuQOOhzLaZ+VqOgKAg0jf332Zz723aZYUdV8YMHPtAGyuAEaFx3B7c30FZpC
         QGS7DcEk4gktyRigcQmGZlw1Y/PcJ/CfZQ6I8uCH7mwF5J1u7psLP5p4t1M5jlWT64W1
         w6SpdPddyDXBFBQS0xdB8aEKlcSizGTnf5xXDk9kkWh5qo+6mq4Zn4rSsgaNPlXTTmdX
         kphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759803; x=1769364603;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e91dx2Lt0A/p1SGAlZ5HpZ8yspCC620dBzh1TkoZPcU=;
        b=oK7pIWvGYtXwgPz44HRQCpO86rQRcVf88fQLCuCuGS8Uar67Dp1P/4nwDIWr8NAm8C
         HsnI2gGnw9CtQw/fgaEBeFM/5FmmoCEwyeJiKgtwF84dOFn+DscTIwDm3EBGECxcX7OV
         QpFXM6QzkJqckfYDXKo/nvwOVZJrZI8A17djPCwN4wUI3o//ACpqhegTITTQ9Xy05RNU
         Q7SFSKcZ26kuuOahxT+UXyH9sWhbWKW0nO/+94GGCkFSZItFF1/0Jqw+ZBavlnHiyGBA
         KhMfMh737xLx6gtFaIxho8atDvaD+qAxBdY9FUu+9EZgE3dqNwWshl+qcrjhsZoZkXkp
         RyCg==
X-Forwarded-Encrypted: i=1; AJvYcCUiFegWftXzWbRcus1Z7zqlLtmiD3QfBbjfWVy4B7L6+LEdF/SKRVqhSleRsktI9w5OCfFgfhwRV+bKXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywalvd5Nf4/QHVm6kz4wKRW0SvEpVuPkQKH1JzdPwzC4RegkOLT
	gbUTyq8KkTeUcqZ4RfRpW4XTKgmj9RuYbINo0ZIWSn779u/z6CnGDlL3C7CG4vJjmXiX4EWjoh4
	75DeL9ia+Y1Yg5Du5ePmy7LzogTFaaKmpl5fF8w620qGGlZXzU46KZqPMsr9fM2aJBA==
X-Gm-Gg: AY/fxX5dyjY0+QXmGQzqYfjEw9T8pKyORnyrefMIpNRkmckM8VMFnYAUc73XgbwsaNt
	VjVxi5taBxLtRrFUfUk4tZepfsMmkkO8Uxe0+FEk2MqcvxBXjmzRfKRB6DCY4iJHQiUhB/1TYgp
	n4fcsHrs1clvd/tmSmMqUSF8jTwqCmL6uMe9afyvA5Ar6KZUmWOLOUCrE1ZrDAVl9P6+QFpmunH
	O90w0q2MJ+i9O29GwQTF/UR0TYg6TMjo7fxTD/UcIp2C9vwAxEnGx/SH6APKpcCvlgP4P30TVeR
	AUyxdUDwluqYQZvZzyamUv2kksU2lPaGWM/qu3ux6+2CuLtYbyp5w84Mx5buichnSsFH5eR4r/I
	eO6ItkPPdzJIaFVvLhOeFluIDsxQY1oTlVg==
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr1375658185a.51.1768759803192;
        Sun, 18 Jan 2026 10:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr1375653585a.51.1768759802656;
        Sun, 18 Jan 2026 10:10:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] pinctrl: Some code cleanup including guards
Date: Sun, 18 Jan 2026 19:09:23 +0100
Message-Id: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMhbWkC/4WNQQ6DIBREr2L+ut8IotWueo/GBQLVnyhYUNLGe
 PdSL9DNJG+SebNDMJ5MgFu2gzeRAjmbgF8yUKO0g0HSiYEXvC4YE7iQVaufUE1G2m3BYZNeo27
 athdt2fS8hrRdvHnS+/Q+usQjhdX5z3kT2a/9Z4wMC5RMVFdeN5XS5d2FkL82OSk3z3kK6I7j+
 AIC5y64wQAAAA==
X-Change-ID: 20260114-pinctrl-cleanup-guard-d899b4938b26
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKxtqE6F8oVTPGmj41LTMmFmCHa0XUBAz9pzJ7TKy6A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHgS/sC9MoC46kLct9nO207FP02f+ZKWuWF4
 x/5aXRVPPqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h4AAKCRDBN2bmhouD
 14R3D/4jKkbCQoTMPrMXhhxCHhrjeKIra3ZsTo8nPBiXx1ID7N9lPwzEIYwEZO8B49U/Q01dq5+
 fUCazLvlHLe2RVwJypxPbjPXDZEh3HAfgP6uvjK+JegThArZiW7Msp/3kWgL7JRn2WAZr4FJOVE
 MhnYZ0KcknqqK3deee26SYH9o7TYNQpnT5HC5fu4m8bFgWNDfZ4f8EMv1rKquIp/HWdPb437xjK
 gdyrQCSvr2uGwRe7V3JHT13jrs8B1if8tfgU1U64WlPSQlcIvvft1IJX+mbe8rzvpggj4Uu7hem
 +pTVezsrkvRW5z+WRI7I7opzoBaGi0qFTUibXhzbG42KeuGaJCCvY3r6Kf+mgf6aaRfPhvR22Yv
 EfcagSijmlL2S5tZv8KR2yes9TEOLqDFKf/P6IrD/+WnGPgNf74qHRpqPnmIPVcACbbA1PgkREr
 zT5pT2C8Thpf7dvRv6PzP4FJs5pDS1EfusuHXjRKP740bHrWrLOFVFvVau9MYu7Ft064VpIS5KN
 BHE9uwTEtyCczL+C7z2TbfRGHmW2/mQqt9z/bk9EJJLp7iGmOsat40UDsozN9a/2VAKC2S8GziS
 HzceKkh1lcWCJVgmwBcKgtQnMHvwF0PT/ni39xYB4PY+aRw8ESy90SUN8GoKJ4qvhbAiSolNd8w
 X8uqy5r2f8iL1YA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696d21fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=SAbWReso6WKF-fSag6gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WOxkbZwhgtTSJMqRq_CcErYP5gKfbU8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX8chU6NAQAGHX
 uRX7t7nPj/vE/NLJ1SuLLoJCB3Jh4LEtwi1MGygE8d9IMo6o1mrA3Q8KdJW3vAVfa7HNNgdj1gO
 Qt9ggHkCdb3gllT0RYDXsHapkhafFwjFFTzzVdktdjOPwoC0rvnPa7mfiOmRYzIeCoXt3dSad7i
 koEljxNFzARrrxlgwooafbTf+lEsY0JRvLWmMPe3RZMujs3abeX1xdjjHyCSRyAKWue2D1j6uZd
 3aLqofsoJCN0GGqD+MzgANRls4Ikr8TGON3sj07T2b1JpVDRnL4+Jog8LB90Vnyx/00xLSxFbLb
 R+CPs79a3P/LDNuQbplZexVi/fzwHZe3K8PWNVI9Wf7Al//0Cd7EmMk/gJG7TH65ZWVGO3beizA
 90/PVw75afaNRhKHH/R3DWNqHun2/ElZdpRjRPI1B8A/HvJkWJ4CCgBesMe47ZxFTdTtAINASYq
 TSQtp+zqJL+RmudhQnQ==
X-Proofpoint-GUID: WOxkbZwhgtTSJMqRq_CcErYP5gKfbU8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Changes in v2:
- Patch #9 (pinctrl: tegra-xusb) - Drop stale mutex_unlock (Jon)
- Add tags
- Link to v1: https://patch.msgid.link/20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com

Few cleanups - from unused headers - or code simplifyings, including
usage of guards when beneficial.  I did not conver cases where guards
would be mixed with gotos, because this is discouraged practice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      pinctrl: aspeed: Cleanup header includes
      pinctrl: starfive: jh7110-sys: Cleanup header includes
      pinctrl: sophgo: Cleanup header includes
      pinctrl: amd: Cleanup header includes
      pinctrl: aw9523: Simplify locking with guard()
      pinctrl: microchip-sgpio: Simplify locking with guard()
      pinctrl: tb10x: Simplify locking with guard()
      pinctrl: tegra-xusb: Return void in padctl enable/disable functions
      pinctrl: tegra-xusb: Simplify locking with guard()
      pinctrl: rockchip: Simplify locking with scoped_guard()
      pinctrl: st: Annotate st_pinconf_dbg_show() as holding mutex

 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  5 +-
 drivers/pinctrl/pinctrl-amd.c                      |  2 -
 drivers/pinctrl/pinctrl-aw9523.c                   | 53 ++++++++++------------
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  6 +--
 drivers/pinctrl/pinctrl-rockchip.c                 | 19 ++++----
 drivers/pinctrl/pinctrl-st.c                       |  1 +
 drivers/pinctrl/pinctrl-tb10x.c                    | 17 ++-----
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |  4 --
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |  6 ---
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |  3 --
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         | 30 ++++++------
 13 files changed, 55 insertions(+), 98 deletions(-)
---
base-commit: ba124fc31bca9f5158f9bc00ac5ce38154b57007
change-id: 20260114-pinctrl-cleanup-guard-d899b4938b26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

