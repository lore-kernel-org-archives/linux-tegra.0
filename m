Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C8202C44
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223716; cv=none; b=cXIITf6Wjpo0gPxbJF1iZD2mesYvNM19hm8xJRl/ROl6O8yhcyg/uXQWADu9ZRt8YF91nhiwduG35TZ0WfVTt15/YUqYoboMxA2HyaE/ohFDJMOLQp9W/2Lz94NMNmKA8zh3U3LO7+/4IO823ZmFfSuRd6weBklHiK4NSgMwqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223716; c=relaxed/simple;
	bh=rfBDcIm653IrfaI7zELXpLUcNIgBnt6pj9hB8cCMYuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X67X+V8fBNqeOL9V4bTnGaPBS+70HW5Nlh0wrzDEySqeve5BZwFiquoMCvFKxWdJCFKRrLByijugpPLf2UkU2pAwJfc8YtTNnHfQHbLEwV54MNh+QevKBEghLmQ24dHmsumJB1OLXVLlxi2uA0f1V0jEA8NqBWegYbvjlEu+3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLw130jc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLw130jc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNs6pW001844
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 08:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3dOV6TefbQJrNU5fY48fEav9
	8ivZ7YhZXWg/363uaxY=; b=NLw130jc/sr36xMO9dNl/g6IyD7ilOeIFbzF9qus
	2Q7pUhbsYma/bac/sVzWK5N6bHxtztyQWebdcv+txHS2qXQZLFBms/JUBq92ePYR
	uXqk1gr+l78B6NM7yF0DPGmVeBKi+/Tdbh8inaRYfXem5SvLJCnLXwInhQGg76rt
	oaeCoSPiAPzkxaFv89Sz5D3IUicTS3oVwj9/pMJxRvGnbpf4PSxZPao/wZC0MHHX
	W+LS9vx3ajkiHkhSP381maBSwCBBPqHpT1LE1LzQhes87umsssD/O1mU/4m2tUWp
	N/AaESjzu5o9/61s05AVsqSWT+q5yd2MIjKF4HCjoOeMGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pbcnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 08:21:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d9d8890fso845254885a.1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 01:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223713; x=1745828513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dOV6TefbQJrNU5fY48fEav98ivZ7YhZXWg/363uaxY=;
        b=ASsfDevWPZPHXDsHX081j3qcwx3qGV2iMmb5kCVzKtp87F74rzlwJawb+GtPip+yAN
         awaQeQ5QMSOeSjry6l+OukMq/ldEP9434gm5/rhE3dLGVpffcU5TRyb74O9h78v0fSYD
         fUo58qyBVu6nAHUbaXodYxIXtvj6jF23U0YiHpghf+bKWUefGKVY43ufpa0Ob2/elxCj
         e19dx64uFKmgPEuJFJfrqikqiCCt+cysqc//Q+j8MBLq2a+wfcXiv+FxRzgDsxJp3bR9
         rKHWQlYaIIG1DnjzkTPj4kKnVG9Ru+4my4c63gIL+WrfyQUaPKs3h3WIsImtj1POUAZQ
         yQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlWcD6aJdsNvlIB3NYdJuJ3zadSbQ7EppYxvcKlwpfNChxKR/uWqnMMr/R/CeeqU3x3MwzQb6mo61qpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKT1ddTxikkiDxUpTo7IaLWN4692+3y+u9UOeRX00BmOU4O3Q
	WdeG7cCRSuwJQpVEC0wUoKQviEZEFxKPLvsBA4AhbVFC/tppvjWcoyj6qR6Yy9N0j95U8tqf5Nz
	ZmHxo6m/Vtpmfj0yO0DY18WRw4Nvql1zaBqWWrqQ7hxmfPt4xgUyXtkbgtXi9/g==
X-Gm-Gg: ASbGncvmpGpjdwXt/i4igsy9y/yoPxY/BfcnhCNst5xlvLV7hJVUb5StpAnGPWTo4g/
	PK0+CQcjjMq/ybdlIONEN0w+4cYaTV+gqENWFZ54d0NZeQ2d78ZcGL8fPUTeDBQ6Q9o0f1InxoX
	wBDTFdoYXf018hBhXi+B3TQjxP4Y2ot1R5q7I5JNzWezyUYaoJKYjEpOHq4oFsxmYYEXB2Bxd0z
	4p5diC+vFPq9EdLbFc88Ik6a0CBEnNhv/MCKYEsXC+PPmtH8bY86efKPlKhcumHsQ1yqn9wz9x8
	loprJfkX9ZBoeOfRsWkZsL2ttfcktNIsjuHd2L5FSC/qKMFr2EtI8hjfXjrDb0dkxuJZFD9t9nQ
	=
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id 6a1803df08f44-6f2c26db1fdmr178470806d6.9.1745223712766;
        Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFDbAU4iG+kC4GnIeIE42J3FEGXYRJXXp4pFCBWX4GU50la+M9HKv+Oo+djrzzh+vCDGc+A==
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id 6a1803df08f44-6f2c26db1fdmr178470656d6.9.1745223712436;
        Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f4cf2sm864754e87.215.2025.04.21.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:21:51 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:21:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Assign plane type before registration
Message-ID: <nxp2vzmushnkigmyk2yv5vz2j7pc7fghtvn4uielhaqqn2dcnv@eq37j45mqpng>
References: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68060022 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=ONaZQ3SXXcwgrymDYLYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: E4L48TBZVoy68expRW_JJLAOfF8Kak_E
X-Proofpoint-ORIG-GUID: E4L48TBZVoy68expRW_JJLAOfF8Kak_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=659 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210064

On Sat, Apr 19, 2025 at 07:30:02PM -0500, Aaron Kling via B4 Relay wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Changes to a plane's type after it has been registered aren't propagated
> to userspace automatically. This could possibly be achieved by updating
> the property, but since we can already determine which type this should
> be before the registration, passing in the right type from the start is
> a much better solution.
> 
> Suggested-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Your tag should come after other tags, without any separation between
those. Also, if you consider this to be a bug, please add the Fixes tag
as described in Documentation/process/submitting-patches.rst .

> ---
>  drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
>  drivers/gpu/drm/tegra/hub.c |  4 ++--
>  drivers/gpu/drm/tegra/hub.h |  3 ++-
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
