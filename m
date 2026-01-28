Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D71F09B3
	for <linux-tegra@vger.kernel.org>; Wed, 28 Jan 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592999; cv=none; b=QMj9AZQeku+a/w3R6nyPP1EurSi1QeratcI2brydnXFLe5+mm/MUD5k5e4Vz1tVuFWzREqvoGmdkWKk2BgKXuW/IeSu/2YqoM4We+2tWh3oAPDcb3Bn9HdNbvFMvvoksRsBCWyMWS+8n+LxrlDuKJhWGMU8vI+XluDq2DqkpjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592999; c=relaxed/simple;
	bh=/uC7aNV9amlBzPrhhufTmDfbCA17HBx2GKUUDq1+IJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoNy9wTp3I/6alQ4q5MAdwR0uIp6FY07qxranaf3kPQhIdELalYTSMqU1OHoT8klu4thCupq7lJzCFHXIUEY1YqND6EjVGzGVVVNm+s6Ac/35w1/YGqJIsACk5XdeLOSjxc6cL50vGDlmZZYShCJOftINQw5zduLK1OdhczhZjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dG71KE7k; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dG71KE7k"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4309357f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 28 Jan 2026 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769592994; x=1770197794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DhF98Nun2om+lYN0JL6mwSJXbtKFe/yYyeyl1TtEz3I=;
        b=dG71KE7kpxiyPenfxxeUrV0UfFdSFGJ1bmHG7uxyFUth9c3yFzJSXd2gWc1t5sdCgc
         81S0udSd2krx5IeZ1od3ooBtamv781h1SXEwgELG4/GyjJjQ2IUt9rKmcCrehQ/rKBkV
         Cxo/Tv82NWk8uPYGS3B8+q7BclRmhR7WycGi0s6bs/8z1mboVoWX8t4z99hmGV4DmK8S
         1i9HscDHczThS+fUJFEkqnAb8howqsSUJeI6xtflRk/wuZXRIaxUbYMLyNBj3g8FT/Zo
         WMhTFJj4ej7t/J1pHSoG0SdIvKJvGv3TUqUsUYEkKmnswoXe/EpG7vFXIDgELVgR7/kU
         E1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592994; x=1770197794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhF98Nun2om+lYN0JL6mwSJXbtKFe/yYyeyl1TtEz3I=;
        b=qYXclVJRxB8iqxGrLeo9en5JSVq7L2BSdRU1Wa65Ys3cjV+YijX/gR0nDYCOJDkck7
         QwVYJ+eXboiSoAjX/4e5jsLJCddrP2K0eekK3osv/HLtshwcQBJW5Jx5g8Nz3lUHI3Q3
         uvLWpid4B8KGoyGUJ2G3LRehqC5E75bF8XKcpkAcdtmMnQvE2y6x/aMJIX1Q7SAPs1JZ
         vX8RaFCFkI9Epv0LCdVCA4x7N/MxjX+UWaqS9W7HFDo2SQa2HSbKQiQNyI5xcsgywXbO
         dlIvluGrTrBIQwkneu09m2OOzumARpSOQBBNG+SFk+aozC76FQkPeIkYzkdyV+l8GkJt
         Kdaw==
X-Forwarded-Encrypted: i=1; AJvYcCVxxPs/QsnbQ0Qr7UmO6BMCitA0d3GR7YCpNM9kOjf1j9M5yiJy7n+uLF/pHG6c6FkXKqE11p43pjv1EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkWgKtWVMw5rvBdS1yusqxnMClB9Cp9n+IF9zapSQkcz+vT9JD
	u4FuojiMUkv+KRT+Ou2BJ5owgCx/tdBFJQqFsHyNQCUZcj/yR19Ng20VUteEJ2+W9wY=
X-Gm-Gg: AZuq6aJOqDt5oVAk5dSSw5b3tJgHAaAAOCtsF8y77gBCfbFJTYhpty9ifhwDVrv8uNO
	F7RJ3gUkNmDu/7XXnqexfZHGTcTkCEeRIbYXWwZ6cXkwZUow19jIr5XHUKD9nwawPB+QQhq2U8t
	KjPooCBs9XR09l4sgpzD8bp6+WY9sayQjZ6dA2ZmtM/ErnhNEvF8GkPi+6S3dydLePTa7pDhtHn
	3Bopsj17Y7mfyk3dSy81MRguGw9qrrVQh+nzhA5QdEXyZNQA8zSvfAk6mp/lDgECsP+q5pEbmOO
	BMgLM+BJ2O5qFE46iQ+ou2ZmgfoWDeR5oQPqnihQT/EMBZAJdf87mOPct2NKp/7YAZOJ7XdS1RO
	JMAaWSgPvCfWJAxbiM1zbrhCAwOC/6ZaEPOj4OhQnikq+6HyAY7REmgInCfRSUZKZTZlhkUv2Br
	TwgjCWnX6f+27qWO7lvzoF0PBNeEM=
