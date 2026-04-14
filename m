Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC49318B85
	for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2026 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189589; cv=none; b=XBFrCHHFa2uZP62S4UYvduiQ/0L1NX/RhdkRYzwdnmmCVAGDuAeny03Zi4B4fkYmGQCozdkI6VPKGk7t81prJHpAlt+MZPYOqZccD0I6eMcfXxdcrVq7SzrhD2w6skm8quWuOqEAdr0jtu7CDW4T3pHYne408a72+CP1OQNseAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189589; c=relaxed/simple;
	bh=F9IImTWbAE/07UVOrHFqvyTG3I6+wFwxQODwtqPFCCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD6KpLSpQel9RvdxDpTwvHlI/FCPuez4wItixHr4SgZpRksMiuq0dhEl8EsQ1NxvAGS/MrMNHdky/0B940VAFlpz7HaUbnS+GzMwdMvpMtP+irA5v6k3cOtamNi20r4zq6tKMBFueobDmTGnFj/eplUV+h/X3o8rFbYDo1FzSNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRDd7HXU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwJznHGd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRDd7HXU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwJznHGd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3MbO966057
	for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2026 17:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QmmQoU/diSWqj6mLutzvYKAy
	DS7PmKhjSkMdbEs6GLI=; b=PRDd7HXUGHWe6M9MJifW8KWES6T96D4dHkR1kHFJ
	LVo5XrJbdL+wbRWSyidLGgE/VD3bngFLr8VwBB0L24//GcHRapu/FwogEHmSCYsr
	9jthYlyVqwkhYI8arsrp9kXaRSD2VkPaHAtHtJ/Ry31xXqjWKKu+Woxn0ik1dcCy
	/v5lhFbn556bT8xg9fqZJM9ioSuFlu0MmF5XLqHlNLBhtNVPA2+aqXgKBHTM8zqC
	2porMtZmSWORK1WmqkcrW/Jn7a/XQqbaTpWRF0YqFlk6EQ+umy0OpgC7c6pWcNDR
	g0MiUOcU2KAiQHzLllQLyiFvLPJfM/yMKGrtia808VCIqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1rfyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2026 17:59:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so157693981cf.0
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2026 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189586; x=1776794386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmmQoU/diSWqj6mLutzvYKAyDS7PmKhjSkMdbEs6GLI=;
        b=QwJznHGdttwZHPQpjnH1TqO3T9IebsR4SSjYcbEwKXOIxvuSChsplTpbscQ3AHmP8s
         ux9LTzbUu7Qe8GPojdGcu4GP/X8NQc1ca3h1tZJYYnt0kdhbTpDsefLnvsUihnn7sNKa
         uDugG3jSui46yMdA/TcF8V3mHAMCQu4mS5Q5C5xknRtDJp3XSB/3jRGWQecz5OiLEZF5
         e4ValtY9YnO90mvWkFECNdyje5DHRVGa7xvCdV+0WNwHudcrKXyo2RmspO79UT4m1YyI
         PVIXXm764kM0VILCGo91M2QyO1P8tQfSDgeEH9ShWLPaBeFLvpkiEqRREUorZFIySIpV
         clsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189586; x=1776794386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmmQoU/diSWqj6mLutzvYKAyDS7PmKhjSkMdbEs6GLI=;
        b=YsoVzDQWZ+brJ147dYLXPFyzlxF+PUlumx2WYcA8OHQNVX790K++SobvqwFtja3CXA
         9AFnyDQ5MqOlxTUJlqSiUAyxaPMD0NXXUKCDwQef64QjUCC01Ohk3f91OFyE1RFf77dR
         ygzxzGsMih3GW2ciUguH/tjDtpUmbSaX8jTQpwLV2r6xz2X5SrhGtxTwr2xhvxGTpZ23
         AAcMD7rOsjgxskr6MXV4Wo+RqlqXJ0fKNtiPl0lvITjagpyI5xYNZCkbgnCNdQMG9zzp
         VylDxKKQD/tzUUz5HKIhaMn80dL3B9ITdbIsYqoKQ8Lljp6w9xTzVtFc0oKYCgbLr3we
         Xp6g==
X-Forwarded-Encrypted: i=1; AFNElJ/Jy6eOPjZs4R6ZSkweGe4NT6h1JuuM4WnFUpRJjb01vERpNhD1REHatzVBzTiLVYRWbykfHanmJ1GrkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkppCBYMAqlSDEWH05YfEu6CKWR6rCTkxjY62uUNSFLnbVheq+
	Vi+M82YyJEWOm8UbCRWDt96mU9bVFohpaPE/SAKvEPJyLCvE1EvUD42t7wfPpscVbgtUOGtPTG3
	FcKSHdEvoS5gyovOzQonPq8UdYE6CQKHr+26XBLb2s5mqrlQ+SCGUGuJhJV6vajOAQQ==
