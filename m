Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8839B482
	for <linux-tegra@vger.kernel.org>; Tue,  5 May 2026 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983033; cv=none; b=bs6DXQ0zah41e9uw76spE9NhsU9PRNHT7YoWzyJ2IoUQDNAKqLQ0+rWmKJQLm/jYFoAw+u9G/430VVjz2Hse6Pl8BM8No5UxG4Gx5MArK0LH1L9S7BrB6nJHBBxSqMFD3sQbEYYvAGZDBXIziwHQ589zX8N8Yw3eeDKN2L0iPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983033; c=relaxed/simple;
	bh=m+OmXuXGMU6wUk+WZ1RB6GmPxqyzm9AXjy954KVhZ80=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SPZgCvVlgenKTlIuo8pSw3sZuofJVrW6aVuP7+7yGdgkuD3X1UjcM4kN/s72+EWDnYMfGEXIg+T3gxWtbSyQhwzFEFP5PqzIXOZAvwZL/X0zdpo0gSSacIrY5sFF2+Ssdv/QbdGCvTRE52TV2/xmOtdBaEe34SP8ClvQybZxD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhI6/+dm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akrP1jbO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhI6/+dm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akrP1jbO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457EPPe366314
	for <linux-tegra@vger.kernel.org>; Tue, 5 May 2026 12:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJDA9Dw9DQRR6r6ZVUHzUEY6axXFWifKuuHs5zUrzRI=; b=JhI6/+dmrPEccOCg
	tYg6BDsttRs89uzgbwa/6JVgnQGpIEsFnyxrz46yINXWj1+O06G4/bXWrjML+BDs
	exLUELVYWW1cSAzbA0grX/Yip7KkVddkeeRxEn50uGINmO6QJn+pqUzsi7VU9w9F
	PkRv1hq+90j1eLaWAmaxOaJs8g9csJ2eUSk7bakk15X81kp9Z75G0XWv9Os5YIni
	q4t25xRwgH2ir+8X8zxPseRqN93aaToUq5gYNn3FxssOJvREsBm7yIwVVt25ru+6
	2yhS1qJUGQHMERAdLp81MOvbMzltd/5V6O1xaz9+ILuA9gmC7yBjsja/DZV/fJrz
	eRGBRg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6vc32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 12:10:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so4333113241.3
        for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983029; x=1778587829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJDA9Dw9DQRR6r6ZVUHzUEY6axXFWifKuuHs5zUrzRI=;
        b=akrP1jbOOaToUc2g0r/0/Gtel4mJLnCGg6otWof1jTKmZfi79MupLa+YgdTljIo0vN
         OF/TLcAJgPNy7kpOBgCWGPEvNXy52MgcqEdnfB33hWBONo6xbeGL5mj6jMSfpJyUwBCL
         5QQVYAs2j9Rz+688AysEPc+XI37DqfFbkZ2sjoul6d1RPmg0MvPbnhLKRePpGsoPo67Q
         q+HxwdvB3FAIhoZzfUmal9hXKPNVAMMz2S4nkx8mzoHF2duVzBoqdU/I2JpDkqTQ65Ik
         xCnpCHM2LcDU5D9lPDthxPQsdm+tl8gLHSNt7+1WtbKHcLZyHgcvHcg22cS4HpKCRHBw
         ZvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983029; x=1778587829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJDA9Dw9DQRR6r6ZVUHzUEY6axXFWifKuuHs5zUrzRI=;
        b=RHiGsuasYVS33RjAfalGxwthmVBSn9suvcX27LJm7hR4E5zJ1Tcf3e4syonOHWYwig
         L9aZAFisjCgaOKMz2YlBPBRQdY1whzxzwC/roqF/JBe6c5aUDv70Frg2in/PpdJuQAaU
         C0UIP2Xlo7+iJ0XjvlJTSUXqp/9hYU3nvb/lNGjmqbj3yw/enq3IpCdVWp7Xa71kJ9Z2
         DfWT2Ze7a81/kA9jKNkDMnsuvxvCMseX7QaYXRFhFSdDPzRKVNjCI2ztSyLCae3PB/Y7
         lutMsBIxymHsv2LDHCZrdDq02cgyS3JnOhN9DtZ1aJStqPuI9+gB2Wdhks+KBw0joS4z
         N2OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JAqcFUhuZg38ag8Pn+w6PAlMCChiccJqmE3cbrjjPUYYVwucYkqutNgZ8WM91J/mYZmW77uLsikznFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6aajyomMWX5TUrCmn/ipoKX4Lgwz7P7ATxQBWPI0k05grcm6t
	KIqlyWJt62srhhryqAhPgYfsQTfh9L1w5OdgAoEERs81BmiVyjKQII5v1v4AJp/nuL7x6R7gL8V
	MLPJgGYNeaHmZNkYtFFb+PlHfvDJGxNADars0y9qNKoB8JPp2LtorI+Q9Mwi2G8Hyvw==
