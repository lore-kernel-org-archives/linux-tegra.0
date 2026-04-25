Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8423932EF
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777111032; cv=none; b=Ue7R4RLUeYZKvVbgOwqbLEqIr9MQnKuQFmNk8TVSwBiRftQy4S1jNkSFiM8j+ARC0xvbBURGytdAAnIGbDI4HundFSHLnj3GTXvxQaOC/xyCEdRXahnQL4FBMcsRTikbGDyRtq9ZrqB7YBbAWohRyfbGXMNUSHLmrvDlXHRiXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777111032; c=relaxed/simple;
	bh=GZbR2ACVh9+gp+nilqqxNsrf904ahFQUCCu4bpKzwYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agYg8Z6Tj+RlBoV/LT7v/eC1/d4mCv6qT0BY/qGozP5Wr0PGv4OtNETywpXtVKCMsfNnsK0n9n786YOkunainOT4WgxPPc+OViLHXHuxgESFbGmBbPbjQ3OmpiA/kWIlSaMHM4iJQWh5KDz5K6qVDKqhrDnsdh2hYR6dMSzDAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzUj1w8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kevyq22w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzUj1w8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kevyq22w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4ePvh1557602
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 09:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=; b=OzUj1w8Q2ssnZpj3
	HLB3WZSeCEilZsnigNWyXXkh2qTKpaa2IkdQCRhjOIUUAWvrBAqoSEUC/rQ9/4qj
	doNf0Ue666/ghX/bdSgXlNM0VGqXwWpU/D2bCrbQN9qXTw5SOzJmzjEm5wJidG22
	o/DuhbsmWOY2hqgjSysxpSkQg9ZvcjYFB1V615nULS1UvlujcZWe6HHD4xEZqG/o
	1cBWGGkWjxRTxn35TktvymcPnVMi1y5QtfzKmovJ8cgtjdAHoBjrp30TfspJIuGd
	B0KR7OJcUmVFQNklk3+zaIkkHMrtCo6kA0GE+k9zRO1L6nYxacv2F6QzfFmhJMA2
	Zd6KxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgrh9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 09:57:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so10364312b3a.0
        for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777111030; x=1777715830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=Kevyq22wK/2NJzygX8mYwyb+npRGoR+l0DaZXybh+GxmHarCUrxbTUpS3LeCCuHDvx
         JyvUH/BZ9mHtBjlxGdQmHuaPNIwI4CP68SzLa6JsvlsxgV0DsdqZ63pzkZMMjBLzCoQS
         jFMCYPtsWjS5upnaFEC1ujg7/2lEjwNIKSq51Lb9jCYIskXkzn2CjzV6ub6WlRBOr4Yh
         tcVsZ+NfxqnrC8p5KAT6mZrYaRPb/kYX4DO6b861+B4zvY8TCVRXKKlZ7i1rMt0/wZVY
         I5vLrhv+1ZumluYXou2UTa8G2R+mUQDlY/XKiJWRbZkZ9WOK9INVsSCw9naHypL8EV7v
         rsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777111030; x=1777715830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=SDmxjFf1X3sEreYuJHMXElI7FMUnWap+JOqJyPk47uHBnHA/1UoQ4fUoUaoSmMzNQL
         Mo1f+UWPajCbo2rZTNNmjVsUB+oiSQqmkSJZVUYZKFNXcxZILrV+1DuCLmqZCyMnQM4s
         p90l8KnAWm3w5IY7Ayf/64ZSNPM/MwRz4O4mSwUxII+5ImqYna5B7YnYv1lWYY4+BTgU
         517Rqmr/2d/FSk4jaoIlh4H7/PYA7B3AwMPkXc11VALrlAY5H6N4sTtUNwoLYVxE3vOE
         KsxZgadgr/807vLtYEviUi6rOU4kceZi/noZMU4wlk6X9zBkBOxMSln4fu6YGEbndueZ
         r2mA==
