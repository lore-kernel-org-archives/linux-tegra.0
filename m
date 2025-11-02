Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A823EA82
	for <linux-tegra@vger.kernel.org>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101572; cv=none; b=jaGc7ImIN2tKa9zsJ2/jWNh4dFH9b4iqJ4szxVcmc57frK8ySca0p/i/m8Ve1ItneFqncDtW+hhI62Dhqd51vWTAebmL74IQBvQcnw99wWa0LyAMEQD80HXcA0vb+yZeGSOKp8uTZop5NnvAWvwjtiXj9/adlEqou9eyCn+Wk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101572; c=relaxed/simple;
	bh=/wk0r2WF7kQ5J/280jubxtFtMyKSbwHx02KsbYzueY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHElUUSd12Us5i171oyFT9AgvjEp40ffHA8O9mfpaVcTdJlpYQhRrGkoucCnui1t7/MYHwmBNKQFtLj7i65iy+E0xJuU1O9KCSq4Dr9iGhejkb2eibWcQqZ5EqxP2vUEnQMXzzxEfIGvrNYRxAXoPWFJlFgBzkbtCenP/N0N/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MofBD+Fv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4/WYBMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4/WYBMG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2FtaE2523758
	for <linux-tegra@vger.kernel.org>; Sun, 2 Nov 2025 16:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
	Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
	/9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
	gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
	FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
	AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
	VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bg9j8eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8916e8d4aso86521271cf.2
        for <linux-tegra@vger.kernel.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=i4/WYBMGUBnEaKfVK+XxEk/1dI9+8icftO6Ih6AsYPQ5iNvgJNFgMwv/camZavyLKi
         iQawi7tyzOpGmVcVQATYY+a/wPi4CsicQPW/cUF5yPf6LhDseLy82Pqxz+SjkEy5nQwg
         4wzi/Gb3p98CLAY+6k3CJhIVs0luMkkVMvDE7eNSPUtQSm94l9011DJpvMQx3u34fVko
         cYWuKIbJ+sLCBQv5vwAA1tczUf23smCJLhwmSHfjHHuyQPPfs3IHL3PyNKxh19uTDcz4
         bJPp6UeFd4pURhT9ffnL8RHsgcFpcVxZ+A2zdYkNSTfrpLeW5dDQBhkfdPUcxXVoyA/3
         DnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762101569; x=1762706369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=j+v64GNWIGHaJM3F9cndnqxv4ftr/8O8239D0c70bMWSmRb67EDP45axKsDRKhsLfu
         DRW+74K3BS6THpx/24B6a4BhnqAJKzudV981YRSdcyeZEMMAtdjkzMo/4FDVHGC89yZ7
         t3oWmWXTb9xppsEqOr9RONlB++5ciouKsVjAPbhR8F60HM1idK9F9cZQ+f7zYRgRt7dr
         eeaUQdfYhCLb7acjEUihNa4BlONQHYfmzgT4euWWWMAbZ1EJLWLu5ntGsG6QTBI8HP4u
         gjYGiPNwpQCepE7Xm4DIC9DbOt8Oom+67NRCO4XdO9JDizh50+x5ucwQUgBdTtukT1ef
         sGmw==
X-Forwarded-Encrypted: i=1; AJvYcCWuDdnikiCasQkxxWMiRZesVYS+/aeE2YWmyWwE5ZcNYMXZ9SXokjMuUMrIObbbASYE4tn3luJ3wADWJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxw9Nm4bXEaKbmiaP8cl4ESiPzqXgxn0gEvhD1LUWk/0SPDuo
	mDlrq/2q73CK2Pu/jbP/8WPrvbA9AcOQ7o4aQbUQQfKqiI+eNji28AnerJ9G1f9MGVllrA2XcK/
	LG5fyrlxtEDcTkZnuFLovTCd8dZoS64cDXwF7nqeDGHTs7RgsA3nfSfUyQDsvZ+chPw==
X-Gm-Gg: ASbGncuRL76uX7+Jx58W6oLSMfOCI0/P3V9PAsruMUsfzHijnfWxOWj3t4qmqNKkN2S
	AbXtk31rJEc25ssYmkfBKTbz9Zn8GuJu4+ttjAtRZoseRePuCJgjtJ59pp7OFmT3Qt8tS5HgR8l
	3LaaFe2nxBdzcpQ+8Wd4Mv5E07hYrD+EUUtu5jNnJky7qV0MizFxlMBDb6/KoiIFqJkFKDQ2Vhn
	5/CVql4kIzAxCoQfWMI5fCWITNWWKhxxCG9BHR2eRSF2fjoObi1pNmSdUYSi/1nttfRTFvO/fcO
	6DirkYsVqpKxtx/d4UMf/mmzm9w/4RZ3MNURoM/wRPiMwvjp0Dtc35EDiNNGjEL6gy84sIeN+Qk
	/f4ExVt3Ri3vYKouWXaBhJFlMmSgNMmZ6U7Udbsx5Abqfgg2SN2CXtx3u+5E0zC9HPaYz6ns2ry
	9VOUt3rfvlLQtc
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57411011cf.54.1762101568677;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
        tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: WmvMSyy4aq1gWJD8wMg-0p2mRh7yng5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfX190hEw5Up64g
 LcmVG/GRqDRu/tLTEj+QLSb+tBehzhfy6+XpQKZ4qVtrM5KKKGVXHU05CrhtEfoq4yQbcU9sY0g
 4GQL4Lkm0evxaE4TJmqNhz47Pq9nEC3yn2qCDvTWWo5Hj1v0diVL1Z/kSrFmmzzN1rK/cxHzLeh
 DhPSe9dGS4Ny7gdX5pAgo7dSKlaPQuFQadMqyxM/A0paZlRxPYQCLQVIH9fSeOtToEzsRDhJkQ6
 0ZkHuhZvaP28oRzd7nYg5pzFcI3l5vS1ziKm6HqAs+HA26NKzxyXPbbth6UO2/ewGe6eAGjNttD
 XLHv8JA8An7Q8N1mLWNXdN1RZSeNRUdjdM0gG89DnTF06xkySoLJ7z/Jx9dNtI2xqc81kCFQ1F4
 u0QQWaY7FHjUaIoUrTmkWGn0p+hShg==
X-Proofpoint-GUID: WmvMSyy4aq1gWJD8wMg-0p2mRh7yng5c
X-Authority-Analysis: v=2.4 cv=TaKbdBQh c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry
