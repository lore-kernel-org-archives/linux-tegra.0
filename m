Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F473D649D
	for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2026 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776274480; cv=none; b=csje1DN993Cf34InxIPO1x10A+MR7wMO9noBXnT2hCw1E8kSiQCpIz8CSs8D2621yLLGwjCxMSQkwjA/TBLHYBlUlkdWhpaVmEpv0SJL+zDzXU+6+XYhmEOcViFtxABHmLM/F0LfUOt/BUOWibEY1Dt+PcZYjK8BUZdxO9rkxcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776274480; c=relaxed/simple;
	bh=PTd4B5uhCcPDIe5w9NIhHzaDs9hz6KZ6USjgaGgCaFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY6Tpt2Jx1p4EE8/Zzq8EI9uCbJIjOQDPqQMeYkDbhEPEaYfdyjvDAf/4+6eIEqswGoQsL//ehVqA2dLqkxTjY53FRIKDPqY33dd0taHWHB4ZIBovvG+FFm9Nwu9iTU9bkLXbe8EiQ0bBkAKMWuTENIhN2vj0b8YoiqB7xx1LQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIzZLNQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJZ4Bkep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIzZLNQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJZ4Bkep"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFIXeO4053191
	for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2026 17:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=; b=gIzZLNQr3c5GZpCJ
	DAvLsiqk4yCnL+T32P+6t65uFnVeGd2BAl53FHVbbg2nXX57DxzV55EGKRtYNG69
	tUKwuIUPSddrCy95Aofs1v1BEhC+BJiX/rdMX06n+/4vv7GlsdJH2bQVycq62kKi
	0osILBVmxC4qNHfKWVjpniLeU+MiN18L25ako0u7QF+P0P9p16DBY0IJs8441zT9
	ADJ7dUgvDlK3Qh52UJGE3buGYoT9tMgzv/ugXRs4Tk5EJhrkXGfMXEEJVfMRojvZ
	2zezmIw0SvNZr69FLxes7jKlICbPW+dOc1xewDhjWlLgnjTJFMvMmuRnmjUqLb59
	K42vQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5st0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2026 17:34:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so143798545ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776274476; x=1776879276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=;
        b=gJZ4BkepBM9+RmfE+zrOBT+xEZ3akPjpEkxLq+HGDoR0J+6kzUerJxPx+HUonn59Dn
         wH32HfI8wROIiDfPKbUejy9Vbdako5sVwAeJxuQNowZFF4URitcR1a01Ura5/E+CCXgM
         Ig09Avfw7eGYel5Ts+WDji2NzMaCc0OLbXc6dRPxk86owJuiClYDBLuARizWFQjjpwHb
         TAQExnh3RZEA+rA/lNLnPS1LQ+LbM19Pf5N7QlFpC7MWXCBxp1+usuNS+E+lVLRsAj7V
         71kL+XRsLKbLfb5KFdGSv79yUrjgO2DCjq3+QfpgDTHmGuULuqq67rNQq+CBO1l5wlQ+
         7U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776274476; x=1776879276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=;
        b=EnnSXS8JGMlZmuf5xKkiwp5KBEpdTWySajCgmBJcKxdsFa/fsuWARaWjORcJctZJww
         GVpPxaa+XVz2iyIHduCNOyK2wJZpaXp1MvkpxUfERxXk+UNBoyhy6vAcxT1aepi3YHGb
         2mST+XyUTh5XE0BbzBc9YiBqspQAh1kVKX7+Q9ijzYx4XzNwub/Oz9x+yfPYYvPZIUSw
         beQd+5mHItOCEyvuE3G5vN0MyX5oDdp01NbjY3KtsFsOMKzQtXiTrGTz/UCmXoiYRhLt
         nSSK8S0gy8BAn+aeSB8uiBvc0GxI6MmHKwZPLPF42GMeeesS4v34A4OXYfjDvS5vL9ab
         j3Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/PsIQkqQa51+UY6bdkS28x/z1ZYiOHSea3zJTADt5fkopnL/jjV9s0jH+BJqMeuV1vL+qhKRXykvUuZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8UWq8xAfuZOthvBQI8/FpLGqfu1YrCmvWadlX2yiC2eTjusP
	gToLAb6o5pUaaM3NZ6mTsLeJr31sSDo1q6OcKM3FFbBrnTYzzJczBT8/bqrkgbaBekW1J038bw2
	j7lDAgbDRQY2Okk7n4EjkhB6tEZp6cgHv5+Tkq9yf6lcvFd/Pb9gWabwENDQaOT0FDQ==
X-Gm-Gg: AeBDiesBoW2IRZpnq0yBVTYYGMFRlR/md6jCC5kil3HoMtBWOA+AnyquAC5GT9xbRYD
	+AGFTrPhkRUfcwD4Nh5p4cx+9QHkSvlJr91sKSLygXHpPolMlqX2oCIwfGthH7hDBL7cACR4vza
	TBsdXDs4XIFSvodDDj7p4THIInPKc76Bo4TASd4IWDnwvk0NOcFGhs2wHkOjoJziXPLrwIzThuN
	LTGo7MRcYpw8BAH6JI9ab0VB0rKX8/F75AOUl+p3FYh4YxxRWvBrQ+WMzHxa1pqf8fWzTmECFW4
	U3QF7z1hxQtQ0O8yVj3lteimi2dyejMtgBmIRAgyR+sjAC6IEmZGzOWLwTd8IFstWI5bdj8GFL/
	CL23RL2CYtN9jJeFeABGRLCV+WMsNDNURkZj9zeM4D4j+Cn9s8YaDaw==
X-Received: by 2002:a17:902:6949:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b2d5a459ffmr160044675ad.20.1776274475846;
        Wed, 15 Apr 2026 10:34:35 -0700 (PDT)
X-Received: by 2002:a17:902:6949:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b2d5a459ffmr160044375ad.20.1776274475300;
        Wed, 15 Apr 2026 10:34:35 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810b70csm25397215ad.23.2026.04.15.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 10:34:34 -0700 (PDT)
Message-ID: <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 23:04:26 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ekansh.gupta@oss.qualcomm.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
 <2026041418-volley-composer-6363@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026041418-volley-composer-6363@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69dfcc2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xRG3GzwA0ZaNjhFdG0MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: HP1c2lv75NayljpM_qx-CFBSe6XsotHF
X-Proofpoint-GUID: HP1c2lv75NayljpM_qx-CFBSe6XsotHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE2MyBTYWx0ZWRfX0q/Pov9xnVbM
 GiQZ5RvOI708QPMCZOMO/My10da9yieROs5w5n/ETDVb2CDZAwSigO+f0OyFs2+/4cCP3rCVJ/A
 BY23GuWT/oxdZ+KOwb6px0ySzSFZ6oGgObtRcoLeWoQ95NdJNBNJKx5oDWG3qqOCxEML/nEzwu3
 Fbjqr/uKdUfND+s2OXm3Ta4LAYvYD+LEzaMA1ze/L4k4PtzH2+ztiMfdnoQ83cg12lZdh94Rl7w
 hiUtVbWxfNELyskq9xTn0oHQ/LEnxI9voYRq/sKr30YjMqE0b8mMN7bSMMnsQ7IIJpQSdCjyofx
 4fndRAAHpP94YwDm8rujPlgkTHUzdKo0uxV3wt2y18YQbZtu2qAA8cLNnKMKtxIKqdAqBsFWXc1
 kcgXTbwJCMJJzkU34zWbeqVkKu5StCNw7KahXzlxmeB5Q17UEWeq7l/nOoPg9OzH3/n9ZUk2bax
 H3MGf3/3Arje8XeoUGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150163



On 4/14/2026 10:19 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2026 at 10:01:15PM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce a new generic bus type for synthetic context bank devices
>> that require IOMMU context isolation. This bus provides a shared
>> infrastructure for accelerator and GPU drivers that create virtual
>> devices representing IOMMU context banks.
>>
>> Currently, drivers like host1x implement their own bus types for
>> context devices. This generic implementation allows multiple drivers
>> to share the same bus infrastructure, simplifying the IOMMU subsystem
>> integration and reducing code duplication.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>   drivers/base/Kconfig        |  3 +++
>>   drivers/base/Makefile       |  1 +
>>   drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
>>   include/linux/context_bus.h | 15 +++++++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
>> index f7d385cbd3ba..479bc4bb442b 100644
>> --- a/drivers/base/Kconfig
>> +++ b/drivers/base/Kconfig
>> @@ -4,6 +4,9 @@ menu "Generic Driver Options"
>>   config AUXILIARY_BUS
>>   	bool
>>   
>> +config CONTEXT_DEVICE_BUS
>> +	bool
> 
> So this is a context-free bus?  I.e. no documentation?
> 
> :)
> 
> This feels really odd, this "bus" isn't doing anything at all.  So why
> do you need it and can't use auxbus or faux?

Looks like the device have specific iommu configuration (via 
of_dma_configure()), then using the auxbus or faux bus types does not 
have the bus notifier calls to iommu_release_device(). Please correct me 
if I misunderstood?

> 
> You say something about an iommu, but yet this has no information about
> an iommu at all, so why are they somehow special?
> 
> You need to provide a lot more information here, sorry.
> 
> greg k-h
> 
> 
