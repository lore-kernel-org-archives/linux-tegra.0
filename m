Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534D3E9F61
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616715; cv=none; b=QeZ8W8mWhkNPY3s0GsCgZkdI9iZpkFTwFTGjlkAQgABrzUbobq5XtroeG5hiM5NxBsJNSeb538gweIBsTMU4rJxY3BGZykKKIvwDnG9E1r60Alm/byyIPh9YmRz5SBMb5MrX19SmgzToxg42neVMqdboZ7EyxA5z0XRxZnJs8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616715; c=relaxed/simple;
	bh=HM0UqkLUu9WqALVJU2c5Cv63fC0p8hZ2Hqz8KblmXZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLTXownAdYaU8PTgChZ43oZZ2MeJa2dJ8vsNv/6U9UjwssvHYYlLlQYe1msSLQ2korsa6R0bH6ruOICClHqc8HJu94AIWtFFU8iD8qHF7VNvPddMblPlo8spMcwPLiSPAhTXinqNU+UeEWzXiMdpTjXsTsuUgrPim69GZfd2NVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHwkPbNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYGM/Mix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHwkPbNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYGM/Mix"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCt7Xm3132239
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 13:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=; b=EHwkPbNh+KpdhkQN
	6mV8U5x55Js2M/cmZRe8Xd2+9xxqoL/jYEGUXzxvjTeNTkfmNI0fflrMkLOm/w+3
	RKzQYUuDzpS9WFBEmI8YgUKweNg6YNF/p1pPf3NVZ3tY0m72VYU2gtBRK0F7MpMB
	r6kiQcf/ZyADM+gstE1zzzy666QnKogqosi3qa73n0Z4Wo+Pmk/iqL7g/8FOpVWP
	8eGAw0yJrxXSiFuHTYNnLdi8rDCaleQ21U+BjhVanmH242/9P/FFYd53kAnrFoNq
	xlxbmTIrrePhfWTDac2ZLAswZmzlRzR6ptmRAKfaYnaxR3CcROgGvoWzi4RwgHNp
	X9lozw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s43j7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 13:05:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60274569cf9so148946137.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616711; x=1775221511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=;
        b=CYGM/MixyF/Ac0qYhpZK+VjxQfYsM7Hh75vMq8yqnVVVmbXqYkUAZTWIWzU/FFO56M
         /vb1d2Azx66KmY86B98bCqsvTrvqGFT0w4mFQsDaBT6q1btlVO3a61qwJIYaH4o6gMrf
         SSBUP6BVRSSgqau0vk97SQ8XbxnFY/epNZCpBiCNFqeiPLSGaH0JHVvJYkK1b20JTZYF
         MeaTA1pkfI8khXQ2MIH1RJjVmr0r/VOkDQfhaUY2ah0J2RYGgpZ53LhN7FTrmDa+J89l
         M4/UrH9DX2MdEM8Jta32vM/iGgTRvEVoROrb1ohE/NYt4OTUmM54YNa0zANnEw+6HnKS
         /SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616711; x=1775221511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=;
        b=dX2JTTjOBEjT+AIxK6gJT+7Fc+5uZZJqm6vsLFrcCiEnnxQBeUdI2uiAWCE7RHB4wB
         /apKCz1/zTEgItr5Q/LCeTcqFM/4wVSC0vBvMuZwXTVJwOs+zaKwB0VlPQ/y4uv3lUHd
         vQ9+vrRA02nr2s7urs/01v127Th2D0LMhkHY8QWtOS09Qq+s904JN/lN4GUJMe4GdYnr
         ZX7rZV0Mna8zyVI0FoCUp6dMENr3AIV8xk1OQhYIWCG5AQVVA477QqyR4hm3ENKffLjW
         LySCsFbczibODqgpmknFKOu03/ufhYBpmsBFfw/4GQaAF4xlbYmI8QriGRC3MC5OJ3YS
         88Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBycnjdea1Q7b20V000c53u+aJg68JmGfTYCL7+JxkUVXXmivY3L/WKqOHdPuN0gCB1uiEJjo3Ufc7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcxMOdjuWGUvhUh+7BSGpdWW45IL8zby0en3BqZSpYXyOCNlH
	wxQnZ/apTusKWgJzy0yv5JAyb4Q78OrSFKtOGN3RlAgeUA1oadNFnLdjWamEZgtXzburFU39cOq
	rxQ3Y73NyWdFmFL+2TaV5DnpEHgzdHoSyweshJTGHg6r/KXvVosH/m0za2PFywmfeig==
X-Gm-Gg: ATEYQzzRTOskYLxM1mftR0dlEwqT0qZ/78TmHXX6QBQqYEdvTS1lyQnAhM7A9dWB3JC
	XzfafZVo5AEMM5QInpUuEC3L6HmhM70PQGNt5cWtmQaVleDCw1kkusQrQigUunx9vA2UdZplCs4
	VaCuHUhdOJoPggXvQmb+ZUE6zM3sfh3pOcfWactWyAvrqgyGm5MlqO0z30qltZUSIE7Du84TBDh
	yR56XFAkYmGcLp/BDLY2hC2+5yj/0SqaPcrGjX66t6EZ3Qf6MI0yQR5Q+WnjszcoDSIJwIlH8HF
	ObZmNz9A2QzHKi7kISPBeEWSrHevQdIwMBYcyIvzjHxW/J43bt5E7XNZrSh3cm4I98UNSAJc3nM
	puVn3jNesjGv4TwgSUsrYsPZ40bVP2uo9MhJ8peQjJC2M65JJV05NMD6nHYbFh9x3gzzyo4ZVYl
	lXp68=
