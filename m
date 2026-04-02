Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C87332621;
	Thu,  2 Apr 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123620; cv=none; b=CK2CLgnOtVHPvSg0sV4aaZl52ZIAwA3gFF2DKmyHDGWSVxx2o3bxwSiUaygsgioNZUj4US2OhKet+rk1UHZA/RIKaj6NqnfJ3OAaR97OE6Jnws/Gr763mXmfe6TEOFT5bokcTlEoRUg5tMtjPOV8qdvAiaEgifYnbEr5AvJyp3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123620; c=relaxed/simple;
	bh=a1jLTGUGZcEmkcUgnbM45f6QbxY+747Eq6dSXy+EG44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBtJ5vv5DE9aV4maW72P+Dd40e09zcgvMdn64yS+8qkeC7/VAaT5TpFe9XPtrPDr5Zxb+kPdG7FVkF4R/SCbiPHDQHd1BWFKdez75XcyVqPYzu3wgqYCTcH6MmrJgn82+coBzMJ1M9iViTMdXmfdvCphK6sTK0uyl4sJTLhVD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eClfswZ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eClfswZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B220C116C6;
	Thu,  2 Apr 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123620;
	bh=a1jLTGUGZcEmkcUgnbM45f6QbxY+747Eq6dSXy+EG44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eClfswZ2tlhHvW9yuUOWF1y4fWu4JjVAiIqJO7yZ/iBk3qO+5xXikOxjByR7HL3Ur
	 GrbDz2+F0ZkbwLrVsXGU1ltVKodDdTAsP9fdf2RphQbJXv6WFyAhmMnifMVGgGksBl
	 G/hjyyhLlEKvj3I2ber+61dVqVbiq8naySV2ieJObjBihgkIaifTZTDMj43m4uzeD0
	 hP8n5Q2P7+BumOKwmlZKGFHBueCmlJOXCA+5742ohxkKEGu0KPJQdDE63Ha8uIc0ae
	 eyYMvC7to6NaWbuNGbagafEOyoxdSd99ewcArvzjW0DA0BhEq4kx6SDjq+JzF+RcmJ
	 zsa7So7l75lpQ==
Message-ID: <c4f41a94-50d0-4f7d-b5cb-2fc966129440@kernel.org>
Date: Thu, 2 Apr 2026 11:53:35 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: timestamp: Add Tegra264 support
To: Jon Hunter <jonathanh@nvidia.com>, Suneel Garapati <suneelg@nvidia.com>
Cc: dipenp@nvidia.com, thierry.reding@gmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, amhetre@nvidia.com, sheetal@nvidia.com,
 kkartik@nvidia.com, robh@kernel.org, pshete@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401213831.187569-1-suneelg@nvidia.com>
 <20260401213831.187569-2-suneelg@nvidia.com>
 <20260402-neat-amiable-puma-d747ea@quoll>
 <1902fb50-ed1e-49a3-b210-cd9167824c1b@kernel.org>
 <dc3a518e-940b-40e6-aacc-9e1356d266f5@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <dc3a518e-940b-40e6-aacc-9e1356d266f5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2026 11:49, Jon Hunter wrote:
> 
> On 02/04/2026 09:47, Krzysztof Kozlowski wrote:
>> On 02/04/2026 10:47, Krzysztof Kozlowski wrote:
>>> On Wed, Apr 01, 2026 at 09:38:29PM +0000, Suneel Garapati wrote:
>>>>     reg:
>>>>       maxItems: 1
>>>> @@ -112,6 +114,7 @@ allOf:
>>>>             contains:
>>>>               enum:
>>>>                 - nvidia,tegra234-gte-aon
>>>> +              - nvidia,tegra264-gte-aon
>>>
>>> And why exactly the slices are variable here? Explain that in commit
>>> msg.
>>
>> s/Explain/Shortly describe/
> 
> So this is not related to slices, but indicating the 
> 'nvidia,gpio-controller' property is required for the AON controller. 
> However, maybe your comment still applies and you want the commit 
> message to be explicit that for the AON instance the 
> 'nvidia,gpio-controller' is needed?

You have two devices there - AON and LIC - and variable properties. I
want answer why things are variable. HW is rarely variable. It is
opposite of variable - afixed.

Best regards,
Krzysztof
