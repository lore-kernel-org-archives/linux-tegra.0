Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2A3C378A
	for <linux-tegra@vger.kernel.org>; Thu, 14 May 2026 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758914; cv=none; b=pQ4qzWAjQkot5Yj3aodr8BnWDmnM8RnaAV9EAEtV0RvssCR9yJEsiKEbejlzK0cJH6QKOuhTIBnaJf4JjwUIbTYB7J1Z6YWhuc8HK7x3GJssU2DdAazmGsRW/kPJu1hJs35cr28/W08neaaRrTbPoDtND8Ed+bQcW2hDEdpLm14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758914; c=relaxed/simple;
	bh=ZBNju30QtNx5PO3WA9oP+jix/lPYme6w15d21uQ73ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3VfWToq/sGS+/yQAnXF3+MyGjTy4P/fuUII950YD7is58cwAnNtM7kJctU2kIa1GxgOA6X3jBHVohus0AFX+aLJ8b6MhaD5KinbY58yJTCodIuMnUVceKiEDJQ5oNH3XB9teW40iDID/3Mq25IaePusLfC/mJfTQf30TxodwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ejb/PgHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQQwjTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ejb/PgHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQQwjTB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBf6j52262632
	for <linux-tegra@vger.kernel.org>; Thu, 14 May 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=; b=Ejb/PgHL4Hh2Pyf1
	vLHN+/6ozUtuCdEpQMd9u4UOr8Kh5EHOCzn0MwqcUrMfF1KY1DfwLwQhvf0fOBmN
	K6qz1qRJQW/7HIfhRTqWXWJ5l5gxw6liZbpJ++KhhNssFQtj5lRz4rVOc65s67+U
	0NaDXs6dqMDYKSqJv2uUmMm4mbhbzHh7B2GIt/o7xyfoYxvUrnnaSkqy8TebPwrr
	NRFFRA/QI8az8+s+YIP1egAr53LTgGu1zaUkg8O8OEUUIQmq3qPBbsvqhUO6gMAa
	viClD+QsJeoZkuQrhA3ljtP3LhvZU/FSFnNWYUFgjq4kldA2KaspJpb4bn+/taxc
	b6ubig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hhn1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 14 May 2026 11:41:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so3575855ad.3
        for <linux-tegra@vger.kernel.org>; Thu, 14 May 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778758910; x=1779363710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=LdQQwjTBY99PS7PRR2fzAT6vDV1NnXzljcDZBccZWK4qkRX4JqkmmQuWsJLIcpeN2G
         OR+hRXxkaRYJaWCIe7sj3bu1wfO1zqlMKFtaAVAmoGoX7plXDHCbNk/sXrgV6fhF6OYc
         YnFKh/jB0sax1hjV/1Q2xv9b1UflGWwISb5iYOnt+AuytEGU9wRjAawp6sS4Ku8yG+kj
         OFLAMuXeIwIfTWQzS7gwzfEC/Mb1ObYfvq1zgaerppW95nDpeysF4AT8hLRfDxKrirEv
         iU9QOMHWrMoiHws4O5HR/01z3qtT0dqjgJ2K5BrWxuqG3J8Hkw33gqDbOKbbqp1j3s9o
         T2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778758910; x=1779363710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=PAxGCJX+PZnzpSW12cX3B0067rixLGYwKHMnjCKmxVLhxMGrwr4TXnsB1ncTdXzdvl
         kmBYQG7UpKhUG0pWCX6alBAhszwuX/GBm5ppb9UBcpDfVFLCI1H/bNoQWexE53RTYh2o
         D4FTdxIRUgioHzJZjAMYM9ATFoOd/pbuCL8ZgmkXN1Q8GQ5FDs2MV66SNoGDiSbcCv3z
         MCc+XSPArQmJ9sNo813IdeZGQ7X4mr4ETnZ5BjViM0LsbRaOxrEeR5u1dFdtTJiGbWCR
         giSeHdJyQv4umENLCcSM3k1RnTz+5vyycvRQSY0QElstAHB/0X6r/VkxMoF/O8fkzviq
         iJ5w==
X-Forwarded-Encrypted: i=1; AFNElJ+YlDCHIADULsjIy/mq0yZuRhrCjypDDVk6BRYBjcoUN1e5p44K65PW0gbfEA3m4kPkC5eU/Zo2tiS+vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzce7kVYDhQUn3k8I4GSWqwPZ5I6hrLtHlf5txSOfMfxtT6z9DL
	ySKgAmqMSPoZ+nDZLBB2kwJ7ckydoBJH5Bm2ONUsS6Vyd7KiKweaeLQKt+/q+DAERQTQ0EolDvN
	HHbdLgFQW2JXvZk/AB+hQjZElSZ549TOpq2mLH1a1Zh+VjtSEUMV4WnNizQPfAzWfnA==
