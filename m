Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB723CB57B
	for <linux-tegra@vger.kernel.org>; Wed, 19 Aug 2026 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169431; cv=none; b=MX/JTVTRxPyMvVjiiQaE2p6qrrUYQU2aPb+IimATVDriEwdegbhY9LbOcTQA78vnWx7udNoFcqMOrItNrIIt/vgq3O+ItzpX9ysV4ZgIqsC0BHwCseuSwgOk7k6r5qmo1urffuccq6PAVIvPBV4IluH7QmTCn2eY6+J6BoJByPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169431; c=relaxed/simple;
	bh=FQJN0cuU+ub8oZlchUHAIroNL+MPPAHAIdeA1Un452g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsyaQpJO5dZXPqdWAxXdobqxV7gqxycbvetkM7IYkZm1sBo+2Ml1tejSs60IU6xnXGj6UxrtxqXFGHnoVVNvcAoT6oiJnM2qZ5GtWJsm8B8+pzSY4rTvUA88yk2RQgYuKahJ10J24P0Vmhmd1PrEJWsR6L8cNmT9Vfn0RdJMRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HobA+rc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=godnM7ip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HobA+rc/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="godnM7ip"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHqMOX922937
	for <linux-tegra@vger.kernel.org>; Wed, 19 Aug 2026 19:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EecG7pICFhcpfpir1cR63XfPtU720iFqsXX+MwCmZA=; b=HobA+rc/R1WrB2Uk
	Bb5lFJ6pQD6x6vmNKQPjZeszkfMvN1CZWVoKBsxkTflA96zpuHZHcvk/IbdpCl51
	OHwGDxGvXmgUZpp3wSLMd7AycbK238hs5XnyQHFYBRO9TujW6zdrygyHBZaaaAF3
	+1VOozRgjLb++oNj9Vv/NSDfnVQJIyB0XePUVE/y9ndhjZql4Wjoshy1byu3B4Cc
	WP/OkX/COr48X4Lzs38FGspm2UzIV3dx8ATTjmhb5jLmwrBrcKtKzjApA3pEwIxh
	T0J7+jJMLu6OW6X+i/6W9hUWrDCUjrvn4CTaXSRQdbDoYeOo1agAt8wm7EA76oX6
	p5Lizw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es59dyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 19 Aug 2026 19:57:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso20846815ad.2
        for <linux-tegra@vger.kernel.org>; Wed, 19 Aug 2026 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787169427; x=1787774227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EecG7pICFhcpfpir1cR63XfPtU720iFqsXX+MwCmZA=;
        b=godnM7ipJ4Au0MEu3008viW+FVgk+x4X4YVw+m2z6SyfEdszusrEAbgp4xy3smxoEA
         ldehQkXWuE/JkNuZ2iUqZmB0nevamDiY+OiukOEtS2MedeLOGQLc1dRrgVpOvg1HOtei
         1LoA80ucVuzmsX175P3KzX9E9pQ9cvAzcJwn1Zwtih0gXMaDE5FPV4Ud7YilLAVa/t4R
         B339jXJLYjMivDCf485uVYRx9HfGfnvX3v9Y4Xe40MsnHf4lF/Ds8sDtWbebGUD45384
         AJZXDJXNsWx6P2dJDqLPttv3gR7ukm/Zn8S/79PmBoLq/Jb+AN6Ygwf7u6QA2AI8Gn5e
         qKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787169427; x=1787774227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EecG7pICFhcpfpir1cR63XfPtU720iFqsXX+MwCmZA=;
        b=V4ZopmmgcSNpw+mcKyHUxt8a5NRGiV2ru8z2Y120mB6htu3/CKBhBZWnqT1n2305nX
         PEQ9TFF38NKBGjFdFi9YMubHQYwi2dxMpgbfjZ54b5gGvlkzrFuL3M8myCKUgyNnmaGv
         mQgBO60yqOl1EVOw+HEvRBU/QlkNxYfe1VHzexLOARHpi9ana5EeNKFkcRdWYE0ESbUG
         NwvlQOUPYBpWkNh4r7TAGqqfREYVF70pL7kYx1vVZWEo5/09SkO8t/xDGp9nlDqHaBWR
         aRMGPrh+Q9YHsstSUPopG/XkoY2BKPBDC5JlipHdkYgbt25v9+SdwO3pa9YjMXWTJ7TC
         XqlQ==
