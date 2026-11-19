Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088501;
	b=CKpWIT34/XTY1SVwuEooHMqO/+aOZyO8INH8zQZth4BTk+pRnbZhHL+cDrPHjoIfY4dR
	 dfdHsCrSBU0OhgWseskfjtL6JsGY7/2a72e2phvtwDf/YuUjDUm4tlTQ5XgctU/k5pkwH
	 HFNiYrj68QEC4fT+aR+1bTVboCHD74nxkmU/jVC2BFVX/XCXB4JNpwWo4I361jS9Pf/tb
	 3V3Cd1QYxwwL6xKlgeT/ukCbnlxZQKHAjYeEJ93is6eI8/sO6hzXzU3WmqlRxHaVBWNHP
	 jYnkAqGlIVr8/8T0x+BiEDRPgQcsqP0m98eQAWtTpQHZRnI+gOc6gmHFEGyfC9hBsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
	b=EsaLRR6AZtQPcq79UDU9/S6TO5nyllz12x0dPXxPJSOee+fdCTI/clPttel1i2QEQ6g/
	 lg3pK+oswUvvp0XP64ZM0jMfCrkspIH7TDOCTnz79LJAYjyckEluuXyFKIyx3SRpQwIhc
	 kbtn6yhBPLKC5z2P4S+i/Ul0GcoVonr+oJo7BcvlMHhkL9O+V6CDgJuzqrbDwrghre2Ob
	 B5j2S2EZlsf9EcYmGc1JcD6b4KwWL2CBLG54B3n3OHJxoTTLrdzKdtj8m5vhr8IhHu1+c
	 3e2neg+aBiTV9g3JBUJ8hInX5msE1kLyIb+4mfwPSqZQqVVq+LR6IgCKbnMR9CrmZXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMzUx5FJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQao0rhy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A3606A320
	for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 11:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMzUx5FJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQao0rhy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuNBH1546454
	for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=; b=EMzUx5FJsZPwXonV
	qMvhlpaPfvRT2YQbRmsY/ZrX/OZnOAKLCxdwu+9eTRFgbtaMb5Ny+XuvsmaXrC3/
	i2zK0VZisTWo492QWv39hKnIsY1IFwXhZT/NdfmMeZMpX9/g3wJVOfKFOXojv+2E
	2k0Htmzi8l6toB0fgSbLP4LKHuKlxVYULIa28Un9yE1DcEHz2RH2VeWXIk0Aptkk
	vnOOhxFAOsdA7LrFY1A4dLlm6oykJayRyOudgONhaHc9r2TwjuE3mMDrOznrECHD
	oyDZ/LCZOdh7graKgFZAdHQNwif0SV411nELOOm05+zdb/SZ8kwk4afwOrkDLtgn
	nY1OZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghg81h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 11:41:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee184a2474so18476675ad.2
        for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088500; x=1795693300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
        b=IQao0rhy7TsQVGfFQahNkFb7lXuGyUaKMaUivVbZkLt6+LIr9bPLlCfGUoOUfHklBs
         pf+ibBqzjJFU06mmRumoMHJc7cXGTXqZCoEuwnofxE+MX2UoxfBSJmpoH1tP1NKwdE9C
         z8m0mkUuwQyx1ePunP2npvYhGbTm0v6sbKSGmTMMR86PjlC4arO9fZ/rtEmzOOne8aWS
         ITvAx6AD5POoXKgK4WOLdTXG5KraVfzDgNRq7AsH+HJB7OWHwZdBALH5D7vPAKNq2nnp
         2XuYkBzUHFsyyYCphz2vVvpzImvLcfG/5y+J2YErt7m26He/1zp17DHLQOI4daqa/xgH
         AWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088500; x=1795693300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
        b=TELIRXq7O9a5jUdbWFVsDC2FwuCMuIVoHaeqhWa+YBMuHB1Opk27Xd3Lv0Ug82ioWf
         b/ZMUambc3otcg6bTRGCD8ik/2ySURCGVd5tPBmuylAsuXe6MFxdYE34oC0mrul1MDOC
         wJHMxu2imBNYgBelpedSe006/otw2tmg9fNF84TOQrAMtgNmWTV+YJlWV9ZVU7XLVrpb
         3aV1Zd+DmG/SYlRjx+xAcKtRV/9V+9pJQg9RbvOk9WaLx1HaMWkL3J5CcSHawCJvGT45
         aqtngeJ7XvMfFhh6+vLjgCa7HiWjYZNqeLi66QEJDg69xB0dFOYcw8PIe+h2Q8he6zde
         k2Gg==
