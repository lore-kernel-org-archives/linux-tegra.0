Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974143;
	b=qQ6UnmLB0hB/Z7O90H1XKsyJM8H7qXN9G6jaVfFNYQu3lgyWFlVbl1V1PCx6/FiHFrGs
	 ike7OvahnVK9P43hEALz5G1wqBidpCFucdOmG9cXDfkyy5sWYjU1EUBsHBaITdokGdfXS
	 z/6C+IW9Vl9kJEDimW4Lvr7I2gVejxUAa0QSlJK7jcOEVBHMvBCFS2EX1PNC57OVSLclD
	 /crR315x5/rBTm10AS5VNR6L3HmQdhCEbgsL3abmvMNPxCPs5MGlhLdDnKu86GZAnaz0l
	 kPnm2j9UBjNB/vcs6OguW/qfnJrOXAfKp86rQACfHs5Kanq5lD60MMvGrdIjbSRyOPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
	b=EuEXqkbRvhTk+PQQcv8+sBeV97Z7L8ezJt9L1fagVSRrbODvvTR7q1lLDUbY7WLkTQ3i
	 lBKUG5Z7zWVIVetUIKFzpvpO8ejQTv5FaPcBGCqWpmywjhZUlfjmJa9CkFWC/qSV+iWfx
	 jggSrv7achXP27gQ4ND/osact4YvXtLtT95ejnt/xXKiBERrjsJu4nxH+vGyJ4HXLmYjb
	 Fr5YEqBmC3tsU+57lHjNFzPdxrI8kdzzVb0qH+Bt30tD2BMWnEIs60Dd7NxZmMTocKPst
	 bjhk8RWlLvwLl+5xm86pKIJWjR8WSvx/JIZ4VcTTmCXrbbWFdBByiamiqK6N6vjqVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855E606A325
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C855E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtZ31959660
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=; b=mW2vvBmqHXZC7iwZ
	fezB4fqyW34Rb4e9IE9D5A9AraL3KfwTeC8T9IwN96u/QDDVP7O9y3QCYVPengej
	0W22Sk6b5JsbeeN/Jd+zE4VPYPpaP33H90fl4xXhwpEhWX18GXjI1RUmDl/rclLI
	K5t1eoPlJ6LIbbugOw6SbRiW/EngOrI4XBLQjbJyuJZsOs1YmMWWY3f5cJmjlPqc
	DB6vHoNI9ATbd7aKZJxkxto+4iHl9Mg6tVNbHgX+JTixGOF43k6ArOZWc0xJYbiX
	4KmWVB0ryp0w87w+nqS2b2WK6tqtdVRwPac4APgZIYd1zk8ykk4rnUWSUDanYH2t
	PBL6xQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9h20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so644943b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 19:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794974141; x=1795578941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=jDNucIe0Udqg1nARcSW2RLa+XuYo8RPY8jjXFiwryZgpV/O7RETf7nZBQamL1b+rR+
         Oz+jCbms4BBSwkXUfUdI3m2OPNf6v9F1B9o5qBmM3+Y5ZEEpIJxfBL2V86XEQ2AO7tks
         I3G5Ju2u+p8Zcp0KvfMt1/ZVXyObuc8ensJzCghTvfnU7ZbO+Of+X7p+H7X6xY5k81b4
         wQ+mDS2pFDgRIEGK5het4rP03FQJLlZu7OeSIZnjGxQRl+zNJQkh645azaaYx9NDp/f7
         tSUlTgXUvFE4q4EAxaW706Xos72wEpJfUVJd5C8HefQS9jNb1a0PpuXbyFOTNAAGoNm1
         35bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974141; x=1795578941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=SLlcNC/CksTXLVcRlmgcIhUzVyBsrt+tWWocH9YyoaPe+gOCMf1D5U6ZspCfIAGhyz
         fP8u72mA2pXhYI4rCLa7wHSq1Asg6LusJMkbO7CIlpH39c+AviIhAAeNXW/E1YPgAgpu
         mfiSxV3yRl1cKsyd+qQk9ccw+y3I7eE9mcI+xEm2BwhMCTbTkjtfAxoUqdhxR/Cuq2GV
         Tcu3qIQ5ZBd0+FvyDr59KKnK5miEwdNCXlHZJOpppnvWW0o9GR1qPFYOA9L7Bl5QjRza
         WYkW0rT6JMnIVL4+1q/RNiyoakDy/bS40bQFKEx7Xd5caojaXTfajrj/d71hQ9/M0ihI
         Wjvg==
