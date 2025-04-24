Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFC13B58A;
	Thu, 24 Apr 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484629; cv=none; b=qoSOCCev2bYM3rRFolNWFdASf1635YGuKcX3FukHfyur8Cc9lw3B/a9LJzDo+iJfVHYMP5n4h5Ks1nfUaUZE838o34HUNKBI/WGGM0qoEEsvKyQLmfu3yx8tPRg3jMS3xJGjIU8oy7R/IiUH7d5ob3Zk0WDDap6AVerTncJvBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484629; c=relaxed/simple;
	bh=s/xjxH81nfhobfanoVxHjL/I3uP/Vbv6gkNi09tXOug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jc9FAMz0QLmpeEGAReGH4Jixpp+8RxwNmgK+M683Fd4zUdKBbkZeEWat4EvFyvcjBtPd11L1KHqY12X4zZagpXTEyoHGNi7IQ8/+0G6WxaEEu8cnc1Clou8r8ON4gog3z0eXcuSY8ZJU4/+iHjfqm2N2tGoChxJ8cAUO0KIBr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPaIs8zN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPaIs8zN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0504FC4CEE3;
	Thu, 24 Apr 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745484629;
	bh=s/xjxH81nfhobfanoVxHjL/I3uP/Vbv6gkNi09tXOug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uPaIs8zN4QMyUEFKHFX/R5BUNROD57WEUMwVXABv/DfhswMS9yMf2YS/ogJ8yEw4Z
	 ZZvt82QUxowT7LgfUv7nuljTMDCdjnCfTkKr10DE4bmq4RtlPWbv4Q3olyyURsGtkN
	 kMfCFRCOFMzhW4wSRh5GSOH7QX0zmsa3GBIMLCfT1w0yZpKtIm9DmnhIAo0vr20jRM
	 pLwcEbDckyLv3ZkcZcYr+5abl0IM3opLMnGjcx3p1BX6t1XvVAEmTIGkb7+iOmQJiw
	 oT+RNparrLrZL338r8OWr73ICp1ZbQGJQQ5etH6FGG4AbrMy5ia23VRbzjBQUwdoJI
	 Vy0dQGIN2Qe3w==
Message-ID: <d978a394-40c0-442c-82b5-58abfaa19f64@kernel.org>
Date: Thu, 24 Apr 2025 10:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: ASoC: Document Tegra264 APE support
To: "Sheetal ." <sheetal@nvidia.com>, broonie@kernel.org,
 linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250422072805.501152-1-sheetal@nvidia.com>
 <20250422072805.501152-2-sheetal@nvidia.com>
 <af965f9a-97c9-4e80-8d28-06532b16e80b@kernel.org>
 <22d4729d-590d-4082-ad02-7d4fdbfd08b6@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <22d4729d-590d-4082-ad02-7d4fdbfd08b6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 09:12, Sheetal . wrote:
> 
> On 23-04-2025 18:16, Krzysztof Kozlowski wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 22/04/2025 09:27, Sheetal . wrote:
>>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>>> index b4bee466d67a..ee33f056b125 100644
>>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>>> @@ -21,6 +21,7 @@ allOf:
>>>   properties:
>>>     compatible:
>>>       enum:
>>> +      - nvidia,tegra264-audio-graph-card
>>>         - nvidia,tegra210-audio-graph-card
>>>         - nvidia,tegra186-audio-graph-card
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
>>> index e15f387c4c29..26e1ed7ec7a7 100644
>>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
>>> @@ -31,7 +31,9 @@ properties:
>>>
>>>     compatible:
>>>       oneOf:
>>> -      - const: nvidia,tegra186-asrc
>>> +      - enum:
>>> +          - nvidia,tegra264-asrc
>>> +          - nvidia,tegra186-asrc
>> Keep proper order, not random, not reversed.
>>
>> <form letter>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC. It might happen, that command when run on an older
>> kernel, gives you outdated entries. Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>> people, so fix your workflow. Tools might also fail if you work on some
>> ancient tree (don't, instead use mainline) or work on fork of kernel
>> (don't, instead use mainline). Just use b4 and everything should be
>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>> patches to the patchset.
>>
>> You missed at least devicetree list (maybe more), so this won't be
>> tested by automated tooling. Performing review on untested code might be
>> a waste of time.
>>
>> Please kindly resend and include all necessary To/Cc entries.
>> </form letter>
> 
> 
> I realized after sending the original series that I had missed the DT 
> reviewers and already re-sent the complete series including the DT 
> reviewers, with the subject prefix |*"RESEND PATCH"*|. Please review 
> that version and ignore this one. Apologies for the inconvenience.
No, you got review here, so implement the feedback.


Best regards,
Krzysztof
