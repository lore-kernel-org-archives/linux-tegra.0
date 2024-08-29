Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37651798C;
	Thu, 29 Aug 2024 02:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724898360; cv=none; b=s6CoYcEAvOIEnjIRDThp1iAH2mlilf+88jqPfAEATiiU4TQ6VhjlijBJ+P/ZON327qb+AIEgflHgyQNqp7801BULhO3xhN/7rKGclPYXqiRl+OuMmsDIc/jWDXi9oVwlaRCARnl249Syh+hELa6x59EHFB3S23OjDTjEDt9cyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724898360; c=relaxed/simple;
	bh=T5v75i6KEzDwiZzWw/B06jFoanFigpkuIZeiKhfF/3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pz1vI8fEET/wbvUbistpWj2hPKHKJUf2x9GuBUMIHtU2qFxZ0pKPh1QGmCXQbLrC9HDXHKtRpztrye/6M3xllymFyYiGuBdF3RP+ICfnha1LsRbcKd1GCDAH0mZlCx/zvwjn+A1bk4nBbya3iyTd6tUCDKnLn23gWGXxIK+N10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WvQ4c4D8YzQr2n;
	Thu, 29 Aug 2024 10:21:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 1966D1400FF;
	Thu, 29 Aug 2024 10:25:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 10:25:54 +0800
Message-ID: <195dd9e0-ef42-bcf8-b71a-d9d548af014a@huawei.com>
Date: Thu, 29 Aug 2024 10:25:53 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
Content-Language: en-US
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
 <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
 <32e8ef50-ae45-4001-92b6-1e9e0608b402@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <32e8ef50-ae45-4001-92b6-1e9e0608b402@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/28 21:08, Krzysztof Kozlowski wrote:
> On 28/08/2024 03:58, Jinjie Ruan wrote:
>>
>>
>> On 2024/8/27 21:50, Krzysztof Kozlowski wrote:
>>> On 27/08/2024 13:46, Jinjie Ruan wrote:
>>>> Use the dev_err_probe() helper to simplify error handling during probe.
>>>> This also handle scenario, when EDEFER is returned and useless error
>>>> is printed.
>>>
>>> ? Sorry, this cannot happen. Please point to below code which can defer.
>>>
>>
>> Thank you!
>>
>> This is not referring to a specific one, but rather the benefits it
>> offers，simplify code is the main purpose, if necessary, it will be
>> removed in next version.
> 
> It just feels like you are doing these in machine way without actually
> knowing concepts behind dev_err_probe().

Just try my best to make the code as clean as possible and do it by the way.

> 
> Best regards,
> Krzysztof
> 