X-Received: by 2002:a5d:5f43:0:b0:435:907f:e439 with SMTP id ffacd0b85a97d-435dd05c4bamr6010824f8f.18.1769592994091;
        Wed, 28 Jan 2026 01:36:34 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm5489795f8f.6.2026.01.28.01.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 01:36:33 -0800 (PST)
Message-ID: <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org>
Date: Wed, 28 Jan 2026 09:36:32 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Ian Rogers <irogers@google.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, mike.leach@linaro.org,
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com,
 ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/01/2026 8:03 am, Ian Rogers wrote:
> On Tue, Jan 27, 2026 at 3:00 PM Besar Wicaksono <bwicaksono@nvidia.com> wrote:
>>
>> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
>> Also updated the common-and-microarch.json.
>>
>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>> ---
>>   .../arch/arm64/common-and-microarch.json      |  90 +++
>>   tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>>   .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>>   .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>>   .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>>   .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>>   .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>>   .../arch/arm64/nvidia/t410/general.json       |  15 +
>>   .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>>   .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>>   .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>>   .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>>   .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>>   .../arch/arm64/nvidia/t410/metrics.json       | 722 ++++++++++++++++++
>>   .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>>   .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>>   .../arch/arm64/nvidia/t410/spe.json           |  42 +
>>   .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>>   .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>>   .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>>   20 files changed, 2905 insertions(+)
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/brbe.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/bus.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/exception.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/fp_operation.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/general.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1d_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1i_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l2d_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/ll_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/memory.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/misc.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/retired.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spe.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spec_operation.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/stall.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/tlb.json
>>
>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> index 468cb085d879..6af15776ff17 100644
>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> @@ -179,6 +179,11 @@
>>           "EventName": "BUS_CYCLES",
>>           "BriefDescription": "Bus cycle"
>>       },
>> +    {
>> +        "EventCode": "0x001E",
>> +        "EventName": "CHAIN",
>> +        "BriefDescription": "Chain a pair of event counters."
>> +    },
> 
> Cool stuff :-)
> 
> For wider counters AMD does something similar, but should this be an
> implementation detail rather than an exposed event? How does it
> operate as an event?
> 

CHAIN should be excluded from the json, it's used internally by the 
driver when you want 64 bit counters. Userspace can't use it because it 
can't control where counters are placed to make sure they're adjacent.

> [snip]
>> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> index bb3fa8a33496..7f0eaa702048 100644
>> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> @@ -46,3 +46,4 @@
>>   0x00000000500f0000,v1,ampere/emag,core
>>   0x00000000c00fac30,v1,ampere/ampereone,core
>>   0x00000000c00fac40,v1,ampere/ampereonex,core
>> +0x000000004e0f0100,v1,nvidia/t410,core
>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>> new file mode 100644
>> index 000000000000..532bc59dc573
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>> @@ -0,0 +1,45 @@
>> +[
>> +    {
>> +        "ArchStdEvent": "BR_MIS_PRED",
>> +        "PublicDescription": "The Event counts Branches which are speculatively executed and mis-predicted."
> 
> nit: The capitalization on Event and Branches, as well as other words,
> is a little unusual.
> 

If there's nothing specific to this CPU then the public description 
could be left out entierly. The common strings already say the same 
thing as this:

     {
         "PublicDescription": "Mispredicted or not predicted branch
                               speculatively executed",
         "EventCode": "0x10",
         "EventName": "BR_MIS_PRED",
         "BriefDescription": "Mispredicted or not predicted branch
                              speculatively executed"
     },


> [snip]
>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>> new file mode 100644
>> index 000000000000..18c2fd58ee9e
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>> @@ -0,0 +1,722 @@
>> +[
>> +    {
>> +        "MetricName": "backend_bound",
>> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
>> +        "BriefDescription": "This metric is the percentage of total slots that were stalled due to resource constraints in the backend of the processor.",
>> +        "ScaleUnit": "1percent of slots",
>> +        "MetricGroup": "TopdownL1"
> 
> Note, on x86 we place TopdownL1 in the Default metric group so it is
> shown by `perf stat` when it isn't given events or metrics to compute.
> Perhaps you want to do something similar?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/pmu-events/arch/x86/icelake/icl-metrics.json?h=tmp.perf-tools-next#n116
> 
> Thanks,
> Ian

That's currently true for the Arm topdown metrics in sbsa.json, but we 
probably don't actually want this because there aren't enough counters 
for the perf stat defaults plus topdown and it results in multiplexing 
and bad results.

I was planning to change it but we also don't currently expose the 
number of counters available either...


