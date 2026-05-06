Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9543F54C0
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063259; cv=none; b=NziYA22dEzoZd81TIXFz8rxGpr1ZlgTgf9aCGJb5TXAFBzDoHZNmtsXot4qoqY9kr1YTgouOszK5W1BbE0XtRqGGPqy9+HAJ5UVrli2h8d3+uwl5GbqKMvoFwsVFRnbrGvtXV0z/bwXXEEcHDeXviQvyaAb4Og0d42K/mIu5rFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063259; c=relaxed/simple;
	bh=nmDqBEuuNrd55Xf0EKOMVEeQIuKmfwnGUnA5AYldlNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNQ2SgCX172XdQks1JQpUysxxkqBXEaEhLmgjrHiej/XjVW3h5Wg7RUxutfeyujoB3SDM1sWzh8UzayWNc2P4rfczXlVBRU58AqZPeoc6rZrbKwyupEk9JHQLDsJN0CUD1H486Gn2gvYdTniXTPTaSz40fweuxY3CyyPgsO84Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQXRtTCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0Ytu/hS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQXRtTCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0Ytu/hS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CbVj1527771
	for <linux-tegra@vger.kernel.org>; Wed, 6 May 2026 10:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsZLiSX2Y5MimoIZwLQ0CXLNavG9OJUKdcX3jVhpm9g=; b=FQXRtTCwLZnb0KTo
	A8sQ23tDcmxK0ajaw5PkJorRHsaGeX/gk5Bc1s2oLLkXKzfzCTbg1KtG4kK8Smgt
	KJhe+qAKkMLcD5wy4fKFQfWT12EvkP+aV4M3gpSb+iIfjf5xikUJvbVbjum+JMea
	s78QQr86xe201fPON5H1pHDmUZtl/Ej8TwDFHVN3BGa38Z4Mp0fI0uvIQ8hO4ckP
	v3ZNhAbU0DBeOtO5DjEgMxT8iLFGZ6V5KIx3Omq94RulUK40LZklc5krb06uR6L3
	72JUddchXTUG8XIooi55X7r/IwfRmb9wEuHrcuk7uco3VDWcojV9D2PdSQW6UcBJ
	eOfI2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288t6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 10:27:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fba8d8c40so158206311cf.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063255; x=1778668055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsZLiSX2Y5MimoIZwLQ0CXLNavG9OJUKdcX3jVhpm9g=;
        b=X0Ytu/hS4BlmPX+pW2t8sd2fxUYyIplv6sRVU808FTc7prIVxy8iAh/NRgxkiSyrOB
         opIyinhjyiVLa0OEzwziuykHOw1vabGWyGPMzyqWrbAJ6tEmfcFIqxsqaSpVUxBdbygy
         M2B8+dfbRAq2SZhNIMcJrrAiI5noFoovgFeBwqZ92t2sOLkUIo/5RqXeAZHEfXkVAb9Y
         lv+fKbhB8jY/xa3uEal/G1c6ZlxEGutG+Be0C1UZDi89mwqIWFBPVpiH7+e3Q+DICI/x
         y/EnZR9Nn7q6cRApJ7idG1Y72k4ypxzzxB6RmE8ZjY+wIOIq5LBsVbSIPSVLMvBiJUVg
         thug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063255; x=1778668055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsZLiSX2Y5MimoIZwLQ0CXLNavG9OJUKdcX3jVhpm9g=;
        b=W07CD+o3MydYzxQIyvV7icmVfE21vJnwOAzjVeKtC6GJ+jTuxvjD1HGqu3v4o2Oiu5
         sXDdhq0fhgh3YX2TkNGJ+3pDKGJrgbxMbCwkFyeGpxjUxEJHkCFBLL3mGh8E4lKOO0eH
         lDqOJ1td4eqqNKNaxK0TIQqX9Rf++s8sSspu99xpQpcId1TYKsPIuVcbquP7VMqxKwjT
         AXsmiOLVgdQVGFxgzbyRqPMpJOezL4h7A9EnnYMAx3I1usswhiwHaJHEiUny0o1baeQl
         1ott4ScWf5IdxEOPPQBEymiRAQo1qqmEzdoZRCaUW071nVjq9a9JE3+1euTs35DkSVbi
         yroA==
X-Forwarded-Encrypted: i=1; AFNElJ8X3U/1FDBddXN4UJACuoN7guwxAX5HDbekaDeMo/UfeNy7lr3LkRZIqapNCPAcSPmU7R9H7T1E2dBXOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBarP80aKinPUfIyZGQSUU4gcmEieafcqZxtY7tlhuzi4MU2W
	cO8t8qy/FkIT/RJG16JYbTrFRxZyn1YjtimmWyOCOJrLdyTsj89bv55kTnRIsNfUNGKVnl2O8Qs
	1hFuxLGYwrdHYIRdlgpbK7FOSlO4LuyzLasat49dpRxiC6UUtLI8Ptr0Fz8eGkHT1nQ==
