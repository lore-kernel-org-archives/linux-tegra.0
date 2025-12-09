Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13F26F296;
	Tue,  9 Dec 2025 05:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765259629; cv=none; b=sqT2DT4LkoD32FjNS8EBYLDtRWAWjpTQtKADk+ekHUECEvCx3Fms1SHf8/TwR0pb7jBusv9beaAGNan3AUb3K80nh+R6QlF3q3wmFDqRlhxHz1qo8PDiCO1fV079c5XCH5ABd5GnLigUgJzJC5FZLh/UXkoZlZofofh5cZlsoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765259629; c=relaxed/simple;
	bh=z+m0utOd2YnpOXXxw6CT1KiBiBPO3m93BrS90rijNgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Onv8LJm5yS+BfHecIJt6zmvWRtlxyugrnwTa5p8bD7BkcFmaOZ5FfX7FTdsvTC5K0w+I/xrdLSgUF64HzxX/MT6mvjMBmqkY+0lisTwPHp8lb0wnjITdv4T+jE6EbwJ21ndLbL8qwdji+UCEsPhw3xul32njQZth14is6uV1rAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDNVubnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDNVubnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A1AC4CEF5;
	Tue,  9 Dec 2025 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765259628;
	bh=z+m0utOd2YnpOXXxw6CT1KiBiBPO3m93BrS90rijNgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DDNVubnujiykhrzYXvr80WmV8f3bm3dgue6tBsXXGSQfXrdJX7pCOlhK75QSBif0G
	 rgJwKBh+u9UnyxUeCZlbYXwR/InOAT8QqFeMELUPR+B62+vitLTuQKXTJ+NtkxY+Fd
	 8YYG/A9ThLkdnqkiQGQ5w753H19nljApdosTkEDmJevhspQk1YRw++vBCozlQnv3rW
	 0y5Xy7kTS9uyG2Yo2QPTDsFR5xmHfzAHyRiNm1W5u95fgguBOqX8SzzVn1im03HZy4
	 MTj8u/kK1gZUsavbL8qFyN7WpkXrB8+RxVwTbuGxftDueCMY2ZNvGTw9iQbaEZZzT/
	 u+AyZ2J9g8d8Q==
Message-ID: <83142b0c-0743-4a23-8846-e9f5e72a7677@kernel.org>
Date: Tue, 9 Dec 2025 06:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <63be3373-1ab4-4aa4-aa7a-0175727aa9a3@kernel.org>
 <CALHNRZ83EcVnyBYADsuXtMu9omBd8WW+7reyb4GX8FfJ4sOcyw@mail.gmail.com>
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
In-Reply-To: <CALHNRZ83EcVnyBYADsuXtMu9omBd8WW+7reyb4GX8FfJ4sOcyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/12/2025 05:26, Aaron Kling wrote:
> On Sat, Nov 22, 2025 at 6:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 21/11/2025 12:21, Jon Hunter wrote:
>>>
>>> On 12/11/2025 07:21, Aaron Kling wrote:
>>>> On Wed, Nov 12, 2025 at 12:18 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>>
>>>>>
>>>>> On 11/11/2025 23:17, Aaron Kling wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>> Alright, I think I've got the picture of what's going on now. The
>>>>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>>>>> my simple busybox ramdisk that I use for mainline regression testing
>>>>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>>>>> replicate the issue. And I don't see the issue on my normal use case,
>>>>>> because I have the dt changes as well.
>>>>>>
>>>>>> So it appears that the pcie driver submits icc bandwidth. And without
>>>>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>>>>> number and thus sets a very low emc freq. The question becomes... what
>>>>>> to do about it? If the related dt changes were submitted to
>>>>>> linux-next, everything should fall into place. And I'm not sure where
>>>>>> this falls on the severity scale since it doesn't full out break boot
>>>>>> or prevent operation.
>>>>>
>>>>> Where are the related DT changes? If we can get these into -next and
>>>>> lined up to be merged for v6.19, then that is fine. However, we should
>>>>> not merge this for v6.19 without the DT changes.
>>>>
>>>> The dt changes are here [0].
>>>
>>> To confirm, applying the DT changes do not fix this for me. Thierry is
>>> having a look at this to see if there is a way to fix this.
>>>
>>> BTW, I have also noticed that Thierry's memory frequency test [0] is
>>> also failing on Tegra186. The test simply tries to set the frequency via
>>> the sysfs and this is now failing. I am seeing ..
> 
> With this patch dropped from -next, what needs to happen to get it
> requeued? I gave an analysis over two weeks ago and have seen no
> response since.

Hm, I did not see the root cause identified, so maybe I missed something.

Anyway, I am waiting for the patchset to be retested and resent. And
testing MUST include kernel development process rules, including how
patches are taken - see maintainer soc profile. Any dependencies must be
clearly marked.

Best regards,
Krzysztof
