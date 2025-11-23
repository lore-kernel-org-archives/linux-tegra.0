Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410221D58B
	for <linux-tegra@vger.kernel.org>; Sun, 23 Nov 2025 19:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925648; cv=none; b=WgDFQgTIXYWS859sTQ0FVmwQs503SbMEwqbuk68cc/ThGJwHumr4ukIE0i/hLBKbGa9xqUdG7eC8n4ir3Ex6SBCMsXpTg0k0IqQNP3fr8cNkQ9oQsdbnidhNyMF0soS8cdxejCNfD8pnO2zTdlLPyWDTSeQR3sxodVBIOhowaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925648; c=relaxed/simple;
	bh=LUcueLCAZgz7S9Ln/O4wwRIIOSY1aAyRYkxo/XaceRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMxGtSjcf8OZTnizeCz8yTjXBGSokv99hL2ihl/gd6QdeBJNfeTj0mf2trRkrE9qlEezNHK+TXJzvznFqw6ZPwYLpsH7uDzPGg0JoYRpljhGW53mxdDyFrGAcYtfB2617WzKBIPnX3nG31lxyn3AdYDVAGuJ0hG+Z3HsTFeJuvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf0dGBt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlKWmpsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf0dGBt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlKWmpsR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AN6hliK733668
	for <linux-tegra@vger.kernel.org>; Sun, 23 Nov 2025 19:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEiXO7u5VocRb3r82eEOHQVCjjRA6YP9Evo4VbzQigk=; b=Sf0dGBt0XFEovYF0
	BF1RYgCzPE3rLXygJN4wLgSQEOaCnDv02zTn2bSr68s0xQs/yFDwwIkaU5pF7y1Y
	mQLYmRCIECr9OJuqyLrXaCjvOLXx5A3npausluRr/1Inmucje9LSQCwScJXCNkYC
	W5UYSexqSUrjlBBB18JNdLEcWGYj8axEWvS8PikrIIjBKbmwmrVryZ1DdAH85MKD
	VNBv0NN3xGqMUthdQs1wD11xNoYb66fbGwh1IzgGspcqxlpDzh+wNoVTrvFP0gXv
	JSg7XuTuf6LLTRgLvZaZOFEMCcReH3PanHtbDn1Ds2mXkpHDdU6gcE4nIixB+LVW
	wrJU7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6a52ucu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 23 Nov 2025 19:20:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so75310591cf.0
        for <linux-tegra@vger.kernel.org>; Sun, 23 Nov 2025 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763925643; x=1764530443; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEiXO7u5VocRb3r82eEOHQVCjjRA6YP9Evo4VbzQigk=;
        b=RlKWmpsRZVJFjLLEttUDDpDHgwvZy3EXeXK+UzU1XsGq7lvoKK3f8x1Ckq6gxXWI7W
         TfQbja+wc15/NffvPLXL9TFRZdk+Rq+ZDZM+Mw/LtxerkdmT5I6v52et3GLmbuaHYfgH
         1cqDNXFT9HH23b8a058jVgPq7t6HBMxLcNIrsjRFJ0cN4b2bOY9ge4Z66+B3g3s7QDU7
         cFhf9H7jLvHZ0rLaN8THTo7fqTICtv8wR46SiRiarIdrJxHotZeZ3F8bBaSYT+zC3Yqe
         VrSYthEUjZlxZMsazbYcMgbH363/F92cb/gFkKV2J4MEGok4LNIKQx7AqUct5U0yCxY2
         FWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925643; x=1764530443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEiXO7u5VocRb3r82eEOHQVCjjRA6YP9Evo4VbzQigk=;
        b=SGmLQGhIxdODFUtOGdWc8UOdZKU7dWDri9wzdGS8wjdOz3BC0aRO5F9XvAqUOY0FGU
         yLUDJmFXBJu4/IGC1KnFeQR641t1rdFHnJZuJlVCYGTI1VWNK9MkAbAITEm2K2J0lIpy
         rz53D2V5bc7e3PQGB6esLOnt/1ecmYjaLqRCij1TIAYcSkTEt4n/YPlaA5eG+9TJS7aJ
         la+KP7q+TN2AGTnjM/mD3UANVR2e0XKrbmZDgV6mYQ/2bxx69LG+W897vUez4pYDxTqc
         ebrMkbgtekEN1yepwtP5PeEdSL4VmUWHS3nZ13P+PDG3IC4sjG+HExhAxH5LBNs2IEA2
         zO7w==
