Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531E3655D6;
	Wed,  1 Jul 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903397; cv=none; b=rXf32vDcSgY1QPXskS8LBOb9G8B6lgSoZdSfOEr2Yd7K22/+UZ4HC6Fw0z/FDvMX7m/10JEh5GyMuS6lcEpiu5SaEO0wgiQBfLrNqGd2XcL8sHNPq9XbbM5q08fHxoCXFgK6bSp36DuIoMaYNm2NJ6I+ZUlJ6rLZjVIpwqQgHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903397; c=relaxed/simple;
	bh=Xz/M/oVmgC4iT6gqXAlX1ebS7dOHQ7COAPgOuecCk18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A3UXG0Ay2zt9gv4PB0YFD0QY8kIO7HNCkeOtXQslXGAjSifW+qrtFqdJEWsRZcNBcKLV1kU8FuYX2dEfENnNOOo0K+4/Yw2qS2w6dN0AapwBnfoxlQFFvfzOENXV/SvPYPpu07Sh8SKg10JtdcBu5n7eOK8rauczunnmVIXU56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jVAQhVdn; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jVAQhVdn"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R0xQROUgY3USVrZRoxRpR+tcCXdEqbd2n35d9Jl/Ms0=;
	b=jVAQhVdn0fHFYNTsr5P+ASorHGa/BtzV9+gxe/BkYOLGPco0c9rweTFqgy/qXPpempwPWyWHr
	F3PkbOSoRe8/QPVVUV6xRowpdATn8In4hR/uQhdDoBiQ0HK75ZYsS/s6mG2wExYbdcIh+slIjk2
	1hFBzayGRAtpXyQKBWbaE9k=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gqxXz5shGzLmBl;
	Wed,  1 Jul 2026 18:47:15 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 896B340565;
	Wed,  1 Jul 2026 18:56:25 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 1 Jul
 2026 18:56:24 +0800
Message-ID: <737355ec-7e0c-434b-b41d-201d08d1d020@huawei.com>
Date: Wed, 1 Jul 2026 18:56:23 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: topology: read CPPC FFH feedback counters in
 one operation
To: Sumit Gupta <sumitg@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <rafael@kernel.org>, <lenb@kernel.org>,
	<robert.moore@intel.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>, <zhanjie9@hisilicon.com>,
	<cuiyunhui@bytedance.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>, <xuwei5@huawei.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <wangzhi12@huawei.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-3-zhangpengjie2@huawei.com>
 <56a1e8bf-41b1-40cf-a943-79cce84a774e@nvidia.com>
From: Pengjie Zhang <zhangpengjie2@huawei.com>
In-Reply-To: <56a1e8bf-41b1-40cf-a943-79cce84a774e@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr200004.china.huawei.com (7.202.195.241)


On 6/29/2026 11:27 PM, Sumit Gupta wrote:
>
> On 10/04/26 15:11, Pengjie Zhang wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> arm64 implements CPPC FFH feedback-counter reads using AMU counters.
>> Because those counters must be sampled on the target CPU, reading the
>> delivered and reference counters separately widens the observation 
>> window
>> between them.
>>
>> Implement the paired FFH feedback-counter read hook on arm64 and sample
>> both AMU counters together before decoding the requested CPC register
>> values.
>>
>> Also factor the FFH bitfield extraction logic into a helper and reuse
>> it from the existing single-counter FFH read path.
>>
>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 67 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index b32f13358fbb..b90a767b2a1f 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -50,6 +50,16 @@ struct amu_cntr_sample {
>>          unsigned long   last_scale_update;
>>   };
>>
>> +struct amu_ffh_ctrs {
>> +       u64 corecnt;
>> +       u64 constcnt;
>> +};
>> +
>> +enum cpc_ffh_ctr_id {
>> +       CPC_FFH_CTR_CORE  = 0x0,
>> +       CPC_FFH_CTR_CONST = 0x1,
>> +};
>> +
>>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, 
>> cpu_amu_samples);
>>
>>   void update_freq_counters_refs(void)
>> @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
>>   }
>>
>>   static inline
>> -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>> +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
>>   {
>>          /*
>>           * Abort call on counterless CPU.
>> @@ -447,24 +457,73 @@ bool cpc_ffh_supported(void)
>>          return true;
>>   }
>>
>> +static void amu_read_core_const_ctrs(void *val)
>> +{
>> +       struct amu_ffh_ctrs *ctrs = val;
>> +
>> +       cpu_read_constcnt(&ctrs->constcnt);
>> +       cpu_read_corecnt(&ctrs->corecnt);
>> +}
>
> Any reason to flip the order?
> Harmless as they are read back to back, but better to add a comment
> if it's intentional.
>
> Thanks,
> Sumit
> ....
>
Hi Sumit，

Thanks for taking the time to review and test.
The cpu_read_constcnt() function includes the conditional check
this_cpu_has_cap(ARM64_WORKAROUND_2457168), which incurs a latency of
6–12 nanoseconds on the our platform.
If cpu_read_corecnt() is called prior to cpu_read_constcnt(), it will
widen the sampling interval between the corecnt and constcnt counter
readings. To address this, we have adjusted the call order:
cpu_read_constcnt() is executed first, followed by cpu_read_corecnt().
I will add comments later.

Thanks,
   Pengjie


>
>