X-Gm-Gg: AeBDievkufNmtuTn1qrbnxb4K5buFwP4OGvyw7pWJI1BNkF3saVZV4aNxX6AqzQqUr1
	tRsLeW1sjKTRSZQefSBHTqewt/Uo+fCa4QwZq2WRP0VfdohfZcy+lCa4GT8CTQzqt8rii1WoRkW
	ST7RltAcSFn5C2iQU2YjD8dcyDbF5NM+s0sJYaFaZyXUnAU+brzDW+SFFdfXgsmfmGC64Wtx/pd
	Q/SLYWL2M/flH0AqLJ5Md0xl67HRfnMbdKBgNlUIUg0PVcXDg+LCQraxw5VIZMtbUiM9n/bo/9W
	zPILSbiCsyrdLAX7CX8rNmWf4LEsPNmi9HRIfojIaCbBdFH5m8PaAJ1PNGnxrm5VBinklCLx803
	9aWa5wVz3eqoBtGeCp2jPLuxNGhD3UVQxBvrK74aSu6dHdjtBpRnlFnZ7qBF73MhMLXX00Ysi1X
	tGnZlIGrYt72oT3PCAVrEGa6CT5KTmB/2CEk1Db8iXoQeOkw==
X-Received: by 2002:ac8:7f44:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50dc1b2f8a8mr313166261cf.33.1776189585755;
        Tue, 14 Apr 2026 10:59:45 -0700 (PDT)
X-Received: by 2002:ac8:7f44:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50dc1b2f8a8mr313165771cf.33.1776189585059;
        Tue, 14 Apr 2026 10:59:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb57sm32395581fa.36.2026.04.14.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:59:43 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:59:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] misc: fastrpc: Use context device bus for compute
 banks
Message-ID: <7cij7qnjnv5ntsfmjdyozywiiwnpcpzop6mr5comt6djlh2opx@qgxp77geszoe>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX+akWTdDQq6CN
 AMFGtw3XUeZIxiVZ07Ety2sls0l9gTEDY5NllETplw5kEjZq7/tj6ZCtzpwA1FgYLr94knzNO+V
 y0xlFFCFAIH4/15LflstWXswGgAVPcWdOKD5Uzy6ZoTZO7IzpKloYTtgCCmPxualRBOxSYhqT7d
 U6no3x9A1RbhYIc7zgBlQ+jjgH64IafBIkHIfzx0f3EFNCv9qkuz2uTRqgcu+x2o7XSDVaQrSo9
 cEqG4tSWLVYt0IBN7WXbD2r2VQbnqFXIBPlvd+BlrGav0fS6aoUw7uKycye2QBlDaKSXFmy7WzY
 lQPQJy1gBslDhMGggL2RHSH5GNXnfOzYw8yTSgLUXrHmktlPQtELsj7vAojaT3fb8dR1hKJYPp6
 6PVdKIE5KHAEcvdAP9mhZKFmgVGDTRDXhdv9qQrfU7kIZ3123nZBflwP6itR+JiWC8sCbDygSia
 jKxF9XKdnUb+3SoGhTg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de8092 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eP6CfP3hHy5NNNlF4cwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 5Ywiho_9Lbh8i2ZdOi5Td85ZdCPeqt0J
X-Proofpoint-ORIG-GUID: 5Ywiho_9Lbh8i2ZdOi5Td85ZdCPeqt0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167

