Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410617;
	b=ikYLQdyX0qTJrSZIOeIGKiRYJWyzwN4njEezuM6qz1jX+sJWOAFq+GFYF8ChAQ70XzzN
	 VSLxF52kuHgYhWf4uol1uG6XNAmggo+s7x1HoBO8N+XCiOuhUcfdPSvChSVje6CIiDixq
	 CgmHQ3Osehz4cByKTQ9/iGDlOuCxQo6eFYUdjoPcrqB+wPJAnyPilZP+6DwwyvY06/z8H
	 hfXBHRIfwQ54LIPegk4A7DwK++L0qDdEBA4OIHWxh4ZEPoEVSt2cn31jVhCHxd5DM8FS9
	 9rjtGQamD20aGK5VrmmTzBuqvyqS5pccBVDPL6kMzdsfWUsUCO4JF3BSFUUBL4jBysA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
	b=gqnNdslPZlbfCywvP2qzh6Ny1uXP6KyjqZaHxfCWKE9Hl91WXVcT/asiPnNKf2/azCSl
	 wPvib/2381nYI7lktSYQGBz4KoPZfL4A8Cw92C+ZfcCrkjbOcZ8pnS5LFX7mucH5uDZlC
	 Zyw82nwWIB2rQvSohC0EaEpAIwzxD3E+FrLoMRp+E8FKZSwvh70rI4hPcHuWkDshwp3Ar
	 M8ojvkdqVSG/jeTMLrZhYY7315XNlrafrFDsqAk9SH7jbw3a0yvwTEMQcEuD7i8gU9ymq
	 q9tbm6N71DhtNWY+u09JT/gh0Bq1ZcFcDromGGJ9Xe5SGt8SrPVk+qgJ6Uvsg9Crqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i1VWQW/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GQD/TldO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48820606A31A
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 05:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48820606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1VWQW/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQD/TldO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN5105I1264287
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 05:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=; b=i1VWQW/QBB1gv1A8
	RKIwklZmxhkyOWOs8cD3B9huo+JZl9t4+nHGhd4M5waCSTsomMijeTRaTIxQgwL2
	PHSMb+DJ+ZkUWmUMAEfIk6bqA8r7suirhjMCGQoCJfjwt0yCi5dIwF2PLrn4QiWX
	PNM0Ln+DKiXOdxRcTlkj0b2HXBunuTGDEL2+r3PY2q+U9Gu4sQ8DGz7IxDhEj/X9
	3XDWjA/C0mKXyF0nVeplx/Gis8kEBDbTXgEBn2JwWgZjPZkUexJH9RBWeqhNfPiw
	qGbnQn+LQyrgCGIOWqdw7a74ffYpNMwW/Yuq3LQurRjIXmHvG7VjFhFWuzo3PtfD
	3rOz3Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h357ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 05:10:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1791414a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410616; x=1796015416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=GQD/TldO7irpuOVoV+abuYYVJNO+zzMhyKjO3MkcAVnMexlGFNwQ9IMSWjeJAoiOJS
         S6tSOarR/xP5K8C9vx3bAI1r3UMYa6TNYDR93BKHTD+G1ZUV+c/xZmLCDX5A4DWX8VUp
         yipI0A1TL+O7pDFys96UCfqJPAntYbOleRiD3wJ7lOC0D33QQ4tFXEniRYXn4cAbZytl
         aFwv1PT+LX65Ckjs12NUjRP54GVlhQrqcI7uKzMA4c+2svuyhmYBKjMTZ2y4SgLrg3Sz
         D6gFPvag51NF8CgMGyhRyo0uCQIWKE1S499FIVz8t/kuEgeDSQOSLv73jrEO4/b3bRsF
         PDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410616; x=1796015416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=vSNDjmb9/35FOPCU2boXO305hLe9xHKrb+XLHuZua7JcdtSvS5StzygxvQ4k+FRTpy
         EYQujxXiIco5wJB8ae7JGk3/oifdDhcWuE8ICpW/YAjwwU+HAq791DHYMTuZ05Ew0c7c
         snWDz01C4fxFMmHiBgsOPJZwURDKQMGoNR5Qd0pceHmAmBmBz5JmK8eGmmcTe8B3j1L2
         RmhKBx7vw3QLboYt+Z6OoS0LJCIwsH2rugsnAR/Z4+yP73ONzdmnmXIePJ8KDbayPMBM
         b5O46Eu6nTvpYThrpCGw2cveD9wxcrb12zzw69pHocdBPNRtCaxsplSCCTOWZN7KK+C8
         OB8g==
X-Forwarded-Encrypted: i=1; AL+hErExfHWEeAlEy+0OTL5wnH4B1TMsUj/21h54Aeb+nEcanh92QMZ6il7asvxJPZReIjwDHFFHMoBf+WkgBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2fcZunZrqZo5PodiANfb6n3/h/xceWyBYko+ROTczkRNt3ssZ
	hb5ARorBCcfOFTE5By8EHegnOWGkvesGxIfcN97W/YxBBeB3WHcLbh7k4aZsnCEo8AcpwMJV1pi
	dufST/fB6UGzXu8IWa026mZhZON94mgxGVtnoJj97OZ10h1RSZcRiQ/r/OGByj78YwA==
