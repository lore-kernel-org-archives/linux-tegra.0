Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551255;
	b=vP1fbp1VHyF+qjw159o56XOtg8BlRWZSZrYAJjtm60W36Xp7mgAajBo6BnsfesVSdoaq
	 /IBxwiQz2no0GbEEaL7GVEqiFf/kP4k4/4wDXGOb5CirY+6+eUK1uLZ+Zkp8pN0KTK+pH
	 U0u8Hw0ANNUQ764eesdggkzJuUdbn0YEHyaxdo8f2hBv6jc9xe25aKgt3A3gEYgFOgQjr
	 mh1q36OsAU9lvS+BPtgIdUSLXqFffpBBvr3UfH7E4P8rgdcqi/iNZk8uXZsnibJ5+b3vm
	 J5H2ZyjH6LJUZaxFQTmDAua06CLrYs5Dp5yYqb3BEmJOG9jYDvHnKAxe2+D1RWmftIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
	b=LtKdAQRfWR2m6wu9YJf2bWSQW9uzxDUT6G2xSZagVEweCWO6AW2Uf9td3N1su9YNaV1n
	 Hk6kw9xrmpKJKwHktZhtAh9BxKPuaUX5kDGiD32zMLslRUA+yjyN6HjIYwO1TWoRFn7/S
	 wbv2oDpRLO5/5BDY/gOj3ahQvhs/utetcHT1ZsJBUIryAyARAoX662M0X83WAcxp6/ley
	 WWXvB1lj4LpgYrtJTF1HgiPgfF5e7htz+Lu53UdSKepWMdxEq89e3vID3A2/qVW6S29am
	 uiN+bdRXGoVTBhagvi+gwWloCyBoMdwGhHaXdgmZx0U4CEEOioeoOwMceL4KLvs9Mdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMbPyI1Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bYTN0G/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D6606A31C
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMbPyI1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYTN0G/j
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD571ma367205
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=; b=aMbPyI1ZH0IIIKD4
	bL2vndO6CjQ1X/qpJB4FgKo8Xqe3il4eLi4BpMsR5UYK+AErptattH5H+uJIrdyi
	bNV6HPcY5jLLSrbQYAov5YJVMujZ3efa1nSR7KX7SBVudfAmgerf3bPoyD9JimrS
	9vYhtE9xVB1bgfW5g7fjxpXVcVWPRoF3SM9h+B2wfzfEK1brEeZ5sgte11UZY7kT
	F7GlbPJW0QBXs7jg73Pp4wvZMhv+8QjovgXw7XtMsv1FOkXYB9G4m8bbCs2dqWTX
	nb4A7fvn5EiOJgyEEennuyQQvifsfj0uf1MEZ9QfE7R0FpH2kOEfTM948rhUqf9l
	9BkaWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33u2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:27:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so11139555ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 22:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794551254; x=1795156054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
        b=bYTN0G/jPIe1PPn4kQwioTeChfWZ5MJmE9dETGJ/FmJnkiOsNnqGkzDMEVkI2TgK/I
         WpJTDgKFRoUhIjAwL0qgthQHkugz8OLBRh+8jMkK1Xss9Cgrdz85R1bz6DJkCyZMrRpN
         MhSTQ1pynuGMZ+GKp2CLb+/LgL7VBDBbmvgnY+MFKbU+O9Z8GLZtgBzxakTrej3WXxpY
         bzE6quu1Q6m9mzOzA22RabDSNxFk/yID+yKtJs8NgN9FOigPOhxfSm9MNk2/6AcMgkl4
         R/BjHo3jQ3n+/kapiCwjE5/hyEzgwOlUkWE9FQyWnTvJEgo1aaqGZVguYDptFrjDfkOA
         PPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551254; x=1795156054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
        b=gf+pcYR1Tzdzo1KWZeg5S7RiN1i1+exa5yknLDgu00g2A67u8kBlMh4bGgtqsrexXf
         A8nMRfVE7gJTIaAaxjbbti74DirLvXXyyqKAql8Y6/4lXE8joAhMIN5P8nm5IfJguHqY
         6qGeDVqJF17VsHVmSy9VmTU6agUP5Op0NH8ww4ZCCQ4M0ONaYMdTFeZLl+vVW+h9/PpH
         +Ez6BPbaNjPXJb6NFV/v4k/gBvFBx7z26BN9FFe8Li2Zex94PGzzXSRnyvjjcZviPMJc
         VazePG9MMu0+2CznwJ8vfZbxF3WNgbGPvB87PFii+SsFlu4jn/y8fkzciZdyyfIWzGJB
         4N7w==
X-Forwarded-Encrypted: i=1; AL+hErG8B/5e7ighjZkG94eCyxLol7jWnlJHhhssIIRmljG1kb+SL6IULGt/znLi973EkKjctOByLwkWf0nVUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+luidZYeo1atOPAqFKh06LedOabz/4C2ENdTR3EyyaPzWszGYA
	untWJ2Kdx26Ldw0kupldCPbjbTvdDc3D0TOfET4alcw16IuL49EDw20O0leZx4lVNImaVvrw+zg
	iWCudvXkFXYmu2/EtNTCn3Qx2ErbbkuFSG9Vxb28b++DRcP3klrT/kH8AI+KDAsdbbg==
