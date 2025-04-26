Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36E22F01
	for <linux-tegra@vger.kernel.org>; Sat, 26 Apr 2025 05:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745646767; cv=none; b=Hh7wK/j9xMxCMsb6iG15M+JnVeOYUBFP2QVvkEvw1pscn5MBn94PDWY3MKv+qMehczOp1Vyc16NMJ9KggFn/TMqouagNrhwDokNMbXM0LtMAgtaigt5ls3PtIPlBzK2zg65MnzFkLebIxb3tbZVBaCsAMQOxpMHypPW2UzCdyh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745646767; c=relaxed/simple;
	bh=v3awsYbJh5b0Z+PsYaMmM2u65oeomrrii4LJE4qg4AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=busJ0HUZ5m2x8MzVc57RghJRwJYvtubIe/YpsriWzx09B0COhIJoMcSfvrIEu/Nou/sK5cSiv9sXXAU6BgztBbJYN6NYKrNlsgsTpTl0ftr5h7rTGYEYGSXM6vsCo+Atl+aidAEyheSlLqDmQJbgd7xfjLkJsngJTgMNAer83EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STeY3nIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STeY3nIh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4lv70012187
	for <linux-tegra@vger.kernel.org>; Sat, 26 Apr 2025 05:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wPJiynUC5KrcChLqRhN+do2f
	Q7u3TtFrtBAAerVGWrE=; b=STeY3nIhQbk54o0P6ireoWGeLAsgBSWr6NRaWQ1j
	g4fKz8JnZXytwXe3hDg+7QZC4rN9pR0Q6VctYSRfSogq92bWCKNWyikjRVaeoTVi
	ltVBVQOOWOLnjbzh62fozs1rFzhjhVUkmRKiQio8PUZaSPWIaAq7G0lHInuNjdkn
	cmiVFXM3qBlYggT3rG/BfEzW7VlQITRSLc5OPwYTU6nilBtEdIytV0x14nVMgp0v
	ZkribfDVy0T5l8hX7KC5Fp4dlXOPRFY84i9t30Um0/+bLAxXTBZOO8lC7RG0q9Aq
	pRbTWFMnZiJiKePP9gJC+mEg0kjZFX4pCCv09wLqfyMuXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb04gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 26 Apr 2025 05:52:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e9083404b7so52290256d6.1
        for <linux-tegra@vger.kernel.org>; Fri, 25 Apr 2025 22:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745646763; x=1746251563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPJiynUC5KrcChLqRhN+do2fQ7u3TtFrtBAAerVGWrE=;
        b=RF4MGrwalPijLGemrsyhI76YM+D94iaLg74BBp23rTS/SkIn4hXjBnvip9XqtRKlJw
         kStyV9bHMrUehWdkUwa9lJ6V6K97TU+xBPl9s/RCkH3FB1mQkLlMRp5kD4K5MAW2iP1o
         4b42wk0gE9J5dzVZqch/DDdSyl0Kc0N9KDb9JoutNimhDLT8cXAJXpCdq3g7KZU1v7LY
         yr3J3pFXBHPJyAzeHp4QVKYKa/ZbxfufX1ZLgrgtDcMOYDwD77hkyrLL3rYcJRKFVOR5
         /aBJgqFNp/FHyX4ULSyyGHFfQ+8EapQMlAZkp3MyOzNsR4cBg/F1bBHwqEPVNLTuL4l+
         XaLA==
X-Forwarded-Encrypted: i=1; AJvYcCX4yjwkELOsm8+SHGrJQcotCt/XsT3JF9IvIdzY9Dj8YShj4bKV8w9NJDoH0uRYkKQK1Tu2pnBnEGeAqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywS6jUkI8dP/w4EUF229ySwpmIXRb6p6kNwzHv6G9ubYvBksrl
	WZvBn0ctzAAOvm9wF2c9OO3a3M08HaJJBlwnGRhOq/rPqWeLMBFg1a2VwLCvxYlWlvamW3TbU4y
	w+w9wUWaOWO5u7waU9Q1ZxHHwG1o8iBQnRljeHkIbBi+qARXJ64PswV7zBwpJ+Q==
