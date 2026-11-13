Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551193;
	b=Jcp/IkOXHDKaa37EVuaYieMXZMNHpX2ni3jt0E4lBVsZJANx06c8uNvgR4ewr+4wjD20
	 MFa9ISNsYvwWSk7OsUUUFg8ZfsIdRgMsccTxw4WHNypKqEzh5fd67niLLxWzaK2Y9JsNT
	 SBKTg7Ez1xumhMZ3KxaBjSwamrR77PZQNjVswlQ3PgP7BXu1uxRiCJKAXCVoouSezALp/
	 hDE633OXHMDxqRhhKa9JSSfqagTBC75DgdIazM4IxtPWd740vr3ofDI49x4QfB2WVeTv/
	 +UR5LUeWd7PBjSNDZKZEhYvJmQDvKQNbrbxPyT1/0p1Ay6ysWbDVRX40z8i27SIOsSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itr4hIklB4kc7LTeKoS1h6ZFX1PCmH/V8dMF2IRMWzE=;
	b=nj7Ye60s7KkGPeybPuKCiFHXx6VWugsIowRi8g4UcqH4cCuQ0ANLLTOzYC3d5autihGR
	 DXtmVrHv7R9NXtijxoNxJSEaGuSVVWDKuIxYMglT41ame9PAzmxYUuS+mfnTGvwhev04t
	 RhRAVHH0R21YJF7nWf10aE5ccR6n3C3GhCgMT3viOeewRi+JpeMSCvkrsbYMGx0sVorxI
	 eJpYhIJbBlft1nLLy2yvnWSgqr7RnKZyEnbbEOjfjtAIGa3C9R3MUugld3s4ifngdfejZ
	 wSPequoLhM2lfjBINXFdJ9WFa7Zdypim+xIE84NFX3m5imaSv3cLnooVtBb8VbJjY5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+mc+OJR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAUyyfEF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D78606A323
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D78606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+mc+OJR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAUyyfEF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57H7F073794
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itr4hIklB4kc7LTeKoS1h6ZFX1PCmH/V8dMF2IRMWzE=; b=S+mc+OJR8Tza8cqE
	ttsLlcZhQsGIaUb+Vb53f0GPoESZhh6D1X2ihb9qGoxj7mZdJSejtEfiCYGx04Yy
	03U3LRrJPi4wZ/D5HqaDWVYn4p89m7WQ/Ax0vzjhyxNuny2wBDnW+GQh1smHyrgE
	j+lSOVX6VinapGZ7cvgyV90LePfTGE8/eqffQ9wThHuCHuhrVNW5kccRFDAnrS4M
	hXucLCr4gGxP/eBpc0lqiEGumbhU4lOO0EnAUXXLDiHd/LPwMj5uPBG7TiIk+UIa
	gMq7j1Nw9gzcunbqq8QlAoiuM8E/Il7cLCsrgevEO7ffxgqIbgW6Ckt9p68HvtoS
	t0vIaQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03t3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:26:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so623095a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 22:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794551190; x=1795155990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itr4hIklB4kc7LTeKoS1h6ZFX1PCmH/V8dMF2IRMWzE=;
        b=jAUyyfEFe/Hu6xdj5D9L6vAvDzpPZYJfZsba1u4EYZ1ZNa0iVGlICFzJJDGNeGz216
         VDS2TrQDdnib+8crRK7TsPuyPqZ6gM9O5JewtVipBYerRvQY6apj+9VvHmrYmDGw7Njh
         +pF3ccrAz22naOd2KElVxF2hSz+W15oy8/N8eCJ9XZsniMuLvlSQM/G9Xd2vjk8DuqCy
         DkXxASwrg8XA28X+CJJnwKQjHdRXd/dGjoJjIGdOJ/MZx4X5ak2LZqqt4brwQJwVDpML
         ZX579KQqR8oLCgMuwnuXftDlcN/3Er2Q7hAelJbMc69z+yODHOGBtf0/0cBLiMzH+Qh4
         hEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551190; x=1795155990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itr4hIklB4kc7LTeKoS1h6ZFX1PCmH/V8dMF2IRMWzE=;
        b=PIlXD2AtD8n9VBpY1GZ3RIpobr0UDHsOLVMPlPRt1eJ9nmQQ140awOmYJ1HOQrviEZ
         BIzY/rDl7XOxJoMV6ujSPcsaQwkEdayjL+/H5t6u4SmqEWj3CHrLD5JOAB5pfLhLYsD2
         V8hII4nuaFJZ6xYSPBghMK8TTff6tqVm1fYakFsXW9nB1IJ+Wtr8viWRTLxTV/yKtVE5
         mr1i10f9EycSrQV1JLhjIw9ETzMBX/kHRmPwN3cHaRpU7VQPRL6ahSYPPJP7sujk3L8U
         2ubg9hKLeGZvQGvkm3u+OL9wASvk4WcMpz4TWZtXpDyeu07s1ixDcuZtcREx8S4QSA1j
         1Yag==
X-Forwarded-Encrypted: i=1; AL+hErEZ36ELzuPNY0BrpTQb6sx+pOklQbfwVTNO5YSYO9cPAgR8YZ5SZmcT3Wwc2qJg0p8Mm6CppHhiWOOzsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BiaL4kvDI6pSzLK5LZwpHpaosyl158OaDjfJtzPYfo2xkgEu6
	romQVx0bWJusCGNS8SAtbTLgmJUxAaf+rWuyLq/7Y/hvy/qOuh1apK0CX4DxTdrGgE8L+Wgxu/q
	OeyQwzQzukBEjfb++UWzHlOTjuptkMiz8WxbldI954WS8/Re8/qaTSseWKQLtMaP97w==
