Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16B35F16C
	for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841290; cv=none; b=kdIH/i4iSpHG+mYXVEjn/JKkiNpNMrtlsWSlvYdIi/WwViKdqftmp+n/OIQga+vjG5GEwO7DPdys8xEHoC2AcIXNEmMo4VjIiBlarua2TgA3GNaHInhDJAb29MLeinwjjCqVLKYJwnYiaher2+ECtcvmE7DfKeLt1YJUO9DgBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841290; c=relaxed/simple;
	bh=7Lk34Za95t+kyvgquAgJFZtmtRJLxGQm+zE5m9tIOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mz5weyQlAX67sKcPHlv4tqcmolPW684XsLDGV1T404nFXkPzkM/GB+X9hRjQFM0uLw6kNs49SEh+NpiNRbV+PXDcYYn46PNIuSb+uufus3jVMt+iYh4SR1SXu+WWCfeYMwn5zGoIVWWCLeu9rd7Bb8uV0IQGRnTsBQCk6Cm+Sm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/AEkkMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVtSx8f9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/AEkkMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVtSx8f9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5HXvq2123749
	for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 07:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=; b=J/AEkkMuXJ4aKR0j
	Q0xfteGZyYNm6QcnqJv2Fyk97Wgj5mZPewxb/aFhHsGhLq6l47ynlhFs21fkqq5D
	5Z7aTz2VsSu3Fu8CuTDMI0BIelyo1kLA8epiLnxRybG80m/AnW/Eh/0xXfKIIIWk
	x/rhjoUt9lsQ1thunmJzMgFfN5OyTKDhBRdhkTBrqeGrK0B1roDrE1f7sZ48CTbV
	7SagRQwG3suU1UaoOOEQI0yZTKEQ1VC1aTcGoS+Dpc5gAJu7sHCd7u3sV77mLtNV
	YoLsMHzYU7uWQ1RmA7Pj4gnz8UDoeeFqqO0h0YTI6O38AZWjH+FPWGutQl5SIEPG
	I7jucA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenft3gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 07:01:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so3351645b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776841288; x=1777446088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=;
        b=kVtSx8f9yDRXEMuch6bbW0gKlVBJtVHx6OO8U2d8ixyq1s5/Y4xIskMuCUy3d/Drkv
         DQqfOpBxLYDc2kQ+3D5b0Y3hOeZbT6rPSDi0p/a6bl8gf9M+xl77E1euPlv0tzbsGVlo
         5ll3JbpfpE33WQpgh//yxVEx6b8bjlB/ZNB7C20zKky1+L1ZvJqbWkGJYZSEr1bQ+Cx/
         lRxxrWxv8Ytg5PgxGrZiUtvBuY1scxhZdPp0UqxoT751/tvRN9zXr6wZUk2sH5Ueykdn
         eMp/7QCS7/nMoH+1nPUJyjSF9tPvR+yxmO4tcS0+LXQ0oGZs+aiRaQc9PY+aY2022mJX
         OtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841288; x=1777446088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=;
        b=gkWIklE0CJvUnlhKBzWqS2Ux1D7e1sVFkIlN09FzmZsBzTW41NkMNgi6uiMu00SRe1
         vTTjfgdPhcaZQyOhxJs7nib01FPFiAltFiQbICoQ4d+lkqz0wJ8jRl/mIXoFNSzS+hV/
         8MoT+VZpR7iZE6stfUB2fzdfEryOyNn4slrlqSAu9NX+vmkAORaFPWrMAhT7rV85iHMP
         6hE5RzfxcjBVdkdVUgBdtQBvebI0qU7qFQqLgY0QS++kBEVesLooDAuso0PolIZQvh1O
         wj2TXDuwpCQYT+e9+Ae2b4EK5Kg3ns82+PH5l+R6gCZWNptqWWYblE/RGFkFmYRCGuYs
         X8vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qSuGdqjBJ6t/Zuj3ySVp6HlUZ0XUpBVNaTFHB86vcD5gA/5QMznAop9DHG9pCgKkSoIDw53VU0Tpcqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VDkiz6kFmU+nC/5fiTWNRYTpEgeut3vN7ehfq3d4jToImsQO
	7mN/FsoAVtAqGIwCBqbEOd9o4ole0FuRaWERdsLmeCr6c03M5Aj2PNMrICVn0Dxn3tDCkdkIJRw
	X4gfm2ZiGSZV4Rib20staG+k0eWtdHUbiJdwahQ9ntOrspZQG1A7JGAOm+WzBH6CsHw==
X-Gm-Gg: AeBDiesXi6JTJwLUU7qStcMtvl5CQpDBoIJkRptTbhogzQn8fUOXVLqyTV02n0V9NTh
	mgUpHZMZNzgVentBOwBinsHXGkxLhPHSYA1599s8w6vA13ojTikyuo7kdv8R30OPx+Cac71FGjZ
	cENPMbwpssF2lvf6X/RY+otU1I4IDioPV8Ltqjrrt59yLU/Lw5ORW5ikCiM+K5P2VWW4iXE46x8
	WBNRnEJTP+l+qiog+Tl6TQ6sO2Xq3qVHq0oPC8L6cy9o7BjE5W5pxprloYQvtDb2BsX4QcZNVT0
	XDW6qvFs876Z2xxg81uMRuR+YdERNY/1dlENsmg8Y1pn6VQEDSS6IIAqj8Zwpwm4vkwMo1LbFZ8
	bsLsdQXFKqzLEEF8KkGLF7jZVI00yeXyHYUjGngGGkNwEikqNrFjmx9k9H8w6xisu
