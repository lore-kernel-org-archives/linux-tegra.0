Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E16541F5F5
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163663; cv=none; b=eiOrY/YhvD346hO3+7R2mWRTUDA8hDi6FDOp2SYT1NHrpqsCwjHJIW3sBJDDs9AnZC/ADmxYRDXkcFGhCRlWxw+i2mcy1+P1Eqcc9UW6LBV+Vg9evQ/ZsyZyMd+hda0HbI1dFswS7uRiOqoyaYBgYpWEGuocgr+akKj02+NBAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163663; c=relaxed/simple;
	bh=rMyZU+9I6C6ppALJ64SkDTUnn3JK6NJ5bZy9+2tmqPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=inFY44T7+h9MrRaMYYazA6SUCnOToJOoXGfSEBPY9FKlZTf0LapZDPewKkXhfGdQGOxzplDbNXc9zuhN57NPvIx+9eCPMmSI+xAdLKwE7RXmrDEoIm8reIOVKPOiYryfmwlyoe2W9DxFoFJHEcV+8NTMYDOAtr8Vn9FHngyHVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg9OMB4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkL5UZua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg9OMB4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkL5UZua"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlgK4033208
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 14:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=; b=fg9OMB4Rp/B/Bd1a
	GrpthF/QtlbaAJU2PpzNOItCg991o2X9dkm5yrkmtr8CrowFIn+Shxou5cw9ZP7f
	YBtFbT2KvY2lq9c96rvjO/2EIDjJt2lbb9plwY/K3twlDZA3rJFxfLdsUa9/kGix
	VUIpfzBZjXlKlmZMocc2sQ6hP60Zi4RApif2RpmpxUDCD1RsSFuZqMqdNn+rGXqj
	vJ5HQMGmBwNovecawlleETMT1Jif2YeucA3R3/UFe+nml0LZaOW2CO2DfzNrdQLE
	ueC64Nnn7zgHHMamZcQvOaUFjH2mTu8jbBI0zfvY20wrI8nO4jw/cSnPDwpFLWN7
	cRTbcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61ama-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 14:47:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso59323261cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163659; x=1785768459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=fkL5UZua5v0/sP6/hFmVVePVaHeCsKjgyOZGGlKwoOgll6MDiFIFBsOH5rQW+yZLSN
         fFSu7BIVQJ5OYDmFm/YApGDrqiiWyNZHCYgvx5XYDNelc4wOEleLW1ZzGzZL40HDgNTn
         P4EvV/NcK9Q/KFjO5IX6gm01jMpLtdzWTgo34ozHwFA6+l2UwtPZDUCwjtmXVQuH4LVn
         lhMoFnl/A+xS0686oM018JIBn8eYb3XffJ+y12ayROUjqumuOT32n9OFimcJVakr515f
         BzfS9TzoI5lCTOmEJVBoPlIFEV3OxZVfJK8HgKvQIbf2vZkT3FCQbko83/woof7Q10W9
         mb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163659; x=1785768459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=ntmoN40cBqsu+sfLrVXT3ZQh5axOZJPM8xozhuvzZOW99dCS+5UtQP1lgHMwdAKMBz
         jGFFo2UxIG2eRUkf0ZF7rFFo15Dky2RVyZ72lTXu2ZRG+qrtiZJ0smV2YH0De+dVId2Q
         9SX+K4hFwSd95pInKMMHdgs70fN4GUZfyAGsx4BXHOllzA7xTLvTMPXZZaGAJIXbBNpL
         O0zuYedzDe34Dw/4zbjGO4YhgGoTDBc9UaeVJ1ijEoyCPfJVZFeFsKi80iZqes6Shjjb
         As5SI7ZhGz8YtCjys6Cqtxm7s70ee9NzlEkad69P7AqH9Vz6fh8cgHeACGjjJEUGLV8G
         mh8w==
X-Forwarded-Encrypted: i=1; AHgh+Rqp0d2DsJZLzIiwV8QI9SdA6ryX5UZcKkufgW/5ExAlmk+TYHxkhFsxfGBOYD07/EySwzyEKStogYsYfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaI9t2Rk90ykvXxMuSMawKprlHhnYBlDzw/az7RROBWvjkh1cg
	lnKFYS549PAK7y7BgjqbQwBhBxcEYL6QxDzXfxuoNIBuCOohzYX0ctMHLWiAEsDsMhXSayy4uxU
	xaz/bIdiAhoM5vGwZcZpvnw+lLxW1bC1X4K1aZHFDKNS8jtdafcrawMJDCTUhPR8JbQ==
X-Gm-Gg: AR+sD12aVP2oInSCj5GwhuVOhqVoHaE4cQoB3zANogXkgXlZTKjRB00QPGJOEi49Dur
	TwjbH1KH0U2zYvhxEsAFgZnNPKqCQrQDE87g8tfFXT15arQzZn3JHAsnOm76+dQYa+naskqzlBh
	6v5JsP6nr5iP/QXDQZpGszwH5GTKVbWDBvrEODYEDsyYwObDhfXiU51yug1TTQ/IIUNjzF6e53F
	LLxanc+6Py2tPkmXJhcEusUdzVVC4o2eeBK6w90CE2DMB6CteHRHwc2xTmRiDJNFy9NKsilx5k7
	r6539cr57xdlwgez+pYhu3rGdJ3XiPM0UxEqLUGNqdRUX9eh/644COXR1wKxmzRunkCHYMpKOQe
	WIhuKvb0MPv1fhDKoOT5+lF7Pf/sAaaxRxNZx7FRRc8d4wQ==
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113813381cf.22.1785163659244;
        Mon, 27 Jul 2026 07:47:39 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113812621cf.22.1785163658666;
        Mon, 27 Jul 2026 07:47:38 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f5f9f8sm227610155e9.9.2026.07.27.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:47:37 -0700 (PDT)
Message-ID: <07d7fd69-808a-4106-a02a-dd77430bbc4f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] thermal/drivers: Remove redundant error messages on
 IRQ request failure
To: Pan Chuang <panchuang@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        zhanghongchen
 <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        Heiko Stuebner
 <heiko@sntech.de>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Laura Nao <laura.nao@collabora.com>,
        Mason Chang <mason-cw.chang@mediatek.com>,
        Fei Shao <fshao@chromium.org>,
        Frank Wunderlich <frank-w@public-files.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676f8c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pSU5Y2q4KNMKwdsDY74A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX0Xf2CeaX3MJ1
 KgQXpqxMFbq18ZR5jg9xxpP8G8JRE5FZAaIH5smN6/SU2+opJcbyut39Xi48uSy42lCqVz2nMYt
 84Hkl9e3kdj/6Uk5l3HoUBU1lCBKttY=
X-Proofpoint-ORIG-GUID: NQfzLF9ySUtB_0HlHr6HhHkCxRC82ECt
X-Proofpoint-GUID: NQfzLF9ySUtB_0HlHr6HhHkCxRC82ECt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX1lg7VdUbOEDL
 rPOxRSrG4J9Z6aXNURSrj1ZGh5NmnVDvEQBuUAPQ6Kjdyx1+hJ4ZP2zxVzMxpDIUvKfXz308csK
 4EH9+wEGWUaF2wwCoGnyA79Fnn4WgowprCK5OyC5ypfza2ihjAmFv5APqPYeJ5vt00b6meIW6kB
 UBPDv5oqHZg17VM0xaVS+NewwxBDo+aQVIWh+JehAI4PR7448hPRgbKWgziZ9wmyMcIxxQBr9JB
 RI6LZLG4YwxEVEUpr/SzCxmmAJ7DHribi0UV4dCooVOTOAkiwAKJXmYUI0Ubd6NEy0Pctl2ZbEm
 Fshm07boEh7tB2RQhfsD444ltW1vTMtc6Kn/ACJa6pymTSxntpe1r5OECi6LmuPl602+Kh0DPsc
 kMVuaPiKGAB5amVbM0JZj43QUwoMHNRcQ8x84XaEZjM7uD1ynjwlWyC2xvYC18qBSbMfXhYSUQj
 0RnemhD07uKwYHbgezg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/9/26 04:30, Pan Chuang wrote:
> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> error handling in devm_request_*_irq()") added automatic error
> logging to devm_request_threaded_irq() and
> devm_request_any_context_irq() via the new devm_request_result()
> helper, which prints device name, IRQ number, handler functions, and
> error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this automatic
> logging.
> 
> Remove the now-redundant dev_err() and dev_err_probe() calls in
> thermal drivers that follow these devm_request_*_irq() functions, as
> the core now provides more detailed diagnostic information on failure.
> 

Applied, all non-x86 changes

Thanks for the cleanup
