Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6335B156;
	Tue, 18 Nov 2025 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475745; cv=none; b=R0MR/JP764tf4jq4UmeDjN+5n9lfHJcOEibpFNySLgmpfLH+zN9NGq9Eur10CRPqLtLTyDHAZwZb4f+j1i/CRuo4n73OS/ceF9FiMrZfMAVs+iLj8ZhR0onfvZfdz1tOfuCR/pCHlbwo1DSyBp148LrlcWehAeTiZh/CCyOtyfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475745; c=relaxed/simple;
	bh=aEGw6JWHkR6aN0sc/5v4DQxKC8iSO5HJJVmjkbf4TIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+5tHtUHOfDV1QQ2CpixKFqoF2+TF2B+C76YRuOIbBXPU/N6SgCWBzV8zgcg9Vmf6eSRmpyfSexLOqNL9SfZD06wonNb0QBrEVhxCifzbmKBJ7vDtH3w1SfzF5gwav+vgNg132xRLnf+cTdrG5Rj1O3A+4FXQ1CIJYuJsMrAIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lco3dbuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lco3dbuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE979C16AAE;
	Tue, 18 Nov 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475744;
	bh=aEGw6JWHkR6aN0sc/5v4DQxKC8iSO5HJJVmjkbf4TIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lco3dbuJiPAAKrOqazMKIKz4UnIoHPOtuAnJODHUM/nIPL48vJBoGH6W0Okr/IaiM
	 Mo12us2UlKySxMVveAXoueQWfaioZJQ5hluxGJvZCHYEdM1q6kaCdn+PUZkpecba1K
	 RPXQrwq5CS8y+A6+Dfctv6aYWlH7e6zHK0CA6OJ7zqGFZSxDmLnx1mJ9unKCNInlBP
	 4Lkw8Eni0Sa9K5ABgOZSKAMLT+/0D/o8zKwsjUu4wEgOGPoJ4dtPMFfrxNoG/FTF8a
	 /FBdS+mCmB26zg18yjkX2Wzqur7c3L7bDPgsfbmbm9NTzYy++As68BzJpKh9ugPSJB
	 cOo72/WBzmftQ==
Message-ID: <e6c73b8a-6a73-488e-8520-1df30ec1006b@kernel.org>
Date: Tue, 18 Nov 2025 15:22:21 +0100
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
 <e39fcaeb-b516-41f1-89a4-fa3328c07deb@kernel.org>
 <9e88368b-2bcd-4f38-abcb-00b8ff6845ea@nvidia.com>
 <d10995d5-1e32-4d51-b748-e77e7f103a3a@kernel.org>
 <d7b5fa60-c6ec-45f2-8bc3-ba79dccf6c5d@nvidia.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <d7b5fa60-c6ec-45f2-8bc3-ba79dccf6c5d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2025 15:11, Jon Hunter wrote:
> 
> On 18/11/2025 13:08, Krzysztof Kozlowski wrote:
>> On 18/11/2025 12:11, Jon Hunter wrote:
>>>        then:
>>>          properties:
>>>            reg-names:
>>> @@ -184,7 +187,7 @@ examples:
>>>                  <0x0c370000 0x10000>,
>>>                  <0x0c380000 0x10000>,
>>>                  <0x0c390000 0x10000>;
>>> -        reg-names = "pmc", "wake", "aotag", "scratch";
>>> +        reg-names = "pmc", "wake", "scratch", "scratch";
>>>            nvidia,invert-interrupt;
>>>    
>>>            sdmmc1_3v3: sdmmc1-3v3 {
>>>
>>>
>>> The above did not trigger any errors even though I introduced
>>> an error in the example. Anything I am missing?
>>
>> You are right - dtschema does not work here. That's a bug, because it
>> should and we already rely on that for many other bindings. You can add
>> "uniqueItems: true" as workaround, but we should fix it in dtschema, so
>> you can go with my approach anyway.
> 
> Thanks. Looks like I can't add 'uniqueItems' to reg-names ...
> 
> Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml: properties:reg-names: Additional properties are not allowed ('uniqueItems' was unexpected)
>      	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> 
> Would it be OK to go with your proposal for now without
> the uniqueItems?

Yes, that syntax should work anyway.

Best regards,
Krzysztof
