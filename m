Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973654;
	b=gV3ouuEQqDZ0JGFYs86I67myVTRQGHwEEfBVScGtPmA40QHrag6AUVUwqWbSyv7YoB6y
	 iwaZpqUTpLxuXrImN9+8Jav1pRNlv6wGAxhbh0P0582802empWSDoJaxbS0B7ei06qfYN
	 ZcPzXUeQia1tAWyZpyXDTQW52qXSxypSFbUD5wBbEC7iGa16PzPxCqlWapbTdmZmirB/M
	 c+viUVhpER2R0UkCy4QPRX6B58AlQBYkJbBskbLOkMHirVRPJkLm1eScQPeN5CzbPIZNo
	 kk7uVff+zRmAA0aohp/4iK3069L4qM/whpn18HnfFJikcgbD/Ys45zPiy3xR3sIQmgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
	b=S9M5f0Mvkm0zXyX69iZkrsMONR3/mGUpbGwNEYgZhdZXqKMT9B4wAKSyGV7wsJ3C818s
	 gdQLJZbG0UPahRQ9FX6IAybNO1pD8kK9S3wyjmJiYAmw+zO2OvP+nx6xqmhdDyJtcpO4Q
	 uRPOYEQWzN8YbgVEqbqx/kkILdzx9aThH9Bi7UJXMlFqijlrX8gxUDcAjVem4M9WaPiQa
	 t3Bup7iRd3jIvGXw16c/ZrDEg/q7LukVCDriV6j6wMA2qDdhp9+nLqIlXBYkjTtzrweZe
	 VOOFlM5RZgkB9f8JeF7kaEngQqC575dm1W96Ez5ubZUwo6hfkpGW3kmZwmBbaUbhZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC1606A31C
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3Dm764123
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=; b=URdO5GDumrbt7yQi
	t45ph71r36BGnxp4xR6UAasTVy+UyOXBD2UD+McP94p1qiI2LXt7+njAIdrVvR/r
	DWGGlXx4eMfHepT/zs/FXi1HQ9y8m2DGmIBZnKQVdWesbwvKIybwUrfO5NeJ/w/J
	47RwzofSmx/Qz0cxhFOzP/2kIEviNsxu4C6x7CadeUanaQZzdKkK2Fl8n7OJl6aD
	T5sqkCYbC/QhnJBb3pHute4G8Yh7F2/Xr53abuIXLQetzpCyJZyLsQuur9AW/KN/
	qkGrzHqmPMwzQC3vA+KevsSWJGvE1DEplBiDf6nzziTswmeOaODFjJBppY0al+L7
	BXSiQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9120-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:47:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so520801a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 19:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794973653; x=1795578453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=NuGOEOMnTZcVlrXyoF2+B4DqmvSA+y3upE8mnAhcwNFO8pcrb+HfNj+yNJstPIU53Y
         UOoH11REDeIismjafSNl0JLM33SFhT/ixSZ0yN70XZdFXTKl5i7ixtBgGwz67iAQodsK
         FaNqGDgOaFRMZ0qKNOPybEGEcICSXlFa2dfPmeFHXC6/gaaGwTUsuhc7SOn0mhFVxowE
         SU8njdvNbBQxYW5xmYmAedKWZwACGzTI21QX49nHoZCDRrwQyR8LLq4wph6AdPG8osma
         NuH5qkkN7ikezFclLT3mPfLqx2CJx012CBLcSHnq2riiYUV0v+aQ6W2MSIFsi1SjYW5S
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973653; x=1795578453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=I1iusLqQPOlOm/dKfk4JArisTvUp7AFZ3xY4PRmdJ7kR+IrccWLkVn1NjbVprYh5Tj
         mRwtq+C7ZC9mpkuLEr2VAoyw/Xme4v2vdfUx/QgjZSwWEtI6lDAWSmpU20AonffyTb2K
         Uwh2HnC+6EtBu+lWlTYulM8VUeXtru2hChL9zZyX2KUVHOoa0ccIm2KAtDlxjX8WObCZ
         X6Rq6iEtaztpBkoVvtMXyuVQQUhJQAzFaZvIXJspuJyE8TK+AXoPCja/+cSKbV11FC34
         eAx1HBo7okBw8dVfW4hjApL1fyocCTZ59Ct+nvNFmT+qLtN38qHkZvjv12QDwCYeRdcp
         5UVg==
X-Forwarded-Encrypted: i=1; AL+hErG/V9FrEZuQHczgI+1pnC25IXk6qAbRmt1kzPwSjQHxi9KvhRZ5PAUqFymTVIe8OhdAuHuGc+0ATqITOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UEqlATCEUVQKGKWfNsBrvrCeeK9zDVatFnbxoVnjo9Jwch4ao
	8BNMLUi1GmQJtPYLwUL5oug9HyYGWzGuhyqQ+9nQG5ITISrsF7Y5XpcOFcKKoLb2+gLjhzhKugQ
	pHkl9swy1le9b2k6SdSrw8XxLCVdpKX1mVVllGupMHEgj1Mho6/uJEQljJWx7WlLL1Q==
