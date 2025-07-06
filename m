Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B9201113
	for <linux-tegra@vger.kernel.org>; Sun,  6 Jul 2025 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799973; cv=none; b=Mq5upHAOmpv28dt9ussu8JKtrizsKKdVt1Dbvb25/LOGipDpw23yjnilPkszkVWiJilhIzJky2QGUBWISK6OPf0axTpJ37hG4b7Mty1wkqKkEoYYCvHMpkG+FMMxgHdDCAcKhkihOFz+9Rzmkxszjx8YBQFtLFvBFe7gcnhQhdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799973; c=relaxed/simple;
	bh=A59nXS+mbnEaSYMFxG/JqiqHCM/ApP1v6hb6TD++ILE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ek9pWLBTPD5ORVO1f1xTi5fTwnsAK4X7f9Cbub64d+CdW4CHNGwTEXCqEBEHjA6Op0Nz93fKUYgC2dq+nZQuDFFxwbwviVS+4ArwZl649e1YdBH+RMmQpXyS6IyN5WMseFQnKMdrfeKlh6iHD966qxD+RFuaFc64p8sVppxFAug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WT2PbVLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WT2PbVLZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666OPph008766
	for <linux-tegra@vger.kernel.org>; Sun, 6 Jul 2025 11:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOhCEmF+uV+au2Gk6pPccqIbZaEi6QqNF6NnOQEKyi4=; b=WT2PbVLZDLLyMqzR
	CeaRMGUmrLHO7TB+C8NYp7uDBxngRbAynVqmv/NTZK9dEPYfP6GEeVM08neRAfZ1
	Lm+W2lAilqGoziTONOiJZvPU9dKnme4nFW/J2U5duRYPAU2Io/HNMim97618JsP3
	y29xMuBPfm7eXdhvadvN3sDjVBY00FEfz1DlKYFkJiQ1b7+QPJWhMtzpS3p0J9I1
	qZB/63J/tsKwhbTFl49ht+xR2cMsnZwMV1PN4wYN6366/d4s1QfJ5P76Leusl8cR
	JJtiC2xQ4MtDxSPOiTxop35jsKIFP3TdWmUwJkFVG/umr56i8ZxUdeDFHk936rbx
	GXBqFw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk3p92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 06 Jul 2025 11:06:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ff810877aaso59899336d6.3
        for <linux-tegra@vger.kernel.org>; Sun, 06 Jul 2025 04:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799970; x=1752404770;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOhCEmF+uV+au2Gk6pPccqIbZaEi6QqNF6NnOQEKyi4=;
        b=lLJS/J92Gi1VxH1VOUMqElI8cvqinPWHLLzp9ntkyqEQji24V10RmOqTS6IrgmoY0F
         Ebcloox1tdq0X+0telq8nyNrzsmA3sdZFNFg2Hwr43JUT6tfEFyyONeLlN/fKfp0REhP
         b2z+9EU9e+YqsG/2hW9kze6XEHSxS6Atnvr94V+nrr/U0cLa2dVwzW0CCVvdFix9CRkI
         zgUtyPs2RtfL1+qNCVDBZsUK1HLW0IVIk2vJykAZi0nE3utY2Z+ErRAQS12AESWQFH8v
         Mn+7Bo8i9tkNtyN6AiPwO+Ky0kF5S4UEAorvTgk/8ikVcC6ImEpOqggNo+xYIo9W6meu
         ixsg==
X-Forwarded-Encrypted: i=1; AJvYcCW0hMNzWyeFzF1Xp3ViaXt//4L88alhdidCxV3UHbTXiH1YEgGoq+zoOhj4nRt2YrHRRxAYVn0NSUQmYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzlnR1n5im2K42vhjDTIZdbmH2Ha6dO94r10aI/8spGR8I6MaN
	Fhequ0bEV2r+K3j5FEPXgfnW6Ni7X05nxHdQ35L3dykHMmaxPNP2WJfexg/lYV5cEc1BHPz36eG
	vKrI0xZGA+bazo43/ys2aNb5T78z6mADo4xkyfj9AXSCaQjKiJ5AQ7ensY27s929wcA==
X-Gm-Gg: ASbGnctFHE/RdCBzwE35uFDufKTLQr1+7Wj8eRdh9drndc6tARJySXP8ZUgK5bGCa80
	3rE5wsgZRBZYfOVwtWlN9EltOx3ecFZ1g5LpeCY5Y8KPwPBaCDKvZmwbkpMezq7JekzY7QNIeM1
	caw0q5GancqZbNCz3CTeyAGFsJcoFw2p1IScezWZvldZ1Ejeg+pjfVVTBPtolQg0YLhC5HZTENL
	zJ7G+HJ3BYWKC1d4+kOn5MDrXzwnRybMU7xjwECCnLFim6MheWKGlIk94FSs9bFNNkhdq3moRWn
	pJVCSFSbcWWoeyYvfLtbc9IAFI0Af97RbjFfpR/gfFM4CehP0nhRO/J/gevJ1KYMSr+p85Nyeid
	CB6N4M91xK583QFBh2z5lruU0hqzdO29RvuU=
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1166925585a.39.1751799969897;
        Sun, 06 Jul 2025 04:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGONDgnDnvrSDe6qvx2fU3hNgdKW6lnSf2axuoSi2pM1AUPmOnALDeg2BDGk/SgSQqBZddqxw==
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1166922685a.39.1751799969465;
        Sun, 06 Jul 2025 04:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d16c7sm918063e87.253.2025.07.06.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:06:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
In-Reply-To: <20250613122838.2082334-1-thierry.reding@gmail.com>
References: <20250613122838.2082334-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting
 is absent
Message-Id: <175179996829.2704907.4823332673925452896.b4-ty@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 14:06:08 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: MNHRHHZgZ8D7osL-vExcQa6czXNrcqm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2OSBTYWx0ZWRfXxF5Fdv0ee+qB
 86cPQzGds9BVdjrb9FnT5Nz6l0u4oVnhXuy6JRauqki6raDBqtTqZn4QoBq1mCw9S0KfkNkAmM1
 e28BvLRlmrSIYji0pm4ZLLWZsImtX20ianik8+XS0jJkUXCOxvSXZ+pzTcKi9Azo1L3ew6XEQaJ
 J1xUfK7a4VM6LHBL1aKcWnwxtvB7YR5WZzG1mYLm+v//Oi18YIZGdLn5D+Kf77M9KzIZTuTRGYs
 icVMpHKNtv2+ZQ30yRLyKDCErR59h84I0/crrNLVXnob17iVO1tqmWc1sQ+edt05cNH1gBgdY+A
 XhKS3EtQoU8AvMlealqUfNcan0hdBxaSOhHD120AOSbI4t+101K2t7hvDvY0mErlscMykct5Yy+
 GG+IbV+q8631CdughIwZhJny09qroEzYlBwIuMdXJfiTY5M0zFmckl5fBgTZ4TgRmB5D5WZN
X-Proofpoint-GUID: MNHRHHZgZ8D7osL-vExcQa6czXNrcqm1
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a58a3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qTWL-RXyTIDn97wEdt8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=982 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060069

On Fri, 13 Jun 2025 14:28:38 +0200, Thierry Reding wrote:
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> 
> Unfortunately, this causes the following errors during boot:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/fbdev-client: Skip DRM clients if modesetting is absent
      commit: cce91f29c088ba902dd2abfc9c3216ba9a2fb2fe

Best regards,
-- 
With best wishes
Dmitry