X-Gm-Gg: AeBDieupyg66+J3duM2S5iRTVvwnpAfBF2rGhRJr8Yx9gIV+Rj0LJDs8SPwaxcZh/6T
	7kuDBB4fR6vY/pPATnogCDfwrN74O8+tRhJ1bhhO/FvyZk4HMhnM9OB7+243JAE/Jf8Nib/PDAf
	AJlXwaK/xnT6UFNpaBD9ehbUfmEaGBWGOTEcXYkoOCY5GNtpWGp3RhFt9EA3XjuTnBt2krcFQ6h
	JtS3hk1V12vHroIvZYuX6azRzHo4ZZBjmahVLYfoeMv17Nkh9S5gyP7vv/lU9ozhOElROGEmSIT
	FBEuev9Fbf4dIqTphk2V96rvHJV5aMz1LtHlAC3TCe896Yv+naAtdc9CtcMH0ZI+MrrOo56lgr5
	yNsWfA+KjgA06RMflfoRkAzovJEQpEewdbM+5I7FtwCYJ278lNCF0DS3dulZt0z9jA3zoz5dzzZ
	VSFS70aTXZLca/L1bIFYQ=
X-Received: by 2002:a05:622a:410f:b0:50d:8080:2a7 with SMTP id d75a77b69052e-51461c268b9mr42610681cf.21.1778063255511;
        Wed, 06 May 2026 03:27:35 -0700 (PDT)
X-Received: by 2002:a05:622a:410f:b0:50d:8080:2a7 with SMTP id d75a77b69052e-51461c268b9mr42610431cf.21.1778063255124;
        Wed, 06 May 2026 03:27:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e174sm11525885f8f.1.2026.05.06.03.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:27:34 -0700 (PDT)
Message-ID: <2740bf17-27b5-4a68-8eaf-589252a84436@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers/thermal/tegra/soctherm: Use
 devm_add_action_or_reset() for clock disable
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: rui.zhang@intel.com, linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        rafael@kernel.org, daniel.lezcano@kernel.org
References: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
 <3075fe5c-e8c3-4439-be5c-0f6eb2fb6e48@oss.qualcomm.com>
 <d60b7b44-37e4-47ae-9af4-0c8d24b6c599@oss.qualcomm.com>
 <c45c96a3-535c-4374-b9b2-cf75240a8b05@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c45c96a3-535c-4374-b9b2-cf75240a8b05@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ITcxpBf3r9AIG1Rsi5i0lHmdb7fbDZAO
X-Proofpoint-ORIG-GUID: ITcxpBf3r9AIG1Rsi5i0lHmdb7fbDZAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMiBTYWx0ZWRfX81u2sEmjoQc6
 fWAabMNdZ/bhJB62No8HAJ3iJzYQzFZTnroR2FqesBDcLFbRNEKWqGK1rUzaZLQCTwJgGYrj+YG
 jHU5ZvTHl1ZRz4w8VQCHrALCA/ksV6bIxSKKREKgUGRZVQbK9aXEtVBHM7Y7yuf0qCGtWhx7m1p
 BVa6HNDw3R9mTXixqJZlnUhWyd/sgsmONPA/S0PTHE0/WJpt+rQi8LTroF9eukhXpPnZOa/30+n
 OmXj+rD6lHnYmXFvGamwgV3dj5plWB8TVQU+08uEAJHuNZ5Huk0SiLc/RbRm9AO3hFFVoIaZgRr
 EJyM5mx7YTj9eVTH7Env2/glM/shIsgVmu/JRzZpVGpGoO8lspl/PbI9ScKfVI7kkSquqp5iUOD
 fNHvM1C24+UgaLYxJR02pWc0okwxvPvVAn27KUC0w7UraJint6ypQLNcNge3RmuxtFQP4V7cbPe
 L7WgpYZVvyjOQN0SN1A==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb1798 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=q-kRPO7bpnIDiy-Y-2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060102

On 5/6/26 12:26, Lukasz Luba wrote:
> Hi Daniel,
> 
> On 5/6/26 10:37, Daniel Lezcano wrote:
>> On 5/5/26 14:10, Daniel Lezcano wrote:
>>> On 4/24/26 18:00, Daniel Lezcano wrote:
>>>> Replace the manual error handling paths disabling the clocks with
>>>> devm_add_action_or_reset(). This ensures the clocks are properly
>>>> disabled on probe failure and driver removal, while simplifying the
>>>> code by removing the explicit error paths.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>> ---
>>>
>>> If nobody is against these two changes, I'll apply them
>>>
>>> Thanks
>>>
>>>    -- Daniel
>>>
>>
>> Applied, thanks
> 
> My apologies for being late. The changes make perfect sense.
> Feel free to add to both patches:
> 
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks for the review
