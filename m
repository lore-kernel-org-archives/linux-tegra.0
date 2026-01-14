Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6739E175
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404635; cv=none; b=p5ajOsUkIiMxKjqs365kaFkaSui1rm2lW2kvR9b6q4ozxdVnZBDDtfTUqdn/twPJYL/V/T4rGxHkLm01b+rB58I17yFzgFDpVKdnR8nM4EhZz4D2Xlvr82MnIyjUhzSjv9rs/k3Fq56CTEiowJ1CkU1PtQAPT9uxsGiug8N81rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404635; c=relaxed/simple;
	bh=7TcfQldnwsgDeNj9THUL7ZJpvo8wBH6EB0ftex+EuCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAD2YhY0wDQpTTbAt79AhJwwzUVlqeB15k6UFh63v6K0NgMr4WKlb6EkePLmuqQHbnuGUAF0Stiw0WPCECvbCwFUcQqQyHoWJ+4IZw4yv3HFp4BwodCcMaAk4ncOIXlUPEl8VC0YMyyFM0b69K4xqnCCi5cAZvRVSz0EOX++SFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcXKAq+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcCB8x1Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcXKAq+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcCB8x1Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB31EL3279842
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=; b=HcXKAq+nTSgWrzSK
	w1a4GoUXM/XuGU5b7mwyhHaftes3dWz2FIYh0ZaE3kTLg6bSA5zLrYkRq0l7d56I
	Zm46EvXyUcb4YHxT4q3XQ2xwvlv169s2XhxgxhrLV9wGHbn/acVHWUrKL9WeiN34
	oxI+nkOmlEgGJ40GzzFOPwIfQ1plkTis7W6XEwSy+BEcDfNNCKZeJK6ntJDy2gJT
	7cNvU/N9ASdtjEEo+ywOMZabQlMvmsZWBwHPkVfHcbdvH7QZIMXscPa1ebEWAwza
	qmm4xfI7i4asmD1X0oDozzuRdnBuTqOGzH+RTAb0dKUgJPvntm6VZtTm/Ycu5NDd
	OjjOJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8rvce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52af6855fso201583785a.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404632; x=1769009432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=LcCB8x1Z+kPSITM0k3ftUsw9PDhGUMHP6H9u12TANr4lzOJNQPlaq1LMkWaO25itHR
         61yn10xcs94FrGOElCaB92JsC5RUxuYjXrJ/O5F/G2dMw9KkG4swnQKTRgt5qICqq7+8
         ZDHyFCb0Y/ZeDI04jKiEFjYqL0T3djuqjvUgKBWTq4xIASEzwsH3qADa2GjKcokmcgRf
         52tXglrINxxaDO7uFWGGZDiuds85o15SegnyFOQPPIVuBxuiI52gObeZklCRLieWKgyS
         f7L7OhBaA2J2xS2/ExLoE6SqdH57kX6L6PLkwqNYDx+qyxblVg4amgzWQaH8apE2ouSj
         ccZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404632; x=1769009432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=wZGdEaM3WUeR6gpUBZcj2LT/UzN5eOoOg0ZiKuNYtM5ophwUB8voUm6Yn37rH75jIi
         u0OZndGDDXCr5IqEOpsNCKW3vZipCnl3yN4lCxTUHb9e7P5agRstbAqaqMz2aVxscLMI
         QmiGFCLc8mmrkhBuucik8TG3HNLcMzYLERSeM+5UEfJqoHkbYpqG7201rb/PBvu72QaR
         82WStqMWpPhDTWBiS/5TmN6b8Fu1DAYeID/omAIpre4j2BBBcBe9nCu9r5N/cQuQXcdd
         /B4ST9SQCHzO2eo9yr8bUqvzFiiCo137yKuaYY02uDfhHoSTiXswLY/G+sKv2K/wE6Jr
         t54w==
X-Forwarded-Encrypted: i=1; AJvYcCWfWuTzS3nXOeXNB3Fcqv4TlIpESjwg7M8/rJOR3IHNjxpGgjlz6NI1OQUi7Z3fdo+y1GlrqoTqAHYJKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyduxcX5k974WjR8IR2/2+jrSyHmsguno/nONZUUiPmatJ2wtMV
	VRV6cvIK2Z2tVf+jFBHhZk/CUZZFfGEHzBBsR9E0C9q9jHRoEkRl6z7dAiuTFy0QRF5OjGnWqDw
	hOIb0VZmaPdmxrENvOMQwpZQMecsnVgmIyLyEEhFGLM/6g8iu8uUK6xtXZ96MTZPwOA==
X-Gm-Gg: AY/fxX4e7AwXS7RTtbVSD3ZTw9xB3NLX9D7UGeThH995LpI8ZolHTh0yOzABrWLhP1w
	4PIfHFmsbQpqbrvzm79gpFykmYVkpnNzuMXmzej+bUM7PC1az3vMh13GdTZ2giQ6+EXFXxhwgWF
	hO8e+hgF0uDnY9FR14c4ip6NlDUxaFFgiVEo+6MydVzuZ7wBnhYxAoT+hHFb2k7O3vi+YIXQw1t
	KJEMTSZZ83hycwkAcIio9PNR/IZra2WaKWUeAf55hhyt3H/I3o4M99I1+nihfWA1BzRUjtVuN2M
	67Oo5HwicJa5kDFPpyk3NtMxYQv1OLGvZOsycEga3NfGSlycnRKOIgDRB+xE+Qs47ImKpm9c8CC
	8n724vBV0VtMurmBWqhucZR9LDMthcJcBEQ==