X-Forwarded-Encrypted: i=1; AJvYcCWB0d0xmZwwdSbayoTcIohDzfYhMVuh1nD0N8jRCZjsxBvYiEILhU7BEXZdXZg8tijLo0uvw4fPrV6G2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSUFhAy4xMCNIST/OsxDbY5LYFGMOCfMHyO2Yimm/niW7eQDN
	E4/7j4vrn5I369F6jb55rzPN08Bf0O7cEn+/pY4zOQc2l8oAPWxp4Q9pHgK33aKkCE+m5ImBlQT
	Rfz41sE6vr8x5SN8WTLmTMb53vrMeoGDRQHJQz3mKNYrhga78t9FObpXbjhbTLkyMoQ==
X-Gm-Gg: ASbGncueY6WcdLJNcm5AjKHsjKmwrQCG1+YiVtjIdzlJhiX3Fh3OiR1JQ6zAZpPnNVI
	nh0MkpSmAjwGGpOwKpglAvyw6AIFK+r4JsunsDUUTM7NM1sm3ho7M4IubMtZ5497bMgpfJPfVJz
	OqaDukxCghAHuhwGq+Frb7kECbr5yVpTz+pOn07E1BLVgB1pkoZN81/CouxFp4a3/myJT2CL1yg
	BjXnU+BVpp0lg7UFt7Th/g98Fy1VqeFt6aDshC2kymSrFnxn9iXY+1kILxoXHk1FUdsp3/+PzEX
	0aO1QqZjNw3Pjgq+xkrOnvXCkwlOgm1de+IF5qoa1+5kc0KM6vDsQQFna4NOJuEq6IuxbbtwvB5
	R47Pi32o+9unTL4RBBZAJdX0pwFCkk6iDb4D2o5UbJuCwq4vat8xaUylonkP1FaWNcgXWYyRHPx
	dKLpTQtmbIV+5TC2rCcqObK9w=
X-Received: by 2002:ac8:5d46:0:b0:4e8:ad19:99c3 with SMTP id d75a77b69052e-4ee5893ce0dmr117419871cf.77.1763925643423;
        Sun, 23 Nov 2025 11:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3Yup2/9S4W1IWJ3bLjkmaAkW2KJHuvHSm1gFLwmu4B0T1x3e3FHTABgIGPTfm/mTUYKkGUg==
X-Received: by 2002:ac8:5d46:0:b0:4e8:ad19:99c3 with SMTP id d75a77b69052e-4ee5893ce0dmr117419621cf.77.1763925642898;
        Sun, 23 Nov 2025 11:20:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbece2sm3539982e87.56.2025.11.23.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:20:42 -0800 (PST)
Date: Sun, 23 Nov 2025 21:20:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Robie Basak <robibasa@qti.qualcomm.com>
Subject: Re: [PATCH RESEND v2] devfreq: move governor.h to a public header
 location
Message-ID: <dxix77rmlfm35msklrbprxz5wipe4ug4kjexqezm4bluccm42w@3voi7o7sqh5j>
References: <20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>
 <310a04c8-c268-4ff8-b185-94fe456b85f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <310a04c8-c268-4ff8-b185-94fe456b85f9@kernel.org>
