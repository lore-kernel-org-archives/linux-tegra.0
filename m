Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479730596F;
	Tue, 24 Mar 2026 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335728; cv=none; b=L+fx6fb5y8bwDYGmT1jM15pEfdqH4qH6WOWspatYG2ZlEPAM+k4xxFeENZ6kXuy85HV3RW34UgsGpNUH+daCA5oz/4zjNkOtaiOU+1fVeyAOrWw+ol2qha9ABYhtbH5fXn/+jqNjTT4pmS3QsOP/V/8Qd3+N9yDcZFqMkF0hqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335728; c=relaxed/simple;
	bh=7J7e2PZn49kKZWBgs1ncIOV2H6wLgMe5h297kwiAgRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTQXZNA7LMA1hzVHkE3s184MUgFB6z81QYChjoKXauIYp/GkGHUqwv66F83gb4TCHVVarKBfWH5xfE8UlxynGJAhB3M7Kl9sd/FSKDi9SvckegL3Rzzz2uwGzaCpDbWdUAxZABJHjXnX2oigaf0ZdJP0XSJbMFOQGHSpttAtrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijjj6Ljn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijjj6Ljn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60568C19424;
	Tue, 24 Mar 2026 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774335728;
	bh=7J7e2PZn49kKZWBgs1ncIOV2H6wLgMe5h297kwiAgRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijjj6LjnouSAMohvqNdXzsV9r9mlD6pUNeRLL7Y1EeYl7TZkXCtpma6Xxk6beRyyD
	 vnFXmhxrAo9fHgw9tLUvWgJYGN/e+KGhWwFjtUVyqofjDAeXrKY52Droyy9LicND3L
	 LGJpeQa5fOmUA02urp+PB3ESawRTs3qS2QyOzsuWjFrHY/iAmT45YbSBSFRzJ0y6Uk
	 FfbRw+6QB562s0Yf7AfaM2rm1uYGgArvZCAV1YjRuQX4x7x5Hp4YSC1Lgs0Ogp5SpL
	 BdA27HppeaIOwdbwzk1VxE1/Y7KSy6bfD5oMskUI9sfLesOsxP45Asyjh+nR4yKX3Z
	 baQvEl1pkSJeQ==
Message-ID: <511d83fe-eb94-4c25-8ce1-b2476dfbd404@kernel.org>
Date: Tue, 24 Mar 2026 08:02:04 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
 <8611828.LvFx2qVVIh@senjougahara>
 <d3ca4cd0-c343-4885-ba97-814aeaf80fac@kernel.org>
 <5154962.LvFx2qVVIh@senjougahara>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5154962.LvFx2qVVIh@senjougahara>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/03/2026 05:24, Mikko Perttunen wrote:
> On Monday, March 23, 2026 4:23 PM Krzysztof Kozlowski wrote:
>> On 23/03/2026 03:45, Mikko Perttunen wrote:
>>> On Saturday, March 21, 2026 7:49 PM Krzysztof Kozlowski wrote:
>>>> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The PWM controller found on Tegra264 is largely compatible with the one
>>>>> on prior generations, but it comes with some extra features, hence a new
>>>>> compatible string is needed.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>
>>>>>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> Where is the driver patch? Why this is not being part of driver
>>>> submission (see also submitting bindings DT in description how patches
>>>> should be sent)?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Just posted:
>>> https://lore.kernel.org/linux-tegra/20260323-t264-pwm-v1-0-4c4ff743050f@n
>>> vidia.com/T/#mfb40392e07d7ac9cedbaf853442eed822da7671e
>> so this is completely misplaced. Please read submitting patches in DT
>> dir and follow standard style of sending patches upstream. Just like
>> every other contributor. You don't get any exceptions here.
>>
> 
> You asked to see patches, so I thought I'd be helpful and clean up my work in 
> progress and respond. I'm not looking for any exceptions. Please do not make 
> such accusations.

I asked where are the patches. The non-existing cover letter of this
patchset explained nothing in this regard. After my question where are
the patches, you sent them without explanation why, so don't assume I
can read your intentions that you posted them just so I can see the
patches and you do not intend to merge them.

Best regards,
Krzysztof