X-Gm-Gg: Acq92OFWOoGk9wEqf3mZCjKTTIKq7kRUdfkhTFkDs2ZTIQ84xzfvpleVSerq4kcpOnm
	xIL2mPpolbNtlcykSmDmZebLb8dGM1ghZPJ8AYom9zgQFMk98+C3jEcpqrqN3fvdi/Cj/lpHczV
	JeLeGGPjvFnEsRIMvrdBzl8egoXWuE8h/lgvXmg7od34quBQ3jq2OIbSYdiehQLyEHKOd4LDC6C
	r1V3o1kb2oePigZJDcW6pFV1+VB8Jx0WSt42L4Dflg2BDm3mkpJ1Nc2HuDJrfiB70sIuO+bZ5Jb
	d44I5zaKIbZdWBMFyFclXdMLB//XiiottNzZk76U+/EDK+dHEzr7IGkc1wvmBUsC+gxbrHx+gZm
	IJxD5FjiAdAqzOV6qkKsfS8G+gaZq+08hwuyK5SLHTPQv5VF5kWnS432lYhIKhMSEinOYpnpMls
	sKGdNTswyz8VrHVg4r3IbP4wTSAuU6yaJ4gqXngUI=
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85598095ad.29.1778758910258;
        Thu, 14 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85597715ad.29.1778758909638;
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Received: from [10.190.200.238] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm24879805ad.65.2026.05.14.04.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Message-ID: <5494a379-1e49-4551-a5f0-50d0bd7cd7d0@oss.qualcomm.com>
Date: Thu, 14 May 2026 17:11:41 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        sudeep.holla@kernel.org, konradybcio@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, cristian.marussi@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W3f7kwrGr3aE12efBXnyoq-PQq6feGc4
X-Proofpoint-ORIG-GUID: W3f7kwrGr3aE12efBXnyoq-PQq6feGc4
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05b4ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=2dUMNUc8cBhmsmHMSX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExNiBTYWx0ZWRfXxQH42N+XRkq2
 +R/fhWVxVklD8HQEc/30hTMAVPwZretSFjvvmVD8qWQJK6dvuuLjjqeRF4siPlfCfVmAJ0FOLCz
 JKI9SiAqynLZfSAs65nUe7ZC3KleQ5X8PIz6NClI0VLSesg6z2fXlDAdeekPR77gJLJW8K/jmZg
 QAEzP4HsS7dreGlMXS6GDYmisju3JvAqdBB2gmxrywhebyhw5VGC+GdcNbOSnnfgs4ZCNHQ5gMd
 p7Y7yEl6HGisWXcY3EnbcG+WZCqyronO2MWCWeBAowFKqandNIEx/VQJY8EJNDKMBHZWcBCjLz0
 MN7X8sMymg+DEzgaYQoehnEVoR7oTVrUYfA/9lFWm1jW8lsUcb0D8cnV8TZMABAVAmYQVD0D+O1
 KUGvrhpgNbGoY5KphQy0iuxwI4/vFH8jAjkph1E78jkzJG0naeGZ5eK637rBsG5MaQrx4eovsKv
 yDuqfCYJ4faL0YO1zuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140116


On 5/13/2026 10:30 PM, Lukasz Luba wrote:
>
>
> On 5/7/26 07:22, Sibi Sankar wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a 
>> number of
>> Qualcomm SoC specific features (like memory bus scaling) through a 
>> mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor 
>> and the
>> mechanism to control the various caches and ram is hosted on the CPU 
>> Control
>> Processor (CPUCP) and the method to tweak and start the governor is 
>> exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq scmi client driver that uses the 
>> memlat
>> algorithm string hosted on QCOM SCMI Generic Extension Protocol to 
>> detect
>> memory latency workloads and control frequency/level of the various 
>> memory
>> buses (DDR/LLCC/DDR_QOS). The DDR/LLCC/DDR_QOS are modelled as devfreq
>> devices, with the governor set to remote devfreq governor. This 
>> serves as
>> a way to get a basic insight into the device operation through 
>> trans_stat
>> and provides for ways to further tweak the parameters of the remote
>> governor.
>>
>> Transtat data for DDR/LLCC/DDR_QOS is now available in this series:
>>
>> #cat llcc/trans_stat
>>> From  :   To
>> 315000000 479000000 545000000 725000000 840000000 
>> 95900000010900000001211000000   time(ms)
>> 315000000:         0         3         6         6 6         
>> 7         0        30    143956
>> 479000000:         2         0         7         1 1         
>> 1         0         3       356
>> 545000000:         7         6         0         5 5         
>> 0         0        10      1200
>> 725000000:         3         0         5         0 6         
>> 1         0         6      2172
>> 840000000:         8         2         3         2 0         
>> 4         0        12      1188
>> 959000000:         3         0         1         2 2         
>> 0         0        13       272
>> 1090000000:         0         0         0         0 0         
>> 0         0         0         0
>> 1211000000:        35         4        11         5 11         
>> 8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> It was found that a lot of the vendor protocol used internally was
>> for debug/internal development purposes that would either be super
>> SoC specific or had to be disabled because of some features being
>> fused out during production. This lead to a large number of vendor
>> protocol numbers being quickly consumed and were never released
>> either. Using a generic vendor protocol with functionality abstracted
>> behind algorithm strings gave us the flexibility of allowing such
>> functionality exist during initial development/debugging while
>> still being able to expose functionality like memlat once they have
>> matured enough. The param-ids are certainly expected to act as ABI
>> for algorithms strings like MEMLAT.
>>
>> Thanks in advance for taking time to review the series.
>>
>

Hey Lukasz,

Thanks for taking time to review the series!

> Based on this description I have a few questions:
> 1. Why we don't use SCMI notifications for this purpose?


This is an attempt to retrofit firmware, that is already out in the wild 
running
on X1E laptops and Glymur which continues to use the same firmware, into
generic linux frameworks, so that it provides some useful information to 
user
rather than it being a complete black box. We already have a ton of firmware
changes suggested by Sudeep/Cristian that will be taken into account for the
next generation of SoCs, will make sure this is accounted for as well :)

> 2. Is it safe to assume that there was no extra frequency change
>    during that polling sampling period?

Yup, there is expected to be at most one transition of DDR/LLCC/DDR-QOS
per polling cycle.

> 3. Shouldn't we sample 2x faster than the changes that we try to
>    observe?

Yup, that makes sense. Will fix this in the next re-spin.

> 4. IIRC there was some extension in the SCMI protocol for performance
>    domains which allows to expose the stats like the one above but in
>    the shared memory. Why we couldn't use this? It would be more robust.

Same answer as the first point, since the current firmware provides to no
such provisions :(

-Sibi



