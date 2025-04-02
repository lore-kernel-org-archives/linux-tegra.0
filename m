Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69519258E
	for <linux-tegra@vger.kernel.org>; Wed,  2 Apr 2025 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620678; cv=none; b=VTBP7Hlhc5crRFux2tFqcQ+80J+5BoWal5uS8kzJEDwMUNMSZYQ7a1TBMGHORgIcgBB/a4jufM/435rImQUsq6PoKYK73iU8JsXJO7z9vHfgm5YI0qpYuK3pzD4WgwU+uFGDZYqRktfvfdslnswi81+BDgTOXg7I7JRU5IjiQRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620678; c=relaxed/simple;
	bh=B6KQGUApPwmdVbHhFYT0+rH4raNW9oq9Cck/bMtgWdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GmrwG40pl6rp8L3SLW8qu/HC4sp0Wl/E1xGd3ex7br2fxO0TVwg0TQDPW3C/D4EGNSySY/e3orcjeKbUHQF/5yQsiRaGZzNBChyMyJmpU1GaRZd2Ukp3ghkoifHExzrKKv/krm0DYDbf+aX3vNq/ykoI/ysI60IpmtLCdubc03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWKsLfo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWKsLfo4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DS460007554
	for <linux-tegra@vger.kernel.org>; Wed, 2 Apr 2025 19:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWBJkjjCygBm9fx50is0sIfTFnXUE+TQIDtlji3JDMM=; b=VWKsLfo4MC6PKo8q
	pz1Aw06MkdrWfhQSvrFnoRtooOhdVHe5D0uKDLMDDvcPd/Q934YVewQ4TO6YoIe4
	Vv0Sd841lWIQo8ayg7kDvADRq4bOWCKeXabuQYFDxEMQcmvjiSq2BajVlDIwjEAO
	p/0Fe4efK4RMD5fLAbOSAQXimMyBszuIeFNIj+qWaLMI7OzNTF88ZY11l7Zp7vZw
	EaETPZ/ymAcwMHGmjeDggea3FpN4l3wHgEeC1zFawFIl2t6iG4uyfGJB3Lmfum96
	kS91FpuBu0DVEAGfCzsMj84d4CGleOzIWYwHtI7/wdV7aFQd2Y8WQ5v5XDf3iOGZ
	WJ5jiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb02dy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 02 Apr 2025 19:04:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0c1025adbso16423885a.1
        for <linux-tegra@vger.kernel.org>; Wed, 02 Apr 2025 12:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620674; x=1744225474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWBJkjjCygBm9fx50is0sIfTFnXUE+TQIDtlji3JDMM=;
        b=ipWLk/5j6gxIQa/YmqwSuExPsWEn8SmKb7scI18DY0EJG3yFfTPlMPmSRRrl9CJhOm
         7I8+cFjRNz8ou2x7NA7/2lWN5m5lYL1txnL0l9lfqBQGNQOEobFa2+ijm8ZyDLWAWa/v
         KsfPXWGOhKyB03PamsQo0Tt/q8jrWjoX6kKu2yumzxXrkx2D6E7zhM1lrMXoI0NaYvLG
         84kNJC2rD95QW2RmLVAMeN7wI3O6bk0b4olozU7cWxLA7te7uilSREVt5i0bED+v9oSR
         UcZD4AeYH+VHGcmlq51TtNlSJW+pNtyM1Wl792qqXpLCWNgwr85o8aA15NQT0nisWFRq
         JA+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2MavxLWcfnrHEyV0w3hj8z71C+yt5HeN7O8fNcGOk38reRaiUlaqRfsfzBAa09kCY7mdVg774fa26AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpZc//WHah1UBWuPspvNctdoKQ0/tVUMKICQnzSElylTfqnHS
	URSQvCBMKGK4vgLupHm6RtPg35kcNdI+c7iflZB2vvzJbzVpAhU0QnDS0Xd60gkU520t6nv/mbw
	iO9wIv5BkKCjFaNeOUDkUNO7HPmsk/bABb4pdWnZJ/Q4ZFOmFCLn9mVEvmYmcvw==
X-Gm-Gg: ASbGncsJ83qfEmd0EHRb0Oa5VjDpNmStLMj949AyYKF1G3ZL6howLK5aofF8XbAzjeZ
	QqoIFw0tptgNI+1SahDJjYjkO67mZKhf/t8wd32lzugx8Y8mh1+IeqyaoRbuNViJ4bJMa2U76xA
	SZccAHhtno5fvAs3967qXM7HHaEUTgVx3oYkgkK7scQH8++mJyZo5yO034bv1TEJg630nyoeXWh
	OKGBbRxEXfqUMdOvTpg2OT5c11pEezFpIHqgcon50ywBUFQnS3IX7tLPMyVR4UKVEcg+OoFZBQE
	j02EV+3QUcqOOhEM2qHVtDP9H5G/53E0hFu3G/a1WYji18n8DIJx3QS+eCKNI0CiT3SdGAHlnNI
	3b8o=
X-Received: by 2002:a05:620a:2a0b:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7c69072add2mr2438610385a.29.1743620674517;
        Wed, 02 Apr 2025 12:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBur0fWjo7yOQcPuAucUs2xiLxZrEWFnw5KrVRkA8NKQ4OAfYtC7kDB0iXCG6T1nj+zDzWKw==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7c69072add2mr2438607585a.29.1743620674066;
        Wed, 02 Apr 2025 12:04:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957f9b7sm1730436e87.139.2025.04.02.12.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
Subject: Re: [PATCH v2 1/5] drm/dp: Pull drm_dp_link_power_up/down from
 Tegra to common drm_dp_helper
Message-Id: <174362067146.2885153.4786307891834552899.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 22:04:31 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: H8m-CwiBUnwZfDPYwjTvQp-6h6xJuZxD
X-Proofpoint-GUID: H8m-CwiBUnwZfDPYwjTvQp-6h6xJuZxD
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed8a43 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3lv0NsTm8rjeSSnkhIQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=913 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Tue, 18 Mar 2025 14:34:35 +0800, Andy Yan wrote:
> The helper functions drm_dp_link_power_up/down were moved to Tegra
> DRM in commit 9a42c7c647a9 ("drm/tegra: Move drm_dp_link helpers to Tegra DRM")".
> 
> Now since more and more users are duplicating the same code in their
> own drivers, it's time to make them as DRM DP common helpers again.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra to common drm_dp_helper
      commit: 09cdda7a60f45784cebddf1fa2109d6279f9890b
[2/5] drm/bridge: cdns-mhdp8546: Switch to common helpers to power up/down dp link
      commit: 23ee8c6b34fdfed970e2fae2b2ac5635303d77b8
[3/5] drm/bridge: anx6345: Switch to common helpers to power up/down dp link
      commit: 4adde49ba497ebd376a164c517152670e4f8eedd
[4/5] drm/bridge: anx78xx: Switch to common helpers to power up/down dp link
      commit: 39f14a01994b5102bdc4632a339a59a03a2f89f3
[5/5] drm/bridge: it6505: Switch to common helpers to power up/down dp link
      commit: f09d9f921f2b7b78e73e9f192a9c08b534b8e5e5

Best regards,
-- 
With best wishes
Dmitry