X-Gm-Gg: AZFdTZdccTxHWbOe1Ydkqsc1DeXqb+8JkoQ+jjAJhQxU9D1VhehXsNpWKYAOJdhkjxZ
	d3TZ6m7kUM0ffmN85+3/SsSLIIlZt7FhqCpvxIWrfLy5wm4RJYuRupd2JhgQiDqyXtRr4DIuwWX
	sFW1A3gSthrxtZDS0nwwyAiRu9egJiywRwvXawutWJ4XX7TF6q9vNqmdSdGPc9q26rIeFD+er34
	bU7gFtBb1nGrO12VcCtWU/AXD0EI2x+1PndJem6832IzdmO45MosKVm8+LehP7yOS/m3rHX1Gsj
	0N1Yj7KMVEp4EaKreNuSNHhBGIntIAQr8ipB5bVi/kqIS82Vmhv0jsausPbelH10utJVylFNCvy
	nbul1B6gD+T9sOvusWmQUE4pDRrpK2h/ualcXv57+JqaGh/DDBUOfTylkFMXaEs53OrENPYu3Bo
	H7BnCcKUrIwBKwcALqGM2wXJYnWfiiXNyb4xy0t5g43bI=
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488935a91.50.1794973652585;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488907a91.50.1794973652066;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm2003736a91.6.2026.11.17.19.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:47:31 -0800 (PST)
Message-ID: <6452ab41-2d7c-4995-9f6f-1e8207767cdb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:47:27 +0800
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
Subject: Re: [PATCH v2 8/9] cpufreq: tegra194: Add support for Tegra264
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
 <20261117154954.625126-9-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-9-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: drxjQuUhFTwzgKmHoBf5sNr71qDjkti9
X-Proofpoint-ORIG-GUID: drxjQuUhFTwzgKmHoBf5sNr71qDjkti9
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd1fd5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=jyGxVx0bnOFcdHMOUhQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfX0FFSnj/eGpT2
 0QBROiHkwmTL4hMW55Ijc3yOx/6KSLDtk08thK8Gfmn8uyEZagJ1wMN1RqU1pd6i8oSnAikYqcZ
 mD0EgpIr2eZhBmRIZ5JDHUzI1TdlMU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfXxClsCn+g9h/C
 qgfsAnWTZ9A20FBrZXEsXcR743oty+cpzEGeqaG2sHrOcD4FkQN9Opp3uu/4HerdItA53hQSj6D
 PJ7lTcYkd4xewaui8VSs0wUTEIQu0Q09SGm+8/y8Rh/90itkvj+JE7vZaoL43/TWgB7zFp+DJPc
 b1r1H6Azs8T++CiGVYibuGOxpj77UZxgcZwd/1rG3lsh3Vrj509T7Kx2tOBHNf7O+d07Ay0er/U
 GUpHTBwBTBgq+dtEsO25fZjAGoZ5ybxLodJG5O0O1Ul/f1jlk6rSL9XpNC2Vc+GH6t/AZ+AM4Cl
 bgvRR8ti8EHMb3kYjya9AyPhoCysHpl6GoiS20FolI70hdBy5feKQ5+KWa0xEJOeAer+mPbc6Rq
 41VzoBOfMMiyd/cXdo0JGsmHnJWu9+sXXw4q3oyA9ozvahZnIdhvrUEI7cl/6YU48SDJQEkY5b/
 RTsU57uPMbO8h4HG9tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180014

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
> Add cpufreq support for Tegra264. It requests and reads the CPU
> frequency differently from earlier SoCs.
> 
> To request a frequency, the driver writes NDIV to a core_freq_req
> register in the CCPLEX register space. Two clusters share a clock and
> its register, so they always run at the same frequency. The driver
> exposes each pair as one performance domain and one cpufreq policy.
> Each CPU's "performance-domains" property gives the domain index, which
> selects the register. If the CCPLEX node declares
> "#performance-domain-cells", probe fails if any CPU lacks the property.
> 
> To read the frequency, the driver samples the per-CPU 64-bit AMU
> counters through system registers. The AMU constant counter is the
> reference. It ticks at the system counter rate, so the driver takes the
> reference rate from CNTFRQ instead of the fixed 408 MHz clock. Probe
> fails if CONFIG_ARM64_AMU_EXTN is disabled or a CPU lacks AMU.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/Kconfig.arm        |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c | 161 ++++++++++++++++++++++++++++-
>   2 files changed, 158 insertions(+), 7 deletions(-)
> +}
> +
> +/*
> + * The AMU counters are per-CPU system registers, so this must run on the CPU
> + * it samples. tegra194_calculate_speed() queues it there with queue_work_on().
> + */
> +static void tegra264_sample_counters(struct tegra194_cpufreq_data *data,
> +				     struct tegra_cpu_ctr *c)
> +{
> +	c->coreclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CORE_EL0);
> +	c->refclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CONST_EL0);


The core cycle counter and the constant counter are read separately
here, with interrupts enabled. An interrupt, or a preemption after it,
between the two reads skews the pair, and the resulting error in the
computed frequency becomes more significant as the gap increases. How
about reading both with local_irq_save(), like arm64 does in
amu_read_core_const_ctrs()?





-- 
Thx and BRs,
Zhongqiu Han
