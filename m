Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E363009F2
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759825; cv=none; b=C0nbTukl/Y9Rp9Zsla5Xsyf8RktwTHrkE2IxQQU1QngmsVbmp6Ik4xFLnHuCondZcSE0wbbpiOPBZdqaJA8bT+9GS5tR7EM278zCTTOI9nOW1EjC1WEHKw2xLgKo7jIJvdL0HDCfhjhmd139cQbYH+wA+vo5BxS1S14MMMbLmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759825; c=relaxed/simple;
	bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuqeY4SqztrU/pqOEEd2mVSj4WChaKqG2/GkWm1CCYcT4K4ACFEatxX9Dx55lwZI+BeKsI/bEY2bm9ocMC1kMfxGMje981Cgl0EiTgjX3b99Iz11Eh3JsIUjzNLHiACLAiflf79R1HeRi+i+gAdLwTZnJrDoyrOrinXUu5dJ8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRpcLxOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNr9ICmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRpcLxOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNr9ICmN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I1k5oZ1335778
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=; b=oRpcLxOSIgnQcj/G
	yg8Hyar8Un3q7Ovi/gBJnj3R+oluHlUQFC1DHjF2h+VTk000kvwcmxlLWX/zOVUh
	w9fRrrwLuCluyalYVdPb3sZJZpCc/r/UNmi6zxL129lxgfQnpDDPVroP9f/ethIv
	c70ogb4hngTCCYaYJiWKzGJZLPlO4m8JtHNoJSa1MkMfEu7IoaWDAtkf6sJGjaRA
	ZsHfxqXTxLw9yGMPfIhg8nSFt/MiFAFZ+zVDeEuz121NLy0+IiSSFsIOgTKm5U4b
	S1oRRECpIpwXLg7Zc4h059rZyp9AmllxgFuqiGNWeKo/C6u4MPf7QevOiUl755ST
	oqvn7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2ke2rbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c921886so479321685a.2
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759822; x=1769364622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=UNr9ICmN/MxFBIybOtTRo3IjX+44iUMXqIzx9UOXBgJO6mHNDPlk3HcLt95rruKkXN
         Yw79/kUFACRwlVyN9L4Z2W+P5Z7ph7V8aEM/bPyiKrYHDxi+VzpeiUJGjusq4JFbUa4c
         /Wbz9ipWF1M58CkzxF0MlLamsGjWm0BLASKpBd9/SobLaOL52YmaG9A0WR20BK0kR4Q2
         xIPt1QAp6cwpyU5EqM7ZKEGxc7p4O6OxrNYS6VlQe2tCA4fRh4xc/Oxh70TjnGgzwnfT
         DzT3x2ye1mFSELo4xYlNmitr3vkbfHpjz46y0KnifiZ6J360nTj8vFAkrDz0A/c4hpGP
         YQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759822; x=1769364622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=FEUIztrDqAm3fN3dG7kVDR/GN2s1VoWlfC9Qcn04Jk3xIpWzPrfm3ykePN9Tgly1qC
         ZZyFVThaZxm+a5MpWGfwUY/6phfFNrzbIB5vsBSMxairpAunjfmT9yZbxtK5jUx9CQGL
         SFLc1ZKRVu/CdR0TrU1SOytAYGaCNF4t1WuWEoNOADnslhMNtWXFAt4UEV1tClctTq4x
         GeqBDgshCMzHi+Qg0zS81r2umFQ3RhHZrpTra5vFzEMnJPkEvJLe+QWkQI1GZC0+Wq9I
         YiieC0y/tIweheLVQHIo5aiq5Gs8LvqRhU4GALQ4Ja4uiKBo/aw5vgOSTzWyiI/r7WVP
         A/7A==
X-Forwarded-Encrypted: i=1; AJvYcCUazhuP12FIgwL2ZhVPEeXlEXg/MSJMNZjJq2MKa7ZCsG1iQW7ZWm/rtquC5YLtF+XKZ8yOyuI6Ypy06g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMu8HhX5YCYCq62BJQZ2TrpmvFWg7Oc/Zlh6wngmsQRGzoclH
	xKe+SaVaPne8F2Th92Avgz0OlkWtLJytbMQ5MMmP+uY3+pST50YDvcsyq3davh+KlIVMM6vt/tM
	E0BVhXAQBr12f6acQPqqagxIypfWnPS50RQtKfE2LuQJmMcbD7Pbg3UDWxxsJt//QRA==