X-Gm-Gg: AYBFou2aRzY6ScuH82F71NApODBoB0rcVjUwzfjRvBXMOcM5GwLqx1zbaQ+NroHq+EC
	20c5Ogz+IELgv6/uBAJ8fHckuflb/a/1ytz8wrHFrXgw79qfrI3d3PGHEbwZ0MGu7d1dvIPmoCO
	MRw+G9W3SZgm1ZqxXshhDE1eatI+eIxZsJvZxnP3eKCMv7qzD9zY3wwbcC25q2j51ixRz0CMh/J
	SJeG56Uzp1TotPyvEstdvtmrFR+hOZi4EpPloXkyGU8U/kQReaWiakYwkE4Er8TpJPIspFNLJKl
	MQ6qNol7qOAiXaf9Al3bR7PxVjFfyLRKGOgu9T6UDpnsLXuzdKmXO2Q7q4yrV4jIyzgRdQiVbzb
	6YZ8YK4tjsr3FAQAG420layQFPlTD0mclq3xFTlSJXZ6I15CZryfrYeaxCvnmaL9xhbti7wsH+8
	MYqmaQ603XY2dOJvGmwoq/CNraqMDr7h0RAwhp6p7TpS3dhg==
X-Received: by 2002:a17:90b:4c8b:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b1b0d75fe2mr1354050a91.62.1794551254009;
        Thu, 12 Nov 2026 22:27:34 -0800 (PST)
X-Received: by 2002:a17:90b:4c8b:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b1b0d75fe2mr1354027a91.62.1794551253501;
        Thu, 12 Nov 2026 22:27:33 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc72sm756387a12.5.2026.11.12.22.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:27:32 -0800 (PST)
Message-ID: <4f680a92-c69c-459b-acc1-c877e88cc265@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:27:27 +0800
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
Subject: Re: [PATCH 8/9] cpufreq: tegra194: Add support for Tegra264
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-9-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261104181521.3003578-9-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6add6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=xaSE4ohpd0vWBzKOhacA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfXyvMXeLgp5KIW
 jOQ1Mggxwi/2A7JRYvvg7XvvNRpEJHF5LcZv62W0Mi8wt7kr0AMtqSEoqcEVN0pq2aqUGsT+XM0
 N4QWqQIAR96GFO9y4KG9+EOmqiy1VAju/aWkEIckRN7FJrL2xOHnQlQaTsVwR8H53RWvKqnI75q
 Ccg9PdhwfEprTK1CbToqOz6wny+F9YHT79Yh5mX73VIemAVMF7VrML5kp3oxJyYA5FAF0Y4WqlC
 cwjwXxKRTl+1Npwr5VZSiO2OfaH9Jdj+pBMWnqgZWghc1KomdMvwctgs3l4YA7RmI8St2OP1t80
 4nZ4MRiALhNM/Esh8wZTcPkC/UWo84XMiSyNfZaPuG2scs9H+Htko/2IAe3n0CO43PoiRshN0X/
 Vurm1ydCzO/JPb95eHjDBNsR5p2dluYJxUynUuT6lxnumSEWtvb2ZqyGlv3KIL6HaCHa18J4L6m
 Lzbuqi6MfW77walavfw==
X-Proofpoint-ORIG-GUID: deRw20vMs-9KTKEkv1CJwJMTpMOJ5bhT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfX/6rB02MKgR4/
 dUzksngFXozsZgegTr2g50vvE6nwaTWDKuYMD2ZcWz6iHqUl+aMVqs2HXXP76xovZ+OlcpoS0yC
 +2kMZ3VickNC3x/T0ZIKfNy0ktk60KM=
X-Proofpoint-GUID: deRw20vMs-9KTKEkv1CJwJMTpMOJ5bhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130025

