Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87663043CE
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759823; cv=none; b=uORtuNVX3ks3wg272aItYvesQwkA8fQ9FyVmfzke5YZ46xFnNy7Mf4tkkK0tNXDbezfSmomUb/5zT0j3fc47ZrZGQujsspZ1LVtY8qAQKZe+aX+OvorD6iHW6nI6rTydC10MIYS/3ujbFDbgQwFnWxj/aBfthdM4zzWJR/cjYVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759823; c=relaxed/simple;
	bh=zwqMNlVzyh5eJuxel4QxILb1w1jSHcI3ic8DyOkYYFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/8lyjKJQYYWZJObxa3DYheCBmaVsjcqK3loS1EGEoatWZLtWJygEGR5OF+eUTruUIqAr2Jf01PEoXVel/DmjqrQXTjS9kuUCCiaSysi8DeFGnsImaOGHb9OCOxF8Tdi22a7wgSk/+xMl75GTgYm4Vta2u3WHkpH6pd86WgHzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgxM7ktr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfCz9jTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgxM7ktr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfCz9jTD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IBJkqx2693845
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=; b=pgxM7ktrM3C6JNHs
	m+dptkkX0Qv+/1wvRYYLqNk06hFxp42qnRNeX85OydKUK3DfNxmAU/+bhQnSiBE9
	5jFqrFFliVJbtloeqx2ulbLwmsj6LGPdxK8mJ+AOtKFLJ7/FTvUM3lulmSMjMd7z
	jWAXVmGvZ0nJaOhf9+EEzpdpwW0K7ncgLn6+kabCTPUEQ0HRjC4remHm5WAf3orp
	HTpFcUGejLERS01PkijD3DH0btzRlLQ3/O0KkA2D5XV3RZav6SLqyQ/JX39LEy2v
	IApUg/r+kFOm+p4BLIsQHdC+oVN2T7Q62++87p+3q1J62nfSHmj2FUGeDuinLNoy
	mEignw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e34y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1124130885a.2
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759820; x=1769364620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=dfCz9jTDLYTHZLXPuZbKhmHyok73um4QNjkgoxn1GwDCr3b9wApgoPud8NXCMG/7aD
         lSG7lKi1T9pv6aisnx4AJ3lmyIr8d4VpYXOCGXBmHizqRqwtdTyE5OjUJqpKtFABcvRK
         lmetSC0BOumxz//awIJMy8w884ZOcKAdagEiNU/U8yMvZlvXIR8sbMRdfY0rl69m/EVP
         yr5D5WmfE7+aMo/iwtcnEYSYp7TtXPpZo4IpLYb26L5BNNIpcNa8BYp52DLSSoyNcJpe
         a8qI1zRMjSeBluPI8l9XsoTZe7rW4Rq7LjidNA+i1Rwcql0E2ejPTClN+1vvAEpPO0YH
         3A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759820; x=1769364620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=h0FDo5jvJXZPm0IIreQFw6UHY1He0JQtcoCoPKzf1/rru7oJsRCdrF0AiG86yJ+LdI
         i3BTQpjAi3bHV+mX402IaKxY6uBUg8TAa+z1f2Ztg/36Q/DB3epVpdw0yWdrnx0mz4xE
         vQ1oEyxJJqEnuAxWUQsRmIdRc8heGHC94EIWMW+kwsK71LH8jv9IP8XB8x6uk4BU1G8R
         f8gG1XCg9k7NjY+EoBFgGbZXcIq//1XHlJUYugiGUviSRUWe+tBYpwrznkfojBGHR9aq
         y5bRBmZF/Cm8POVrT/Oq9Fkc9I0FrTozI8Dp1cGy4BtvomDvxTINMMTcN5V4vupsTWtX
         /e6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr1bCyf9YBInX/UR/8jU973MuZA8Bz5juZDOdHlRH0H5qfQ9yM0PUUWLfroe056aAsaErj9m1BH3OCMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0PLUkDNP094onSaER2zNzEARuMrGNn4+wwPqbGTAMhKwhJgc
	rXfg5kdYrE3Bu0m0Ezqs8XkZMSsKX79TsllPGwcsohcbklTiyysGUpTikNuvMLYVZENE6JBLhCU
	4RDHCHE31uTX7Gf8I5kHPbYByAIRCh61fAwpDve9yMQFjZvHIVEFQ4Qn/qJHZMNDlZg==