X-Received: by 2002:a05:6a00:22c5:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-82f8c9300ebmr22580057b3a.48.1776841287505;
        Wed, 22 Apr 2026 00:01:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c5:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-82f8c9300ebmr22580003b3a.48.1776841286814;
        Wed, 22 Apr 2026 00:01:26 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981d00sm15665619b3a.5.2026.04.22.00.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:01:26 -0700 (PDT)
Message-ID: <077a99c2-c954-c5e6-3699-cd0360e8b9f6@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:31:18 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] misc: fastrpc: Use context device bus for compute
 banks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
 <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
 <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e87248 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N8QG227OEIr4kTigVUgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 0mcC0pAQboe93L6yynOjzxUOK3luOJ9M
X-Proofpoint-GUID: 0mcC0pAQboe93L6yynOjzxUOK3luOJ9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2NSBTYWx0ZWRfX5tGABIR21fn2
 oFF5bePk/VKUHKDLmXedM6GmVlWslE6VpC6proQOMa2aJs37ErS7zd3oQNVAXBkpySrsPpXV6np
 Fkvgsn0JAldHsBNhXQqsZL2Mw6zDNstI+enPNse1crNMtc5rkbqOjaBJOrGeqcM9MOVp+7ry4wK
 2qZRoMuYLdKnap3KPfjheL50pzKQOvfJgIgdG2EkmnN4WPOSlYHg5bJxTPxVUZTQAnzUYJpLLhd
 j2jGcurPlxMJhRQW3raPjQwOI6QZpLLu1b50IgzXVugP+PWMoHaF2rwErHP6/BSXx4CCXtTb/QT
 SNJGwwQrw262nLgaX7mAJN2wAiDkajsk+j4c6sVpcZ5R9qw9H3qlyjI7ndIEJT51mJyOl1PXCX5
 eDUiwbgGqU/n4EijuXdgGmriNr3nodPAvvBcfOZWHoawnyYFEHAJIkahGZB/+rXc+AU9Itm6NDB
 mDcJhnvMue5AMSBuang==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220065


On 4/19/2026 5:46 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 15, 2026 at 09:35:47PM +0530, Vishnu Reddy wrote:
>>
>> On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
>>> Replace the platform driver approach for compute bank (CB) devices
>>> with the generic context_device_bus_type. Compute bank devices are
>>> synthetic IOMMU context banks, not real platform devices, so using
>>> the context device bus provides a more accurate representation in
>>> the device model.
>>>
>>> Currently, fastrpc used of_platform_populate() to create platform
>>> devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
>>> driver (fastrpc_cb_driver) to handle probe/remove. This approach
>>> had a race condition: device nodes were created before channel
>>> resources (like spin_lock) were initialized, and probe was async,
>>> so applications could open the device before sessions were available.
>>>
>>> This patch addresses the race by manually creating and configuring
>>> CB devices synchronously during fastrpc_rpmsg_probe(), after all
>>> channel resources are initialized. The approach follows the pattern
>>> used in host1x_memory_context_list_init().
>>>
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ---
>>>   drivers/misc/Kconfig   |   1 +
>>>   drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
>>>   2 files changed, 125 insertions(+), 56 deletions(-)
>>>
>>>   	}
>>>   	dma_bits = cctx->soc_data->dma_addr_bits_default;
>>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>> +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>>> +
>>>   	sess = &cctx->session[cctx->sesscount++];
>>>   	sess->used = false;
>>>   	sess->valid = true;
>>> -	sess->dev = dev;
>>> -	dev_set_drvdata(dev, sess);
>>> +	sess->sid = sid;
>>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>> -	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>> -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>>> +	cb_dev = kzalloc_obj(*cb_dev);
>>> +	if (!cb_dev)
>>> +		return -ENOMEM;
>>> -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>> -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>> +	cb_dev->sess = sess;
>>> -	if (sessions > 0) {
>>> -		struct fastrpc_session_ctx *dup_sess;
>>> +	device_initialize(&cb_dev->dev);
>>> +	cb_dev->dev.parent = parent;
>>> +	cb_dev->dev.bus = &context_device_bus_type;
>>> +	cb_dev->dev.release = fastrpc_cb_dev_release;
>>> +	cb_dev->dev.of_node = of_node_get(cb_node);
>>> +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
>>> +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>>> +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);
>>> +	rc = device_add(&cb_dev->dev);
>> device_initialize() and device_add() can be replaced with single
>> device_register() call. You can refer the below patch,
> Keep in mind that for several arches device_initialize() sets the
> coherent_dma_mask. So one should set coherent_dma_mask (as it's done
> here) after calling device_initialize().

I can see that device_initialize() sets dma_coherent flag for several arches,
not the coherent_dma_mask. The final dma_coherent flag value is updated later
in of_dma_configure_id() based on the dt dma-coherent property.

Setting the coherent_dma_mask here and calling device_register() which will
call the device_initialize() won't change the coherent_dma_mask value.
Please correct me if I'm wrong?

>> https://lore.kernel.org/all/20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com/
>>
