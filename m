Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739736F414
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026691; cv=none; b=uIuMDgpRTwmpdeur/qrQZhcGQKfOouQn1XmD7PuNfSe+honfM1VmpheSkrcCYGNJAi26oVxRWG+mHSDYJbW+o0llFCN+urKphpLY2A8jkWT8aV85ZMR+oIrtt2+n6epwXKLaAhUYRuwXcakqXqBliOVI62CmFyI7eh+Yf/4NEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026691; c=relaxed/simple;
	bh=YMZ3usUZw9E0KGvmv+ttUT13W4jFnP9tOa+jYYoLrz4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k3H9JpXOcdBawg+SdULvcn3tMK0gGYiNb5fiAG8lLX9sE1tG3JUaEGE03CmOta2aZNRh/Gs+hSWDks3WGH5ETCEZWOiBMXtv7/SLur+aq0m+KH8R8QUxfaqUoC9vE9gR472smD1ZIruo9ig38ur9QH/l3sWTweixDgUIuvknOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6JWbiHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ00qwCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6JWbiHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ00qwCE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O96W9b1533422
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=; b=R6JWbiHr1Hws4KFD
	P9EShqlovtNlSf0AByxhdLPJUa4yZ+U1z93tuKKYXReXUOh1Ohhj0F+mt6flshwR
	/tF0rSAvddvM7tnnRNYDFv3A9iHf1kV53PboqvNmAtcE591LZnrza8MHeK7UtcNz
	7ZOsi/JRnOGYSR7FEDqRo30aq6g1dO6aqVzP4lJDQtaHtAmCoHR2NBnkWM9ZsnaH
	jp4+B05Y44J3DavygqvO8iGPet00xALCA+r31AZfZC8hIbuVWCLFIeWfApqtVG2/
	v9sxRb5TtsM4rnbuuWDe01yfk7PpNWDZWXSqhooweWZSAg3Fseq3PT6bCsIOiDrn
	5FvXyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26km5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5115120b3a.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026688; x=1777631488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=JJ00qwCE1Pbb7cZYucbR0EvFn47A0+Om/AwZBQTxo8oRdiq2wRUVkVmcJibUz0SouX
         0d4A9dxs498eMKFI//0KiCDXwRDy2PoS8fNu14hHsph2cRl2eOPn0Y1xYUiJgY1T3bZt
         auclNzQvhIXjEVFNtFe0ao2Mkn68a7Tfxj5yK94gqoBN015f5lvIn/AgmNo+MkboKVgd
         zMlBoTDzSi7W9Mn4GbTp4la2Xjrp+uUU+kOs7bPfYz00kWJtTIfrW68pEn5m9ZH8vVZw
         fG8qD2fXQQ8wSbh4APQGd6sjqiXSEAPUHbRZmlt4YmVF1xa35OfpgkyZ9G8l/UKgzSPS
         25pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026688; x=1777631488;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=kuTtdskLYii9s7PWv+t+WGqVcZPg9wtSM6QubJ+c758zfUiqlWXfhCKLwKcxIJl6pG
         fdGNRs3F2Cl0Ie1F4wmlOgA5lyNzq1WHD61VWJyQdTUm3dCasRd9vR6rD1Dq8+GBDecm
         ONILCeM4zKzhBW1UkU7aWaLTHHckZAUlSWHYTwoJn/IDYcPFeFNuDIuUfyzYJQQuHwGn
         iQ3S/xn0kFWPFKZkOJaPDPV6pTfGdM6DCFnfur2lz1pl7javpsiaId6/JGrMW7Fs8DMA
         olStmKhUKXQ8DRssfTZ3MqF+J6wNAbqsvqdPRdPAVT6cpn1MmBA1HnvKq+mrC5AXEO8P
         Mnmg==
X-Forwarded-Encrypted: i=1; AFNElJ96MYJZItB6l3pkfzoQvFG+cfZsF8rUZOpQOfrBklC0Tah/ODn85/DWFiqlBXlehHdKHPKoyq9ULbIKlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7u0vU1PoF+FwX+M4fjqHYKEepUAZ9T8t/sMyqA2KhXCf31Qfv
	Ay0F7Lv1D560ZxQl4S/F92XRLM9jSvHAfK8nztkqztdTuLlPCAJq2MxNTQkSCFt7ZH+8VXAVdWn
	FZYEVtFxfkaEu49TwcbVv7gqKnAaA9ILguiLvjEohTz44Wni6Xv6w2kV/PPucVSZ4vg==
