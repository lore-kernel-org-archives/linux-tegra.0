Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30373BBA05
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145056; cv=none; b=N2Am/p0qeUmX19D08AAioHELTq5GU5T+zwWyRchm042SRDp1WGHMHaGReWM5JHHVVk8hPktD5mh9X8nfw7QuEkk722O2Oidn2hPMIA9Qyv0umtw3HXuA1LXrMStFY97zPoayuuM0LVm4ZUQwTjG0wnN3c0UJCWBPF7TMWgcHBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145056; c=relaxed/simple;
	bh=cSbnmKIeK5PiH7jDW+BQqyiKxH8RY05vb4L396PVn/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcPfjeWHoqmeVZKYzoub60Uidf1OvakunXea09TbcMJoCgWond6wsofB6CfvRzh1Sag2wfg733beDtvIxfBF0nH1S5sMcgADjZsFqeq6UdP0lD1OGiYtzAz/9s1n1+/eTYdaRxnc43I+PmVrCPTiu2oFA7Tibhg65MGNMtnNMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaj2kPf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaayxXqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaj2kPf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaayxXqs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pYUw1424511
	for <linux-tegra@vger.kernel.org>; Thu, 7 May 2026 09:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiLRyqVWGS0Ix+7Et8ZETjKI
	EZ4pzdPJfw5gz/TlT3w=; b=aaj2kPf7Vt70KA2i3+8H5rqr4GaTBRUxUXfFCAIX
	1wdBO8jPUfsMqMrznswtbQ2P2Sc+PW6u3Lv/QSqcGF6r0+iMf3u3kaQtK6o9hdEQ
	CbqLEGnxg2KU0oLYXWLl4EXauJIGscXmUQ7FkaJ5ATmeVNCi9CPdyPreNdMhujls
	lo2BJ7dWx4/ULLNGvksEnomZ1gSIjLo9AVuTUsGBgxibOK+a9ikaCy7nV2o1vnKy
	+7+q98leDPrDHpE1aow5LsCT1+nLVzy8Pwfnb6CvPbz7NcYllukprl0QwQL2LNMG
	cMQ0cNd/S3qW7IY5fCfePp5fy9uOvRNQhHlP8BRedEPrmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqframq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 09:10:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff051e189so12105521cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778145043; x=1778749843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=eaayxXqsFRTvarNydVcHFRARBFPSw+J57YxMg9pETfh8Dga987mHzV4BWW/Np7q1u6
         g3MtwRlgZ4/rQksxVHQQC8hyu5qCqtpMHtKyd/wNSMP8q0I6bp86lycopKq+FeOBuKPo
         NpLT19srU4rmTZH1UMu+19x9fCIuFl9TIfS1sdKzQMGIv97rsHnoH7SWVVHEjjqsZywM
         Sxpft5Hd5cGHKWV3zLyFrAyDiFaSJiq/qQhN3Or2GP0TXk2ZJ93X7KCxnZnPEaxGHYwv
         kf7u6M0+fxHKa3WueAMgXYneJGNfFvv1cPPfyy1cFfYmezT+GzBajtZi47wIu8toiRii
         68ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145043; x=1778749843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=Iz2rm/x+zetKYJadBSXvsAeq2UETezI/4YlpZSvnF1jAR/YdokRf5Yz+SZlikk4zG8
         XuDr+U5/d4gSW5VfBVbDtBpqJD9DHWxjGmUxKi6qUjSyvES5uBrj/JcJpwbZgaBbjLa/
         Mk1tkQargkAIm+S9YS04GpDwJGpp7FVbUJ2pFxDM94kfzkBnGLguQ3y/1J3s9cp0WeB8
         gkzUDfJkAIMUMQkFCkormLFe6EGUWAefwD7o7iNtclIYdoauz+irc9kiuTEhJC00cwAL
         zmTDI23BYi+HkGJpAcW6NxYRW+R9Nuq1itaOoBOTJFyBENwO8UaS6v9nPS42281sNRDP
         /ftw==
