Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF7258EE0;
	Wed, 11 Feb 2026 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770790796; cv=none; b=CNuibUX1k5qsv23a1sUgMGXlQudm+nv9AaVImKUn7m5M5af9gxZoN9H99gVGT2zkJ+retCEltknrGYU65G1u9pdFjZ0UbZxuhEdgNhDn+2OXAJo49KLscalT5eZQaJygBUrl7AwmboEZ3yNCDSHPhHLAlFjzjEWqjJ2d3nv7zcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770790796; c=relaxed/simple;
	bh=7rgUId6mgMF3MTDeDSkGxit6/QsnD0ZWcZ2CxVpgb/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ud1M65LCcQTnfijr/fUQDH9aa7Vf5+aYwjhY0NBY8d4Sg37WNwouY87ZAJ+6e3+IWPs1GvLB0QBYf4Xheouw7ltZESP0iqugWkisMKXwvGPioELzsdWVPshULKXrq+lb++84lqTp0u/O3cJnyHH8wk20bI3PNDbHKc4/yqbjo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLdDjwpu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLdDjwpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A2EC4CEF7;
	Wed, 11 Feb 2026 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770790796;
	bh=7rgUId6mgMF3MTDeDSkGxit6/QsnD0ZWcZ2CxVpgb/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QLdDjwpuyYpgZoJGl0ixYFS+MPPIvS4XNkwLxvfaM76yVTDKowRQZZPxCElPEdhuc
	 FeIeQMee6o9cojI8ZQMwVWnSwcL6J+3nLNTrYkpdkyWKGQQ9XvQyboCgaVtfz6iXHZ
	 125tLJmPCPVfvdkw8ToeV1f38kZekzRiXnvdg7CfzN6z/k5G4rgD+BgizGKbuLmbwI
	 hqUUkfhX5EKw3hJVazYq22QaW7yeRJ55PlzWrf/3PS36/O680Ge7VbazHnKKco0pBM
	 lkYeq52QcUwl9mlcDkjpOJ5wlujwYZWJUToOsB1SZ7RKTK9L0jfl9YQ0ceNg39th5a
	 HVw/Dn6oSLpsw==
Message-ID: <a04e5648-86c0-4930-ac2f-a824acb35941@kernel.org>
Date: Wed, 11 Feb 2026 07:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
To: Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Sean Kelley
 <skelley@nvidia.com>, Yifei Wan <YWan@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-9-bwicaksono@nvidia.com>
 <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
 <SJ0PR12MB56762714BF94D1E67511C43DA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <bd69c94c-51d0-4166-a059-e46b30cb83e0@kernel.org>
 <SJ0PR12MB56763B5860CE8E93BEB4FF49A062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <SJ0PR12MB56763B5860CE8E93BEB4FF49A062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2026 18:42, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Tuesday, February 10, 2026 10:15 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> suzuki.poulose@arm.com; robin.murphy@arm.com;
>> ilkka@os.amperecomputing.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Yifei Wan
>> <YWan@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Nirmoy Das
>> <nirmoyd@nvidia.com>
>> Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 10/02/2026 17:05, Besar Wicaksono wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: Sunday, February 8, 2026 5:18 AM
>>>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>>>> suzuki.poulose@arm.com; robin.murphy@arm.com;
>>>> ilkka@os.amperecomputing.com
>>>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> linux-
>>>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>>>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>>>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker
>> Donthineni
>>>> <sdonthineni@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Yifei Wan
>>>> <ywan@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Nirmoy Das
>>>> <nirmoyd@nvidia.com>
>>>> Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 26/01/2026 19:11, Besar Wicaksono wrote:
>>>>> Enable driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU device.
>>>>
>>>> Why? Why do we want it? Which *upstream board* uses it?
>>>>
>>>
>>> These are for NVIDIA Vera platform (Tegra410 SoC).
>>
>> There is no such board (git grep), but anyway, don't explain it to me.
>> Your commit should explain such stuff.
>>
> 
> This is a server platform. There is no upstream board using this device currently.

I don't understand why server or not server matters.

If there is no upstream user of this, it is wrong to add it to
defconfig. This is upstream defconfig, not your distro.


Best regards,
Krzysztof