X-Forwarded-Encrypted: i=1; AHgh+RomQzVUFW8FnT2KL6XZckka3Cq8RN+jnnEj5DDmjTDr4xW4vJErzgZINdvOyFoSHibAzK0OcVL2F42AnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrRvX/LAudBAFoL7GK5Gftfkfr0We8woqEOlkZu00KZf6c0y3d
	GlfCiBftMTLP0zAjVakPy2oocC6tkrCvPwQdJ0CuezgVMBjpqwC1XbVf3qBQP1tydzKEWL9moT6
	ckLxl2kccucLiH4jL4cNYmzB30F/B9SFsH0zwEgFyYJ+gMe2d8zs8G5QvCNuYb68lSQ==
X-Gm-Gg: AR+sD131YvL8oNFRdmFfrW918xPyHT0Qp3MpX/V1ZBR8w4yLASi6b+zRFvtS0Zm3CT8
	3lv/csyGLVKV0vfrQfCfWV+qL/z+5e5FIQW3dHCrqzLNU8NLsFkklthX2FtR58Jts/ZRn3R3Hmn
	HIHBTZj01RYmvJfmYj1YTXZAhxwwipUFNBS9MpdeWb/oLtGhqZI+TfveOJeksgVcN8dJ0s3bx9D
	/MgzADJR0kMaHP3m7MAcliP6OGVoTG/ZNqNHIGHi4oOJfwTX9DyLTN/9SwgBl/vg+fDSOEoxxwY
	24n0TMFvxntraol4phrq+5LtWrLu9xUJtEN8AL+TcVQStli0RForr2Edq6jPCkNaL9ZOiU0jTLV
	kkQgkYYiv+r4h/4VhPd+ajtOT3NwY2Gw=
X-Received: by 2002:a05:6a21:9182:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cd00df4c1emr15089572637.5.1787169426995;
        Wed, 19 Aug 2026 12:57:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:9182:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cd00df4c1emr15089465637.5.1787169426493;
        Wed, 19 Aug 2026 12:57:06 -0700 (PDT)
