Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1038A729;
	Fri,  3 Jul 2026 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062622; cv=none; b=Bm2LfmlkB/eNFui4OQyZVcUvf/9N5EG98Qxh2wraDsNwe4IZ9vJf9qRhm4t+4GLoi7AggYYB9oIrQL4eN70IGt2mjE/agqzEnd8SGjorLzRrX7q2Hf6fEAMJkvsklbVn52iEF1Xa+W+Xvo/XAygUXc8BnZh93cH4NS9KmS9RN1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062622; c=relaxed/simple;
	bh=Au7XCecHtF2tigo2BWCNwOZTr1iYKRba1SqJsXZfwIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmXDgjzD1hmYHLR9XRaB2Sjw1dlWWzp7nyq1ZmMGu34ex/Ymy17BLmw/K6pJkYCiaNiLgqqBM1xesWyesmFKll/ZHAxOTTxEz56bKhVar1HuAz3akzVnHwoveJow6nHroq27996v8YpVzMgq3INLgjmu5/VbM8L4LnFH7Wi5MyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5p9sIR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5p9sIR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED571F000E9;
	Fri,  3 Jul 2026 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783062619;
	bh=5EHukF5H/z9l9uC2WxZRVzgW9mK1DchOxCTKztHSowk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T5p9sIR/c3iKErjZCsuxu797uuaK++oKaepi2ujfJjvVEfav6h5ZRF8W/pqp46ZIN
	 CSVbwulKUChwFEoTcKcogGloLiN0iOyozBS6wBJ4oJRMXyQsM0mZGjgWHybnAS6cF4
	 8tKS6VNyxGNfCtfOd5PEKtOOE1Hefv0Vb7+FI8wsYKJJ8Y/8QXz9bmdwhUuTbAq6Mx
	 VzJGQc0SxfYZRT1E3CvXpgLR5p/hG0MVEcjYHDlW8RHCE/eCsh+KbPiPZot1biRH6S
	 0I2oNFToeebbrQoKt+0O6XDWa9Pak+hDp9hidHEDQzaz3KQ+hNGX4iEKhKo+96Kd0R
	 KH6D41Ge2Wmtg==
Message-ID: <7ecf28a5-1c69-41b9-a6ed-0bf14f62b9fa@kernel.org>
Date: Fri, 3 Jul 2026 09:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: tegra: Add channel/syncpoint
 range properties
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260622-host1x-nohv-v1-0-65bc682a617f@nvidia.com>
 <Np88My8kTE-rRphOw0a-Ew@nvidia.com>
 <20260626-sceptical-aardvark-from-mars-cedf81@quoll>
 <xLshrt-qQoOT-VB3QjfvBA@nvidia.com>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <xLshrt-qQoOT-VB3QjfvBA@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/06/2026 06:02, Mikko Perttunen wrote:
> On Friday, June 26, 2026 7:26 PM Krzysztof Kozlowski wrote:
>> On Thu, Jun 25, 2026 at 06:26:43PM +0900, Mikko Perttunen wrote:
>>> On Thursday, June 25, 2026 5:36 PM Krzysztof Kozlowski wrote:
>>>> On Mon, Jun 22, 2026 at 05:22:51PM +0900, Mikko Perttunen wrote:
>>>>> Channels and syncpoints available may be limited when other system
>>>>
>>>> What are channels and syncpoints?
>>>
>>> Very host1x-specific hardware resources. Somewhat close to GPU channels
>>> and semaphores / fences if you're familiar with those.
>>>
>>>>
>>>>> components are using them. Add properties nvidia,channels and
>>>>> nvidia,syncpoints to limit the range of usable channels and/or
>>>>> syncpoints.
>>>>
>>>> Why isn't this deducible from the compatible?
>>>
>>> When Host1x is partitioned, the hypervisor (or other software entity
>>> with access to the non-vm host1x register regions) can configure which
>>> channels and syncpoints are available to each partition arbitrarily.
>>
>> So you will have different boards for the same SoC with different
>> values?
>>
> 
> Yes -- even the same board will have different values depending on the
> use case of the system. The hypervisor or bootloader has to update the
> properties according to the configuration it has programmed in the
> hardware.
> 
> I will update the commit message with clarification.
> 
>>>
>>> How that partitioning was done is not discoverable through hardware
>>> directly, so we need to pass that information through device tree.
>>>
>>>>
>>>> Also, nvidia,channels is too broad/generic. This is not ADC, right? And
>>>> channels is a common term in IIO. And in few other cases.
>>>
>>> It's not ADC. Yes, it's a common term in a lot of contexts. I can call
>>> it nvidia,host1x-channels if you prefer but that seems a bit redundant
>>> given the context.
>>
>> host1x is indeed poor, but maybe there is some way to be a bit more
>> descriptive? message-channels?
> 
> I would prefer to keep these as is -- anyone working with host1x will
> know what 'channels' and 'syncpoints' mean, and changing the name could
> cause confusion since the name would not match other code or
> documentation discussing these.
> 
> I can update the binding documentation with some more explanation about
> what these properties mean.

Property has only one meaning in DT schema, so basically you are now
fixing nvidia,channels to uint32-array for all possible use cases and
nvidia devices. Well, you have been warned.

Best regards,
Krzysztof