X-Gm-Gg: AY/fxX4feiTvdWP9BsqSEif7LMU25x7UB8u+apf5lFjjuI7nEXg6IAEncMWPXIiRLfJ
	CeUOE0968yEACpDmF8f6745GhEhQCNs/Rc9MZ9fXviVxoPlN2b5FywHuGjVS4koTGawxS4urQqz
	UxqrAPS9vtmD7roKTe0ELBGN/q2++X7ZAlSJTsF/9ZtBMJafrvYJ4pjXoCrpKCvaEt2rLdo6lzR
	vA9Ln5X5oaGNbpBuIeuKFIEG3G3AyeZYL/v4+DjEKkr1vlvHuHUOUEmLCMloznIjGEu/Nd5MACi
	04g6HMDPrZ9DkjVdbGThGGcWSOeZcYRQm7BJQgDtCnEIt5KtujN5UDtGoz2AI1sYoCnwA8/qPwT
	OdyoWaLMrpuypT+PIVIyDIN4ErfuRrwjHPQ==
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728108685a.7.1768759822577;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728105485a.7.1768759822113;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:32 +0100
Subject: [PATCH v2 09/11] pinctrl: tegra-xusb: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-9-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH12QqDR9lyHrdfWBYKu5wDAWLJ9ZakzQ3LT
 0UuYPASn5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9QAKCRDBN2bmhouD
 12VHD/9unxdOGDL9Cvw8qMe+777M4gAqFDHe661yf+QCRAMfaXbN3WSV5wByRbqTx3YfWy21YOQ
 PmUn8RHfADZRESRLJ40apeyBHwmf+X3aiVzCvJrIhssAEg8e6K7zet9KS39Wxq+ggSw4RMklgwR
 648adqt9vMbooDA18DkIXowYvJNwPJKcEnez2js1gOhYtk9Et0iy/q7sWb1Pdi265zTYwxv9fSN
 1XA2P6oDR2vvTZGfRM3Y3qL9sYGLOq+7J9B2IhXGsT4h0bakUH/HwP+otw1LPAta+OerExiolHI
 mYexTPNF9qC1iJTWw9c0TKj9KMWD6/7qUHNH6Na0WwHWYNyqKi68kjfdg8ye2KAuFsHc4AFBrlg
 D4+GUG4Z5YjPvImtD+ZxD49iaeWlpHrIs9/oPs8qcDvb4tIp237aGABh+JBRAXZIneYCMNNZaT1
 StSPdDt7VhSHoNzlof1zSlpuaWaw1Pabz/Tr+4F1xEqFkZZFTdO26JMZcQMyZox72x7c/QHRR5A
 +YvVe+Z5+GsaGQttt1PTi5ccnDiKJoTagTW/dEGBAtL7aTvBTSan7k10tRuwFKj8ZWVzxHG4TSI
 Uw+E/NGfkjEagoYcsHuN9QA27EJwqMeW9WQTpq7JAAHx4NjypWFW+haLBXvrjgznmhZ8d0reg6W
 wSCbjewNTPr6JfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX6Q3Bcta5yqtT
 KJRrL9ctWz7hyIrPCZSA7wdEfpYePFt/tDdQ8O39Y0SGWyDvtiUYnJQDf7Cdto8gH2NzwaJMJ09
 gf/lRARx8Evui57PoYBZSSj7J83mkI8H8I4N5wfonfPmL4xMCFX6Rj62zxzlm9BIbNHT4mnoxeZ
 HIJYyOpCFUVthGeUmEYP8ulagk38EHDJPEAluhZVvidz+nI0WfihvJVWgiX5i0braHWDGnOTgOn
 7Ss1bgkkLLWNmhrnWXawMQuT3LYBNUqUNcE9bzsfoIPQWZj4KkMv2kBkVovRdRMdZ5RSVmwDuqL
 wZDeyzo9I6UVzhxAIoIRnjRqxdz5ZFzLPqVALsQvwHL2WzYAw8vpZA2np71LqmRW08VvHxdfrQy
 kgjFNpy/9qnj3vKvz2QyGHua2KD6aD/Vlh5fZquXmuqi9txccYtYEZgRwPa17PLyX7qeO6Tv4TE
 gVwtuf+DqccGc8gLS4g==
X-Proofpoint-GUID: WBGRgtGxtmFbjfq9xjbjrySbZy_NKz8K
X-Authority-Analysis: v=2.4 cv=EJgLElZC c=1 sm=1 tr=0 ts=696d220f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aRO1tsgHJH1V1zxVpf4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WBGRgtGxtmFbjfq9xjbjrySbZy_NKz8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop stale mutex_unlock (Jon)
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 34a373f7e04d..c6a51bb21215 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (padctl->enable++ > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
@@ -498,22 +498,19 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (WARN_ON(padctl->enable == 0))
-		goto out;
+		return;
 
 	if (--padctl->enable > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
@@ -530,9 +527,6 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)

-- 
2.51.0