Received: from [192.168.0.111] ([49.207.195.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3d708sm8323768c88.1.2026.08.19.12.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 12:57:05 -0700 (PDT)
Message-ID: <fb0ad185-8989-48a9-86b4-9c765788febf@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 01:26:57 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] firmware: arm_scmi: Add SCMI QCOM Generic
 Extension Protocol documentation
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-1-cb732bcff1f4@oss.qualcomm.com>
 <20260724-crouching-starfish-of-apotheosis-d1cdf8@sudeepholla>
 <f39b2be0-b6d6-43a6-a412-44ff433c51f6@oss.qualcomm.com>
 <20260813-remarkable-handsome-heron-e99e78@sudeepholla>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260813-remarkable-handsome-heron-e99e78@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fm26_vrDf5hzBMdIxYm0I7LlmVBDsQ-5
X-Proofpoint-GUID: Fm26_vrDf5hzBMdIxYm0I7LlmVBDsQ-5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE1NCBTYWx0ZWRfXxBBLZwzY/Fsk
 mwUk1BKgxUF0CfZ4OIvURRsstor+7F9Cuqg+aaPcNCeIqolfcl039OuC4SYsUnJP9YDBkHYPrXR
 Eux+GakWDyN9CeRfzCv2aKaLF9ixT6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE1NCBTYWx0ZWRfXxaAkupscg3+y
 hJqu3G0BV9m53bQW33hBG7jekhF53AeWIvlzMtFhJ+EfhOrr3nHcUXPsiBfyVoLqAbJ6QpzZdFK
 TwELHn6lXxPI4mkliCXObGdQAZO0p2ov4t4ta0dCw0Xprvnx7f0Cg+lLLngS+fcpo/8A4sMe1ZU
 HrBEHX7a2WR+zIP6nD7thFlUNI631O2Ju6nRDp07pX1SniqyJOEnHZQU3SvuapwdLCd0QYvBqEq
 QVdxY+D0xnIWMf4YqBlHcnvm1FwDBs2gGZfaP8t3j40XVpyK8NivzmzUSw1UlfQ7U9RgcpiYV6N
 uwTt2oPEh438C97AsMyRL78uXHVhoCxHOO4NuvaoYY+lcb/qkLEVtlZNCvOW/K8gYTYq1UVqpJv
 NEabJYJhdr3Lsmd4HWliRkhNAJ6JinlYkGDB0cDk0F8JgD8SvbwVUO2jNBSCb86ImVmikNBF5Wm
 RR3GL+aGBU2i9D4J1tA==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a860a94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=GtEwt0l4+wjVPj/mkyDqNQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=elA1XZaLXWgp4cnL6pIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190154


On 8/13/2026 12:48 PM, Sudeep Holla wrote:
> On Tue, Aug 04, 2026 at 02:07:28AM +0530, Sibi Sankar wrote:
>> On 7/24/2026 2:43 PM, Sudeep Holla wrote:
>>> On Fri, Jul 24, 2026 at 12:48:06PM +0530, Pragnesh Papaniya wrote:
>>>> Add System Control Management Interface (SCMI) Qualcomm Generic Extension
>>>> Protocol documentation. It consists of a small set of generic SET/GET/
>>>> START/STOP commands, which is used to turn on/off and configure Qualcomm
>>>> SoC specific algorithms that run on the SCP.
>>>>
>>>> It currently only supports MEMLAT (memory latency governor) algorithm.
>>>> The immutable pairing of the MEMLAT algorithm string with the supported
>>>> param_ids associated with it are documented here.
>>>>
>>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>>>> ---
>>>>    .../arm_scmi/vendors/qcom/qcom_generic.rst         | 954 +++++++++++++++++++++
>>>>    1 file changed, 954 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>>>> new file mode 100644
>>>> index 000000000000..42e327d53841
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>>>> @@ -0,0 +1,954 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +.. include:: <isonum.txt>
>>>> +
>>>> +==================================================================================
>>>> +System Control and Management Interface (SCMI) Qualcomm Generic Extension Protocol
>>>> +==================================================================================
>>>> +
>>>> +:Copyright: |copy| Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> +
>>>> +:Authors:
>>>> +   - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> +   - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>>>> +
>>>> +System Control and Management Interface Qualcomm Generic Extension Vendor Protocol
>>>> +==================================================================================
>>>> +
>>>> +System Control Management Interface (SCMI) Qualcomm Generic Extension Protocol
>>>> +consists of a small set of generic SET/GET/START/STOP commands, which is used to
>>>> +turn on/off and configure Qualcomm SoC specific algorithms that run on the SCP.
>>>> +Each algorithm is identified through an algorithm string and has an immutable list
>>>> +of param_ids. All supported algorithms (currently just MEMLAT) have their own
>>>> +dedicated section and are listed after the generic commands.
>>>> +
>> Hey Sudeep,
>>
>> Will set some context here, this version of the vendor protocol is currently
>> running in the wild on 5 SoCs (Hamoa, Purwa, Glymur, Mahua, Kaanapali).
> While noted, this does not impact the code quality or review process for an
> entirely new feature. That context would be relevant for a localized fix or
> system quirk, but it is not applicable here.
>
>> The ABI/Specification that this vendor protocol uses can't be changed in
>> any way since other Os'es like Windows/Android expect it to behave as
>> described in this document and will break userspace.
> The current rationale isn't entirely clear to me. Windows historically favors
> ACPI over native SCMI, meaning that supporting a proprietary vendor protocol
> would require non-native workarounds potentially hidden within interfaces like
> PEP. I am skeptical of this architectural direction. Since Android leverages

In an ideal world maybe but transition for all SoC capabilities to ACPI 
is rarely that
smooth and they do use the PEP interface.

> the Linux kernel and already manages this through vendor modules, maintaining
> those as modules seems like the optimal path until we agree on the interface
> that can be merged.
>
>> series is meant for the devfreq portion (since it introduces a new devfreq
>> governor) and is not for the vendor protocol. We certainly can take design
>> improvements for future revisions but making changes to this major/minor
>> version of the firmware isn't possible.
>>
> Given that this patch series has been under discussion for nearly two years,
> please provide a summary of the feedback that has already been incorporated
> to address these concerns just for sake of argument and in your defence.
>
> To clarify, the vendor protocol space is strictly intended for
> platform-specific functionalities that cannot be standardized; it should not
> be used to bypass standardization for convenience. It appears no evaluation
> was done to determine if or why the standard performance protocol was
> insufficient. Had that assessment occurred, I would expect the proposed
> interface to align much more closely with the standard definitions as I
> previously mentioned.

The design might seem contrived at the moment but it was still largely 
shaped
by the SCMI specification. There is a literally a 6-7 year window 
between SCMI
landing in mainline and the first mention of the vendor protocol identifiers
being re-useable between SoC vendors [1]. This largely shaped how Qualcomm
used vendor protocol. The first instance of vendor protocol was a straight
forward vendor protcol implementing just MEMLAT [2] but the sudden rise in
the number of protocol eating up vendor protocol space made them club
together the class of devfreq algorithms into a singular generic extension
protocol.

"deliberated attempt to circumvent the standard SCMI protocol template"
"expectation of immediate acceptance without modification"

I gather that ^^ are the major objections to the current series landing but
sadly none of these were raised during this 2 year period and this protocol
even had a "Reviewed-by" from the only other reviewer listed [3]. We 
promised
to fix all the concerns raised [4] in the next major/minor version 
upgrade [5].
The current version works as is on Hamoa/Purwa/Glymur/Mahua/Kaanapali
maintaining the same ABI (that should count for something) and it would only
need a major/minor version update when a new algorithm string gets added
or a new param-ids gets added. Both of these are yet to happen.

Given that we put out the pseudo code of what the MEMLAT algorithm does
and spent the past several revisions trying to explain why generic perf nor
mpam would work for us we keep getting hit with the blanket "It appears
no evaluation was done to determine if or why the standard performance
protocol was insufficient". The only recommendation I see from your side
is move MEMLAT to it's own protocol. With the documentation/code
available to you can please let us know how current perf protocol or MPAM
can be used as a standin replacement?

[1] - https://lore.kernel.org/lkml/Zag5L9j8-oCebKFm@pluto/
[2] - 
https://lore.kernel.org/lkml/1667451512-9655-1-git-send-email-quic_sibis@quicinc.com/#t
[3] - https://lore.kernel.org/lkml/Zo14-rQ1Jaxh5Idi@pluto/
[4] - https://lore.kernel.org/lkml/Z1GfGk0yQAVQKEVL@pluto/
[5] - 
https://lore.kernel.org/lkml/55fd0c34-c52c-95c5-5cd0-16fd66a4baa2@quicinc.com/

>
>> Plenty of folks running linux on these SoCs would benefit a great deal from
>> this series landing, so please have a bit of patience, take a look at the
>> documentation/series as a whole. I still feel we should be able to land this
>> series in a form that is acceptable to you. However, if you still feel you
>> have
>> to NAK this series regardless of its usefulness to the users, please do list
>> the
>> reasons and we'll try our best to convince you otherwise.
>>
> The core issue here is that the proposed vendor protocol interface has been
> presented as a finished product without open discussion or a willingness to
> iterate based on upstream feedback. This approach bypasses standard
> development processes.


It would be way easier for us to re-design this but it would mean that 
we are
abandoning the current users stuck with this firmware version and that's the
only reason for trying to land this in a form that is maintainable. 
Either way
please do take the call to decisively NAK the series (even if it's coming 9
revisions late and at the cost of 2 years). That way we can give up on this
and go about upstreaming using the standard development process.

That said please do consider expanding your reviewer/maintainer count
in a way that gives you the capability to review series from all SoC 
vendors.

>
> IMO these vendor protocol interfaces must be debated on the mailing list prior
> to finalization, similar to the 'code-first' prototyping model used for new
> ACPI specifications or SCMI early prototyping. If an interface is developed
> in isolation and then submitted with an expectation of immediate acceptance
> without modification, we cannot approve it. I recommend we pivot to an open
> review of the interface design itself.
>
>>> This multiplexer 'N' random algorithn into one single custom SCMI protocol ID
>>> (0x80) seems to go against the general SCMI design principle and this seems
>> Only the strings documented are allowed by the vendor protocol while the
>> rest are filtered out, so we clearly don't have to worry about this. Also
>> grouping a class of devfreq algorithms into a single vendor protocol should
>> be treated as a SoC vendor design choice.
>>
> This is precisely why I previously suggested defining MEMLAT as its own
> distinct protocol. Doing so maintains architectural consistency and adheres to
> core SCMI principles.
>
>>> like a deliberated attempt to circumvent the standard SCMI protocol template.
>>> Standard SCMI expects distinct features to occupy their own vendor protocol
>>> IDs and utilize standard protocol discovery.
>>>
> ^^^ as mentioned above
>