X-Gm-Gg: ASbGncsLWH2Nnnr5ORAaFHzy7F3T9Wwe/kxQ9jOyHWemE0x/K/nERjjjdn8lkjM8vrb
	6bu0tWZtC4mOIAIuHMUHMQs5yBBAvWv3WI4zlaNpcE81wvKIP6TbaBgJVbCcduJGTGMEzsq4q57
	qI1Yak37k26D1axMI1CvLzW54W8/bVWzHS2jyXDbWfjhe8dxYCR3hUuNr0YZhWJo9fLgLGunl2B
	yR/5kxnvMk+QGHEof3Wwh6tX6LnAjcsKx6SOou2uxVcIS9t6i7fpIQl3xZwy8YuulmfqOrNNP9l
	nqtRbFpxmBB60+D1XzBDpRcn7ONabctYyCN5ighrt7+0anOuPptgdnpmVwwqJuYRpbBDgiWRLAY
	=
X-Received: by 2002:a05:6214:29ca:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f4cbb5893bmr70485336d6.40.1745646763443;
        Fri, 25 Apr 2025 22:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGfnM89hyAQV0jPbK7IhI4wD6nEJfo4E+eFt6OFBoKATt5UnIfwc6pP9Q3dfmcI6nbIsPN2w==
X-Received: by 2002:a05:6214:29ca:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f4cbb5893bmr70485266d6.40.1745646763120;
        Fri, 25 Apr 2025 22:52:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d27sm10503671fa.107.2025.04.25.22.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 22:52:42 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:52:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Message-ID: <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>
References: <20250412070047.6725-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412070047.6725-1-thierry.reding@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMyBTYWx0ZWRfX4RdbO2+s8yac myEqD3RpRPS62KtH4910lBGJSOQpVkeb7fTThzOaE3BCQGVybS2C8F1Vto9n3jX+KNWm0FGo1Mg PAZTeV9vgqcwfcvADJecB+XHmUK1sYQJQlCPl8tRLckheZc9eIo5DUpFFBrcqeGkDSMrEwBIyGa
 QkxMIY7k9UzSG3vXsJ0TzJ7OOH9AyiYNMSH23cnAjx4ZJHJI21Y+nVj3S494yCQx6e4k9l7bYhi MneoAK2WaUzyBijy4YO8HDUgUSh57RHGQSRuFjF9zmOe6xWyVm068IL6a+ZyzpTl/EZGLhPm8dk m6MxuDFrm9l1gcaP/DPJG5HZdkdLpS/3Kheyfeupjo2HStV8rG4Okpi9Ss56Adsfx2drY8/dMwk
 WeFthkI+rKtbLE2cU6Cg3wwNsFz50KCVBY1koEmjNgKPRarJiePAz/s3CUb+QRrts4YRR7xb
X-Proofpoint-GUID: r-n5s9G-GKCs2LSoQKJSxsgjlL5DoMBO
X-Proofpoint-ORIG-GUID: r-n5s9G-GKCs2LSoQKJSxsgjlL5DoMBO
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680c74ac cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=IgeXuqktetCwhAi8AUwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260033

On Sat, Apr 12, 2025 at 09:00:47AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> 
> Unfortunately, this causes the following errors during boot:
> 
>     [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
>     [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95
> 
> These originate from the fbdev client checking for the presence of the
> DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> not support DRIVER_MODESET this is entirely expected and the error isn't
> helpful.
> 
> One solution would have been to conditionally call drm_client_setup()
> only if modesetting is supported. This seems a bit redundant, however,
> and could further complicate things if ever any DRM clients are added
> that do not rely on modesetting.
> 
> Instead, simply add an extra check to ignore this expected error and
> skip the fbdev client registration.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..8c8552ed912e 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
>  
>  	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>  	if (ret) {
> -		drm_err(dev, "Failed to register client: %d\n", ret);
> +		if (ret != -EOPNOTSUPP)
> +			drm_err(dev, "Failed to register client: %d\n", ret);
> +		else
> +			ret = 0;
> +

Wouldn't it be better to explicitly return 0 in the beginning of the
function if !drm_core_check_feature(dev, DRIVER_MODESET) ?

>  		goto err_drm_client_init;
>  	}
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
