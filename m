Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF27619D8A8
	for <linux-tegra@vger.kernel.org>; Sun, 19 Apr 2026 00:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557789; cv=none; b=KytbYz2QPOqm9UNVmjD65kUjBTYTtg3AzNWokgbz/URyYnrTKBb8CpICsSiCnWqOX4JGJGteZW9RZmKLV1XXWc3p8i/03cVk7GTcsQLSGxfzFbk+JTkJlc3mjh4igvj4a0G/uWUpkizz/ow2AO+rabE0kOBKfUFEjuFRAdRueAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557789; c=relaxed/simple;
	bh=Us0ndhO033kkFDcL/Ol+YYJaL5GcvP1KfFlzvNH0qnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1ONqhBZGnAVDzB+KiSO0x+xcqQfn9ZbGlSDf2dpIfP58kLnUrIhrEFptZXYDkMUeq+DzE/WZam82rGBf43K3AO5mu5+mopj4KBO6S2K3Ynca5UhSsLXlq8gfNcI9yDOagqUNP/Gj33QP0GO5sM8S35PwtED7akjvs9Czk0VOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR697kqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aobQnuWW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR697kqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aobQnuWW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IJ05903035283
	for <linux-tegra@vger.kernel.org>; Sun, 19 Apr 2026 00:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krtkKxe19pMn4PJwb0xqRCTx
	s6eIr+De+hcmkYF9q48=; b=gR697kqo80AfHPSVffaSyFYnY6aqjhi5knRMEcry
	pUTuAf6jP8zXHkkY2KJEWhJfCS9zAU1Vcz86eE6qwoHoU2HtpPtG5fudRj7dOyhf
	lAiR7LAsOR5T5ankj4p4/rHYlEJIpW8iC225aFk5K5YLMBtSdpGdNwZwzGRhdQmF
	23lq2V6dzPnpj3lwWiG8sv1ULnN+bO1GLkWcM0uIED9vacHlgShdQYmSeHgvcAV+
	4f+6eBdTLlcNvwin8N9iKAePe1bjK6NqACqnfVbtT0gTjGHv2gm0cpjq0+imp05d
	COD+qz1rDaBlio8vkaV2wGdbVJpSp5CooJp2SJapHEtjnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fsr24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 19 Apr 2026 00:16:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfdc479f68so208873785a.1
        for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2026 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557786; x=1777162586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krtkKxe19pMn4PJwb0xqRCTxs6eIr+De+hcmkYF9q48=;
        b=aobQnuWWUk69fj85pTJW9q8A9UY1Ci6zkUA8mWXziOKRB35yW8WQa/FEYrjU4QHGMH
         L4hcXmk2w/I7El70ZMMZ573oq6dqSh39pPp4baDh0DBF4ACcwvm2hArtkAC3rXhAAY9P
         CEt0P5tPcImpZW+NJ5Ce0Y/gQQcfQ3VbgJi8JDDfiaddLBSEkN+wD2ZrfNUUYQFw5aER
         jZa7jwsxiEhwT1Kvr3LjWEOVeelCUs5WMkXbYVNXX6pe2ww5PnQ29c4pOum/AG8RyWqm
         Hk8FEOE36Sd9GP9FmaYZP/ajsTHu7IU8MQTTJSIXz1/U3O5lRRdDNBfaCyzoR1WLgIt0
         1vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557786; x=1777162586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krtkKxe19pMn4PJwb0xqRCTxs6eIr+De+hcmkYF9q48=;
        b=f+XlSKdwYgmmtYkugJpW5P1IXAwpfXOcYwv8mYtKg4HPlJKq7RwEz1AG8tU05npD5V
         ONsQY3YIP0IDPfKZad/+SsieMVZXdo/ZQmxNcLD7nNUzRmBWgDW0Jf2Aui8B95rNvPDx
         xIC4aEIRAInom4KbBcHaczydzdJRC7XGLo+xXPb9C6GZSZexemJfeAjuEpVkDOkW+P+W
         jHfRHi3GEVh1Y6xOWeokDz6/DPVpg5Pf/SAh9gyoUnMP2fnR6/IhgvRlJr0qlpp1sGRb
         Ad4RyxLdUdBy7oQB6x4TVSXRmOVb9tc4fIsHhUG1NYErY/P/9druikLmUnK9EHdnVYGB
         bPuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8um3K6RNQamQ2xhq6vZnwDSplM1OgU3wD/zQP5vTf86DbCRFcXNb4R8lbbCmF6KFUx0XGfiyY4hJWZ9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpmdb4ykbULSR6lpfdjhWHmW+T/hsCN6hCir/9kYWV82/HYBkk
	m9fYw8P/rmx6TgYCX5PjhlOqm+18Huq8YpvmAmtFfZIl9I1HIkBx+j7dmeUchTw9LuUbit51dLs
	JRlEMnL7GJewelt+aqSjbKA0H28Q0LHfKYl1xBejYnW2Wo3RCHIbOBP6qz+cdTVyIDw==
