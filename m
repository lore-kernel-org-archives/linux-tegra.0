Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180F34C139
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134262; cv=none; b=W932+toI4S4D74Z+qWc8Y1rHkuc91Khyxo8KxkOQ4E/nIUOA7xfrTx9XEU2I5quR3cU8Q1znX2caMV4+mfVnpLx2nWWZGfYDQd6eRiucot4SfX6pPsd0bAlp7nVhjjf+SbRVc0m4lD6APm/T0le0i5esfD5cSAewyYBLlG4LM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134262; c=relaxed/simple;
	bh=VWy9Kg9mDTOQDkQpdKD/lfret98JGppo3qXkI9nfpyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=secg+3Q0/8Q1BrGO7VHQ4JGw31CQ+Rb4QuyShQiqVAP6sPrvMif9YJlOTql5PWt++4T+85M3LO9E0ioGRWHnwb/Sh81GfyC2Qja5/f0tMnfz8mKaw0J8ez6HScgMsPtPBSGXg8dn606epSCG5yF8FX1iabt19awBJU7IVslM9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRm0M6hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBsyBRqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRm0M6hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBsyBRqa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGNUZl3165039
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=; b=jRm0M6huFizUvkHb
	tZYUdtnmtE2LQE1macTNCd8MjeOQ/jmrtd8i6rVmUi2ynura1X+uSDuMpGOGtMhc
	qK+4Epc530EwLltrtpZ0OZegKQJwLQ8ucfGJAMIAXH/w8N9lElP/thldjCiAKKdp
	nguBbfbmJVWsR/x7LoIYwmAVybriET0q/I2TX6msC3i9vUg0DdJaVAUfFT2VCZLr
	PFHDJlvZEzn7VaskC5AjzbXpDtwuSMAZtXetypupMBydu2h2lZDHID1O51lAde+2
	qUcKbkRcOgG8RBVF+2m+kSHOf392hF0uzxm0p2k+bApZAkdA8cnPpye3Jjmmggra
	BAsXHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqt9arw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 16:24:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3595485abbbso10762741a91.2
        for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777134259; x=1777739059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=LBsyBRqav61Jw7tJF4ytIpWxfYy9uMO6z4eV63appUIxi+YI+JHQqnhM95LrV4R+aa
         fLasUwE5DuJmCTIB7AISJP7kdiLx2j2DBwMyJLC5Mgidq/O+DQDnZVQOG8QwjaCVI6TH
         zoFa04tMpDVPrS1zsXL9UlWyTEXPNt7ltAdEC3xNJEhZ5EDPDJh0q1omxkvDX7KkITY8
         dTiMdWHw1It4bAx7r0WKEyLVM7sp9guU1O9QlrZExO4TmO5+2ui3neARUAEUuXNfBBIi
         htB1/IcPzUY8IJjjCtXWnreTaiNwYk+dRoBd+ZsiisUaE0DtlKHxzkZcdjCgsGiGt3Ws
         F+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134259; x=1777739059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=PAhix6lDq6/9Bb3EaSOghZK6W9nBcjPGtRo1YiGTRrsvYMrP4Bs0Mu3yvrNl+e1trt
         VJ2tb7UkhjgxQdpiGOBRk2983BG1I1Rdlg3hcn5wRFopmhZpM8J0NziHXolOgpFu82cl
         jKrr5Pqq7aLxZDJX+dHTp2L+MS1QsKQoPSCbwrZb26c11OpNLtNNOBaSMJtzQ3p6vloC
         xE6r9g/CU3dsRVgjH9e44pNku0BDFwrA/5Sjouxu30ajCXEpd5MgQ8zFRIlg2d7Afqy8
         OXgN+/AYklUEv6Qe+x9dJdqbHND10wL8XK9B0vF0vXq51Y9q0pgoog8/Hvx/6sG1Doio
         zjvw==
X-Forwarded-Encrypted: i=1; AFNElJ+pZ0vXxoES5P/fn1oVNI/0btMC3MA+a3mAMeLSP4LqQkR7mIqJdRI5Gqx3s/MtyvXehMib7sAvFSgLYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgyy/MqoGnzxYngFQDUD+LyI7rMSd/2DWdQMHkc2T5o5fkHOax
	5C6eZ3g1T4Ho6IETnH/CAkP4z+erSQ7R+wDJBZ1BwPb6CDY6IFuV/3ak7MoA91KM5rBXx7asYfI
	Ibqgmj2txuIazUZqi8EKW1mdSD05qj+2VPHq4gp+GgRHzV9OI86SDoOHQRWXKE2vngA==
