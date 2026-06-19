Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21D3233ED
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jun 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872300; cv=none; b=SbyWL9AaFikeuIjmBBsaPvZiDgvV2SMqVHS/Vvx0CWonznPsPsPbrsoVVzhcNsqlgSoXmLX5rCgSlgpV9/usUk/VuFasBnpMUeW2sOKuyP12uAJ20KooyeKoJ6JETdcZSWIwls2B3N6voMxGILpitjOs+fUtF7yZX5bAHI6D+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872300; c=relaxed/simple;
	bh=L6z4k3QijNHTGXXT1fty9BWxZPIxToZssOMwBPutHeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6eqY7tsWdfrH9wvmMyBvUTuXD6CuUu0UM+8bHNrmwjK4Q2YZkTdJcDq/1CSK1wZ6NE/KUXdgssqn+v+Ka17o/lpJ9ZF9gADs47EahQq0nrrS+DlgZKb9QfpAZBl8g2IVyh9gPFgrVVUUTJs/+RrCuRbD7fJ32fLJAKVWU36DTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz/g6FMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZlcALdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz/g6FMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZlcALdk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Otg93659811
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jun 2026 12:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=; b=Pz/g6FMaYoQlQk8+
	3WjzmjdxjC4j44ms7bfVLBwq0rZdzNZoXBxTKXWdnGgXegvrabKGeUMCL5gh82IS
	mOBo6SMiETuCVsq2tWK0CgwFkTRXj9REs7SkW13ibhHozaFEPLUHLQ9W4iUComHM
	rwHUK+D7z5BBZvE2Ew4dk5h9E+6DbDEuU5eOCCWHVPIoTbUqFs78i8Qhd7ImUuFz
	wEvJfUfSXjzJpKntcC//Z4nOzaYZW7T9t7lhTNQWluFTd03VGI2ppEPfzxCc32b3
	BuSJuDbDUrDn4W5QbGWZPLorztFFBKLUydOf4M/NLcx7+OV4UGwIfA18xikEcBVa
	3TSNhg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72h60q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jun 2026 12:31:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2561982a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872298; x=1782477098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=WZlcALdk0uMX4UtSKid6qww1GssGiwBONzf6Z23sxsNwn4Bx3C4BP8HNiU9XKaij6T
         IrKynLmRbAGXz0UdPEyPvqY2YQN2HWeKXBDt1SNjI4yv6Y0Ef25fBNTzD6i/A5+68hXA
         GZcxggzzDogJqrrdESFNpqpxXVwtxnJHVrNwRdFfl4XMNUTLwef0IDSTXjVHk5FhWYVm
         3mUnhd9G6k2rCX03BgDeUa6bOntg1WBrvPa4LHuNwq4TeOTxXQLq3bhEgmr3pFl4lrzH
         MvK0d1VrA4J+FKdqWCIAvPaGsybArJ71C7VU0x7icDJ8YQlW5gSTkFsa7CB4p6w8+tE9
         9OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872298; x=1782477098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=Z87i1Ce7rBf64RWckSMJdEi8RVMSdWjndEWsAqBvq1Kq04YNcBCmch+7sp8iGZ05Z1
         SpqGAFvi0rLQSUcfC/oOFP5+P+vbLjsQpLSJiNMmkRyVYh9XHVTWKrdSrYJHRjiZM/W5
         FgbXDsqu75GXgCK2+liHu5sKOHfzQM1VHLtgPfLIBY5wJufhIJQImejwupKWenbPrBc/
         FFzuKNe/iWoDzg/UpWpfgZzJ/2mghfoxlxcvaTK0ZqaXKN9j+xq5DUJrdM901hx+8C7z
         iXZ7yIbIgrkonvy736u1/pxnJK6iglaGPLB8VIeuSLWJJLMfeQmdDtukJCqgfDCHflWH
         EmcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uUor9U9PBj9ZDlc7GQ2T1kreNyIWwjIQ4cVyGhU/DmRE0S6fWPO+bl+xs+ikW5KfO3bKSq8VcZ/lUgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0+CJlVdqTRtlhKXf03sPN7ERCHl10RpnwLuBLgEtNYO3klew
	14n36uQjcZcLREvIKNwM2j3sBfR3Q+hnmt9RpCJu52WG82tbh6fBOM7UusCVKy+k25Lj5qz3UUO
	29KqDIFIEBvChQ+9w2kHgUiE1vzmXQvd921dpW1ylRvNtpweCIYlH170IKoEfWcpS9A==
X-Gm-Gg: AfdE7clUXocloqC+mrmr2fgNWEXCXH14BaGrFrOUkwuMQC9QaUnV2STujbj4TBfSNQp
	9ADkzd5D9z1158MDbSJC+mO7UtmQCXaHGgU4OAvF1SEbPclak3I1SG9Swatq1XjBxngVVEUkNRg
	nj1Um/T/NRQshHM+c9qwChW8FrwG6uJh7aag1tMW1Q79+obdbXZb5d9zO62rtb548OXJ0mZNivY
	IwrNgW1dMJdReTDl1eBwaUldLE86F5/jROTqvCJNHT3s4fvoz4nbc9luE9uNETfrPAgNVKDArOc
	IEbHS9WjJU1kgZlY8MKweB/neCvbka325HdJgYQ6vWvlGC9awlddRMkxe3Ep8cuyYkb+tdyv1aI
	foiz80hiaS0ryCX6t2jlaLDjMu9i8t9ITn1eP6qbLX/i6cNPcak8mFivHcSsP5CZYwuBaMmo1VP
	RzWPnyN79WR8hm0d1KBk3qDPri/dXPtsdTRg==
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456635a91.23.1781872298060;
        Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456595a91.23.1781872297615;
        Fri, 19 Jun 2026 05:31:37 -0700 (PDT)
