Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684837;
	b=TvgNKHtYj6Buri/K78AQXQ0dUC8VLsmcobCIxp3JDFfKEvtECVAQa6v0wFJtEP3ko0tw
	 Vhs3cQaIEq4GN8ceTHew+XjRX/HCJTOC4arYePcNZqwkfM86uXl6HURi6pSJsITzp8tKW
	 KxdnlNOpuP3AvFHstA/EnLdllJQTieHdsEiBPtzZ4rVSgw6xKSJW3tdkEaVztbv/lkb0F
	 vOerezxyZ2H74HzUSRKr+vL0cc5m4Tl5eQMHvxrrg9wn9vDVapx1DweHiobKD1qnLSUAg
	 zUEu5MwSVv0Ro/tzhgIIZ0rUIMzEsTeFj9oWbHPTCsmm+RYGR5VFquA9iANLH3vulWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
	b=dkLi6Vb0x2+FNgkQGdi8fajr9FUARYaFi0FHyEk/DJwiVUX7oJx0UvmUlQqsVJtO8MVt
	 yPfBZ38Yna9TjKrH2bwqqnw9DqGVItv/vjVgyg0XlTlcvYPyGLLlkh8wU/twu/6Dad+O3
	 cHzOapls6d2LOqeLE5Ll+X8tZ8sM0T+woRjnqxGhaMJypn0yNK+RoWpMxlgn1Z2UxBcxl
	 oqjnu/PmscxmPowzg/rqKQlM2J1IpgIxcWAEsEpuutbvzCaf9Xl6wjkdO6NNQIArYNDxO
	 H8rJsXPoCO3E2ibrgsUxEHImDBUzmjjOAAStj+/12txxW/li46An7tPgTHwN6N5LY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D72606A32D
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 05:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D72606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32ojHr2609059
	for <linux-tegra@vger.kernel.org>; Tue, 3 Nov 2026 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=; b=B9WPCRoHyNWKGB9D
	L4dsvqEUClvH8NYUkX61OcAYrQ7xjNf8OsnFL8BeS8ivn8fOebHh8j2Gr53ZrKh6
	6ctTJdl0ZoS4wmHYDLR+/08RvCfJxzW/kPXa0K7cW41jngrpCOWaIY6LQkDQwyJX
	pc/oqb9Sfa1/hL935YqWfv8iL7ENTA5UNB6XUVuTVOZ4NG1qYy0RYXXAn+i6+JaE
	dAtNI49uAU+gger0nd4XxtGguv6Heck9tdclAGjAIlIbqcV9UwW5+P+biYRG2YaU
	pDVTCiB7IXKU61B9PByE9Cd8wuz4R9xucjIUAAdWtJMAiw1U+M7kvVF7/je2dwm/
	b3H4Hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8j93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2026 05:47:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so4815413b3a.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Nov 2026 21:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793684835; x=1794289635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=g56Tr5nYTBRguwedEcBQiCAihdNQBz0x3U8KSv4CKoD5x1qbdtDlrpaDDpbgYZ1Bd2
         U9GWKN88ADi57o/kysshNxRjfhR7SMLlHQbngl6W2IoEhjDDPWGxfSGqd18v3gY1bMdF
         Ro7XaCyaL5VfZcBjrnztEZhilDGytP5PC5QGT7oMSctJm5TZ0u0VK0cXsBaev2ppMVir
         bmW/hj4+dzczrAGOcp3EI8iRoScRqtp0sET9Nofp+ZLAf0oO6qRafd93lXvd+NL8nvLr
         1D59Fqh3ddTIPT1yQEVU9QrH3ByI4F5tq7F/Am3kjAa1jDQjqtIupr11x4T1EMqd+5D0
         396A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684835; x=1794289635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=kGbxj3yQhhfAKo8PVWCvwna1tc7XjqtEa/CSNt8yYXyTabQQxUcpOiEdl77dG0dQJZ
         DIfoAFtZJwgcfyIA8tv/EWelrDKWJRjfWlm6cchYm5pLBHzVJx9oqyI6QMznL5phr2MO
         egiknyXO49ekb+6445qs6DLk7aSyEcg19PzvP+pp8Kh4ksp+AXOmaWXH0P1AN3BLKlvx
         HvValevtE2W4uTqIUGuM3ZqRZT6qVqN3v8tX2B/yR/1gqiwkeUErUKU6xt/YTSxwhlK7
         +GHY7O93K5TDGHfRl/PwRR77JGKXXtDO7CcgOmh3/g7jQiWgRdLcc1W47kntqaatupuB
         u/6A==
