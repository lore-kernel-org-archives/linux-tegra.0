Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276C346FCB;
	Tue, 11 Nov 2025 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859819; cv=none; b=oMtUYrlz2xqVwclDW8Fax3SyUyn+rrFvZ/7qZkEAWh+P2fEU35cW4XlgR3hZ9M0MXtDwYnz6ESA0AIM98e4ELaZKAL2s6MRVztgNM2TI+XrYRTm1zxAoQfdHr4hV9UU5wgBKpZe+8nUr6ZgBHpDwYXbZiUCmKlP7R7FQpbqmeoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859819; c=relaxed/simple;
	bh=6GaXkqPrq2gZuZ0i7G8tPqJd3p8ZVkVq5GXwEApzHJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLiAEUQ+sxDzhUGPbgoqQFqsvInr10bmTmadnaEmog0ECIG+82cc3xykEwVgzT984GCRA18P/fOPazAYjfCq1Jy2/Pm/whNzwzcS2TnMU9wqV87WCixy3GCLEUfIQU3F4QprdPBS3Y6gOvlZr6mHDSdNftuPBya0LUS3GV48V2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+kHAFqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+kHAFqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F5FC116B1;
	Tue, 11 Nov 2025 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762859819;
	bh=6GaXkqPrq2gZuZ0i7G8tPqJd3p8ZVkVq5GXwEApzHJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m+kHAFqwrLPohGYQLVCe3ybZXB4/IzDjklHStUvFB4kKT1/82fBi2P1LgYDY37XPS
	 o0zr/G4t++pQgnX52oxJ1uOdM5xMrd5zJ1g11VQeSXPJc/WDW9mYt1IWB8cCdG9yY2
	 25YF4wMc1om7bQ8mFDrprszK9Cz2e/6PQre2MQZ7Fe3lmp5Koz0ZKwZ8Jb3RMalkVe
	 m63RY6jdJXq2PIkvEOB2oHl+ovMcwqA7QuQiY5vINMigyXSXLKwdQFgd5lMpbpAdWB
	 WWJHVFVxNtrfimEX5b5YGn6vFf0kqTlRDHDpKUyrYahXzpjoxxCgRAMpP5Pp0vym1h
	 S7LZpQwEpGAkA==
Message-ID: <99ca4992-5736-417d-854e-379542549bee@kernel.org>
Date: Tue, 11 Nov 2025 12:16:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2025 12:13, Jon Hunter wrote:
>>>>> +
>>>>>        if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY)) {
>>>>>                err = tegra186_emc_get_emc_dvfs_latency(emc);
>>>>>                if (err)
>>>>>
>>>>
>>>>
>>>> FYI, this patch is causing a boot regression on Tegra194 devices. I
>>>> noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are
>>>> no longer booting and bisect is pointing to this. I will have a closer
>>>> look and try to see why this is.
>>>
>>> Interesting. Both were booting for me during my verification, though
>>> my use case involves the dt changes that I don't believe have been
>>> picked up yet. Thought I had explicitly verified without the dt
>>> changes too, though. Since I was asked to do so on this or one of the
>>> other similar series. I will try to check linux-next as-is soon.
>>
>> I just built next-20251110 using the standard arm64 defconfig and
>> flashed the resulting Image and dtb's to p2972 and p3518 (p3509+p3668)
>> and both booted to cli on a barebones busybox ramdisk. I do not see
>> any errors from tegra-mc, and the only error I see from tegra186-emc
>> is that it can't find the opp tables, which is expected without the dt
>> changes, and is not fatal.
> 
> Thanks for testing. Something is not right because our boards are 
> failing. So may be we are doing/testing something different. However, 
> this should not break. So there is a problem here.


Did you meant: "So there is NO problem here"?

I kept these for 10 days in linux-next and yesterday sent them in pull
request. If some patches are needed on top, they can still fit coming
merge window if sent soon.


Best regards,
Krzysztof
