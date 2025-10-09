Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C63595D
	for <linux-tegra@vger.kernel.org>; Thu,  9 Oct 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016777; cv=none; b=cnjPHyP7Xfcvl4TLIQ3AsAycYwuP9UDlV1B8NvoCxIvzbSK5Vqjdkh9nLBgx4DwpmEmVE/3ltQejiboqBHzb0OlwUJuzs6EYN+UeNbakxBgAV4iN2D2CevHQv7FP02jmINyTbsZqDPuCl5XclC5Wnc3KLgvmwuCkHDnekWQXJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016777; c=relaxed/simple;
	bh=6ta58I6Q1aZWuHTt+8vwHZrputBGhleQ9DK0QH2ht9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Txr/MkgcNKq2wFUExuearBRd5yhvrOc6l9IdwnfACwc+X/gc07ad6K8jFo6H7C82vU2Zm+22gLrP54mbqmAn3+HeSl6zNb/iDm+Wx8Dditcbh0sLS32bWmmzIDAPphVs7RwTV5CRZS5fjd/Ns6JwThJgvyTNdxI10DKIf7ewxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSgjC7lf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EToQ005222
	for <linux-tegra@vger.kernel.org>; Thu, 9 Oct 2025 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
	iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
	E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
	MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
	WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
	Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
	94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u2yfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a887b39b2so1861382e0c.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016774; x=1760621574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
        b=fRMAlYWJm08RYUziXGZmprbpBl6WIL+OX0yEsQbUSu1tv1jMjyBO32+DMJo4R7icGj
         c9XkKY64pNkIzXUeB/FuSz8FBHw3bjc6wEjjQ5GLpqKf7ouoDO99f6qVEM/rLdF3gQOP
         q7PxzWN4dLCDySoNC7+EN9TyzE3YdzRcItDaJdQZPGAGedFFzMeNWOwiaCx9sloiRTWM
         b2IMrcxdbDndT0FKt2Vzh+ZGOLLr58lzSiw3LcnjiUrf+jskG9euCughMCKxvyYzAEOH
         wofK5Rh0NqwZKLM0YphT9W0byWhL9IA0zu4vRaRnmDxZi79/Ht3G7/a5pGfbfWow5wfY
         gFvw==
X-Forwarded-Encrypted: i=1; AJvYcCV89ZULZDh8N7Isbu48/t4Bk1pspy9q3wnmBYBNrA8fYWH+wMSTO50HGWet+CKOD7G6eQl2gR0Gp6ycDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx43faJd6Ds/GORsZuL461oy+/in9g2hjmtXW0YbR6xjq0FeQ60
	acRowqDRgqxrFIEguGsB6ueVWlcPIUmOVZ1a8kvHToIWoENX5GPfTDU4NagkV0oZ99Mz2sjM+0o
	RehbPiybYkZGUw8lXPcwUrcS6LHmPEfm+QZU+4c4wDc/FOOfFgzSlsdquRjJ4RWYnwA==
X-Gm-Gg: ASbGncugWqOwFMEICXvQJLaG/KWFC3hzXehRL1h77EQBcRDaYTXxFH4dFxlpKs3Agg+
	P363uDgEiUW/AVj5QdTaiaRm5zLMReoYxOT8dtNHjSjB9l9RsHuF9WsQvKoUilBI3rSU0PSywGm
	WXhd/OLMx3Pq30g0a92SIapICXTaFk7jxlbXMgXs15uRDL5LkxfCjDz2tR5UnU1ztyEMIgUz9g4
	RT1ANh46AO4ZDApvmpwOL4Hratx5iGQ6p8zzr9wQ7JBAKPR6SCLkF68+nLu9zW6VPidRGuCnXhc
	FQusv/e2YstZHm/xXTstSelSQuXY5PIBMOMKr3yui8Krf2TL54mMvkq/OaDXMFCOxPr0mILGZNy
	JUasw8+x0UyfG6dLGnJPDbjA+gCGUy2oH+BT6HCK2QBg6rJx+NpEixDX5iw==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464549e0c.15.1760016774160;
        Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679;
        Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: v_LFRTCBlqwzGqKIY3mWp1ea-M6oofWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/i14MeqAYnRa
 ZrG4eENAYoCHq7A8otjUikV9puAvpoI6tHyNpDy2vjvbcx9VfTe8Wu7M95TggcM0kgKSrBWURh+
 F6SvDdG48ClBrFa1i5m57sEk0FwquO8Ek1N1exQN6+qGs22be87ji1lIg2GmK+mqYVzkkh00X8l
 zw/GufnhbcWc0bmYqaBYHn5PJP3SWbrcSffQqyyaa5J/DkBfM0F6tuE/bbeU0Pscok5J+2wzkE/
 5bOrri938iC2MtS7TbHgmkVeg7i+hta4s1rde9e2rEVsPpCJzNkMbG9+TBmofG03jGaHYFW4U+P
 ugPfG40s8an5SzAHcVg2c5geOroNpzRJXAslsu6xD44M+Kg8A/IUHb3cKiV7UBSX30NJzBXLTnq
 REN4oPrOkH3nbDvFCez7ZbdRh8CXzw==
X-Proofpoint-ORIG-GUID: v_LFRTCBlqwzGqKIY3mWp1ea-M6oofWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry
