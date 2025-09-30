Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF3223DD6
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260962; cv=none; b=gLxDvRMCubo2TpvuDNf3wetvuQVrl8ssNTDd7nxYvhWfQsyES5+xP2CBPF4XH4LgDQqFk7hcQLwiV4/+ghwrxIkJmRqtCPSvTdV13sG81fa55zLK6ViCIXBjjHZMvmfFTOhVP1cRuJ4QDVknXZtLW3d2R5Xp7NXINUMWuBCTFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260962; c=relaxed/simple;
	bh=Y6ASMnKN0lRfzqLVf3QZa9bH1LtfrSUCRUokUivLfvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRKkeg/pOBcw2CXhv6Y1DPtrnlUdMHg3oekZ1QyWfTfFrsiIEpNMWbktWKlZGZ7yEBE7RFbRSzSEivZyZOYHq0s8wT8dJh8JpCPm9LeAFAyBtic77EyQQPISNfYWqrEXaHW2knCWUOxHiuX69swTnxPNMAdVGEM+uuoialUi+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UI9gjTBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UI9gjTBo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBWnuI009452
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 19:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvj2v58WhaULcHhKfkj48JWEN5u/Hdq652Y2OxF3nx8=; b=UI9gjTBoXPG5FqK1
	i9EZzEPIBe4cEDqnrdysIx8PJIqOevx3NoJXnRjIohzIMMjafGjLtNHMiLg2OvlX
	ObpiXVh4VE0LWHyv8MoHsBIjRg0HQUmyq/8WNkm/g1XOpnRadVt3vOwQzhhby6GX
	1NzgDujWs3kbAf2Qujma3/qNDL+F2J+ewQ+Jj4tF/z4LrsE3wwUPr9gp3ygQxrAw
	bv5RiBOk+ykEygkPA5yiaOpanR4I5pQPeycLkrYvSOLCDRuNTeNf34pqtSkiRQMA
	bZuN53R8YM7jKqSzZHHAtKkPz+8YRflLot4cgYN0DfSBad/6LsCznUoSGrGK3bDb
	uB/Tug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977t1b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 19:36:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de23c3b40aso125201541cf.2
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 12:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260959; x=1759865759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvj2v58WhaULcHhKfkj48JWEN5u/Hdq652Y2OxF3nx8=;
        b=dy8nbbj4J4Kg+LW9ljWTnPG9ElSZq8H0fTYtLndAj9FnRjc3DNx010DlJvlJfBnk4T
         Nn8CF+65z9SErnss3PcQ8rClW9b6S8TERs3Yq3hXU4CWZYHVfxbHFdJMyctC3Wlxd0yG
         T4CgzfWAhGg1S/+9gCiW9uLaq6LjEMLr1A11LnUk/LSTccWnYMsVh+1NBwvs4tyM10XK
         vinNoua0W2Z/rNhvc1+X5LFIP5zIvN4R0gd3jXCFATm91PxgCueGHXNM4nDcNZeGcI/y
         w58/6NVgqfbAepbGyv2rSFwiJUsmCMAhjYdLyO8XIqIWZVhFe2eQwQBwbTH6Yr3nTCSS
         2gzA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXefPJ4zIMkGJ6F3YXT7+FTDxzpZNk9Qd8J2JB6F1n6ZYSbHia2oi1GeRNSLXRM4d/vBicQwZP2UMpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAWjNbEhpZkUOEson0lXiIB+h3JvJHDzXhqaKqZI57j+VpJfn
	tPiMV4nTDnNaE7FV5BAw7Vi1rnDE1Y4SRaVYYITpLt+dWWCSUtHyPUi25igCOeuoywWeE4CyT81
	+KJMHQCnT1s3a1jxjWCd+MGCdR+Cfc1GFwlsU+/iSs9b+F9f8BGkGCpunR3xFP4rvYQ==
X-Gm-Gg: ASbGncsWHSQVCZTuk9HVHJzrJnsX23JRMr3mXjyu+h2NsUnyu7FMqg0alREIKSW6STE
	fl4mDAPFEMgzCWe8KNmgCnlNeBo3SVoYWDHye2r1zjP5EE+yHldT81HHJIVTYQ2HiuBK+4H3FCe
	H296ZEUO9ms3+tmBhJGcJRohzRiSeLFioI+gx2hvbMlbBY63Az5kRlbV3BeBK16WucuOrdY2Skz
	5yKH+ooa1cSa5z1yTs4g5PO5pZgE+nuHazyh38Zv/6V9Eieke0tu5Lj5Ew4H+KlyIE8GqatjKsK
	5+mjJavzDmBcvFdYUkZ43cyZH+k5LEXq8vVtPY3GZbOOoHudL2gw/5fZxr44r26jKIuPixIzSFD
	3T73UyEUijJS1Z9VTctYFmbbzC7gJioqD/ofDRsHIVLOgNqI1XJUXyGmHRA==
X-Received: by 2002:ac8:5810:0:b0:4e0:76b7:35d5 with SMTP id d75a77b69052e-4e41c733499mr10629191cf.33.1759260958625;
        Tue, 30 Sep 2025 12:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkNxeFgWyXeWrWIAptA6yK8icuvlqTlnU99wi9RboNE56Zpsc59WiRM39V19vXyZGsqKMtwg==
X-Received: by 2002:ac8:5810:0:b0:4e0:76b7:35d5 with SMTP id d75a77b69052e-4e41c733499mr10628561cf.33.1759260957894;
        Tue, 30 Sep 2025 12:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58737e32f5csm2282387e87.0.2025.09.30.12.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:35:56 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 7/8] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI
 panel driver
Message-ID: <rcx3hpufjmrpzp6tgl75qq5rmk3bcxa6dahl2egpgubu75bpa7@bouekp54w2gh>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-8-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929142455.24883-8-clamor95@gmail.com>
X-Proofpoint-GUID: CrZcLN7Q_YQwdJBokpFudz-myEGlq7lL
X-Proofpoint-ORIG-GUID: CrZcLN7Q_YQwdJBokpFudz-myEGlq7lL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX2w2yA5b0Yo6f
 S/9UZIJPgM35cwqLRhd6uHxN0+a44IF/2Xd4MMCNmCRNXPjQc33rBz9ps6FRsppwWMUBT50m2hW
 4ExgoO6yQK6bF0X8C5wuSFClkOzsuYGalMUcAbd+EkcvfXONVE69iqln+2/o0Nai6Kl15WPdH2X
 iAmbxj3povy0D6mYfm77HrtNaRxDSHHgCJeRzrqBUWEtnTw9TJ8zzZnkiGfjylUTQklM9IMNV7A
 14PR4Fl774++yORevNhBjr0OT2ACgkWzFpGMEIKGcV71brLpujWV9g1djrk5yKQoizyNFnF9ykV
 NpxoXPoZRusAEXx6Mpzo5bzTsiF6Kpl1ZDYjEdEG1YjBYdfbwVIy8OwJuLr0F4WvZc22/ZYVAd7
 qJmfrdgoG84zu2tH9fhDCbe6/w/odw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dc3120 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=r3kgLuTu-6ezLa8AVuoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Mon, Sep 29, 2025 at 05:24:53PM +0300, Svyatoslav Ryhel wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> LTL106HL02 is a color active matrix TFT (Thin Film Transistor) liquid
> crystal display (LCD) that uses amorphous silicon TFT as switching
> devices. This model is composed of a TFT LCD panel, a driver circuit and a
> backlight unit. The resolution of a 10.6" contains 1920 x 1080 pixels and
> can display up to 16,8M color with wide viewing angle.
> 
> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  13 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 ++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