X-Forwarded-Encrypted: i=1; AL+hErFRcHmXU+g280KuOfgiU6md5dK38ql/0fl15sA9iJXfBjAKSBwWWHmm4/5J60fyMl4YiVAW22lU1eWQUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+85l1z8UQr3+DAGf5cK/RNhIbLVxj+/8eWnamn0hDVYeldDvk1
	TIWelE7NlWu/ej8z32DuN8dR8k4GWvWJu0IvgQdEkfm/j4RtP2vJvnPz52lFfMzVsBWIJp60pZc
	3fIWi1e7pXEa1E7PbWhw0Hi18h3T9voYTfEdZ7QFy+YxEcTWimRySb1tvsAbbcOqvow==
X-Gm-Gg: AYBFou1BooUoNSEeGUxB4c7wE5XrUi9SU+UFU2RAF1RGzZiVcyVp2hmINq4JEkoKGtP
	hgi6Af4ejPd0MKQ07dJribGU4OdiavS7OVQwDszr1chDDevtjwesx3XTbklPiL0deurOtfeBcMM
	RyYeNs2ok9cku2Uu58XQ7Uk9FwR2LtYx71+iitYQrq6cyTJsGs+8rPu5cQ0C7pBsPJBcHi6v2NE
	4/SyEt8AyO9RvtUzecGi5pS8ACyrKimwkrGnOJyPhgSt5/uWGsQ0j3NVj+CrdpOJlpj/KoBBhCD
	on6Pp0QjHducZzpOchbDJFEJhYMcQND5ThZ38UtTKhWozbBNmq96uR1OCfhzThSxujEz0BnudYx
	7d1t8WH8hfAYhtxqoAblHFreqOXi/MVE0VwRFr6amFck8QFIB3VBeZeIKUk7z04foFJXQGuAAhZ
	WGUlKPQtvrNxXVitkevaZxJaprXxZKtlyWHyrErcxptak=
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107248b3a.60.1794974141383;
        Tue, 17 Nov 2026 19:55:41 -0800 (PST)
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107218b3a.60.1794974140866;
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99fe0sm421351b3a.7.2026.11.17.19.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Message-ID: <77166c44-71fa-4e28-9399-3f7c4b8b999b@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:55:36 +0800
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
Subject: Re: [PATCH v2 0/9] cpufreq: tegra194: add Tegra264 support
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd21be cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bIqCZTYioKoOuvliMVYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: IwFhrx70DALR7l2uRAOgiVGA-k0jA3o4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX8otGqdcFWWwP
 C413dn1oNKzNJJZNDbTE36odAhdtAanFrx/eguk8sMcligfR13jLI3vriCT+fM25JShr7QcqPfs
 R8hW71ppZ4mB7PdsNDkuGN4UsKatx57rUzoxz88upG9A9pCKYLqK7Euy9CGvr2ic5DsreWaH/nB
 seDlFvxUQCaVwkO1TxKPBdWcseUc8EwzlFaHpiemwH0B8WLsA8529Ubhenezx4mv7hNRdxYWb8m
 9zgxyVUl1cyfVr+XziIA9LmrEC4hPUchppHPWIsbeaEMRTerbEVreMFpdDBfL45aH4Q2FZ/BxLy
 DE2Nai2ledFoj12rkoQ6GoRpurQubhBA1w8/ok4T1s2HjUkOT2htiEE4QnUxW8BYMyVWPY4aDMm
 0hwLMUxOxBzuWG7D5u4b/o7AaB1zSjXiIgnxgGcewC43Fcf8VmgTCozOfiiuKcWh9bWaEPAnXxI
 MFNSApVum/EJoEScGTQ==
X-Proofpoint-GUID: IwFhrx70DALR7l2uRAOgiVGA-k0jA3o4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX/4DA5O/bj+gl
 SPc/MvDV2DKK66JxHR+x/VmEDczCWIxg8Yfk683vJbSFo5vaU0jxnDcA7yARyiq57EzCRrZ7kPS
 0cTyJGXbCAqkDbQX8hQsJ2FOfwxS3fo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180015

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
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


Hi Sumit,

Thanks for the update. All my v1 comments are addressed.

For patches 1-7 and 9:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

I left one comment on patch 8: the two AMU counters (core and constant)
are read separately in a kworker with interrupts enabled, so an
interrupt or preemption between the reads can skew the computed
frequency. Please have a look.


-- 
Thx and BRs,
Zhongqiu Han