X-Authority-Analysis: v=2.4 cv=Hup72kTS c=1 sm=1 tr=0 ts=69235e8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=hD80L64hAAAA:8
 a=0lGHc59NbHFHm7JOwJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: etydjZs1bnaAXcaeJFo12p7d6Gl4hUHe
X-Proofpoint-ORIG-GUID: etydjZs1bnaAXcaeJFo12p7d6Gl4hUHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDE3NCBTYWx0ZWRfX4MCmNox0a5PC
 uL9DjaVmy+z4myUODvmxgP6qYUBXcgRB7C7qVVETizmYFC9c8dBHuSjl45hBPxDNkFiDSPZSoF+
 UDIWtJj6hGfuXneXWZqxXDzQ1t4FaqBE7e/P6NGe5aYx7pyQVJPAKeXHg4VamQqqX4LJ9VeAD4F
 sfNEEXb+WoaVQ8GZKu6spWpmwJ/bWt5CCRypxvVlefD9KWiixEg8BXIQUHsJADr4DxXcFvBm831
 HsnjJhuUE235YgvgpqnpV/NrjV08Zl3pbsdnrb/g5ArykCj6p0p13sHRCwbTZ733xZPsPfeZpoB
 iDBOg90JCUwC1iEI+Mo/FcXv2/8ATeQABoSmXz8A53mLNF7w7KWe36hHggEOv3V3M2rjpb7AF4J
 SuRBpq0JwOtmnfthy1JktfjUWf2+bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230174

On Mon, Nov 24, 2025 at 12:03:32AM +0900, Chanwoo Choi wrote:
> Hi
> 
> I applied with following consistent patch title format of devfreq patches.
> - PM / devfreq: Move governor.h to a public header location

Thanks!

