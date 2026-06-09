Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664B47D95C
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jun 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019537; cv=none; b=sipVWrge62nqjr4cBB3wurVgGkiEQQXLu+UBzqcRctc049fealmY6HQY3Y8MA7BjWxJ0mqgXHUIlVv6ry6IL5LpQJGxcm20ygFS9UMcNiRq2Gs8nkRELOgImUhjJVP27ikwjDr2kG1IJcdbBBd86RuG08iya5BkhHEko867IWv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019537; c=relaxed/simple;
	bh=0kct+14mMG1xFdsNVtMmX0y3j/+kU9r5xuCPCGUMWEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4fSPlBLW9ZhDvue0OxPe1JmP/BtbUeNW1PXgMMYg5vw9pxRLg9UJaT/ncrPwEFQcJgni9FUJ3JsmW5D6bZv2yQj8wpL6WrkKfzHHOtMKIWUpgL06eawqylC3wtbBpEuK2e6c4IF4dEFUNHS9yiCSFOjmKkOqo7Pz9jzYFLjYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxW0fQt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBOCJQA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxW0fQt2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBOCJQA8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClYx62693995
	for <linux-tegra@vger.kernel.org>; Tue, 9 Jun 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=; b=kxW0fQt2xsmeD8ZY
	tMdptrcCoLAs/kHbN3BKX8zq6WVGoT/LmX2S3UfaU+7eC1EcSWN0SBSkAP8IvLLn
	IkWEC+LevOXch2zo6FlnDFVKcFUWMuessCZoJezAP7n6pQ7WpP2SoHx4rVgjop5I
	iZwxVcndMGA1lvMZOR8Gyq6IR2mXVK4jlXdYYX+V4sJ513uNycZF9PmVf/sE77Tv
	Tm7s8UD2L3ho4eTBDuJMS4beT59lO5awaL7icYZ8IVoTyexOZLIwZFJZ9ze78pml
	Gz8VnlR8bPLmLsfBiYqCtl3WFLlqrBjKLlJRm8wUOsk8Djd7J7kE9daRcfY5D/FO
	PZdohg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1t6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 15:38:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso3035381137.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019534; x=1781624334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=;
        b=XBOCJQA8VEaoWEWzBnQ4s7SVlm7E2lsZpvYOc/xBcr9yhmNHaZ9D6x0Mqk9xAX687b
         Kei3Pn66r2p+efLZ1OnliAEMxMXOtVPRgxrv1LKxVmO7ZfOdn+54wlY3VPAIcCL/9Ebq
         dULX850UtY3jh9QnPyWcDXZ57Z1RGbrh9J+25+BFwCzFb+M87qvEZwXpW+zPUbZUa04E
         r6dYuwRyEPVsBCTI4Y5WTlcA/5Dd8F9NwMqM/tz6zKyU2i750KAPK4QhoqPHiBqyaFSo
         LkzIgeaA5778mjhidyQ58IVEKz0yTI8L09j7Kq66AyMNdN2CS3jrsUh97919N4k/8Yt0
         o9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019534; x=1781624334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=;
        b=nUnKTsG/5tEyU3ABAKbvz9CC71rAlpUJ/UdfBFfJckOiuVFGHDO2Guk6gRT7036VsV
         caU8+jBc7w7z81a3qD1V3PFBRCLM7mB77yqft9c9pglIAEaWi+zt/Q6lX/p0/eZLgQHx
         QepUh5fVsECu2jo+MLs0IYY8Xqj2bjaIyHMmM4tGDTkBb5MuKZ84G/3bImIz6pQ8vjZi
         2wKU36ck5a32DAHgZIvRpy71treEu1NO8kZ7gJQuAm0QIuMDBAhc6K9OIL0805kHrzNg
         MT+j0HdSLW/aDGEW3pXDFJQqRegquZnUdhpdGZVKkLMUO9hbVN6FsNdwXLzUGsTbkVYs
         s1rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VkDXQzV0FT5Q4zOvZ47s9a56zI/Oj4Jj0viy34jEwnXrsrs52q4q4dBIWQndoHU1jK24SoIC1d3PVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYFWehoPgksjymwiYDOZX0iZb6yhHVFTg990jcJTdaVllpXFy
	O9GgV5VaUVhktjSdbBn3YmiIqV9FBXUBgZY3tn1GIJz60JnM+XLFjP58piLkN3BnRBMBaQvEHlj
	IsjzCtFnapq3NHypYSwTmY6X3MNVFo1XfYBrCtQ0rFGNySJSR4Rq5P91zJGJUHjpcYg==
