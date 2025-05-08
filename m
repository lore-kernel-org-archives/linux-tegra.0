Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CD2397A4;
	Thu,  8 May 2025 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694321; cv=none; b=JgCCf9pT0zp13IktHPf19D4MFzaBZGlARQ87nHjEaLc1KRQhYC1r08YHOAUe0zXfYbsbbNbXeCAHTdE5z7/vhnFbO66L5+rGkZ0gbz7Bfe8UsDLECOYYrhMP9QKyZffpguN+1/wCJW2EBf6luDTAGInLED4hKUx6fN/AGaKol6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694321; c=relaxed/simple;
	bh=CvCHKw2DrPRIkEjStvg0PsH/JFmu5t3thdOEGFPOWJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcCi6wGdDkwVlHL4Rns9dyEbNsBbiD9IEL160HVUOVYIhN3dO58BNzVnMRQmCwCC1mxcOCgolXgmeZsbk/X3WYS/iC7j/3g0P7rHTtue3p6g37CR6qqbTFLDKQA+Tz1dacxsvZxawXKHnxV6/gWGYNuwlWfsXaTpWPNf5bHEnNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYNbhNSz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYNbhNSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC33C4CEE7;
	Thu,  8 May 2025 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746694320;
	bh=CvCHKw2DrPRIkEjStvg0PsH/JFmu5t3thdOEGFPOWJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYNbhNSzA07ONu9LeO0a+DQQ+UD00WnlsX/2kJsX5z7ngesZpBWFr5PoQT/sNkr8E
	 bcVMDlnrzVF2nEWAuQhmyH6VDwawNLi8zMbOmBH3l4EmznMgxZrB1T7aY2LBdp5NeI
	 ncBNMcAG9CnN41xFyQ+skOzmrR3SB9EklseCpwGq2F6ZnHQAzO5ySwfFprAVFKC8o7
	 3QW+sU6R8t4RhKeYB4vcaZYAjtJULCEUIg4ldWFlp8874pdpRdDm1VAGjOr1B8aAFb
	 /0uLf2S8JUJO9pIj9+uKDZTDbEE9UiLiyr8gfyOeQVJ4hq2f9YC+TwP7DzQltCygSG
	 XDEn4Dny58nRw==
Message-ID: <321bf682-71b4-433e-ade4-97e8c9839564@kernel.org>
Date: Thu, 8 May 2025 10:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
 <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
 <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
 <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 09:59, Thierry Reding wrote:
> On Thu, May 08, 2025 at 09:49:12AM +0200, Krzysztof Kozlowski wrote:
>> On 08/05/2025 09:46, Thierry Reding wrote:
>>> On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
>>>> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
>>>>> On 07/05/2025 16:37, Thierry Reding wrote:
>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>
>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Missing commit msg
>>>>>
>>>>>> ---
>>>>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
>>>>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
>>>>>>  2 files changed, 16 insertions(+)
>>>>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
>>>>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
>>>>>
>>>>>
>>>>> Filename equal to the compatible. That's the standard convention for all
>>>>> the headers since some years.
>>>>
>>>> Huh, I cannot find the binding in this patchset. Where is the actual
>>>> binding added?
>>>
>>> The bindings for this are in
>>>
>>>   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>
>> There is no tegra264 in that binding.
> 
> That's part of an earlier series I sent out (and linked to from the
> cover letter). It's here:
> 
> 	https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.reding@gmail.com/T/#m96bb396b352659581a9e71a4610c51e6ab4d5b6a


Then this patch belongs there. Standard rules apply: binding headers go
with the binding itself and the binding itself go with driver patch via
driver subsystem tree. At least usually. Nothing here is different than
all other vendors who follow such convention.

> 
>> The header always goes with the binding and the drivers.
>>
>>>
>>> There's no 1:1 mapping to a compatible for this because BPMP is many
>>> things. It's a clock provider, a reset provider, a power domain
>>
>> Sure, that's fine.
>>
>>> provider. These definitions reflect the IDs assigned by the BPMP ABI
>>> and we've used this structure ever since this was introduced back in
>>> 2016.
>>>
>>> I don't think changing the convention for this is a net advantage.
>>
>> Headers still should match the compatible one way or another. Can be
>> nvidia,tegra264.h
>> (because -clock is redundant and you do not want to use the actual
>> compatible)
> 
> I get it. You want consistency. But what about consistency with earlier
> chip generations?


I will fix them after finishing my time machine. :)

> Do you want me to go and rename all of these files?


No, I don't want to change them, but I would be fine if someone does the
change (although someone else might claim this is a churn). That ship
has sailed, but at least we can start with new bindings.

Best regards,
Krzysztof
