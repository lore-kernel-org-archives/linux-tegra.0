Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F848AE22
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jun 2026 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019587; cv=none; b=ogzUAHrParkUM4BNoSLRd2c+w4horGmDWgZMhhK1c7SUQo3+g566hiXlIrAimaeNdIlm+S3ZanRhTcNGSMt3B9C5TFUZuL4ItYtEGtWOxeIpKXeROOwl2rpe7wKoEtaoMj4RD9GGbn/kBlkUeHd7CSolw7Ns3IGWnvFuSCLL9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019587; c=relaxed/simple;
	bh=wNUUUkKj6yruta7YOEgb0lTjKIbD2RzU8cqMHrzQHnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOb+OxHjG3xndc0hXSgcFus/yAIfnOP+9mGJweZAtt9kx7mQA5TusW6F34hLLguigz3XAj0Nssu38AXbu2DUNU/W9C7CLWr+3hJhVmmbzeMsev0cA9Q9nwE1DdXQgvYToNEwP7SfxqErd99snjEvlWdA9Rywz/S2zW0yZeBt4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1VDEKGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7nmqvFs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1VDEKGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7nmqvFs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmWxX2625544
	for <linux-tegra@vger.kernel.org>; Tue, 9 Jun 2026 15:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=; b=C1VDEKGFGSuZsv+c
	QYusNEU8WZoERwsGXZREsG1fTNAKH9GmQ+Ne8LRW0SPB+tkbZ7sPbtViDHby2Fnc
	lVcmpdE9+U5d740JHdl6TPlf3urHNfsbdp/0mUdVFmV7XhfuiwrSV3bpsUpBcGhJ
	yDsQU34hCeLWUiK3I6ToD6xrWLNI1RO1vEfz9qwfr7T9Qd8UzE1DRTqgNzLCGTTZ
	jeAI73zWxevzFsJRbAAVh7i7+Dtvn9+ZMEtskYnhncwdplnE30PEyqmy9rqWhXXg
	493g3ZVn+kz6ghAKu+Bs8YboDBE9I1n33nXTzKVdSiUxndicFQ9jg0jZuIpHgRUu
	BKrK4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsakp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 15:39:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cecb6dee57so123794256d6.1
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019585; x=1781624385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=;
        b=B7nmqvFsVhq5wkGLaufnqmuHpWpbsi7USoby/rK0ZpWYCwho+2f+VZ01pUMajbIbli
         6PAPjXaAeQt3F7lxo1UoVMn4XlZ+/7yUh7HpGJUnA9LqfK3xz4Qk6wrFNLGwe1GZ53wd
         FOs/PQLLC/ajnpUVKibRFV50oJ/hTWRA02PlUUhJh2ecggFT7lj1cFY5y0x4XeSCoKsL
         k6koANrlA9x+pFtLdzKwo33RbnBqmQBTPYuhhEyTAYEgWUI/iPKS1akZOXOxch3pbnns
         3dMB0SGp4ymI6rXTIrIR2jZ8zpg7KEInp8QNYfGFalEmNHjd3WZytWrQa0pKu2+Qr/LH
         6zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019585; x=1781624385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=;
        b=ff0GOEknyxH0fEE3P7ugXqQg7d9nag6jDgUQk406sryM8OmhtmCoMFZJ00BRp12HqV
         KhzqcVc31G9NAcRflE2CPZvzys7UGavB4O8j1RYX3YDe7rLLBS+ou3UM9Ayer/pikYPQ
         DWongj0jSylQX5Je37qT2C/jQ9d4TYMhAsjoqLZarFXXqVSNsnBKIfSa6EZwTMPwceqk
         KGwUalQg+SdvS6tnL/JGf58YfWNcIrnscxL1zI7BS0/YDh2VHGEO4lt8NWsRaVbdZDIG
         oWGVu8yj1Vxd/HYAPSkMFejfXOs8omsILfMujL7akjW1BxLv6CgVrjWkKFtNBWdV46lM
         KL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+V3ldGXyPhwIgSeIaVeMsyb22SQulpNO6i0LGY+B+De4bbWSAf37CxIf0+QkuVjsRcbtfMsSqr3S77Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLqviaIIHc77BkvmLAjDmyztoBv6ulPYxZU8KrXudGQMvWTlY
	hR/RrL2HDxFT0bsXgPsJaQAWb+Jq1V6RhZ6Y1u7wyhf5scIm3RPXMwAN02T2Qh+GiY2trsoG7px
	U3J9f0Glp9AYnFmsmZcjj/hvrIsTJGaK01J9pkdjMTUfE2fDir3T2E9C3iH1CZF/urw==
