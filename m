Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793A3502A1
	for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681275; cv=none; b=I7ByDIqN3O3T80qC9EUdpp6Qx4Cg+nkvg9vMbgXH5DIaP0GchAhsG0+7pDyhPttilvrrnCZ8AM58nZEXtcqktZgeXWT2L2FJZs+aqWfsL2KC6BpkNdg8Cr2xjzvyTwF7tK+rznQFXKbvfBUrQmr4OwXN9j3nWO9XQSsGpM/+BSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681275; c=relaxed/simple;
	bh=bvnf30nKC3djBvFOcYireXU/JDqAmzp127ARfU81oVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ/vZz4Fiimr2foRd5WIciDeed8C6G2njBxnhNfi+lz7PVGjZga+q9iVLXpY+eblRyJRtKFOXi1kU7WjvsxrI69MyonzND9Pvi7pAqih9TyYP0ACk8M2KvnRBaJyRUEKppzgPX41JLoxmlv/CW6tIwzfJS3PblR6Qxej9SYFsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtrDBg+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnPh7TZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtrDBg+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnPh7TZx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlR2t2552905
	for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=; b=PtrDBg+z1RJoSGZw
	ngQn86Waw+T2U8zDWNrDutSLoe8j2rGOU4ErW+W7tYqptFgesimHadUVZrlht1ng
	CmUKNwb7ereJCI5Q4e/KyV2GRswAopZAku1w5o5l4np9fDq5tIY4CfPbmpZRWH63
	uA1o7cSLf7Fq7TbmIiSeq0pR7CGoHjqgD5H4SttoWiB5yd5o7x4ElY5GVsDiN8+T
	BOZtA5o+WBjmIKIvr1/jXlM5oAajD8efbYjRmeinshLqFUGNz2KNfzhu2IrHFyxI
	dvrhDN3guCj5uHHPZytfGhC2ApcnimbGGdEFEXC+2Haci447ir0uEEI7XhUhjehI
	M2Lj6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g0ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 19:54:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8aafb21d6so159098481cf.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681272; x=1762286072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
        b=WnPh7TZx44LIneLSZ1pvxxcnlZyQcQKz9WBwnj7LcIsl5a8jYz9liurQrRwrhq8/bP
         6tMctvIOe1/E3MwO8ldm8n7LXoohA93838GloEZ0MUqbixkReSHcCvG40+mxNC10cG8p
         F9IttiNS1OjOQWsdEsBGaZGCSU1NZUZ1S+WlnsJt6Lg6wzRRcRq58TnRKPIs7e7HZads
         dhE7RfbnmzMrsM7HvVZjn3OhNJMDp1q8Z6w4L/Ef1pbhzyqYskodmL1pOzIWHE+ORQ1B
         CoFgxCsqlbR8H4jKBFP7gnw7qr7zZ2+pA28c4CVxC0XHM3rIJLEiVpIqjYioCK6/aB9I
         ehQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681272; x=1762286072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
        b=GOck5TqqPa9fg82ffsia2S1Acuhv+KhgvpVS+BK6qpVolTNd4xF0igrZ5ahSCVZvqe
         o5DVnYicAiuFuNQvXDyBrXofjbwOG/SbJJxtXRasfRO5HU2YvQ/+ESCTZQ1fen9ICD6n
         Sl7UbPDlBRqRUHCX1fngrS9ffAqyGxp48vRFHlwaAoyspirNr5265TACOHCBXdnv8+7e
         hiXEDNdQAut7nelNqTg/P8Hv+uRStfvfIzPpZmVnVnaTjU9ESGOTGv28GaZQY+mFQ/zy
         tSrpmFuLyNuvNJiAaJShsABd6AugWSb5+8T5dumInaE3pxgp6HiD5oWNgRs7IbG8TwK7
         ZMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dvKJ+a3nvTPhAGnMT7Pk1kyF6GJZ6810aUf7bKk9iOPYQncyLNh93n9bCd5oRGWHL40SRJxTpZNsJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/YLDz95JHZfvovDDXyiYh4DoPoZZHaajEgwZzsjIiOpxOpWh2
	hqL3JrwS5OYXv5qHuuMxt2kxH9tY4Dxm6mL2nHeK06paCywTwTOVIPdL/yOBbgpZLt9xOwEnR1Z
	o8c1AVUNdJSUJEIJSW6QDDTWKwGvpJ9hRLi8AhhDQnqzTmkuJEPMBehjAXufzOyUPvg==