X-Gm-Gg: AY/fxX7NnAaJSr/BbCP9r26lDHz59n6W9pGfa521JsLqyDqGRfmSmayrFZinlShgea2
	6vgm8q/rjJD0epaFRkhX5K4QW7yNPvrY8erN5X25/PzeMWq4YbmHGBDehJ1QEaFstN/SU6eOTzt
	xerY789hxMkfvuwBh1zk68zU1HT6+p8I6WhPao6OxZ65wyLwU5trGW8Tlq6LK7lRl+EC9eq89Sp
	9djR11gaDuKvqY7ViuPRa7qZ8zfAuIj9i0t0WGFgNSUkIwamq45ggukwpp1elJZ6bLQScPT5ZYD
	6xIHw549AJNiCLDyHHnikosWcOGRO2NnBlq/hYJzglzpcfsQZ9E2H75xQ0JSmR18Cnd1o9XcxV+
	+2uis075VZtFIFqn7e05kASZwlwWmdFOqiA==
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272746085a.40.1768759820184;
        Sun, 18 Jan 2026 10:10:20 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272743485a.40.1768759819810;
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:31 +0100
Subject: [PATCH v2 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-8-bd36f681bdc0@oss.qualcomm.com>
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
        Thierry Reding <treding@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zwqMNlVzyh5eJuxel4QxILb1w1jSHcI3ic8DyOkYYFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH023tp+pR8RcdVkgtrXrXPyyvJCiTJRQMKg
 Lvm/TsQPiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 1wwNEACGkGa4R5iPxfciaNNGa26cpFVFOKNoQQ/zlFKjd9KdLdP3tK0fWadkQ6Hzg8vIuOQ0s/N
 v7S9aLNuDw74JQ3Y+27cgzgg2n/5allaBhi7p504JFNtRp9VuczJS9/aQzkHBhMBYb4qHa0hbMF
 5B40sNT0sLeOazx6g5oH7IJuwLknyQHZ5fbOnNm3S+Rhbjt4X0zszXGk6S5rQ6TaJx8wStEz2hJ
 +lC51VjrnH7jRwQZzX+zzilyHJ/l+HI120tg6qO3suf4O0SY/DtDfqx147BUPRdV/wmxLJ57ggf
 0TgH/14e1z7TwcuN6zs0miiAII0m2HYe/etu+gBd8fiBtv+uEcW1fdvtFo6xpRvM0cB+ToJ3epW
 J+WAhktebIvSeAt0KWbj0CP31V40a5j9h7uHmWaU7Hev8XkKhQb4BD1OrE9+7qS2Y9ZWqEa/b5O
 IHPpVLfe7pkjnOiOiy8BEgRkXThCYu6o3CyTClOaQRKzaR+YtzAPb+KL5GNuyB0Sj6wmRyqlRj0
 1cOaOus9EEY6i/l6k7smRdmdWfEuQRoG9OOvnXlrwxjA+kZXKGddz4ythESHN77jK5FCbFlL9gl
 yc4UG9zGjHjhRMHycAqi6bFpO7IHu1HO61URwtcZ3WxZe89GryobQ4tMqNi6WqrOhlLfDy6NcCX
 iSdKZI6W2hyvuow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696d220d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=Ed5BEzkqmhObfCaRRI0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MCBTYWx0ZWRfX/fnTwUilhKZf
 QPrRCBLhXYWsVCJPhtUu4PxRuf4f4yQ6KhPbtbF1E5JdTOrNKlNvvYDSuLhjwTUowkdKpIj+uEc
 dYV57SvShM+ky7VkKZpUvJz3kstzZ+UAKvcT8YHXtHSFhkrsdwVFXox9tgzac7DUXk5CkwNabt7
 SbpxZ5KjeF36wD47dBz3RALJiN3r2fr67aVj8AxH83EMfTQyGQnFBX+G5rmViQW4uI9N4dtmxzs
 8gz55+bScY1fRl1nh8dfR8ncuP2W/DnIZW5GT9e4nILB54p1k/hqICY6MBIisprL0bTLT9XD2L/
 Jx943mHmdr3D420sehTGaNCmJxX634N0ibujugq7PoBO2AsmwpFhL9AMkpw0IoT5FiFQByiY1tJ
 P9oeAMzdDdDdAoKrIQki7c3jnlmzpEqUqC2DvxEEUUWmkRhRDlnXbFbzNjjTYVoSMX4D9Tj8jKp
 gFYdfMVCccSUEsaENdw==
X-Proofpoint-GUID: RHlyDV_NzykfSJn-LMT3oUnqQZWb_gS1
X-Proofpoint-ORIG-GUID: RHlyDV_NzykfSJn-LMT3oUnqQZWb_gS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180160

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0