X-Gm-Gg: Acq92OH3jgmcnIzCvXePAYo9x+Q3aP7sRtyru+Y2phLvvENX/tdZbKSR9YW2ccN3eNN
	jgYcp4Y81CD9YtgFKp7YpPg9/T9MLat66OMrQ8SzIBRV00CSb/su0wxfrKXjb4uBzmZIRfpDziq
	0Ew1AjgRgBEv5Fpl7FA627wBNIPfr9ng7zmmRyvEPtAMP3B3TcrZ8lzwoDh+WA21VyDOAhgFrzq
	LlN60Q429+S3pwxa7ZQmmNJJvf6KNs6SywJBA7Lidiv9Hevap3ZAITKFtJArsxc6j1ZSr6EujO/
	fn9f4thg2fvjRX0dWrsZgSCY1Mx9KjBM0fEEjwTBy3+IwsIzcGkxjC1uPPh4j7EUbbiREktKLei
	Qd/fat7DbaGdHH7tOKqXNBbIRBxjkGBADr7p2ME6fm0zXcJP4OpbyzzukqhrJhA==
X-Received: by 2002:a05:622a:4885:b0:517:72df:787e with SMTP id d75a77b69052e-51798851507mr196795491cf.36.1781019585047;
        Tue, 09 Jun 2026 08:39:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4885:b0:517:72df:787e with SMTP id d75a77b69052e-51798851507mr196794991cf.36.1781019584526;
        Tue, 09 Jun 2026 08:39:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm485444665e9.8.2026.06.09.08.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:39:43 -0700 (PDT)
Message-ID: <504b860c-d9cf-4ce2-9db9-54167d1a26f7@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: tegra: PINCTRL_TEGRA264 should depend on
 ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
 <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T7rT9eXxdqwNaCCVX7YXciUk7toXxivC
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a2833c1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cm0b6EE1srAZbXlzdSkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: T7rT9eXxdqwNaCCVX7YXciUk7toXxivC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX/1quTgQ9nVav
 TpeJC9rezcUTNb7ra4F9ShqU94zYWQfrq3HobR9OIV+Bvm8xwzXICrnFQRlTQsPdec04pPZL+dj
 C2BT+pj5MCdpTb9G4v1cmho45gm5Fcg/fouVEdj2UMVkNGgoDZlOZ0/seLzZtbuiMMN8TVzWPEN
 iRBUx26BzuV9tB3ooFXEalHqiBaMroWaKYbLhylfhyb6IWB/CK+Bzgq6ZOYNXazLfzrlGGwNrRq
 IF53EgNcGz+aE6xQP7RsHLE7MPGKyLwmfYpbQ7BVlR1xEQg/4Tml2LtRPKlYXbBJvDDHYCASlGC
 J1MUPB0GWNAHdKdXcC3fSJTZRYCpeCmVVHvdviAagdKmSXC5Wc7T+mQOq9qHHMEAB1TzImHEWhK
 wr8yBrh0xg2qDTaWfHkPkF0DlriiBydvHfDiOG1kPSSH1Bym1SBLhdbViGbAyFQNG+GMKttzA7h
 Qi405rnfLIqoumnengg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148

On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> The NVIDIA Tegra264 MAIN, AON, and UPHY pin controllers are only present
> on NVIDIA Tegra264 SoCs.  Hence add a dependency on ARCH_TEGRA, to
> prevent asking the user about this driver when configuring a kernel
> without NVIDIA Tegra SoC support.
> 
> Fixes: c98506206912dd0d ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