X-Forwarded-Encrypted: i=1; AFNElJ/6qWudX/VRBXzXjpbO/KEUyVy7xHt6z9M1mdnNe34B88pfzC+7Z4E94exxturEouv6KDIHm67ubLQNcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGDcUD/klkE9iJf4MzDzBFv6W6GMvWJx0B2ARr10iXDV46IMi
	UMoPMqqjjFH2GBHfPV8DH8fKnDNIwMiBE/x8WOlEvqmdfAFapTTCxQQCO4WIlhWmXkUExviPDwH
	MZIkcF90tTUt1KRkOMazgny7ztmDQThIe0ymehTe884P4rGC4hUIeazkJ2+igTNmIiA==
X-Gm-Gg: AeBDievahGX53rU7CgRn66rULGT8Jf6qQvb9lsqHKK23b2MhUDikjSLCiyFTGN8kDlJ
	/1kVETrQQcN0caG2kW2riurQ4FshNrPlj+sKdoblcxUvlNxCNLjao0seccpCsiHYuYPDUPo1TE3
	Pfq2jgi/L0355RyanqTGy0MYBn9pagsNrF+uASL8Zd+zl9ZVbIdUmAc2sCKS3JKhqDsLxzceQR3
	rcyU/A7kCSHltgT/BUKegokMiUWGhG3poyDX9W4ZjMvNV1TxA+knkLrgiQ3yRIv4/thzcoyyKou
	i3oS55BezteutRzHN7zEKVa7IX0z0wYSdzBJFn0lTteOxYNQ45foXiJF9RIYIEe8PHZ6nx2sbpm
	gWzpJkBPzxf5NIKPIpgWJvD1GvxUVcHhUW7f30kwzmpSuznhhbft55DLCJIcOBdTcaLrEe3ghbC
	hYuKPDp8tR8iC8w+zSEtwinoPTLY09/Ip3R/R1YEG4JPVbFQ7gM+ndPyc7
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989744385a.44.1778145043097;
        Thu, 07 May 2026 02:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989741085a.44.1778145042666;
        Thu, 07 May 2026 02:10:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86e65fdf6sm3822632e87.78.2026.05.07.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:10:40 -0700 (PDT)
Date: Thu, 7 May 2026 12:10:39 +0300
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
Message-ID: <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc5713 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=RJIkCpciCD5dGSa3Y80A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MSBTYWx0ZWRfX8ES1r9jyBUgm
 AW52DhTq7eqiTzyP7Y934wu9wiD3R5DyfdCgiuMq/1wcpQYzrAyWBWrFrEtIMzOyoOiHWvwyuGt
 kCP3iiGNl6JPvJASLfR2s9nXiYcKdhFipIQr3yNodXRDgi3pfKTcPfyb49H6nZqG4S8g6jJoTsu
 TtDPeYyf4TF1eA6nlLQ3g82cwfMTDGI/f/GUrZxDlr5S7Gfb9EQj26Mk+WXytSNdo3t/3D28+m7
 imPTtkhxFe+3D0VA45ZZDzwtXiaBVN0ZuwHPGwZAdN2jNqbzpJCEwlfMt/ZQHMGDODdet6QImm2
 DbbaJPXv1LTYJASrhgErHIHkDHISW5GLoGz/Ca3tOm5Lz6dlAcqsW9/3xU8Qgxt1cXGL0ZZzk0u
 1PRbSYAqaLkHpuv05CvN8KvwJ0gQV26ehSAvGQ2ztb+6QWS+XQZ7g3YiuFonb/iu2x39FJ3vU4w
 xxgVRE+vtThExwxT5GA==
X-Proofpoint-GUID: 1MltQT9e9K8DRR7B2ycB5c_R-jfc2akY
X-Proofpoint-ORIG-GUID: 1MltQT9e9K8DRR7B2ycB5c_R-jfc2akY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070091

On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and ram is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.


Could you please clarify, does this apply to the common commercial
Glymur and Hamoa laptops?

-- 
With best wishes
Dmitry
