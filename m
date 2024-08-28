Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755E1B5AA;
	Wed, 28 Aug 2024 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810319; cv=none; b=PxoX2s6/sPi+RFC3yD8Qk4M4HAsUE6ofpaRvaaCRcC8EZ9CXUsYLvzY5rfDfMaIYSHxpckmJy0o7mQMnMfpXTF7xAo+QL91PVaY5dM/grhKkjMOM0uUha5nLmCZOHvKQg9zeobFOgI7YPrSR2vsUtMpLOWoBFC19K6MgGMDtZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810319; c=relaxed/simple;
	bh=+9iG2Bdhc9Wd8PpUBy/yYjGb7Hb4joMYU5NDCiSDL38=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PDD69C2r7nY1EQvIxtzgfUaztbApygHhACqMygG6xN4Is00LloOp0zwMTkKRc5/6RNCwwRY2jxDM+gKSew5Vd3lYXCdo9k0C+nrFU4bxJXoCVsKQwBcMsWK5NQ3+YZ6B4NQuaZ2yNzXcLrp6meIKwijqQSd81Q9evbeshisXZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtnZq5xBbz1xty0;
	Wed, 28 Aug 2024 09:56:35 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E261140135;
	Wed, 28 Aug 2024 09:58:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Aug 2024 09:58:32 +0800
Message-ID: <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
Date: Wed, 28 Aug 2024 09:58:13 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>, <andrew@lunn.ch>,
	<sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
	<herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <nm@ti.com>, <ssantosh@kernel.org>,
	<petlozup@nvidia.com>, <pshete@nvidia.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <jic23@kernel.org>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
 <20240827114607.4019972-3-ruanjinjie@huawei.com>
 <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/27 21:50, Krzysztof Kozlowski wrote:
> On 27/08/2024 13:46, Jinjie Ruan wrote:
>> Use the dev_err_probe() helper to simplify error handling during probe.
>> This also handle scenario, when EDEFER is returned and useless error
>> is printed.
> 
> ? Sorry, this cannot happen. Please point to below code which can defer.
> 

Thank you!

This is not referring to a specific one, but rather the benefits it
offers，simplify code is the main purpose, if necessary, it will be
removed in next version.

>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
>>  1 file changed, 23 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
>> index 7fa399b7a47c..fc37d23b746d 100644
>> --- a/drivers/soc/fsl/qe/tsa.c
>> +++ b/drivers/soc/fsl/qe/tsa.c
>> @@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  
>>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
>> -		if (ret) {
>> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>>  		switch (tdm_id) {
>>  		case 0:
>>  			tsa->tdms |= BIT(TSA_TDMA);
>> @@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  			tsa->tdms |= BIT(TSA_TDMB);
>>  			break;
>>  		default:
>> -			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
>> -				tdm_id);
>> -			return -EINVAL;
>> +			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
>> +					     tdm_np, tdm_id);
>>  		}
>>  	}
>>  
>>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
>> -		if (ret) {
>> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>>  
>>  		tdm = &tsa->tdm[tdm_id];
>>  		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
>> @@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  		val = 0;
>>  		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
>>  					   &val);
>> -		if (ret && ret != -EINVAL) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
>> -				tdm_np);
>> -			return ret;
>> -		}
>> -		if (val > 3) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
>> -				tdm_np, val);
>> -			return -EINVAL;
>> -		}
>> +		if (ret && ret != -EINVAL)
>> +			return dev_err_probe(tsa->dev, ret,
>> +					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
>> +					     tdm_np);
>> +		if (val > 3)
>> +			return dev_err_probe(tsa->dev, -EINVAL,
>> +					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
>> +					     tdm_np, val);
>>  		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
>>  
>>  		val = 0;
>>  		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
>>  					   &val);
>> -		if (ret && ret != -EINVAL) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
>> -				tdm_np);
>> -			return ret;
>> -		}
>> -		if (val > 3) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
>> -				tdm_np, val);
>> -			return -EINVAL;
>> -		}
>> +		if (ret && ret != -EINVAL)
>> +			return dev_err_probe(tsa->dev, ret,
>> +				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
>> +		if (val > 3)
>> +			return dev_err_probe(tsa->dev, -EINVAL,
>> +					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
>> +					     tdm_np, val);
>>  		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
>>  
>>  		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
>> @@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
>>  		return PTR_ERR(tsa->si_regs);
>>  
>>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
>> -	if (!res) {
>> -		dev_err(tsa->dev, "si_ram resource missing\n");
>> -		return -EINVAL;
>> -	}
>> +	if (!res)
>> +		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
>>  	tsa->si_ram_sz = resource_size(res);
>>  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
>>  	if (IS_ERR(tsa->si_ram))
> 
> Best regards,
> Krzysztof
> 