X-Forwarded-Encrypted: i=1; AL+hErHiwpLUyJSlHUGAzgBiZVKzdU1D2P7YzfLExKyJgNpYB2QBtd+poYKXwLXXeHY67GKvNy/y7uRnoPGOtw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FI9dlXna/gKrwNcWQyz1mlaSrkEGRw7IY75lfSV0J9RqBQ0Mz
	bmqflYmiJ7D1JRF1AUp6LczfDecEhBBDkuYr6NMLbSsX3RlpTaruDttQXcwnvxSp+5QcgfD2XuA
	hWmkQ5HOV3U4LIPGa6Bu875YSLlbadMgVDUKktbwUjiFfKvMVKz5O0xC4tW35dd3fMg==
X-Gm-Gg: AZFdTZd6UYUZIrapOz+BwVI7aPt5PjLvIZYt2xlWTGaKx+A/ffqrRb8ErjgBCKnrmez
	f2V+mgE4EubFWmhY8dEe0F49a1xlr5QV2Y+gB+lPEk6DA4bGTacmAako8959DGaV3rTJgmxoVFi
	pJV1nhxR3xNQ0JPT7M/mskmbKzRxkQSB0JwiVpeYwPEWylXgf1LHwhoqeOEr770u4t254zZJ6cZ
	26sIwPkoTqA87qICPPK5Z8sARUia/LQsRIOFQ1XU1xBgvcPId8dlbgC8NEYVLmc4OKCFeIPezxC
	h+y+JNddcDAFpar7IzlDjPwxj8MUhhT0o7C/Xtn7rEfhMHyHj1KzxUrDvrDlgMdjwZpdO8Pje9d
	AkA1dyhadik1H05zMWdBgkhLugZNdD/7zf3WyXnwMJTIX1gjXi+jkHL9ZZx6QOwInI9HHRqHNWN
	UNUaxaQQd3NT3EWFZA63+s7ySobSFURjZumeh5dqflmw==
X-Received: by 2002:a17:903:2b06:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eff753ce5cmr53624345ad.50.1795088499952;
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
X-Received: by 2002:a17:903:2b06:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eff753ce5cmr53624135ad.50.1795088499431;
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f021fdf305sm11054485ad.5.2026.11.19.03.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
Message-ID: <2698e091-17e9-4a1d-acf1-19981ee604da@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:41:34 +0800
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
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119111217.902071-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261119111217.902071-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXzbGcrsO2c/k5
 nFDkKEWVkmvOAV2ts1AlUxqrve1hV0a/2eCJqGUPIAtXbKNycCHqKKn/GEWHX6Nk/SZnvDP0SSF
 jGBnDyHV3urIVQP99q+owu6nYaDJLzL1fQ9nRf4SBu34LJnhGldJ2hk17orPCI6IaUBdX76OLSX
 Z+QVHRNL5zkaf5MfmLKTG82SRaT0cIp6mPMp1ABk7SSDvz8Q9yg46UUVxXEWiXb8LHF2eJPtw+r
 Ld/fztgxLHpTcGjEiA74juBHzoG9TTlY9umS6zbEbmTV0O47f3oyrwWMTXT/QdhyLv3pCUaM9Jb
 Wp/bHGRUlXImKxyIYIHDacsnIkNz1TjUZ7U9BiHf8zZv711su+H93c5WpTvoSMrihN7sLcLEmaJ
 DUQvAnAsPoBJ6YjaeS7GO3+j1tuYq9CNnOFiFErWWMIBPJX5n2KEOacH2U+uiFSYMjbFezPl69n
 3lWqwGOGHfnDVq2OohA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX6wNZu7c1gG/3
 7u7p81Cx2RCMUukDPV/QZA7BUQwAB1PJ6IFil4SwRTZcMJTRI/39mR1tBp6ONYJ02HOgHdiuAlC
 8DEuxVfC63I4NVH3AwMah6T1jrFlTK0=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6afee074 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=I7BNmAFbTgjmseqQuzQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: S7iHHU5VIOxkDnYtpgzeyvLBD3Shok_N