X-Gm-Gg: AeBDiesAk3UjcvfTkU2diz0AqtqswXeckKMknv/EFqjFgKKZNVl/AOi+we2iM6gVbSz
	4Ki3XE2kA2YxkrQ/5x8IH9MBBN0LsBFCQGnMcUbf1y/ky+W7Cei+61Oh/zgXsFQjx/c1dTuPDWP
	1XaKyp+w2Y6WxdlHa1pkeN9BKtRFSufI0gdR6tPF1IBTFc74Ab0UwApzjN/KU7dWECfCo/uFdt3
	2V6bLWXjIRu8x+sNFIebmf974R7F4sg+yi/YNTKJOEAw6VCpMD8kVom6gzfEsWXZ94EdxRvE0p9
	rpZ5njGL0tIaDGv6ynqpol2ZhHSu4xUIaWJJP6m1gQt8F9HQKwkN2GbmUwLMCbV/uzxWN/ogr1v
	Wu+pk+i4l5FkBqMajrAKC9boknP3Z41DsUD9KnK+F9N/OFLf0uKn+K8TlI0frv0hXgw==
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788739a91.6.1777134259149;
        Sat, 25 Apr 2026 09:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788694a91.6.1777134258606;
        Sat, 25 Apr 2026 09:24:18 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm27919380a91.17.2026.04.25.09.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 09:24:17 -0700 (PDT)
Message-ID: <6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 21:53:48 +0530
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
 <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
 <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eceab3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Hbe3yhC3yqVD2gJYGagA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: P4qZc4k66SJ7Pp2YjwFBVYGozuPAX1By
X-Proofpoint-GUID: P4qZc4k66SJ7Pp2YjwFBVYGozuPAX1By
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE2OSBTYWx0ZWRfX4oME4Lhi0beF
 XxVgX8bww6UKkRjq7B+tr6y4G66a1Ddcf0hueAYsvzpJTCigE7prEMDWRxshK/RPHUW1ajY+zTj
 IKYnvV23NhmWvGYwaAFiZyGzswznAc5nbKWBNIHWXJ1rRzElqOrPlc4oEyFprHxOcnOcEqRiWye
 uPXueV2qsaKKCBzndOHVU/mKP8Z159dAgi6HhQTTnBBHYJNcMOe1HCOAcRWkatNIIERi8jbgK1V
 MMQtG5KI7pwY8wjD1X856XJVxGHWI0oTufeWyNplmyiqYNcSKi9vGYP5XrzX8uCCd9qEtu2ADW5
 /wZoP878cX0zXgvnByC4ZmmN7EJpBJU6cKpFnuK3ncPYCa5Q3HegVdBnA3v2WtjjEkFG4cVv7nj
 bVXt6OLhGwPzavYo+zzgj1an9PguY2QKSUge+/60zTYOcdwX++Qst8MAEgNQsyNjO128gLq9VfL
 xn7oPC2Y0Ek5e1AEGZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250169


On 4/25/2026 4:10 PM, Krzysztof Kozlowski wrote:
> On 25/04/2026 11:56, Vishnu Reddy wrote:
>> On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
>>> On 23/04/2026 15:29, Vishnu Reddy wrote:
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - dma-coherent
>>>> +  - interconnects
>>>> +  - interconnect-names
>>>> +  - interrupts
>>>> +  - iommus
>>>> +  - memory-region
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - resets
>>>> +  - reset-names
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>> I think I commented around here but probably not specific enough. You
>>> miss here either reference to venus or usage of additionalProperties
>>> instead of unevaluatedProperties.
>>>
>>> If you intend not to use qcom,venus-common.yaml, then explain WHY in
>>> commit msg and switch to additionalProperties: false.
>>>
>>> Otherwise, you miss $ref.
>>>
>>> Rest looked good.
>> Iris glymur platform have more clocks and power domains, which exceed
>> the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
>> it would cause dt-schema validation failures, so I have chosen not to
>> reference it.
> Instead, you should extend the common schema. It's already flexible, so
> what is the problem here?
>
> You then need to duplicate all of the common properties...

Ack, I'm fine to update qcom,venus-common.yaml to relax the maxItems
constraints for clocks and power domains, so that the Glymur Iris binding
can properly inherit from it.

>
> Best regards,
> Krzysztof
