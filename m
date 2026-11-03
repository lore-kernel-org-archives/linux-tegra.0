Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706837;
	b=H6KB/vSm+dMjmx8VLHIzzwlergbdMPHkLow8DqXIzTMU460q23lFYPjCjfkld7X5zfa7
	 EdVsxoGkmZuj8FMoRta+Q60uA2z+T5E/YGITPw5DSMs/J99hpsGtCt7+FyaM2PB1MJGY4
	 SIi3bROOAH3TGVyNeX8HVVTFkynj7LMGK8kgMytIthDUp9MXa54IpWDz1gHVWwFNFjDLO
	 XubO9/qms8WHB+qB4Q7FCIsfiH4aScwdbOlpapDR7y7eArMmn2m9wGsNX/gI9dvq3aCdH
	 1vxY+DJzr8wS7vltg89zCGPRHh1je+f40KyWSGjzOMfCru+GHkMGa4im3zkGF8OBa4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=OHs+cfJoL0QQDC5P2c/w7+MCUPHobtspWcP6vwXll/6nPF5fO9mxnLgUGhmOvqUL2+jj
	 OsEttnuvJG1w0f29PxOjPT4SGd3ig61al70+ldQVGD0RyutCBodftoIDuInr8mE3vHoSh
	 ZzJJdUAb3cKcrMk3dtzIJwaZ0XXkZcRZlGihhFy93B9/xcSEVgRT6cxQIi+sLBleF2utN
	 PrOgaN4UnGQNEWxvxNBYA+rHdWYdb+GbynWIhvtesWPtMv8wHwXcw6e6C+xJtRSUj1P2j
	 I6OCjlQlvs9Fi6lMZtP8itxjUFSq7KbRkPfix9sRJg+22ir43WD25LcisuLCyUMJ1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AAC606D82B
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 11:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54AAC606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAF0u1476126
	for <linux-tegra@vger.kernel.org>; Tue, 3 Nov 2026 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hmhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2026 11:53:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2329236a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2026 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=KK78crOGmZpSA555x++KwTfwjDuBx0eos14VrqpBCgLIy28W7f4uZKjNYHCI7ay+z4
         2yiQMJMvcstAWxARbkl6wagm9d5pCJdPQDIGKyQ+bDmXQr0Il8qweDzX5Aqmi+ES/jMo
         p1qyKLOd53d+6NGFXgfFWo7/m+hyV/iosjja3oBspeYvsOTBM9mfHfeXTKp877l6tdUH
         6x1ON/pCJLUfuO8SqvieUqr6Kwa2CxOQaFxRQcqfGvGfAqrFzwFUQ123x6HV4PN3w46h
         qpg4CNqiyGV2spbTKqgx5BUBc9npE2Lk0cUq5WUC49AxGU8melpdpfHqUlm0h18AwyGY
         05zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=jA5tJ1bQWyc5Ikn3IMn5cpGfGRVq14HevvVBD6UoSzUsO8H1kPYX40dkxiayZKbvUX
         +eIi037+mW2a0fSP4dtnBjCoXzfmHy/ZVqRS45W8pYopuwcOvffJYhBB4OWyma+EHlFr
         y5ud1l4gb8h8nR9PYMo4yJdIWc9CQa/5RY3Dx1SVZe+fVjqouCkmEWWoUPqyKy9c6LmI
         vR2tUJhCBieB67QgYizDeVcIwJvjO+DK16kqJCDxWCJTwsIVdG3yYwlKeM2N6cN83TZK
         dJ8jYFa3lKalSY72+CqZNAGLRLt1hFYcaPAFgr34g8WdEI+XVKmglMo9avVBY5lb6SEw
         PH4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/BuE9TT+zIGOjfi2DCYcdRw2hkqHx55xbxrhwe8kBTq3dcMGaxrqZzW/0vpNSqiM1eYFz8upAaaa7nQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ArihIMz7ZYhGX5H85O1bGT+6DkhzGR7hDZAXEE8OEkLuiwRcd
	rWIcpPfp+oD2fV417zc0kopnDwMzheiP93jgGaBb/xojkjkJbqVCE+p+PDktmWoj/yvHDFlUSZc
	fjNvd1zfDSjIwsVp1lt2RXjAQhRQSONKhksIjjQWArQAlwm1cAyEq9MbE4FQoCMLwzA==
X-Gm-Gg: AYBFou3H9A3jwSZDd/Xb9TqDh6HXFXU4ACTIAKVLM/qLOjkWOBcMG9I4/M1Zthsz2Ke
	lbLFJgZAZhR5y9AvO5tAIpFavwUpR6Ryu7K0ZsPHhtXueczYX++tA3FqK2SE0FT+awEXDwTY/1M
	WEOn6zOjb5gNtmMeIhTIf1XNH9EKDOoqAPEjgvgepAvIR7xNPhNACwtSpw7zvLH9HFxAhD+ariu
	b5JsM6Z4bi6pt/0JHLbnWIbriiOaJPAjC5B6JNUs4aFTZ9ojQ2ca8SaYnZHAok69gWHYLukNrS5
	jDmryHolIV7TKcYEzUhXC5jSweHD+6f3jsHlf3agz1qCFkdH+OuowW03szIbPc7M3sYa/cl+Mis
	y3lltDuAOPY1rmawbHdxbpKCEJvMDjB8EBCA/XOdiuxXM2EbkxodnCESTPrR07NBoz3EEJ0JQNG
	K7EdYmyw==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480947637.79.1793706834837;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
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
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pi5fDt1iZcYKjtcRgiLeFIDbkalbqq2n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXwWkAeZG91lD6
 81wZ5HuGpSgk723cbSll1mP5PuA+9IGMdLis7eGtDOt9jOWo8E3AmjwxlvX6lMUwAZBLgrGn0e3
 QgyeBZJ5jLZ0xJ/+Lm+pl4P6sv74Q9w=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9cb54 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: pi5fDt1iZcYKjtcRgiLeFIDbkalbqq2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXy4bbyNkTV9zo
 9hwBVmSa1fGPN7xi0XJ4I8ZpUmON9k+55dJiaWsFS8lUsQdWi4KzlgTp1AFCF63hdx3NQN6Bxvp
 2Abg+XYsf72Q0gA+xw01235nXpXEgJQUrlFdWaO1qLxk4G13jUcOeKp5F6oqxfaEz0A+QYARHnR
 SEl2JfSXTBXxaL2fH3opygg8SG7i6cXhp+CwmewcmQY+5eiopsYgHfLDOqp1QPozrUTo7BmojtC
 nOefy+5lQonqcDWgHBiDcAYqCl2Nj5GSSXiMRRsre0rz5tqcg5aa0hhP5nqFnIIdA/sWLlwHA89
 PzUCheBrJt71/MbyGur/ENOe3RyEFNLJLxLIBggJ2oTOr1FLX2exdSKrGXCe4Leig0HPfoHRICt
 +mVOPgLdiK9Xev1bYg73iC8+kgq94JLriUdvWAcQUS8PgQV8CA8uOqRAeU+CyvHTIdyQrGSiKEO
 nGoKMZb+eQr53Y/rGqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