X-Proofpoint-ORIG-GUID: S7iHHU5VIOxkDnYtpgzeyvLBD3Shok_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

On 11/19/2026 7:12 PM, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.
> 
> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
> The driver derives the current frequency from the core clock and
> reference counters.
> 
> The main differences are:
>   - Frequency read: through system registers, as on Tegra194, but from
>     the 64-bit architected AMU counters. The reference counter ticks at
>     the system counter rate (CNTFRQ).
> 
>   - Frequency request: through MMIO, as on Tegra234. The driver writes
>     NDIV to a core_freq_req register in the CCPLEX register space. Each
>     register controls a clock shared by two single-CPU clusters, so both
>     CPUs form one cpufreq policy.
> 
> The patches fall into four groups:
>   - Fix (patch 1): read each CPU's MPIDR from a CPU hotplug callback
>     instead of at probe. A CPU that is offline at probe then also gets
>     valid cluster and core IDs.
> 
>   - Preparation (patches 2 to 5): cleanups, mostly of the counter code,
>     to make room for a 64-bit counter and for an MMIO mapping without
>     ACTMON counters.
> 
>   - Improvement (patches 6 and 7): group CPUs by the generic
>     "performance-domains" property, which cluster-based grouping cannot
>     express on Tegra264. Device trees without it keep the existing
>     grouping.
> 
>   - Tegra264 support (patches 8 and 9): the driver support, followed by
>     the device tree changes it relies on.
> 
> v2[2] -> v3:
>   - Patch 8: read the AMU counters with interrupts disabled (Zhongqiu).
>   - Add Reviewed-by from Zhongqiu to patches 1-7 and 9.

For patch 8/9:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> v1[1] -> v2:
>   - Patch 1: drop the cpu argument of get_cpu_cluster_id() (Zhongqiu).
>              Check for a bad MPIDR in tegra194_get_speed() (Sashiko).
>   - Patch 7: check the BPMP table in tegra194_get_speed() (Sashiko).
>   - Patch 8: fail probe if AMU is not available (Zhongqiu).
> 
> Sumit Gupta (9):
>    cpufreq: tegra194: move MPIDR read to CPU hotplug callback
>    cpufreq: tegra194: remove duplicate counter sampling loops
>    cpufreq: tegra194: add tegra_counter_delta helper
>    cpufreq: tegra194: add per-SoC counter mask
>    cpufreq: tegra194: split MMIO mapping from ACTMON offset
>    dt-bindings: arm: nvidia: Document the Tegra264 CCPLEX cluster
>    cpufreq: tegra194: derive frequency domain from device tree
>    cpufreq: tegra194: Add support for Tegra264
>    arm64: tegra: Add CCPLEX cluster node for Tegra264
> 
>   .../tegra/nvidia,tegra-ccplex-cluster.yaml    |  27 +-
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      |  21 +
>   drivers/cpufreq/Kconfig.arm                   |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c            | 456 +++++++++++++-----
>   4 files changed, 387 insertions(+), 121 deletions(-)
> 
> [1] v1: https://lore.kernel.org/lkml/20261104181521.3003578-1-sumitg@nvidia.com/
> [2] v2: https://lore.kernel.org/lkml/20261117154954.625126-1-sumitg@nvidia.com/
> 
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6


-- 
Thx and BRs,
Zhongqiu Han