Received: from [10.50.22.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a8525f818sm2378163a12.9.2026.06.19.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:31:36 -0700 (PDT)
Message-ID: <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 18:01:23 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
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
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfX1nqlaI2qGyRu
 JqausKqWdWtw1P1L5W56X7R7bk8/YxJM0qE0+MI4rv2Yt6sOm5zKZm11unN8RdSreSoR2NBLlCH
 dXkKMYbpZvUD+6A4GIBV5hrELLuKvpICN3+znSkuKnVk5+U0GcFIlqmu/0G50g7l25gm67rQKNB
 wt+OFwbKqHPwwUOxKfY7YgsrDJbnN10faVtTQQj56s9N7VFCGPAomFlEnFYTRxznRXzw/mltYPp
 vyVOJSdUez5ZnEfbV29kV5cox8B/Jj5hpOryqU3YRkp1gBoBMFwF8nYiLxsF2IvYW2IHDER9WHX
 giFgGPn1tc6dCmboRsG8brRs8uNhdPYVz4owFR2lltZENCS1rzURgW8te586HIi+CF2UqQOtBcO
 16SxCq5o4GQNuo3LK/uN9ysO9zhGA++dGimwWFIckRGLtmK/iEDhIWCLNTDh/4LmHvxownE1rrW
 jz9+UhL304sJkhYLRWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfX7pedWRRr7c92
 bHHCb/JRlbz0JmwTWxoY186sShVEFn24M2CimJceDwZIf1UMm57/USwKqx4BzUNSdRPS3/JWUb2
 YsqIp/3vy2QbordZDDLq/JbosI3VyIA=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a3536aa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=_HCkHYxhaP3GdHjqj7kA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZRv6FDf2rf4IMXi6NwTpY6n5KWOi-V_0
X-Proofpoint-GUID: ZRv6FDf2rf4IMXi6NwTpY6n5KWOi-V_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190117



On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> On Wed, Jun 10, 2026 at 02:21:27PM +0530, Pragnesh Papaniya wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
>> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
>> mechanism to control the various caches and RAM is hosted on the CPU Control
>> Processor (CPUCP) and the method to tweak and start the governor is exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq SCMI client driver that uses the MEMLAT
>> algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
>> memory latency workloads and control frequency/level of the various memory
>> buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
>> using the remote devfreq governor. This provides basic insight into device
>> operation via trans_stat and lets userspace further tweak the parameters of
>> the remote governor.
>>
>> trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:
>>
>>      From  :   To
>>    315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
>>    315000000:         0         3         6         6         6         7         0        30    143956
>>    479000000:         2         0         7         1         1         1         0         3       356
>>    545000000:         7         6         0         5         5         0         0        10      1200
>>    725000000:         3         0         5         0         6         1         0         6      2172
>>    840000000:         8         2         3         2         0         4         0        12      1188
>>    959000000:         3         0         1         2         2         0         0        13       272
>>   1090000000:         0         0         0         0         0         0         0         0         0
>>   1211000000:        35         4        11         5        11         8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> A lot of the vendor protocol numbers used internally were for
>> debug/internal development purposes that were either highly SoC-specific
>> or had to be disabled because some features were fused out during
>> production. This led to a large number of vendor protocol numbers being
>> quickly consumed and never released. Using a single generic vendor
>> protocol with functionality abstracted behind algorithm strings gives us
>> the flexibility of letting such functionality exist during initial
>> development/debugging while still being able to expose mature features
>> (like MEMLAT) once they have stabilised. The param_ids are expected to
>> act as ABI for algorithm strings like MEMLAT.
>>
> 
> Not sure if it was discussed in the previous versions or not, it would be
> good if you can capture why some of bus scaling doesn't work with the existing
> SCMI performance protocol and the monitors don't fit the MPAM mode.
> 
> Please capture them in 1/9 as a motivation for this vendor protocol. It will
> then help to understand it better as I am still struggling to. Sorry for that.

Thanks for the input!

SCMI perf protocol exports perf domains to kernel where kernel can set
the frequency but here the scaling governor runs on the SCP while kernel
just observes frequency changes made by remote governor. While MPAM is
not enabled/supported on all hardware (Hamoa). Here's the pseudo-code
for remote governor on CPUCP to help you understand more:

Barebone Memlat Pseudocode:
Every sample window, get snapshot of latest AMU counters from each CPU and scale all the memory according to the map_table:

For each CPU
    // Calculate IPM ( Instruction retired / cache miss count (L2 cache refills for LLCC voting and CPU RD miss counter for DDR))
    If (IPM < IPM_CEIL)
        Use CPU cycle counter to determine CPU frequency in the past N milliseconds

LLCC_freq = lookup_llcc_freq(cpu_freq_max)
DDR_freq = lookup_ddr_freq(cpu_freq_max)	
DDR_QOS_freq = lookup_ddr_qos_freq(cpu_freq_max)

// Scale all memories
Scale_freq(Memory); // LLCC/DDR/DDR_QOS

> 