X-Gm-Gg: ASbGnctTXls+dNFA2Up/WTlvk4wchfWJt4+TwvsytgfHt+5lz6vFHb1chasTiGCEAOD
	Mz1uVwjt+Y3R6gAv12XNDdPP0kkb9eBCW6mP+ZOiRIEd6bfFL1OYa2MtAu5f0KUanGPrA9ZQDnN
	F7Jy/KtlmQSmPJrsDI/2EbSLUXl3W/lltz/qfsRnaAB7eYcrERbeMJecjxLPh0iw/b9jnMPLWjW
	PmgwuCQ2l3KdV9hpm/XAH5WNATxRWEf9+vVpDsc7HQcIRrzlOJy6TeMuOdkXc/8vDD3fNKoXKpr
	99C/BKA2F9RP+bwUfpAIH2LBelW9HZPEkoYvAu3XpmKXHT3hNBIsAJLDQ2BCc88u1zAtOF56tAd
	7COFL9kARBu5emc0VuMgXhDbOs3sKy6zrc9bGejHMXLo6AKW9ZBVRBObNoJUgKG1L2T5HI1mLAx
	r9I4zfo0vj6YlV
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4ed15bb30c4mr5992841cf.17.1761681271913;
        Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp30l/mxiO0/x28DsAYuBVAOl6GnYN2VrIZ7Onq+dUKIoHEjlqng8hPS5TJz3djMSRii/+MQ==
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4ed15bb30c4mr5992331cf.17.1761681271214;
        Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f87f14sm3312685e87.112.2025.10.28.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 12:54:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
        airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
        alexander.deucher@amd.com, thierry.reding@gmail.com,
        mperttunen@nvidia.com, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <dlvkkogiueskk4emkwdkpst4pvqk54ordyuqobh3hzqckuzz3f@gguhnqagpvwj>
References: <20251027081245.80262-1-tzimmermann@suse.de>
 <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
X-Proofpoint-GUID: Z3EYaZa61TJ9T7_imwDG0Xjrf5iI-Ryh
X-Proofpoint-ORIG-GUID: Z3EYaZa61TJ9T7_imwDG0Xjrf5iI-Ryh
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=69011f78 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=G-TusFqAXxKo-7y7638A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX/wnhI34/nYwC
 DnO8L/iI2V2fVDR7UdkSdx8ALt7eNcii7eByH1vaCEeFhA4NPKiAkcBeG1jrdKSinoabq0Au5cH
 XgpXbzCjooYNUfcB7J98hXHshyPFf2KFOisIdjNqkNi8cVL1fvcWNI6RGzZpvmvKFPNZvOkJ3rV
 iCJA3wbafhDoziTXxOi1JT/1o/bkBgvwDl4UbSWCk8ECInTvxUuFS5ro/bTswWLf16MH+hjUOcr
 6guwelcHDS6OkvM+DbY9pNn9l2zbqhIpxmur95IVH7/DwEsOwVbGVZPVan5xNty7MzniESrETu0
 70NwxM/KJVZyMW9+Q3uuR1Ttdoj8vP7lxI4zQKDbYTZo9yeS0tvtrUvK37wZTb+ESCzg94Gsf1a
 GlEun5/qUYyV+7UB9PdySCj121+b/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167

On Tue, Oct 28, 2025 at 08:58:10AM +0100, Christian König wrote:
> On 10/27/25 09:12, Thomas Zimmermann wrote:
> > Move the calls to drm_fb_helper_alloc_info() from drivers into a
> > single place in fbdev helpers. Allocates struct fb_info for a new
> > framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> > create an fbdev screen buffer. Also release the instance on errors
> > by calling drm_fb_helper_release_info().
> > 
> > Simplifies the code and fixes the error cleanup for some of the
> > drivers.
> > 
> > Regular release of the struct fb_info instance still happens in
> > drm_fb_helper_fini() as before.
> > 
> > v2:
> > - remove error rollback in driver implementations (kernel test robot)
> > - initialize info in TTM implementation (kernel test robot)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
