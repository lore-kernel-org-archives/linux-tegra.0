Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381938AC88
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152261; cv=none; b=XheiChil7oLe3m/8Yyx7E+fyQF8MSfxZYkxcQSYgjHYjYeGYR3rmd1FnR0LZ1UDJnxBqPJmin46EFieJwFpv5bByRCIMcify7S5lfa6Q4djKFrd5Sbwtx0uX2qDCmzGgw2FOVN0VDV/ryZdc2YJeMI7w6BYGeHwRaF119HIQkf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152261; c=relaxed/simple;
	bh=iwBZ7AtMlhelEvLw+tye8c1q7oBAuTMT4QG11XTcpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyDJfevB3wVdT3+LOTggy/i14PlVOPos7a9q9ByHak0BXSLPaQCL7HSfVS90mH1s+eIF7Hlegi4cfIIF3Ivt76lXUTkuHU9VzuXfJp7ZXG5p/vYfnJJlMgOAX6KwxUqXqIcXJ/16JDFywlfJfISTmPtEwh0qCtdCqMFPuo7nzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8jZkoVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g20X+xxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8jZkoVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g20X+xxt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478mi13258772
	for <linux-tegra@vger.kernel.org>; Thu, 7 May 2026 11:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Y1kuY6AIGy+U4i/Y7pzL/6z
	K08GGDx+3n+4jmLdQvU=; b=O8jZkoVAqt+2HLCrU2eOD6YB3L6iTXF67LpCaRSu
	QAseQv6SNf3eYEndOf+rlKeYTn5xvcmLoniRiabHTBNmoqEMId5tALIdR3xOYLal
	M80isMChprYO83Hs+kwz+mL4ar0l+0LD04kBgpK1seap2XZ0v0VI+meYkfLPzgo3
	KBDG4EMuoWNq5Zso9HhvywmqbfipwOrbHtnNVXWsHQgvlbg5GkRkX0VlgFlAuOP/
	XMvHY5T8+aYuRcvjrt7euN2/KcH6wo7D/lvgSKY71ochyglzsfOMjdPS2CMXeRpC
	XLTzyjYCysKfoMAX/LiT99/jDAE5AaN5C03ulU4NuObiYA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8suth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 11:10:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57563cc7576so798813e0c.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152252; x=1778757052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=g20X+xxtK858QKAdfgknvaE5wdXkNyjSMvfJhZsM6umA6INVGTekjmpmviDynIAbE7
         GY0wLAqURl7qTs0JYq3mapcEpWu2Fci6AnGvHS5lWqGGtjLs8omBvAOxFfDObaMfibhF
         PwM+jNftyf3QhpHC0hygrhI/driWYyGigVa1n8vhZcm/pYz6q4ceKZF/BPx4K6ckm0B3
         bAxuqhXMrUvK3olSICpxo3v0TDsKXKGpClj5VB/Wav5BaxT0xWZo1kQXQiPQXF/jGCcO
         UYnUyrkyA2H1y6I7DVw4YAOVH60PjlPH+ZYzE3cyu2qYSL2llSduqNx9xD4WpT/d+f2Z
         DikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152252; x=1778757052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=Rciqj694yGrZNHv6NroqU3TKv5iLi+2EIYBkS116ArPkaqQs13lkNJDRxhPUADy71g
         y8UyoyXJ5q4t/ozZXLTwGvyusvCBKmIhO9x/ZWsP1gRcI+wv3v6HHT/rT2ZCHFH0VwT3
         iew583Zkliy6btKdJNZaMfsFX03nIQDwgSisfo5PiTlkyIJ5bSRMLF6G6U/BqV+cAIfv
         FvWuQlg8i/Zgkc4oHhFzUeNHbCmz11zT0d7XpQ5XNuWoEKtJGtzZjQO6Wd5b6cZDzEF9
         D2QBH5KQ0EBwBc+ZUDoCoWbXEm06IUfeqX3TGa8a2lgIoieJ6E/Bk5FcO0ET9IHKlBHZ
         brHw==
X-Forwarded-Encrypted: i=1; AFNElJ+nUKMJtjo6EF2hrNxzhtHbk4BJz1ARrydbKYwWET8lbABwSgSOdVwvdUtGl6jgZDEkiKHQ7iBfgBQZoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFkMLAX/aSne0QiZT6f/5FXhqDYZc5RLLHT83QYassIO45wiE
	SCOEmf/vGX5xEqtXhpsyd59Ak3AjRon1y+UhqCF5mNHMk142TDhyQbq0NPbnsjHtu6w9wntkRmE
	rp+O9X/Ze+EPlvFEGYDlgiWwGaso5A7ysvx3Na6xuFwQz4O2sQ8CyXp+19/3/pYW3Fw==
X-Gm-Gg: AeBDietf/EeUmBlyISjs42IzOAVHBTVUmDLzeRgf9QeXkTYCYpFjFpemwC7E4C2jUOR
	hVH/5SdSOs9l/Tni09Tnonsk1v6LmOhZBHa1D0Z2IiFyuMhjw8s6SV+EK4P3gfYG83rJz1tLh7c
	/qLq3Ff9GT5G6/jsSg19zIlNo1DzJK8kah5zWs/jv/dqQhjV9MpEnE9lM1Z6bK+5VcOZ89B04qb
	4PtsBrDWAyOnywpEj5X5moGbl/HnVHo93aQ0DaSRG1oyHyigSG9hG79bhLP0pUnwcv4Rj4jzFpt
	PZDNwzjomSXa5kr+DlZTVRCT2KRypoRXoy1qiPHxBgNSwOY1McPHIXCeoPGyV/1SM1vk1PLPTzH
	ZSKHlnOdOzbpjp3TLnSGD2Pod2qq69i2A0BHOt/mx20vvK4t87kkHlFac3eRByHvnm5Htb1CjeQ
	C77p2UsBhLmFLJa3ndfO7dVyCuflANm4wiaiMJWogAjLcirFMXk33YF0jZ
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284822137.26.1778152251751;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284814137.26.1778152251228;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22de94sm5528582e87.7.2026.05.07.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:10:50 -0700 (PDT)
Date: Thu, 7 May 2026 14:10:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <nfh7duwh3o6hayhxz4pxwfwng6fi6q4l5rlzlgjjk3atakw4h6@6xbyk3nppdrt>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
 <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7O3jJqV9X_T0yqAA-R4P44Y6J5pHOwAK
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc733c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=kzQ9Fxln275sraQuM_AA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 7O3jJqV9X_T0yqAA-R4P44Y6J5pHOwAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMSBTYWx0ZWRfXxHlWG8GJVEGI
 HY/X8D0x0P9V/Gh49sRrPzahTrGXfp//38iUrhvqBCKy+sRKqVKw4iWoRQDzqPKdWzCzDOaVm0d
 Z0ha6h8gFImam/HvlX/3o8bhX7GCHEIxS3d6IQQdgehewct3k4CnnmeQ+uTEv+tFMvE5sQ/Nyue
 f07u1UioBGLKWMmO9Pg+UhNXOnS+fyUe1GDX+x0EOfWEPoaIqQP18BhzosKnN1UBVHsBJO/WUOu
 x5W3C9t4mYp8l7hGnT5UpF+epQC++xE+lyb3HbNAunf0EEis+59437owHIGik6peSE/nmzYpqCK
 qFklaZLZN+vhLBx5vQzhx7wpZhSJl7Ys08EU7oIchRUpIyFmAEfuLDuQB2fCvVG3EC+bzqAZ9em
 W2BwV0YaTt1q096xYSPSfNWTstvKNc58/9fbgE4lKU0UEP7Q9py0FBAR+JEAjMxv4aYUwSmcT6q
 8YRKx2XooPXDX2wZVrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070111

On Thu, May 07, 2026 at 03:28:21PM +0530, Sibi Sankar wrote:
> 
> On 5/7/2026 2:40 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> > > The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> > > Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> > > pre-determined algorithm strings and param_id pairs hosted on the SCMI
> > > controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> > > mechanism to control the various caches and ram is hosted on the CPU Control
> > > Processor (CPUCP) and the method to tweak and start the governor is exposed
> > > through the QCOM SCMI Generic Extension Protocol.
> > 
> > Could you please clarify, does this apply to the common commercial
> > Glymur and Hamoa laptops?
> 
> Yes, they do apply to common commercial Glymur/Hamoa Laptops
> as is. This is the same solution used on the windows side of things
> as well. There can be certain cases like Johan has reported earlier
> where certain oems are stuck with on older version of CPUCP
> which requires a the memlat string to be sent out in lower case
> we should be able to handle those as well with overriding those
> by using driver data and specific compatibles.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