X-Received: by 2002:a05:620a:46a6:b0:8c5:2ce6:dc9 with SMTP id af79cd13be357-8c52fb4f058mr411706685a.23.1768404632264;
        Wed, 14 Jan 2026 07:30:32 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c5:2ce6:dc9 with SMTP id af79cd13be357-8c52fb4f058mr411698485a.23.1768404631550;
        Wed, 14 Jan 2026 07:30:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:07 +0100
Subject: [PATCH 06/11] pinctrl: microchip-sgpio: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-6-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7TcfQldnwsgDeNj9THUL7ZJpvo8wBH6EB0ftex+EuCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aFcSlR3KaVGiIyNYG8oZHo4izzrC/c7v2QI
 ELyljV0aeOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hQAKCRDBN2bmhouD
 1/c+D/9JCP7uMMFoU+h75eykrt0KHmHUnHV3rqtg3g7Ut1d2/As83e5bk85vikvVmZM/NczFXe7
 tQxswgbhKLPilQU4gCP3Ga6silueQpxzqiLbJaccYmtFmcy4rr0I3ATIJuzeZ+xjLqKsMvlDsBN
 5CciXjKG5O5Br5wwG9eSTc/INEM73B0rn+881EzVNAJtEBSP1fNhWwkx5nIiBvGhEp49M99L5nS
 Bxm1JS8AA76I0eJm+s3lVShXx6sccqHmnDTkkB6m8kAdFeJ7lqn0UpVpX6q93orxxxwlAPeVs92
 gp4l4zUpAWVSv5rvRJCGzn3CRbKUXlJ+XXT3EVZsRL4mvrX4OY18izt1M0rKQ2jLVDxHs7pKBKF
 WZMNHrrcyTlCIQ7WSfVzTKuXZaeUtqQezfcYz4QJu73AoUPusr4JilaxDmzkvLOvxaeGWx1aQA3
 XxTSCpYcLEW+07K8mVmDNCtsc3UUybPPwSxVRYBMSHfr0R/Yq+w13B92RZUz3SvitQ1RsSGFGPP
 tZPDshniy8mMJMUivX7pjR39HjGg1DJXYUG1sch9D6IG+YQgxZvHQ5G9tDMnhlrjry3n+cjsAxb
 tBNq5GvN/JX4WDvzpXbCaXdN9IH2zgxN5gPkt0cindxysAHiXqL0N4ohP4zkibgluS7P0+DFsIC
 uJx7nBKwy1ooASQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: bOlmMFzSGXXusEMeYnRD884vG9JwvEIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfXyBls7zSx9mQl
 oh+zLF0kR61zpeytCjK6K47lCDLOpws9jZ0VGDHH10eBA0kBA8kJGV2wc2iLHuw2FbkWX0KTwmw
 WjBPIB0ZQ2q3LiAvXh4cgKddeD3IY3YPlAHLr7qonTv+5gtFiraYFesVRkjaKGdxe0KRmt6TCdh
 0H7rrW8jMenUsj93uLxntYpTSpcIFaTqP2jmkNHHWBubd2iEmITmqenWQ1xWHndHGlcwIgWWx0w
 ka+y59aRZWtP+15wcdTCXdqnSbuEBsWnkdcfsoYga5lenBMM0/bGnbcpG/ozAYQE972x+LXo7He
 37TCx/N8ijwk6jrttzhdNESvrhPjIoplT0H5vOzq1rp6b2fX4MkgZOLKjUuMDSg7ijTOXofpiRC
 9FIulJ4cY2GEU9sXDnYHNHVBbTYG8TuGAz4iR6g6OTPgXSju/CgUzfrRgkjK6fRZeA4fxVrqk/D
 hc8n1q0sQWiPaaqRF2w==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967b699 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6VTnscBjb5kX48BWP-sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bOlmMFzSGXXusEMeYnRD884vG9JwvEIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index b6363f3cdce9..7a6cb5f502b0 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -264,19 +264,17 @@ static int sgpio_single_shot(struct sgpio_priv *priv)
 	 * setting.
 	 * After the manual burst, reenable the auto repeat mode again.
 	 */
-	mutex_lock(&priv->poll_lock);
+	guard(mutex)(&priv->poll_lock);
 	ret = regmap_update_bits(priv->regs, addr, single_shot | auto_repeat,
 				 single_shot);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = regmap_read_poll_timeout(priv->regs, addr, ctrl,
 				       !(ctrl & single_shot), 100, 60000);
 
 	/* reenable auto repeat mode even if there was an error */
 	ret2 = regmap_update_bits(priv->regs, addr, auto_repeat, auto_repeat);
-out:
-	mutex_unlock(&priv->poll_lock);
 
 	return ret ?: ret2;
 }

-- 
2.51.0