> 
> Thanks,
> Chanwoo Choi
> 
> 25. 10. 31. 03:26에 Dmitry Baryshkov 이(가) 쓴 글:
> > Some device drivers (and out-of-tree modules) might want to define
> > device-specific device governors. Rather than restricting all of them to
> > be a part of drivers/devfreq/ (which is not possible for out-of-tree
> > drivers anyway) move governor.h to include/linux/devfreq-governor.h and
> > update all drivers to use it.
> > 
> > The devfreq_cpu_data is only used internally, by the passive governor,
> > so it is moved to the driver source rather than being a part of the
> > public interface.
> > 
> > Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
> > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fixed typo in commit subject (Mikko Perttunen)
> > - Link to v1: https://lore.kernel.org/r/20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com
> > ---
> >  drivers/devfreq/devfreq.c                          |  2 +-
> >  drivers/devfreq/governor_passive.c                 | 27 +++++++++++++++++-
> >  drivers/devfreq/governor_performance.c             |  2 +-
> >  drivers/devfreq/governor_powersave.c               |  2 +-
> >  drivers/devfreq/governor_simpleondemand.c          |  2 +-
> >  drivers/devfreq/governor_userspace.c               |  2 +-
> >  drivers/devfreq/hisi_uncore_freq.c                 |  3 +-
> >  drivers/devfreq/tegra30-devfreq.c                  |  3 +-
> >  .../governor.h => include/linux/devfreq-governor.h | 33 +++-------------------
> >  9 files changed, 37 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> > index 2e8d01d47f6996a634a8ad5ddf20c5a68d1a299d..00979f2e0e276a05ee073dcf5cd8e930bdd539fb 100644
> > --- a/drivers/devfreq/devfreq.c
> > +++ b/drivers/devfreq/devfreq.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/stat.h>
> >  #include <linux/pm_opp.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/workqueue.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/list.h>
> > @@ -28,7 +29,6 @@
> >  #include <linux/of.h>
> >  #include <linux/pm_qos.h>
> >  #include <linux/units.h>
> > -#include "governor.h"
> >  
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/devfreq.h>
> > diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> > index 953cf9a1e9f7f93804cc889db38883bf97ae005d..8cd6f9a59f6422ccd138ff4b264dc8a547ad574f 100644
> > --- a/drivers/devfreq/governor_passive.c
> > +++ b/drivers/devfreq/governor_passive.c
> > @@ -14,8 +14,33 @@
> >  #include <linux/slab.h>
> >  #include <linux/device.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/units.h>
> > -#include "governor.h"
> > +
> > +/**
> > + * struct devfreq_cpu_data - Hold the per-cpu data
> > + * @node:	list node
> > + * @dev:	reference to cpu device.
> > + * @first_cpu:	the cpumask of the first cpu of a policy.
> > + * @opp_table:	reference to cpu opp table.
> > + * @cur_freq:	the current frequency of the cpu.
> > + * @min_freq:	the min frequency of the cpu.
> > + * @max_freq:	the max frequency of the cpu.
> > + *
> > + * This structure stores the required cpu_data of a cpu.
> > + * This is auto-populated by the governor.
> > + */
> > +struct devfreq_cpu_data {
> > +	struct list_head node;
> > +
> > +	struct device *dev;
> > +	unsigned int first_cpu;
> > +
> > +	struct opp_table *opp_table;
> > +	unsigned int cur_freq;
> > +	unsigned int min_freq;
> > +	unsigned int max_freq;
> > +};
> >  
> >  static struct devfreq_cpu_data *
> >  get_parent_cpu_data(struct devfreq_passive_data *p_data,
> > diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> > index 2e4e981446fa8ea39f65b09dddff198c0b8e3338..fdb22bf512cf134d75f1eaf3edb80e562dd28bec 100644
> > --- a/drivers/devfreq/governor_performance.c
> > +++ b/drivers/devfreq/governor_performance.c
> > @@ -7,8 +7,8 @@
> >   */
> >  
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/module.h>
> > -#include "governor.h"
> >  
> >  static int devfreq_performance_func(struct devfreq *df,
> >  				    unsigned long *freq)
> > diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> > index f059e881480465b051f27d740348adaf779aebf0..ee2d6ec8a512248f070b2c5bee8146320b7be312 100644
> > --- a/drivers/devfreq/governor_powersave.c
> > +++ b/drivers/devfreq/governor_powersave.c
> > @@ -7,8 +7,8 @@
> >   */
> >  
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/module.h>
> > -#include "governor.h"
> >  
> >  static int devfreq_powersave_func(struct devfreq *df,
> >  				  unsigned long *freq)
> > diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> > index c234357363675508c12732a08c1cd26c349039d1..9c69b96df5f97306e9be46aa6bb1d9d2f8e58490 100644
> > --- a/drivers/devfreq/governor_simpleondemand.c
> > +++ b/drivers/devfreq/governor_simpleondemand.c
> > @@ -9,8 +9,8 @@
> >  #include <linux/errno.h>
> >  #include <linux/module.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/math64.h>
> > -#include "governor.h"
> >  
> >  /* Default constants for DevFreq-Simple-Ondemand (DFSO) */
> >  #define DFSO_UPTHRESHOLD	(90)
> > diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> > index 175de0c0b50e087861313060eab70a35b757fd20..395174f93960d0762456238654f4d356e21cf57c 100644
> > --- a/drivers/devfreq/governor_userspace.c
> > +++ b/drivers/devfreq/governor_userspace.c
> > @@ -9,11 +9,11 @@
> >  #include <linux/slab.h>
> >  #include <linux/device.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/kstrtox.h>
> >  #include <linux/pm.h>
> >  #include <linux/mutex.h>
> >  #include <linux/module.h>
> > -#include "governor.h"
> >  
> >  struct userspace_data {
> >  	unsigned long user_frequency;
> > diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> > index 96d1815059e32c4e70a1d3c257655cc6b162f745..b8e4621c57ebc76513e4eba978aa54f2b884e210 100644
> > --- a/drivers/devfreq/hisi_uncore_freq.c
> > +++ b/drivers/devfreq/hisi_uncore_freq.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/bits.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/device.h>
> >  #include <linux/dev_printk.h>
> >  #include <linux/errno.h>
> > @@ -26,8 +27,6 @@
> >  #include <linux/units.h>
> >  #include <acpi/pcc.h>
> >  
> > -#include "governor.h"
> > -
> >  struct hisi_uncore_pcc_data {
> >  	u16 status;
> >  	u16 resv;
> > diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> > index 4a4f0106ab9ddcfb106a1860370cbf8a3579322a..77cbb204087c970c1fec0c1597b1e76c1a11b390 100644
> > --- a/drivers/devfreq/tegra30-devfreq.c
> > +++ b/drivers/devfreq/tegra30-devfreq.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/cpufreq.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/devfreq-governor.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/irq.h>
> > @@ -21,8 +22,6 @@
> >  
> >  #include <soc/tegra/fuse.h>
> >  
> > -#include "governor.h"
> > -
> >  #define ACTMON_GLB_STATUS					0x0
> >  #define ACTMON_GLB_PERIOD_CTRL					0x4
> >  
> > diff --git a/drivers/devfreq/governor.h b/include/linux/devfreq-governor.h
> > similarity index 80%
> > rename from drivers/devfreq/governor.h
> > rename to include/linux/devfreq-governor.h
> > index 0adfebc0467a3db39278814fa66d2b1f25d61f7a..dfdd0160a29f35f5608575b07b450cf5157420ff 100644
> > --- a/drivers/devfreq/governor.h
> > +++ b/include/linux/devfreq-governor.h
> > @@ -5,11 +5,11 @@
> >   * Copyright (C) 2011 Samsung Electronics
> >   *	MyungJoo Ham <myungjoo.ham@samsung.com>
> >   *
> > - * This header is for devfreq governors in drivers/devfreq/
> > + * This header is for devfreq governors
> >   */
> >  
> > -#ifndef _GOVERNOR_H
> > -#define _GOVERNOR_H
> > +#ifndef __LINUX_DEVFREQ_DEVFREQ_H__
> > +#define __LINUX_DEVFREQ_DEVFREQ_H__
> >  
> >  #include <linux/devfreq.h>
> >  
> > @@ -47,31 +47,6 @@
> >  #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
> >  #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
> >  
> > -/**
> > - * struct devfreq_cpu_data - Hold the per-cpu data
> > - * @node:	list node
> > - * @dev:	reference to cpu device.
> > - * @first_cpu:	the cpumask of the first cpu of a policy.
> > - * @opp_table:	reference to cpu opp table.
> > - * @cur_freq:	the current frequency of the cpu.
> > - * @min_freq:	the min frequency of the cpu.
> > - * @max_freq:	the max frequency of the cpu.
> > - *
> > - * This structure stores the required cpu_data of a cpu.
> > - * This is auto-populated by the governor.
> > - */
> > -struct devfreq_cpu_data {
> > -	struct list_head node;
> > -
> > -	struct device *dev;
> > -	unsigned int first_cpu;
> > -
> > -	struct opp_table *opp_table;
> > -	unsigned int cur_freq;
> > -	unsigned int min_freq;
> > -	unsigned int max_freq;
> > -};
> > -
> >  /**
> >   * struct devfreq_governor - Devfreq policy governor
> >   * @node:		list node - contains registered devfreq governors
> > @@ -124,4 +99,4 @@ static inline int devfreq_update_stats(struct devfreq *df)
> >  
> >  	return df->profile->get_dev_status(df->dev.parent, &df->last_status);
> >  }
> > -#endif /* _GOVERNOR_H */
> > +#endif /* __LINUX_DEVFREQ_DEVFREQ_H__ */
> > 
> > ---
> > base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
> > change-id: 20250903-governor-public-d9cd4198f858
> > 
> > Best regards,
> 
> -- 
> Best Regards,
> Samsung Electronics
> Chanwoo Choi
> 

-- 
With best wishes
Dmitry