On 11/5/2026 2:15 AM, Sumit Gupta wrote:
> Add cpufreq support for Tegra264. It requests and reads the CPU
> frequency differently from earlier SoCs.
> 
> To request a frequency, the driver writes NDIV to a core_freq_req
> register in the CCPLEX register space. Two clusters share a
> cluster-clock unit and its register, so they always run at the same
> frequency. The driver exposes each pair as one performance domain and
> one cpufreq policy. Each CPU's "performance-domains" property gives the
> domain index, which selects the register. If the CCPLEX node declares
> "#performance-domain-cells", probe fails if any CPU lacks the property.
> 
> To read the frequency, the driver samples the per-CPU 64-bit AMU
> counters through system registers. The AMU constant counter is the
> reference. It ticks at the system counter rate, so the driver takes the
> reference rate from CNTFRQ instead of the fixed 408 MHz clock.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/Kconfig.arm        |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c | 147 ++++++++++++++++++++++++++++-
>   2 files changed, 144 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index a441668f9e0c..a5482b12be57 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -248,9 +248,9 @@ config ARM_TEGRA186_CPUFREQ
>   
>   config ARM_TEGRA194_CPUFREQ
>   	tristate "Tegra194 CPUFreq support"
> -	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
> +	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || ARCH_TEGRA_264_SOC
>   	depends on TEGRA_BPMP
> -	default ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
> +	default ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || ARCH_TEGRA_264_SOC
>   	help
>   	  This adds CPU frequency driver support for Tegra194 SOCs.
>   
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 1328aa0a1bd1..0767a6fd6bdc 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -14,7 +14,9 @@
>   #include <linux/slab.h>
>   #include <linux/units.h>
>   
> +#include <asm/arch_timer.h>
>   #include <asm/cputype.h>
> +#include <asm/sysreg.h>
>   
>   #include <soc/tegra/bpmp.h>
>   #include <soc/tegra/bpmp-abi.h>
> @@ -36,6 +38,18 @@
>   			(data->regs + (MMCRAB_CLUSTER_BASE(cl) + data->soc->actmon_cntr_base))
>   #define CORE_ACTMON_CNTR_REG(data, cl, cpu)	(CLUSTER_ACTMON_BASE(data, cl) + CORE_OFFSET(cpu))
>   
> +/*
> + * Tegra264 requests a frequency by writing the NDIV to a core_freq_req
> + * register in the CCPLEX register space.
> + *
> + * Two clusters that share a cluster-clock unit form a performance domain.
> + * Each domain has one core_freq_req register. The registers are grouped
> + * in blocks, two domains per block.
> + */
> +#define T264_CORE_FREQ_REQ_BLOCK_SIZE		0x400000
> +#define T264_CORE_FREQ_REQ_BLOCK_DOMAIN0_OFFSET	0x40000
> +#define T264_CORE_FREQ_REQ_BLOCK_DOMAIN1_OFFSET	0x50000
> +
>   /* cpufreq transisition latency */
>   #define TEGRA_CPUFREQ_TRANSITION_LATENCY (300 * 1000) /* unit in nanoseconds */
>   
> @@ -70,6 +84,8 @@ struct tegra_cpufreq_ops {
>   struct tegra_cpufreq_soc {
>   	struct tegra_cpufreq_ops *ops;
>   	u64 cnt_mask;
> +	/* AMU's constant counter ticks at the system counter rate. */
> +	bool ref_clk_from_cntfrq;
>   	int maxcpus_per_cluster;
>   	unsigned int num_clusters;
>   	bool needs_mmio;
> @@ -79,8 +95,10 @@ struct tegra_cpufreq_soc {
>   
>   struct tegra194_cpufreq_data {
>   	void __iomem *regs;
> +	resource_size_t regs_size;
>   	struct cpufreq_frequency_table **bpmp_luts;
>   	const struct tegra_cpufreq_soc *soc;
> +	u32 ref_clk_mhz;
>   	bool icc_dram_bw_scaling;
>   	struct tegra_cpu_data *cpu_data;
>   	enum cpuhp_state cpuhp_state;
> @@ -240,6 +258,78 @@ static const struct tegra_cpufreq_soc tegra238_cpufreq_soc = {
>   	.refclk_delta_min = 16000,
>   };
>   
> +static void __iomem *tegra264_core_freq_req_reg(struct tegra194_cpufreq_data *data,
> +						u32 clkid)
> +{
> +	u64 offset = (u64)(clkid / 2) * T264_CORE_FREQ_REQ_BLOCK_SIZE;
> +
> +	offset += (clkid % 2) ? T264_CORE_FREQ_REQ_BLOCK_DOMAIN1_OFFSET :
> +				T264_CORE_FREQ_REQ_BLOCK_DOMAIN0_OFFSET;
> +
> +	/*
> +	 * clkid comes from the device tree. Reject an index whose 32-bit
> +	 * register does not fit in the mapped region.
> +	 */
> +	if (offset + sizeof(u32) > data->regs_size)
> +		return NULL;
> +
> +	return data->regs + offset;
> +}
> +
> +static int tegra264_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
> +{
> +	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> +	u32 clkid = data->cpu_data[cpu].clkid;
> +	void __iomem *reg;
> +
> +	reg = tegra264_core_freq_req_reg(data, clkid);
> +	if (!reg)
> +		return -EINVAL;
> +
> +	*ndiv = readl(reg) & NDIV_MASK;
> +
> +	return 0;
> +}
> +
> +static void tegra264_set_cpu_ndiv(struct cpufreq_policy *policy, u64 ndiv)
> +{
> +	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> +	u32 clkid = data->cpu_data[policy->cpu].clkid;
> +	void __iomem *reg;
> +
> +	reg = tegra264_core_freq_req_reg(data, clkid);
> +	if (reg)
> +		writel(ndiv, reg);
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


AMU is optional, so arm64 core reads these counters only with
CONFIG_ARM64_AMU_EXTN and a per-CPU check (arch/arm64/kernel/
topology.c). Is AMU always enabled on Tegra264, or should this be gated
the same way?


-- 
Thx and BRs,
Zhongqiu Han