X-Gm-Gg: AeBDievxsVsBNzVV1iLR88EmSZVOnpVWROUv2kh0nCpilsFmBxwolOE2DpOG0nNYU6A
	l3aMpyLNUsEtMoLLCjJJRVKHgEp9bKXDrZSCQ0g4/ony7qBa7SZV55xJVW+ZGBLYLcq8+NCCp3w
	Kxf0ElGQ04k/i5Yvd1zcVKjUgmC+mqiUzyAgwOahbgJfsCNo4QtjU9j36pWEw7FxmOR7M/czLJB
	a8HsYlV98qm4wDhlI+eh5WrEaLoQtVbAwHaKY8LDgopGRNfXaj04ucasCdMGYaePyM3NwOrF35t
	xrmdtYKIERM+cVz5VP8pb4OKykQkOT6mm9r5CjyGIJkDHpUf/zoRVEsCFCpRmqaHZO2wSt7FdKX
	RymMp/vPsGcrNxDnkYYg/1zyVUrQOGKEsd2O/cBfSCQge5wVZsVs1lfIMUyHOVsalngXo5tFtbJ
	lUJNPZVLMFt3t0WCOC
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-57547fd53a0mr1224776e0c.0.1777983029118;
        Tue, 05 May 2026 05:10:29 -0700 (PDT)
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-57547fd53a0mr1224731e0c.0.1777983028778;
        Tue, 05 May 2026 05:10:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm312206105e9.10.2026.05.05.05.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:10:27 -0700 (PDT)
Message-ID: <3075fe5c-e8c3-4439-be5c-0f6eb2fb6e48@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers/thermal/tegra/soctherm: Use
 devm_add_action_or_reset() for clock disable
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: atOlW3JYK_q9QUcbS-yysgTMpq4RFQAG
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9de35 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TJ0kvanGE02mnE8zDPUA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: atOlW3JYK_q9QUcbS-yysgTMpq4RFQAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNCBTYWx0ZWRfX1yFfvn+ZDtNH
 rxeFr9BBdZhcW6dF8s3zKxTWs+UdOEFT92t99iO9L/Mt85CXLbeAuaFdDoWaMi9Aezf1vNvokwg
 NfgaOnYfcynacjRD6/CKdC/U6lGt0OsJfD7vFiPRosOe8moK6su+RTQw63h5mYU3oNx6JO/K9b6
 2fg8TDTvZl92q3cY97xTM7QyFAMX5eCA3t+42uUZ6pggguUESge8LWGCoK5V9wYKiGIWCbh9p4b
 LESDJRbQfRX2G7v+44VqzUcayVWb88jjbl4dA+9UvZgSF2+O8RXCzML3w4nyLnR1wo5dS4ivxjz
 q8FiQove0gi5TYDcLs8xxcbdQ1NuwJdLw+rtVAtusHKM0Vz/rYQ0bOOk4XKJAUeAoNCIscvM3+L
 Ywo2jMboBnaABgqMa/69HsNkzkz0Vz6LQcUAs8b96yGea3HmNOopx6XFG0euVlzqro59QwZUcOI
 kGZFvVCQR8uTNmgDZ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050114

On 4/24/26 18:00, Daniel Lezcano wrote:
> Replace the manual error handling paths disabling the clocks with
> devm_add_action_or_reset(). This ensures the clocks are properly
> disabled on probe failure and driver removal, while simplifying the
> code by removing the explicit error paths.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---

If nobody is against these two changes, I'll apply them

Thanks

   -- Daniel