X-Gm-Gg: AeBDietbPYwW07RWykw1dx6j+n6/RFIOEiX3AUbnWwzsXcxOnvpmF6hUXP+FBDnjluj
	ffJ0T2U1yba9CIEGrXJ/K3U3z0KsAaalkREzszeZ9mpXvAd9ad4ttMw3h/ZaSNiPJX/pKUJicMA
	3JQ0FYDlHE4vAYG4fl2z+1D+8SIK8iV5Z9QwaeLoku/ZJNiXQUziTQVzIDeceqkEKYoA7PNvaXf
	omVop/gOzejY4kAVfCsbv/tH11fTapAsZWHxzXHz0qe+IhCsDTl9VKgzoyGmlwOSUerV/Jgmuwu
	YXXpMVGVJZUGubiP3S8aFzUqA59SEYZbIj7xQCauZ5eEO+rcVBFvJA5YGSVtPgXaRxF+fXHioCw
	6DPuXoBRcdjM+TgW6X4hm9TboIRG73FLbujaFcjra8urspLPkJs59TAwfxxiiLOqa
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808618b3a.23.1777026687558;
        Fri, 24 Apr 2026 03:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808559b3a.23.1777026686919;
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm25153536b3a.14.2026.04.24.03.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Message-ID: <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
Content-Language: en-US
In-Reply-To: <2026042346-trustable-register-095a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: msMCCKjXBRXB2kpQ_qgoLoNS8iZeB3F9
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb4680 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=5Qc4mBPHLNQQZN8o19QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: msMCCKjXBRXB2kpQ_qgoLoNS8iZeB3F9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX851F1MnTcGNx
 FbHuHfpCgezAvYLrjdgwNhdTRhHD5goen9IKzyu7zuODVAKUb/FE1hWDGSooVjQvkuYZTWKuFf9
 qE2e7g2J/HBx7ndbPMTh5w9obL5AH6wjw9DeDTinLOgVXkRx1A2pawOvDda2RkBL5C97veQjJCl
 qZ3q95A/1VAczu+4nwSnVIkcXGXV5NB4EE428SilP7Q7UsbJeVM7vuBpZ1qr4fFftgEY7UhNRgp
 uIszDmdk4pivZsrOrWP46rDIuP7HsO93sVddKfpItcx8rSF7COj6owmlsx9nHV1qV+rFOpaKVm2
 CErcg1iBK3RZO0Wa5cwQ3EJfHb/5UZBWK4EwhRKdOU3j1x/F7H8XmPHppTuKXThVTRE/HXmSIXZ
 zhHDZ80u68SoXjG4tWV3VdipQUghM/iE4+1Ki9HCeKbNxGGoWFEYFhYYYyQutRk37yaO7IhTXZu
 AqRc15iEClsqiv4Sb/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099


On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> When a driver needs to create virtual device at runtime and map it to
>> an IOMMU context for memory isolation, there is no common bus available
>> for this purpose. Each driver ends up implementing its own bus type,
>> leading to duplicated logic across multiple drivers.
>>
>> host1x driver implemented its own bus type to attach an IOMMU context to
>> a dynamically created device. The Iris VPU driver now has the same
>> requirement. Rather than duplicating the same bus logic again, a shared
>> bus type is introduced under drivers/base that multiple drivers can use
>> directly.
>>
>> The bus takes care of creating a device and attaching the IOMMU context
>> to it based on the client inputs.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/base/Kconfig            |  3 ++
>>  drivers/base/Makefile           |  1 +
>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>  4 files changed, 107 insertions(+)
> as you can not have a device on multiple busses at the same time, this
> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> please add it to the bus that you are wanting it for.  It can't be a
> generic bus as that just doesn't work.
>
> Or what am I missing here?
>
> And why is DMA somehow "special" here from any other hardware attribute?

Let me give brief information which was discussed, in the initial series,
the iris VPU used platform bus for dynamically created devices and we got
the comment/suggestion from Robin to implement a proper bus_type with a
.dma_configure callback.

https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/

based on the discussion, implemented the dma_context_bus and used for iris
VPU devices instead of platform bus.

Here, the device have only one bus (dma_context_bus), not multiple buses.

Regarding the "DMA" naming, the core operation of this bus is its
.dma_configure callback, which calls of_dma_configure_id() to map the device
to a corresponding IOMMU stream ID. The name "dma_context" reflects this
purpose.

I am open to suggestions from you or Robin or anyone else, if there is a
better or preferred way to achieve this, I am happy to consider it and
rework the implementation accordingly.

Thanks,
Vishnu Reddy.

> thanks,
>
> greg k-h