X-Forwarded-Encrypted: i=1; AFNElJ80MKRJu3jAYhd8wjhr8Unh+j4HStgHKODcVBSFhC2T1/cntTvwoDDG9HIdEN+sriqcS8xPTii3dGintg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEm/NHfv/ALZXV5aPgZxqW4qGi21vHA/NXFzgH3bz+/GAAJXH
	iRw/39HblyA//0v42LERaPVCoSMImcdnLQmcy+2Kxx8IgJNVcPeXrdBEJ/ha9mWX6Y5nGTybpxU
	U3q8FYC0UOD8rj9QDiQA1uqjuUpYskMO9siL60r8ElflofPABDFh92ElE1Q21q20Jjg==
X-Gm-Gg: AeBDietvM9FIyQwpydSfeQH/C+3YMDzKCnZ9kOHa/2RaTszDtUGrfsAIYcR6fTiHgrt
	eKk/SB4/MpAk6wj2E43piUbfGKwN/5YIIG1Y1VAFjJ9LybFeD3/PYZaf7W/EPkacdBQugFez6cf
	quju3juezZJEG0zSWWbhAzT7Pjdd/kHgzl4clrf0fTu1xdBqJ/oUgBkqxg7ae0K2w5u9j6jtMcP
	W5kGf+yX0RpKO2i3iBw7XS8pbq6L0IE78y5+TdauCLs52maW/tMGXnmLurdWCLnBFcjs1PFrdLQ
	BB8f7zvWeyG+qZ7VzRHJUSTY33bpNkRymipUyqHlcf5H81/CSFyHp1N+lw/XKF/UYQfqyLJDkJH
	mO/tSXELlD3mCju0D03yt+7mLXRHGv+ptsWhXTMenOInZ7yiTvPxGSjLk8QukBcCxsg==
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379979b3a.17.1777111029806;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379925b3a.17.1777111029289;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.38.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm31035140b3a.54.2026.04.25.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 02:57:08 -0700 (PDT)
Message-ID: <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:26:51 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
 <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ctl2uiG_CItoJUOk_YjIJ81H3BnuBp5r
X-Proofpoint-ORIG-GUID: Ctl2uiG_CItoJUOk_YjIJ81H3BnuBp5r
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ec8ff6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=zt2h8jT1BUEQU1rgsTrZfQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yXM0pRxr-LgjvrZoWBMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA5OCBTYWx0ZWRfX+FBFVgSRVKoz
 td7vFWyuQQo0BuLg5T0pc2cSS4yKbB9v+lUC9JDKODkuPmA9/NpSYCVAIUqt+wis/Aa9FkRHMgI
 30ooqTuqmkGumB6Y4lMp8ec/yJtYYmfFQTfnQembekj9CDgkcVlDH8bEprl5Fq0NwHHDWGmV9vu
 sT00pofLXKbUM65O/wsAjMVUBkb98hIJ05wpvzYDo1H42czqyB61KwVFm2ca/by9iPriKpuvN/T
 UCk571f4jK4oz4FfD+5c/eYe2LjtxUwS4UKcCytupt34REZO9riZoVlm+OuVkHGJeObo4POo9uO
 Xx10yR6LN52e0ZJyxb7azTadhCJ/6lJct4bNJzUYGbXumBxlICE+IY/4msbHAev1LVaKSI8ocYk
 uelf7MlJ3fB6tFpp8CqOid0boRSCXPcseywksk3LBrcVSgj729DsqX+jVMS9vQWvwXskS7G5Ib2
 p2Qk6myVt749fTkvChw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250098


On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 15:29, Vishnu Reddy wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - iommus
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
> I think I commented around here but probably not specific enough. You
> miss here either reference to venus or usage of additionalProperties
> instead of unevaluatedProperties.
>
> If you intend not to use qcom,venus-common.yaml, then explain WHY in
> commit msg and switch to additionalProperties: false.
>
> Otherwise, you miss $ref.
>
> Rest looked good.

Iris glymur platform have more clocks and power domains, which exceed
the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
it would cause dt-schema validation failures, so I have chosen not to
reference it.

I will add this information in the commit message explaining this, and
switch from unevaluatedProperties: false to additionalProperties: false
as you suggested. Will address in the next version.

Thanks,
Vishnu Reddy.

>
> Best regards,
> Krzysztof