X-Gm-Gg: Acq92OFb7nKYmQmLaXg08uvfhPIlgsWTF8frdqCx3wK8XayRNMeAmxacP9/gjwPSLUL
	RBvoNRdfL8fwE0XBicAeQL5pvSbFWktstnRG49qhrcHgVqm4gy0iX9ZpICqWfH/RDO5JfFYJK29
	930Sz1pNZqA4uPhjSUVXs7uG8PfN2UWCD42l5Jo5sdYZL2Z6rIYt9aqOnoxELdpZtXCZXNM8LtF
	HbgMXlCiQw0mQ29S7Dpki72jJxnKzIBlQgJvJXA52Qnq4xwSPwSVuYcyh14skUAe1EcgNiFgDn9
	Ew0dlZNsSiN/86qLdZLL3P1ObIuEDrz2ds+T0faCbMBanWXCheZ7AnJTVRgjx5kyzQ7BxEixseC
	nRF18YOEBr4GM/vPCL+bKPIY3B2T1LQYn8naBewryCcRlwTbtug1Pnxmv00NAFQ==
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr12061857137.28.1781019533776;
        Tue, 09 Jun 2026 08:38:53 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr12061808137.28.1781019533379;
        Tue, 09 Jun 2026 08:38:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm64850259f8f.1.2026.06.09.08.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:38:52 -0700 (PDT)
Message-ID: <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on
 ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a28338e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bXYH841EKscq992ZkzwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 1-_ClSJl1hPWBgxGTWTUgTX-Gu57jH38
X-Proofpoint-GUID: 1-_ClSJl1hPWBgxGTWTUgTX-Gu57jH38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfXwj8yezejfIBT
 q05zPoCwubz7K4bauW6ts2D/0pm1P7POtmK0bcKkEhZ+DrsCpNbvowk9CuliXlLh5cYy12eM7bz
 rRL0CIOja4dsDK/qbD6FPrKgG8iCpHuBif/1kaJBFDrdJg3wUvDqWkkpki+hE/OD7mmQg4Bjcnt
 TGE9TL0mCiecDGxlSbYT9L0gDN8RWURElI9c9poFBQ2UghBafpqQwU4fLioj6PguDPZ3C1Yv9iJ
 UqCG8mIPmdniI2fV6ligKO53uYI8vKkHSp0dmsuoufIuMZYeIq4MHxJqxeiA6nuIKbcVhn7Q6h7
 1cvmFn8rdG3WiEdC9FFPk32vqr4wYNMOiGVAksQmCVl+GPzISvWnkRExg23AzOADl2T/pa7P+8Z
 BgvmwOZu12nnEsDzc+qQVnnwm25/6XuWFsPlef4my5jH2qYrfA37lALnCCao6JZhAyhe1KR1hsy
 Y6uqGaSZHFdhn5Ttdhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090148

On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> asking the user about this driver when configuring a kernel without
> NVIDIA Tegra SoC support.
> 
> Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index c7507193044f4af3..eea7ec9688b6460b 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
>  
>  config PINCTRL_TEGRA238
>  	tristate "NVIDIA Tegra238 pinctrl driver"

It's the only user-selectable driver now, so this could be unified as well.

Anyway, the change is correct:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof
