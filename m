Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D9253359
	for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758043449; cv=none; b=WPvy8/l7y/0O67Y1blhHXeu7qKcPm4zLnPM82kY29gvUfAV8921xPanqs1egJD5U9Sbesj4ZdNiM4vhjby6a2sdx7hYkBVrAHW/S7Mr/kBIloyD64nKmtbq43PZFKBrJBo/ig9DBu6boHcR+01KTx/LoBj6SoJ/q+erTlQklCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758043449; c=relaxed/simple;
	bh=MMRDsv7F3L4iVwuItvJKhX/lkgNUMkwNnqMAXa51eJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4uvfHp5ITsdynMQoaDqAscMj6/ADh/Fh1+17D2tNJY7kurKfbHqlMpOVJT91hqIqs7R4zLDcXrAnfULQsv9i0EjnzGL0P/vy+1XR9OsNuw8VSv4oT+ZlPh0fc214DIgeZvWHHvi14lGHgM6uJhWdOr6NPvr4ZHunzl9QgjuuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbShnk+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbShnk+E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABBIn005278
	for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 17:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVJaMFI5Gjh/Baa5ktag1wf6
	hKqheSFU5lQBIMVpCak=; b=YbShnk+EmtE1J0PdqrUXlMR+1KrcppSpR9QOdcfx
	fj4qZNAWj+IZv+8RcHn1hpjzU66oZC40SA7f04qf+CDhhq8H9bYYo/wZ7jYUVZaq
	h1RwDTq5GFgmxYF62pTFCSmBB2b9IXCtGSo7uTrbvxAGwTwukAxxXClxD9J/eZOl
	XQjLp9wAisqLN6fuFIqaLIfDg5atgGfwrvF3PKbavB++hlCR88kSHiTxQFykL0ic
	Qb3Dbi+AiumxI4pOvug33UALfQkPAXpCC6GqWGlfE7gaFVt5QE8gcBi2+jH0se/I
	rGoN/uePn//t1HPlsOq1bYYKLx3LK8gKKqsnaDAY9r4RSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n5g8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 17:24:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f818eea9so109596711cf.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 10:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758043445; x=1758648245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVJaMFI5Gjh/Baa5ktag1wf6hKqheSFU5lQBIMVpCak=;
        b=SNPn1zE2nz+TiicovBhvTkLzkO2c7QEaIE8ZhueuISZI6j+lSDDdYhMPSGK5EWkvsY
         whP6Q33uRRT2fihaO6xgu9xusx1qciosDR1E4/Jy7xgNyQbBpjFiGMgK5tZq11CP/YaH
         ux0JhtOwP3v85tMvt5reAxogONLdtdUQRTLmI8OlV9AOEWTbLnCrW7nYNpYlksaAQq4p
         gWwApADcQwhExGbNx+oPv6pl/9wr37v45+6KBx+c1O91hDI2F5PxA2q9ENoo8klah9aq
         HDpVlNXU1zda9rTNUv+7YOn0X8nn/7nB40gjf2qI77KLmYOrmgjZp/A9hwCOA3TkoJH+
         fMXw==
X-Forwarded-Encrypted: i=1; AJvYcCVMtFw9Euk7MbSciXMndN9f4PaQuKqKB32iC1vYfRkJoOg9yVTYQG+zJirlSyTE0cpFG6pyS0+lUAd07w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+c/3A53rzT0YRVZDRU0toqFu0salaeO6KrOhwLOLIeC1cJcK
	IDTEeZLJYqekxnzkMXJ84VxDNF0kg9/03emArWssIBrs8qtLuokH353x9Au8BLYT9ZxsydEgvPh
	VHphCyEfT+fLxWgaJZkuUMQm1rhsNSZIfZ+q2g7DOceJmnv2ottupp29pjqiBAG+nZg==
X-Gm-Gg: ASbGncv8z0OBfwXA1B6pZB4mR67DcnuAhXgNdD+lctKgBScoeeDmMkQRI6cvNeNICMv
	xAmwWsSk63q1k6c+pbHVH93i4Ds6X5AKAjaHAt4vMb0AdA4w3D4Tvaepc3NgLAF5NvKBCAci4MZ
	nOtNt9vWEeWtuqa++TVQ+ycBmFoWm4rAvRrmhBjPLRtwtujk8keQWHoIylU7zzZk2jgDwEShTIV
	8+9FfQMweeHu6CRxAv9eNP30lQ0P6HPMjXE9xRpUZp/t9uekCxCcHricddUGl4t1Tng0DPQexcJ
	zVLIlystXfd7r/VLYQXmRqGlulMKi2YM8RPoJNiCQWALIYZshh+U8eN8a4ZfpW2QZgHXK6cLKJF
	M7h10I8adcQN3TNAaebchjAXtm2Ju+LNKtRZh04mUjXEy8c+rq9qo
X-Received: by 2002:a05:622a:5e05:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b788414644mr167556591cf.73.1758043445414;
        Tue, 16 Sep 2025 10:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr6odQMGAixWJo4XzHRfYcfzQgqZWK3iutuTIsVhQhJR9bb22IYTwsejar9wedxbDu/asfUw==
X-Received: by 2002:a05:622a:5e05:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b788414644mr167556171cf.73.1758043444718;
        Tue, 16 Sep 2025 10:24:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a925dsm33908831fa.46.2025.09.16.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:24:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robie Basak <robibasa@qti.qualcomm.com>
Subject: Re: [PATCH] devreq: move governor.h to a public header location
Message-ID: <3shtevnohqcwjr7zho75brhx3ffbluwtaimzst2kkonohdzlwu@2myszcxun3gl>
References: <20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com>
X-Proofpoint-GUID: yI5syUJYjreWJygaz6WJATH69pUBToZi
X-Proofpoint-ORIG-GUID: yI5syUJYjreWJygaz6WJATH69pUBToZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfXy/k4cGl5bBkA
 08Vc26C0RUQReOO9QtMZgsu5hHf/n3/mJmiRwW5rBOrQvgRl4RtISF2WlUtyynp8up0V0BtuTXc
 /YUcGt7VrCF9efPmAIW+V0qnQ0HTFkfeFUzR+Ka3WOacxslelciegb+tVxrrXW3bzJWB+E5/9Nf
 qWRPIxjCJ3yxYm5pSPa+rsdbf7L8oGDALajjF1XoK/zbA14QqHHdC+OtPgUQp6cl4RckqrGpoTw
 hF3sK+9v0nNEOCvnZeiWaFYADdJ0qgoUq1biezhPxXCQTO2UOv6Lg2e+K0ztatQjbNhwEAL5b5e
 FBDnfwdFnwFSUjsM4QKDCsvy3bhVQCBA48juu5WuDuFloarrghF257aN3odeRW1bezPMjivhR73
 e+zwi/hN
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c99d36 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=N0a9waa89YCdHAc7B7sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On Wed, Sep 03, 2025 at 04:43:04PM +0300, Dmitry Baryshkov wrote:
> Some device drivers (and out-of-tree modules) might want to define
> device-specific device governors. Rather than restricting all of them to
> be a part of drivers/devfreq/ (which is not possible for out-of-tree
> drivers anyway) move governor.h to include/linux/devfreq-governor.h and
> update all drivers to use it.
> 
> The devfreq_cpu_data is only used internally, by the passive governor,
> so it is moved to the driver source rather than being a part of the
> public interface.
> 
> Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/devfreq/devfreq.c                          |  2 +-
>  drivers/devfreq/governor_passive.c                 | 27 +++++++++++++++++-
>  drivers/devfreq/governor_performance.c             |  2 +-
>  drivers/devfreq/governor_powersave.c               |  2 +-
>  drivers/devfreq/governor_simpleondemand.c          |  2 +-
>  drivers/devfreq/governor_userspace.c               |  2 +-
>  drivers/devfreq/hisi_uncore_freq.c                 |  3 +-
>  drivers/devfreq/tegra30-devfreq.c                  |  3 +-
>  .../governor.h => include/linux/devfreq-governor.h | 33 +++-------------------
>  9 files changed, 37 insertions(+), 39 deletions(-)
> 

Gracious ping, I haven't heard anything back.

-- 
With best wishes
Dmitry
