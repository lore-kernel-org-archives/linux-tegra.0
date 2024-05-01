Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F71182DF;
	Wed,  1 May 2024 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714590218; cv=none; b=JflVI0j77ejN2kMoEaVJnstJifSQZCeWXjoP295+pw93FFiMCLXT+EAKBAKzHk3OZ8ZaXTdeg6hllPbqp4hYXDtQMsiAVwALWwUK474Uoie4O9MJE9+kAYVQuI3O0togw8kKbg/rROS+OafR/ToBLkv+bAWAgwT7VynHQZGfdDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714590218; c=relaxed/simple;
	bh=k/y5BeiXRkme53wJh5vTzb2hZLgiLP5EW3r2wagWwcc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rB5w+auffmyhAWfbcvOQbhZvQMdDRSeYmNllw+fI4xcuND7h/+QupbpnC4tIahg7g65aQIrLtCKgHypJXelNJHGHVhCX/f0rLGULI2P8JLf4NRIbBPnFc469YvazNJ+89hLyQdcpX/JcUryffTJ2jQuurdaef6cldM1icAq1pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=Ry5Z8XdI; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="Ry5Z8XdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714590209; x=1715195009; i=marvin24@gmx.de;
	bh=gYwHy5LNplYoKK6zdvHGMt/83YYvl6lIqLhP/47UlBk=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ry5Z8XdIbGLREuOfxiRV8WgooMM9iGSxjEEl8RyiufjpK3DKkKy0at+I80C+6S3Z
	 FqO3Rs4reH3odx4mwDQEW4UiWzqajYgZbFhsOCK3vBKa7nZCltbKMPgwHWnU0JBNg
	 8/0QSjbEncdAYLO5no2T5I5SMpv3tVNuLy4JBWciWKSnGPWQCXsZJEmfHMOvtBpT9
	 brORn+bwuAzcIkIctM4j3ShBXSJGB/EVv9EtfR95pQECjRCd07SinVJBo2f3tKckV
	 v4xaEqBBmq/tHrBWckrih0S6fj9RQyVOAnGmX24NUoq/pW6TAtky2BHgwyO7bKfOf
	 QTO3BWdRrXjiHGwP+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.33.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1srrxd19qe-00yhwF; Wed, 01
 May 2024 21:03:29 +0200
Date: Wed, 1 May 2024 21:03:28 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org, 
    Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
In-Reply-To: <2338e58b-1ec2-4500-9675-2d8a3aaa107f@codethink.co.uk>
Message-ID: <79c10e8e-bf3e-7eca-a0cd-e177a270a517@gmx.de>
References: <20240421104642.25417-1-marvin24@gmx.de> <2338e58b-1ec2-4500-9675-2d8a3aaa107f@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:Ja7zapM5O1KRHIaFdURWIzIUrQygATLJYtj57B3Vfjm5jjb17E9
 zWEuYTfu/QnV0QJg81B6UmzlqEj5QvHoBUu3bzzjD+HEp84wg70Txx3VtBAB/7DZIkd7JjR
 Le5XDU+7E0lhnPmq6hbLrKCIH/QBp25dbqId95of7C8K8HwD+SW/XjgascNWBhb7vnjqlkN
 NT2UTWOWM3vETKvxQzONw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RmgwIelw/CU=;fqNOTpQAO3hKcjClNDzl5Gd1oLO
 2oxHPx2w6mRH7EeiZVzoi2bsSdC+Uxm6p0xI7FANMPHvzF7Q2PbTDip3hiyHxglyRW8oy1+IG
 jcgm5jN+vu7Pdd6NhlwtDLOZgef6l13RRl5lqmxpGYZioCI2FmOVcPQujyOGRvXsihW6wNwno
 HDMsVgHJvvYu7vDv3Y5R3lj+/tSebapnbvyKmDX6MtG2psFAGXVIrM+KMo4CkE8OzjUbBZw+q
 7bmzFHkhERerAqlCx8U7pWx4RiQ4doIG9mruIHWkqrCx2X9p/6yfjBJY8xdnkFIE+6VNSF4Hw
 IrZha8YiGbGQvzOu2s8khqxms9lUjqRpyVLy8roUhSNtQc4LWZB61zlpKjUG3GOa+OO3tdzgS
 VfhYzJeB3enSoEHW3s1QCiYqSWokEpoRZbnorHdfosXOlJKYFFB9a0T2TWijzdJ1ivFXXTwE3
 BlsXPjpk38iY+u/TjTZg/rljKvYRzJrb8dLgXMci/6KEUeyjAm2Z4HgFOQKu1lWXRfsvsUb0q
 xJYhHokH5AjYGMD+1AKf3rHsVmhuMYPqaisJfO6OZLwWbul1nl9qIdKUPupveIu2SsR0eD8m8
 6TRI6foXPf8wNF8gg9R4YxuWqPV2wt2gqCwJyTcb8pC3yWf4n2bNXhH/yDuf9bgylAZ7hn4fC
 A4jFnMm6xof1O/gIm4cpYaQ/EqqQshGHWxlUY7sNRRI/hH6mTH+czceaRxsxIZ1lxGdBAePqe
 xfm7eWq7/Z37QHNDrBYJxFXFpCQPJUIvDgbPlbOH0ChS8bAFslJfZe7+QFqV2wRMt1MAIwar9
 EzRgU7MqEuj6xfI/iuCrz6Q11dHvRw+1LsjEzCtwQcQlY=
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Mon, 22 Apr 2024, Ben Dooks wrote:

> On 21/04/2024 11:46, Marc Dietrich wrote:
>> The i2c controller needs to read back the data written to its registers=
.
>> This way we can avoid the long delay in the interrupt handler.
>>
>> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>>   drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++--------------=
-
>>   1 file changed, 24 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>> index 45df190c2f94..214839f51048 100644
>> --- a/drivers/staging/nvec/nvec.c
>> +++ b/drivers/staging/nvec/nvec.c
>> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>>   		(uint)nvec->tx->size, nvec->tx->data[1]);
>>   }
>>
>> +/**
>> + * i2c_writel - safely write to an I2C client controller register
>> + * @val: value to be written
>> + * @reg: register to write to
>> + *
>> + * A write to an I2C controller register needs to be read back to make
>> sure
>> + * that the value has arrived.
>> + */
>> +static void i2c_writel(u32 val, void *reg)
>> +{
>> +	writel_relaxed(val, reg);
>> +
>> +	/* read back register to make sure that register writes completed */
>> +	readl_relaxed(reg);
>> +}
>
> I thought the default behaviour of writel() should be to force writes
> out of any CPU buffers. Are there any bus isuses here causing the code
> to be necessary (and if so, why is there another buffer breaking the
> writel behaviour?)

if fear that's a question only NVIDIA can answer.

Marc