X-Gm-Gg: AeBDietxhp27jZPO9u938QYlG3+uEinbEFx50uc9yC4hepqboxazWWkMy6j4JvvAtzZ
	IpXbyCBXL4xFi34L+gURBlQwgvzeihKd+6LyYSLzfW1ZeRdK+x0QJOc3wt4Ta0wsKhivrRvFyrO
	hNoz5JDWNLB0wBDQtFONguLYmYeTbS5ur99BGIrX+bC8tmRFVWXGMIBDYn7KBPj+TN5SdYmgtAz
	VMP82WVFMgRQXXoCRjj0WWqKkkL2HF9cWrAh4UX9bgnogNU8nQ9KpRRf4gjkb/b56kP3kezuqQx
	lX4vqZYSshCllwe0EyFrW1541LMRA3C3b+oKmN8VvqTQs6vpOCMfbXwwa4LHYnEh8CZZ7tqfgD/
	XRkrnJj+j6Uhqxlt/3/r+RGW7Af+Nq2E8KmA9AwPjbwHANHCfJVvyu5yN3G1Juniq+W8g3RRxP6
	px9hPefWulEr9JMc/l3JFzksHpriG3tIKqMFLUuHEeAhYwcQ==
X-Received: by 2002:a05:622a:1f8a:b0:50d:9e69:8099 with SMTP id d75a77b69052e-50e36833221mr139255351cf.19.1776557785943;
        Sat, 18 Apr 2026 17:16:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:50d:9e69:8099 with SMTP id d75a77b69052e-50e36833221mr139254881cf.19.1776557785464;
        Sat, 18 Apr 2026 17:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad343sm1729076e87.2.2026.04.18.17.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:16:23 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:16:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] misc: fastrpc: Use context device bus for compute
 banks
Message-ID: <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
 <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwMSBTYWx0ZWRfXybxOQ7vVDfIE
 BtwzYJB+poT+HBAB3PuF3uRMQ44DX1FHqLVeMiKMLUQ3Zm2sXgF8AKZWJbOAUcA/mMJn9sN9VeT
 yyMY7kQiBDyL07J4YEUjU3n+A3+72z33RX8ZckUHlA+mTTXJ5OG1J7Bee1mXdpZAn3hy6PuvjjP
 2jSSVL0L49j5azawvfMgo4Jl45O17rh8iAVZPa9vuK6uIwp5BO4Ftd7kd3FHcef0N7o4sTdye+U
 JAP5yVrF2tWyD0meXLSWPMKjBciruNAV2rkoK7rSERqLM9K32pQ3IYyX4SrBhP2OVWuv7leg6eb
 7KJ6GK4i5RgRjqJt5J+KPAulZkmasZq7jQ4KciiH1drQDX3X0p4By2QOFL3bi5ybd70Ee598O1F
 cOYBnBerNoBx8LZ2VWSF8VcJWWUN2fqy9o/BBBnQ+JdCUGd44RCFXxRCPfoGxQau5jlJWmYUh79
 FHY92681iP2c3brak6Q==
X-Proofpoint-ORIG-GUID: K0XT-wZuRUpa9SRa7FjkRwTkB8_t0pse
X-Proofpoint-GUID: K0XT-wZuRUpa9SRa7FjkRwTkB8_t0pse
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e41eda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tB70rH4wX7YjnKcxG8sA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190001

On Wed, Apr 15, 2026 at 09:35:47PM +0530, Vishnu Reddy wrote:
> 
> 
> On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
> > Replace the platform driver approach for compute bank (CB) devices
> > with the generic context_device_bus_type. Compute bank devices are
> > synthetic IOMMU context banks, not real platform devices, so using
> > the context device bus provides a more accurate representation in
> > the device model.
> > 
> > Currently, fastrpc used of_platform_populate() to create platform
> > devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
> > driver (fastrpc_cb_driver) to handle probe/remove. This approach
> > had a race condition: device nodes were created before channel
> > resources (like spin_lock) were initialized, and probe was async,
> > so applications could open the device before sessions were available.
> > 
> > This patch addresses the race by manually creating and configuring
> > CB devices synchronously during fastrpc_rpmsg_probe(), after all
> > channel resources are initialized. The approach follows the pattern
> > used in host1x_memory_context_list_init().
> > 
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >   drivers/misc/Kconfig   |   1 +
> >   drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
> >   2 files changed, 125 insertions(+), 56 deletions(-)
> > 
> >   	}
> >   	dma_bits = cctx->soc_data->dma_addr_bits_default;
> > +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> > +
> >   	sess = &cctx->session[cctx->sesscount++];
> >   	sess->used = false;
> >   	sess->valid = true;
> > -	sess->dev = dev;
> > -	dev_set_drvdata(dev, sess);
> > +	sess->sid = sid;
> > +	spin_unlock_irqrestore(&cctx->lock, flags);
> > -	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> > +	cb_dev = kzalloc_obj(*cb_dev);
> > +	if (!cb_dev)
> > +		return -ENOMEM;
> > -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> > -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> > +	cb_dev->sess = sess;
> > -	if (sessions > 0) {
> > -		struct fastrpc_session_ctx *dup_sess;
> > +	device_initialize(&cb_dev->dev);
> > +	cb_dev->dev.parent = parent;
> > +	cb_dev->dev.bus = &context_device_bus_type;
> > +	cb_dev->dev.release = fastrpc_cb_dev_release;
> > +	cb_dev->dev.of_node = of_node_get(cb_node);
> > +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
> > +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> > +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);
> > +	rc = device_add(&cb_dev->dev);
> 
> device_initialize() and device_add() can be replaced with single
> device_register() call. You can refer the below patch,

Keep in mind that for several arches device_initialize() sets the
coherent_dma_mask. So one should set coherent_dma_mask (as it's done
here) after calling device_initialize().

> 
> https://lore.kernel.org/all/20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com/
> 

-- 
With best wishes
Dmitry