X-Forwarded-Encrypted: i=1; AKwUvBygVt5M+9UuRI/Lq3c+Tn0TCFX5shB7I/qZNacHku21mb8Dv0C45K1uV+dqNmyBz083KpwZ/qN+Z2KQWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z91eavrWQ9Dyz5VvC4rftdE1E2oVxquZMSCvoP1z6mM/aEWvYkm
	OW16GtPhhurU14oeTAe2WU/alm6l/4+Lv/s0YNddgaXubSoxGGtQrynQD/No9h448IvHQUqkBps
	+9sd/RTj9Q5D7XQTK0RbaqdbkVw3uyqpzb2p80K2LAvB2h2vPxvmMe2rs5UnjnhrdGQ==
X-Gm-Gg: AYBFou2aFOXeCatW0zXEKWcCeuxwUCUe/LCXC+sKWnVTLoKl1F0TkiYS/n056OfClZ8
	jWhpgWjbCQPVFitqBgGGpWLE2NG5DaxRygWT92gETCHjvDVLl2hacLe3gY3AtJGZSPwwva/hd5b
	qFROs/jkANSpY7HsJ9p0IWsJ7kNivVV7Ime56C4LzuR9MCaAIKXSF8u8MEIXMPwd80AaCjI+99+
	CngksAZRTgdm6W+s1icBGXIZcTKus2FxfXGPYteGc0s19lg1Ons5imAikh1cABIMGeYTZ4vMrf/
	cRB5/gZej95dSWlwq2tl8f95hWkuQV5nF+CbErjtIg9KcPrd3j7wH9lmqa8GHY7EpRP4U6mi+f9
	ntft2QuUk7U0/0rP/oG+6qmJPU5FZmASQKcYN2F6B7emQxTJXu21Bxw0m+CXpHMj0NQztlIli+m
	9YsfCk
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570084b3a.15.1793684835533;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570053b3a.15.1793684835043;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm2896689b3a.2.2026.11.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:47:14 -0800 (PST)
Message-ID: <e44d3e85-8dbf-4ca2-9c88-817f729fcdb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:17:03 +0530
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Codrin Ciubotariu
 <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>,
        Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae97564 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX6C05EtNHf/I9
 eSleov/4GytLC0MOLCWT8dNfqSrU2/C9dTdayF0qyd4+VwOLkVKvL1KRu9IU1xTs0oDzQY7wEEz
 6XJKCTcBMR07visO1yR0zlf3OsQVqfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX26UVd68ETmxr
 VJ+DDXHhykM1Qp/Xk7XuZ3zqyijXcQ81st1DL4Nk8aqwrtTJGJnFpw2YKpXdeEOHWn6sQzzfrGW
 sDGjFQgenkxUMvrZmFGGCuQr0khN1eW0tTcWZkSGSz3lEk+mf01zWJsuXKQ3tHL15jVhe//k4Au
 Ijkqb//MOFcxZH5pkg7f00gLYpT6YsV3QC8lnmHKWb7ANZRwd8ponaX6eQ5PAyHlkAI5Gzp6lXd
 BGMrVs/bVM3pkxUPnmzcp1QgdcMoQT2WRpBHuT56AbXHmBbKbjN7F7U/sxi8ICkoipg8MTWDaTJ
 Zkk1Xv1xjPuBZf9cJ5N3G122tAyc9XxGb6xPL6ZaxPtD47LQh4XWn17I0H4B9XUnpU7JqGS1Prf
 Jvli6eTgd3kQewFTY6yduMXFP1hu6ww06d5ZZepgcDounCkfSBbEUlTN+P9W09Dv4lgviNq5hDr
 8qyxytlWjOBjS0qPAzw==
X-Proofpoint-GUID: 0HFhPR1_IsQUtzpN490iKHXBNnIdB01X
X-Proofpoint-ORIG-GUID: 0HFhPR1_IsQUtzpN490iKHXBNnIdB01X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030022



On 11/2/2026 10:30 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
