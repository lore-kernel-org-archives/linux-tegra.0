Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E392F1FC8;
	Tue, 18 Nov 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462331; cv=none; b=iEHQZjfmxYcDuAM11PD703oAkL/HCpBZEE0YQaaR8TQU72UAGe8sei1JINPOJMi4Lic925+KoX2YEsCwnzhpoRJRgNqaX7kcdvcCDvers9NSxU+0rnErhnYq/2fsrH1lgLPDg+bDpTRLWxVQMkkQjCx8DqlXoIJHNegxLaYFPKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462331; c=relaxed/simple;
	bh=i0psKtgYo14zrou8MdVu+ZT0F4wPW2IGkdT2aFkjUtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTTKvkCR2836xossv1KxbimaAoHvkMgJOYRsTcKVVrK3YB7dQdNcLriNFtxxHOTZcjZmy6Dij7gfjc1s7cKqQhXn2F0vNNJ7eKC3sBsEsJJkwHzYKDgdszujvENG6e6CmHMg3KilF8j9qnw/NZw4nkrzVV8qfEiP76DyNkCV0v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3EaYcsj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3EaYcsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C688DC2BCB7;
	Tue, 18 Nov 2025 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763462328;
	bh=i0psKtgYo14zrou8MdVu+ZT0F4wPW2IGkdT2aFkjUtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n3EaYcsjpyIBctupVrJhfqkyYCr76qvy3vGXvTKOInwPOujtAgYfcCjjZcw843lAR
	 KBXum1jo/LgI5+Hz9Uz+YRvBXdwPv3wX+FTgo3MU/IaPxOT51vcFJSuMXk+1eT4tG9
	 xAmpQi3JGsGlT5g9Xn6j4RgMSRDQrYyu9zf/h0FXsRGBP3lK0ORHfXpn1jpRgk47G6
	 xItBMS/9OQA2GGc0GX9emUT0wDpyaOWWCbZk/VH4M6yCBfZgA9O2IX2m9a9pUw6tB9
	 a9dX1y4mEwW4JYzyA7JqKwU8TEap77rN/LWaUgdOOvUJkbI+ahyLTDPyJ/K8dysZ2X
	 ifbvErxkVogoQ==
Message-ID: <e39fcaeb-b516-41f1-89a4-fa3328c07deb@kernel.org>
Date: Tue, 18 Nov 2025 11:38:43 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional
 aperture
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
 <20251115-accurate-fair-salmon-64eca9@kuoka>
 <77b9e0cd-2597-4d52-a352-dd029ccb6a42@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <77b9e0cd-2597-4d52-a352-dd029ccb6a42@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2025 11:08, Jon Hunter wrote:
> 
> On 15/11/2025 12:25, Krzysztof Kozlowski wrote:
>> On Fri, Nov 14, 2025 at 04:17:10PM +0000, Jon Hunter wrote:
>>> Not all Tegra SoCs or all versions of a particular Tegra SoC may include
>>> the AOTAG aperture. This change makes "aotag" as an optional aperture for
>>> Tegra234 and Tegra264.
>>>
>>> Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
>>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>> Admittedly I don't know if there is a better way to handle this,
>>> but if there is please let me know!
>>>
>>>   .../arm/tegra/nvidia,tegra186-pmc.yaml        | 57 ++++++++++++-------
>>>   1 file changed, 38 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>> index be70819020c5..defd9000eed2 100644
>>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>> @@ -19,17 +19,12 @@ properties:
>>>         - nvidia,tegra264-pmc
>>>   
>>>     reg:
>>> -    minItems: 4
>>> +    minItems: 3
>>>       maxItems: 5
>>>   
>>>     reg-names:
>>> -    minItems: 4
>>> -    items:
>>> -      - const: pmc
>>> -      - const: wake
>>> -      - const: aotag
>>> -      - enum: [ scratch, misc ]
>>> -      - const: misc
>>> +    minItems: 3
>>> +    maxItems: 5
>>
>>    minItems: 3
>>    items:
>>      - const: pmc
>>      - const: wake
>>      - enum: [ aotag, cratch, misc ]
>>      - enum: [ scratch, misc ]
>>      - const: misc
>>
>> Should work, no?
> 
> I was thinking about that, but with the above, and if I am understanding 
> you correctly, it would permit someone to make the following mistake ...
> 
>   reg-names = "pmc", "wake", "scratch", "scratch", "misc";
> 
> Hence, I thought that I need to be more explicit and list out all the 
> combinations that are supported for a given device. Let me know if I am 
> misunderstanding you here.

It won't be allowed, test it.


Best regards,
Krzysztof