X-Received: by 2002:a05:6102:2423:b0:5f5:46f8:465f with SMTP id ada2fe7eead31-604f92c14e1mr304043137.5.1774616711457;
        Fri, 27 Mar 2026 06:05:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2423:b0:5f5:46f8:465f with SMTP id ada2fe7eead31-604f92c14e1mr303995137.5.1774616710719;
        Fri, 27 Mar 2026 06:05:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef860sm247393866b.48.2026.03.27.06.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:05:09 -0700 (PDT)
Message-ID: <c6318d9b-c706-4d09-b0c9-3bca35278478@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0xJ0Dkjo2iW9RtJy7_eikjb9dSrlu5aU
X-Proofpoint-GUID: 0xJ0Dkjo2iW9RtJy7_eikjb9dSrlu5aU
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c68088 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=4Zt-9WjB5CLmpKvnE1MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OSBTYWx0ZWRfX5cxv+ia9Xi4X
 zJXCMIDC6D+YOOlsJLr9pdOa/cVHeLM+bxkIp4CtuqZFFr5nccYrAAvZE4hHWkM+Wav4SrOvDM4
 HnOi3PqJE+/hnLMPalzMZq8OxYEKjOsqN9XvPu7ybnEzclfgeGlnCLT1wDEArt7aRjMaX2fBox5
 HQD3PJ1VYXqC1uMb4trkVd1nSBcJ7deWdPMImr6o6AXN5JzdZHpJFPQnBhylkleTFquxwNy6ebb
 eGsNeT2wpW3KH9RcxB8Du4B+K7QS/CbPO9grZSJEnaSrm+r5FfTaZUN2my886QhA51P5S8aspCn
 P40tUkzfcFo0Na3F1GQd2TvAhaMgYpmDoMdQWCWySCm8u8Zp7KNftY8c2yi5Z6f7ps35hVkHhMZ
 vxL/GE8H9jMIR90ZfHJ7v75+NwWKZ7VkNcSXgNSyD9FzY7PbOX/i8HputOCaWLfWrgM/I+1ukgj
 uRgzFtwEnmzKt1TWyUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270089

On 3/17/26 11:12 AM, Jon Hunter wrote:
> Hi Bartosz,
> 
> On 16/03/2026 13:52, Bartosz Golaszewski wrote:
>> OF-based GPIO controller drivers may provide a translation function that
>> calculates the real chip offset from whatever devicetree sources
>> provide. We need to take this into account in the shared GPIO management
>> and call of_xlate() if it's provided and adjust the entry->offset we
>> initially set when scanning the tree.
>>
>> To that end: modify the shared GPIO API to take the GPIO chip as
>> argument on setup (to avoid having to rcu_dereference() it from the GPIO
>> device) and protect the access to entry->offset with the existing lock.
>>
>> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---

[...]

> Thanks for sending this. However, I am seeing a different issue now ...
> 
>  ------------[ cut here ]------------
>  WARNING: drivers/gpio/gpiolib-shared.c:499 at gpio_shared_add_proxy_lookup+0x118/0x1d8, CPU#8: swapper/0/1

Not only this, this breaks suspend on the Qualcomm X1E CRD (probably all
/most QC devices by extension)

+CC Abel, Sibi in case this is what you've been chasing

with the patch:
[rootfs ]# echo mem > /sys/power/state 
[  226.043580] PM: suspend entry (deep)
[  226.047470] Filesystems sync: 0.000 seconds
[  226.058513] Freezing user space processes
[  226.066296] Freezing user space processes completed (elapsed 0.003 seconds)
[  226.073489] OOM killer disabled.
[  226.076843] Freezing remaining freezable tasks
[  226.082353] Freezing remaining freezable tasks completed (elapsed 0.000 seconds)
(give it some time, it dies)

without the patch:
[rootfs ]# echo mem > /sys/power/state [   38.047570] PM: suspend entry (deep)

[   38.053506] Filesystems sync: 0.001 seconds
[   38.082615] Freezing user space processes
[   38.092528] Freezing user space processes completed (elapsed 0.005 seconds)
[   38.099860] OOM killer disabled.
[   38.103222] Freezing remaining freezable tasks
[   38.110329] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[   38.469231] dwc3-qcom-legacy a0f8800.usb: port-1 HS-PHY not in L2
[   38.652848] Disabling non-boot CPUs ...
[   38.668957] IRQ205: set affinity failed(-22).
[   38.669018] IRQ206: set affinity failed(-22).
[   38.669029] IRQ207: set affinity failed(-22).
[   38.670351] IRQ274: set affinity failed(-22).
[   38.671257] psci: CPU11 killed (polled 0 ms)
[   38.712308] IRQ205: set affinity failed(-22).
[   38.712323] IRQ206: set affinity failed(-22).
[   38.712333] IRQ207: set affinity failed(-22).
[   38.713634] IRQ274: set affinity failed(-22).
[   38.713821] psci: CPU10 killed (polled 0 ms)
[   38.754187] IRQ205: set affinity failed(-22).
[   38.754202] IRQ206: set affinity failed(-22).
[   38.756479] psci: CPU9 killed (polled 0 ms)
[   38.789962] psci: CPU8 killed (polled 0 ms)
[   38.803178] psci: CPU7 killed (polled 0 ms)
[   38.816286] psci: CPU6 killed (polled 0 ms)
[   38.828479] psci: CPU5 killed (polled 0 ms)
[   38.847479] psci: CPU4 killed (polled 0 ms)
[   38.873528] psci: CPU3 killed (polled 0 ms)
[   38.894399] psci: CPU2 killed (polled 0 ms)
[   38.905818] psci: CPU1 killed (polled 0 ms)
[   38.912658] Enabling non-boot CPUs ...
(resumes just fine)

Konrad