X-Gm-Gg: AYBFou0+WD6lOJk4rbCcvtGJK+vI0t8PVof6lTiRsoFl4TCgrk2h5W4vnR580NanPTj
	n75Ee0gXdPRvYjVlWsxZ2W6rxEPhRcwFMptRkzwAnw0/IXR2HM5zbog43qgrKZnUYVQH26Q5xxy
	39KvKFf5IWm+bWpH2Bn2fkwA5tLQsGjmx9rno4sjhXja3g1RdSYxsXacp9uQrELLsFAI/fA9b/i
	C1IrhIxQXlAkg18Y4WkQomyGQACKNBFBckkbqBgdgzY38yjtvpm/+6oRzZGbHN+Qxbda1nr/Sjm
	jL3NZwHMcA8qe07GB2IrJELTtIQBz6oEYGY3vF7v+HJeKPLbbyRBhuUCOJWRTRp4NWujNaJy2oh
	GY0bCl1Fz6gNRlUvxiGVCbYlbLEIRlwulfbcQfsOv4nhC+ypcdmK+536eK3ZHL/MPtK3WIpvhoa
	8UGWEnsP09b4kQevDm5Z3B4fYut0vtxiQ7eHiE8UtMvROfpA==
X-Received: by 2002:a17:90b:54c5:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1b087b75emr858172a91.3.1794551190204;
        Thu, 12 Nov 2026 22:26:30 -0800 (PST)
X-Received: by 2002:a17:90b:54c5:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1b087b75emr858146a91.3.1794551189608;
        Thu, 12 Nov 2026 22:26:29 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm2933013a91.1.2026.11.12.22.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:26:27 -0800 (PST)
Message-ID: <904f7ac1-d488-4700-8839-ae981b04a71b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:26:22 +0800
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
Subject: Re: [PATCH 0/9] cpufreq: tegra194: add Tegra264 support
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261104181521.3003578-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfXyW+ArqJ38OoI
 nu/3O0HZCsDGT8Y456d8SZWBNpZWLVPQB9arEOxRwnlyvW2kDhHoklOOD7rJHMytXtwgEz09uLC
 fp7dVgbjvn7B/8i1Imi2k/haBpsqBsworyhdvnp1fsqK6TGvFFUsOBDbJqYOrmk9qbQ6u3ae37R
 otwdR+fwBxTbdBt7b+WKKTwPH7SBH6Va4Isc6hwE86CDNu2L+Mt8u2nVcp13OxcRn9pKvYD3L7l
 hwY83Rx52S4WN6KrJ/jY3p6cY2Y62XO5MAF38MBFTLoO/2D4GZsrWLzxlofDL9Y274Qu0Jt2TTR
 s5dUKgJNPM5BHuo+3QiV3++fw1KnJ9Ks9lRR7Em+mxj1LFqUbPm7jmba0OF4sNbSyztDfFMJOrO
 0AihIsdoqXeZXa8cUsqmIcmPUkdosZqz69/1+eZ5+1LD+vJw4/RTm/PtjfJfrYwBFj/jYf9DdN2
 mMAGEo8puruEt0QteIQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6ad97 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=I7BNmAFbTgjmseqQuzQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfXyyrcFtCuBZSP
 RcDOvTjHnRcm6S7xAYgIRIWf26jbZpkZ1dB2EC742oNr+cAlPQJOQfGP2OycP8mTD+eqGVV9+/p
 TsKX/UuNMapYd5ARBlyNxyVWwUe4t5U=
X-Proofpoint-GUID: kLtX4didxa4Ly3SiNOtLsDgFcdWbSMqe
X-Proofpoint-ORIG-GUID: kLtX4didxa4Ly3SiNOtLsDgFcdWbSMqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130025

Hi Sumit,

On 11/5/2026 2:15 AM, Sumit Gupta wrote:
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
>     register controls a cluster-clock unit shared by two single-CPU
>     clusters, so both CPUs form one cpufreq policy.
> 
> The patches fall into four groups:
>   - Fix (patch 1): read each CPU's MPIDR from a CPU-hotplug callback
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
> Patch 9 depends on "arm64: tegra: Fix address translation on Tegra264"
> from Thierry's series [1]. Without it, the ccplex@30000000 node does not
> translate to the CCPLEX registers.
> 

I have some inline comments. Please take a look.

Sashiko also has some feedback that may be worth checking:

https://sashiko.dev/#/patchset/20261104181521.3003578-1-sumitg%40nvidia.com


P1 and P8 don't apply on v7.4-rc2 / linux-next due to 4dd10fbbeb9c
(devm_kmalloc_obj conversion). Could you rebase?


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
>   drivers/cpufreq/tegra194-cpufreq.c            | 422 +++++++++++++-----
>   4 files changed, 357 insertions(+), 117 deletions(-)
> 
> [1] https://lore.kernel.org/linux-tegra/20261030141101.845044-1-thierry.reding@kernel.org/
> 


-- 
Thx and BRs,
Zhongqiu Han