X-Gm-Gg: AZFdTZfZEErNx9gFYGK1ydlolZ46N0LGQoSaEJBagZXsf80OmZPb7/c4HAGwqVwUZ5u
	e5FBvJb6ePzbm4zCwcdhP0MRkW45XH+LlmSi2tWyxeRqRHbyufwFIP/McLFuj8JrB5zChT7VpnN
	HBX+XIK55BMaJaR1hpeZdL+yeuDU5DR6chIjeePQHrOqcX/0JMiqMl0AbNiavdO3Zn0FrkETGW0
	zwEZ3GXU/OdZviM2BKOll2e704x5SAMDArMB+LTDqG3VJi6optuk5zB6eMGgpzcz+YceQnwvrb3
	rDyN7yrQR5rV03XcUvBa2PkjGnau/T2FnAfON3re0+h04oLeP+RUju4M2YLf2eu7SckFAMogGE0
	YmPECp3aYdx+ulLGtSHc67kLEA2sLp9153N8GqWAFSqV8bGgcAEqKXLdonQmF7zLX8KhQmImK9O
	w2Xq0ZEJ06eRNSgUWMXzI7nHq/WlTYERtte6VAtmGVmr/O
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192653637.29.1795410615662;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192629637.29.1795410615177;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm4841567b3a.29.2026.11.22.21.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:10:14 -0800 (PST)
Message-ID: <07a533cc-80e4-44c5-89c9-8b94b0a255b2@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:10:09 +0800
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <2698e091-17e9-4a1d-acf1-19981ee604da@oss.qualcomm.com>
 <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b03cab8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K9XYs0MPe4wYk6c9fc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 2wSi3xzQPmN-iGDcXHR7AdmumK-bGRYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX4fYNBGifBwmi
 ndx10rVtxjpr+wLZdbnDl+1KCrYohs5kd27NInk6pGZbBHQroLU5ILReQXY6DRWabkBAO2H3xQR
 jzN4VKiY3a/x+M1GFtyr9IURZD+x2O3Vty4TgUdjONjEJ9OmPmCVhoSU3hRUAQ7t9O/Vwk1ehEg
 eDvafHThYWXNnU2+fOeWr4J+6dBQrRpLNvzfUo28cy9bDQa9x/Fgj6FPYJ72g5BVYVEMxjlaNXA
 jfEBnOFDDCjppUQ3X2EcBgHYA7i8Qsjm0LTIi0jcaTWd/Ie23OATNNjVGLHFSPf/k0jU7Bu7Arh
 B23vBmSoDMqkTRtYBqLdyhInf0SYn/Pfy4O9RVGiAZREVcgbditEsWCRxIsA96b4fLQ8HmwCy+S
 Ul7pUxUot3OJlWuvT7xueNTN6rNxSFGYaWX+WTMq+FuXLfQx/QmAEZLcLE6opgOxFDIW1XNCS5d
 sy6ZYM+a6tNCO+yyuyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfXxZxW4P8zC1/9
 7P5Yhgvd229xzzS6pPrUrFWTiZD5Z0BUjOKeGACEAamXPyKbcCL+MZ9Legio6TE3O3vfjQHrBv0
 dx4xhmCPnbQBcamdhmD+F/LnhCFyvZQ=
X-Proofpoint-GUID: 2wSi3xzQPmN-iGDcXHR7AdmumK-bGRYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230020

On 11/23/2026 12:53 AM, Krzysztof Kozlowski wrote:
> On Thu, Nov 19, 2026 at 07:41:34PM +0800, Zhongqiu Han wrote:
>> On 11/19/2026 7:12 PM, Sumit Gupta wrote:
>>> This series adds cpufreq support for Tegra264, which joins the SoCs
>>> already supported by the tegra194-cpufreq driver.
>>>
>>> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
>>> The driver derives the current frequency from the core clock and
>>> reference counters.
>>>
>>> The main differences are:
>>>    - Frequency read: through system registers, as on Tegra194, but from
>>>      the 64-bit architected AMU counters. The reference counter ticks at
>>>      the system counter rate (CNTFRQ).
>>>
>>>    - Frequency request: through MMIO, as on Tegra234. The driver writes
>>>      NDIV to a core_freq_req register in the CCPLEX register space. Each
>>>      register controls a clock shared by two single-CPU clusters, so both
>>>      CPUs form one cpufreq policy.
>>>
>>> The patches fall into four groups:
>>>    - Fix (patch 1): read each CPU's MPIDR from a CPU hotplug callback
>>>      instead of at probe. A CPU that is offline at probe then also gets
>>>      valid cluster and core IDs.
>>>
>>>    - Preparation (patches 2 to 5): cleanups, mostly of the counter code,
>>>      to make room for a 64-bit counter and for an MMIO mapping without
>>>      ACTMON counters.
>>>
>>>    - Improvement (patches 6 and 7): group CPUs by the generic
>>>      "performance-domains" property, which cluster-based grouping cannot
>>>      express on Tegra264. Device trees without it keep the existing
>>>      grouping.
>>>
>>>    - Tegra264 support (patches 8 and 9): the driver support, followed by
>>>      the device tree changes it relies on.
>>>
>>> v2[2] -> v3:
>>>    - Patch 8: read the AMU counters with interrupts disabled (Zhongqiu).
>>>    - Add Reviewed-by from Zhongqiu to patches 1-7 and 9.
>>
>> For patch 8/9:
>>
>> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> Why you cannot respond to specific patch? Tags applied to cover letter
> work completely different!

Hi Krzysztof,

Thanks for pointing this out. I’ll reply to the individual patches with
the Reviewed-by tags in future reviews.


> 
> Best regards,
> Krzysztof
> 


-- 
Thx and BRs,
Zhongqiu Han
