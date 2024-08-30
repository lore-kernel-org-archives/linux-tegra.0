Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D654278;
	Fri, 30 Aug 2024 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724988261; cv=none; b=HfxPIQU7nqmrI+giORCoi94MFutc+mm6qrbmaUnaeb+nBY2vO8QU1nHOsHNy3TiSAFmAm/m3Pzl1O8BuXm0O9MqK3yeR0v6G+O5xKejxJEXTnc3rKa3hL+4Gc5TXWJts/3NPY2/iY8wYcq+YsNHgflempjKjJvdobeAl6gcS60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724988261; c=relaxed/simple;
	bh=EgkGRp5q4ySI1rSf4ekOJrTTr2RikI5756NbEe5tnDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QX726FSVSoOzhkrikmipfn+Rf3QO34DPT6mYyvc1EKn6Sy4lMOCl6WqvBlH62jwwj4bbje44wauOtxsHCU3NZfCRZHOEaFMyakmNVFXj4bPw+nVmKBEmEtImTml19wCGD1WE9Lle0RhJFsbn9yEMaZ7WDVou8TOVVs2YOZPiI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ww3Ng2NFkzLqyG;
	Fri, 30 Aug 2024 11:22:11 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 09DCE140202;
	Fri, 30 Aug 2024 11:24:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 11:24:14 +0800
Message-ID: <598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
Date: Fri, 30 Aug 2024 11:24:14 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped
 for each OF child loop
Content-Language: en-US
To: Kousik Sanagavarapu <five231003@gmail.com>
CC: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<christophe.jaillet@wanadoo.fr>, <ulf.hansson@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
References: <ZtCapIwWZolY7oMH@five231003>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZtCapIwWZolY7oMH@five231003>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/29 23:58, Kousik Sanagavarapu wrote:
> Jinjie Ruan <ruanjinjie@huawei.com> writes:
>> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
>>  {
>>  	struct device *dev = kdev->dev;
>>  	struct knav_region *region;
>> -	struct device_node *child;
>>  	u32 temp[2];
>>  	int ret;
>>  
>> -	for_each_child_of_node(regions, child) {
>> +	for_each_child_of_node_scoped(regions, child) {
> 
> Are you sure using *_scoped() is better here?  Since it seems that we
> need the memory pointed to by "child" in cases where we don't go into an
> error path.

Hi, Jonathan, could you help review this code?

> 
>>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
>> -		if (!region) {
>> -			of_node_put(child);
>> -			dev_err(dev, "out of memory allocating region\n");
>> -			return -ENOMEM;
>> -		}
>> +		if (!region)
>> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
>>  
>>  		region->name = knav_queue_find_name(child);
>>  		of_property_read_u32(child, "id", &region->id);
> 
> Similarly in most of the other cases in this series where a similar
> change is done.
> 
> Also FYI, as for dev_err_probe(), I think I covered all of them in this
> file and a patch for it is currently sitting in ti-drivers-soc-next.
> 
> Thanks