On Tue, Apr 14, 2026 at 10:01:17PM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Replace the platform driver approach for compute bank (CB) devices
> with the generic context_device_bus_type. Compute bank devices are
> synthetic IOMMU context banks, not real platform devices, so using
> the context device bus provides a more accurate representation in
> the device model.
> 
> Currently, fastrpc used of_platform_populate() to create platform
> devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
> driver (fastrpc_cb_driver) to handle probe/remove. This approach
> had a race condition: device nodes were created before channel
> resources (like spin_lock) were initialized, and probe was async,
> so applications could open the device before sessions were available.
> 
> This patch addresses the race by manually creating and configuring
> CB devices synchronously during fastrpc_rpmsg_probe(), after all
> channel resources are initialized. The approach follows the pattern
> used in host1x_memory_context_list_init().
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/Kconfig   |   1 +
>  drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
>  2 files changed, 125 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 00683bf06258..b501462a4548 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -304,6 +304,7 @@ config QCOM_FASTRPC
>  	depends on RPMSG
>  	select DMA_SHARED_BUFFER
>  	select QCOM_SCM
> +	select CONTEXT_DEVICE_BUS
>  	help
>  	  Provides a communication mechanism that allows for clients to
>  	  make remote method invocations across processor boundary to
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..f66fd3eea5fa 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -13,9 +13,9 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of.h>
> -#include <linux/platform_device.h>
> +#include <linux/of_device.h>
>  #include <linux/sort.h>
> -#include <linux/of_platform.h>
> +#include <linux/context_bus.h>
>  #include <linux/rpmsg.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> @@ -250,6 +250,18 @@ struct fastrpc_invoke_ctx {
>  	struct fastrpc_channel_ctx *cctx;
>  };
>  
> +/**
> + * struct fastrpc_cb_device - Compute bank device wrapper
> + * @dev: Device structure
> + * @sess: Back-pointer to the session context
> + */
> +struct fastrpc_cb_device {
> +	struct device dev;
> +	struct fastrpc_session_ctx *sess;
> +};
> +
> +#define to_fastrpc_cb_device(d) container_of(d, struct fastrpc_cb_device, dev)
> +
>  struct fastrpc_session_ctx {
>  	struct device *dev;
>  	int sid;
> @@ -2190,92 +2202,156 @@ static const struct file_operations fastrpc_fops = {
>  	.compat_ioctl = fastrpc_device_ioctl,
>  };
>  
> -static int fastrpc_cb_probe(struct platform_device *pdev)
> +static void fastrpc_cb_dev_release(struct device *dev)
> +{
> +	struct fastrpc_cb_device *cb_dev = to_fastrpc_cb_device(dev);
> +
> +	of_node_put(dev->of_node);
> +	kfree(cb_dev);
> +}
> +
> +static int fastrpc_create_cb_device(struct fastrpc_channel_ctx *cctx,
> +				    struct device *parent,
> +				    struct device_node *cb_node)
>  {
> -	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
> -	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
> +	struct fastrpc_cb_device *cb_dev;
>  	unsigned long flags;
> -	int rc;
> -	u32 dma_bits;
> -
> -	cctx = dev_get_drvdata(dev->parent);
> -	if (!cctx)
> -		return -EINVAL;
> +	int i, sessions = 0, rc;
> +	u32 dma_bits, sid = 0;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> +	/* Read SID early so it can be used in the device name */
> +	of_property_read_u32(cb_node, "reg", &sid);
> +	of_property_read_u32(cb_node, "qcom,nsessions", &sessions);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
> -		dev_err(&pdev->dev, "too many sessions\n");
> +		dev_err(parent, "too many sessions\n");
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		return -ENOSPC;
>  	}
>  	dma_bits = cctx->soc_data->dma_addr_bits_default;
> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> +
>  	sess = &cctx->session[cctx->sesscount++];
>  	sess->used = false;
>  	sess->valid = true;
> -	sess->dev = dev;
> -	dev_set_drvdata(dev, sess);
> +	sess->sid = sid;
> +	spin_unlock_irqrestore(&cctx->lock, flags);
>  
> -	if (cctx->domain_id == CDSP_DOMAIN_ID)
> -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> +	cb_dev = kzalloc_obj(*cb_dev);
> +	if (!cb_dev)
> +		return -ENOMEM;
>  
> -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> +	cb_dev->sess = sess;
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> +	device_initialize(&cb_dev->dev);
> +	cb_dev->dev.parent = parent;
> +	cb_dev->dev.bus = &context_device_bus_type;
> +	cb_dev->dev.release = fastrpc_cb_dev_release;
> +	cb_dev->dev.of_node = of_node_get(cb_node);
> +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
> +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);

Please extract this code to a helper function inside the context bus and
use it for both host1x and fastrpc.

>  
> +	rc = device_add(&cb_dev->dev);
> +	if (rc) {
> +		dev_err(parent, "failed to add CB device: %d\n", rc);
> +		goto err_put;
> +	}
> +
> +	rc = of_dma_configure(&cb_dev->dev, cb_node, true);
> +	if (rc) {
> +		dev_err(parent, "of_dma_configure failed for CB device: %d\n", rc);
> +		goto err_del;
> +	}
> +
> +	rc = dma_set_mask(&cb_dev->dev, DMA_BIT_MASK(dma_bits));
> +	if (rc) {
> +		dev_err(parent, "%u-bit DMA enable failed\n", dma_bits);
> +		goto err_del;
> +	}
> +
> +	sess->dev = &cb_dev->dev;
> +
> +	if (sessions > 0) {
> +		spin_lock_irqsave(&cctx->lock, flags);
>  		for (i = 1; i < sessions; i++) {
> +			struct fastrpc_session_ctx *dup_sess;
> +
>  			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
>  				break;
>  			dup_sess = &cctx->session[cctx->sesscount++];
>  			memcpy(dup_sess, sess, sizeof(*dup_sess));
>  		}
> -	}
> -	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
> -	if (rc) {
> -		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
> -		return rc;
> +		spin_unlock_irqrestore(&cctx->lock, flags);
>  	}
>  
>  	return 0;
> +
> +err_del:
> +	device_del(&cb_dev->dev);
> +err_put:
> +	of_node_put(cb_dev->dev.of_node);
> +	put_device(&cb_dev->dev);
> +	return rc;
>  }
>  
> -static void fastrpc_cb_remove(struct platform_device *pdev)
> +static void fastrpc_depopulate_cb_devices(struct fastrpc_channel_ctx *cctx)
>  {
> -	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
> -	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
>  	unsigned long flags;
> -	int i;
> +	int i, j;
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
> -		if (cctx->session[i].sid == sess->sid) {
> +		if (cctx->session[i].valid) {
>  			cctx->session[i].valid = false;
>  			cctx->sesscount--;
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> +
> +	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
> +		struct device *dev = cctx->session[i].dev;
> +
> +		if (!dev)
> +			continue;
> +
> +		/* Unregister the device once */
> +		device_unregister(dev);
> +
> +		/* Clear this dev pointer from all sessions that share it */
> +		for (j = i; j < FASTRPC_MAX_SESSIONS; j++) {
> +			if (cctx->session[j].dev == dev)
> +				cctx->session[j].dev = NULL;
> +		}
> +	}
>  }
>  
> -static const struct of_device_id fastrpc_match_table[] = {
> -	{ .compatible = "qcom,fastrpc-compute-cb", },
> -	{}
> -};
> +static int fastrpc_populate_cb_devices(struct fastrpc_channel_ctx *cctx,
> +					struct device *parent,
> +					struct device_node *parent_node)
> +{
> +	struct device_node *child;
> +	int ret = 0;
>  
> -static struct platform_driver fastrpc_cb_driver = {
> -	.probe = fastrpc_cb_probe,
> -	.remove = fastrpc_cb_remove,
> -	.driver = {
> -		.name = "qcom,fastrpc-cb",
> -		.of_match_table = fastrpc_match_table,
> -		.suppress_bind_attrs = true,
> -	},
> -};
> +	for_each_child_of_node(parent_node, child) {
> +		if (!of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
> +			continue;
> +
> +		ret = fastrpc_create_cb_device(cctx, parent, child);
> +		if (ret) {
> +			dev_err(parent, "failed to create CB device for %s: %d\n",
> +				child->name, ret);
> +			of_node_put(child);
> +			fastrpc_depopulate_cb_devices(cctx);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
>  
>  static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
>  				   bool is_secured, const char *domain)
> @@ -2441,7 +2517,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->domain_id = domain_id;
>  	data->rpdev = rpdev;
>  
> -	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> +	err = fastrpc_populate_cb_devices(data, rdev, rdev->of_node);
>  	if (err)
>  		goto err_deregister_fdev;
>  
> @@ -2496,7 +2572,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	if (cctx->remote_heap)
>  		fastrpc_buf_free(cctx->remote_heap);
>  
> -	of_platform_depopulate(&rpdev->dev);
> +	fastrpc_depopulate_cb_devices(cctx);
>  
>  	fastrpc_channel_ctx_put(cctx);
>  }
> @@ -2558,16 +2634,9 @@ static int fastrpc_init(void)
>  {
>  	int ret;
>  
> -	ret = platform_driver_register(&fastrpc_cb_driver);
> -	if (ret < 0) {
> -		pr_err("fastrpc: failed to register cb driver\n");
> -		return ret;
> -	}
> -
>  	ret = register_rpmsg_driver(&fastrpc_driver);
>  	if (ret < 0) {
>  		pr_err("fastrpc: failed to register rpmsg driver\n");
> -		platform_driver_unregister(&fastrpc_cb_driver);
>  		return ret;
>  	}
>  
> @@ -2577,7 +2646,6 @@ module_init(fastrpc_init);
>  
>  static void fastrpc_exit(void)
>  {
> -	platform_driver_unregister(&fastrpc_cb_driver);
>  	unregister_rpmsg_driver(&fastrpc_driver);
>  }
>  module_exit(fastrpc_exit);
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
