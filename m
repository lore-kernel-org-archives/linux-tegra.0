Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA92E40E;
	Thu,  8 May 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690557; cv=none; b=ByJwp2V9xY9Jq/pLsKYGYGyDH+1ZK8bWtEkIdYhl4fZCkvAwST7L2/sw+N5NMh/2w5MdtpALzh7zgVl+Cgyh3AZbE9GOGHbDiIDa1lqMK0DV98zxaZVhXiAairkVgWCiMf4p20RfvTD41EDAt/5atcocNuJ7YI0CWqY1vPT4UrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690557; c=relaxed/simple;
	bh=Sh/O69+i2r+nZOg79yPgBW3TIJ+saqBgG6Wlq/osw1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4WwKISZpinE7QCUwZamhr0aR7vG4De0WoqUhqXw0HnNnycllf0SPJ8fvLu/DyVcWMx6WKuVytoEsKR3o1uGJhnT5VPHY/EIWPWVLzNmPQjnvLwB4ztEROzdSCLetTP3SnXYbYwAl3S+irNAu/fHwDz2MN4sw/EWLre0fEzSyLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdINAyyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdINAyyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853E3C4CEEB;
	Thu,  8 May 2025 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746690555;
	bh=Sh/O69+i2r+nZOg79yPgBW3TIJ+saqBgG6Wlq/osw1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sdINAyyRCKNdjhlc6PZChIenJoqs+QVfA/JNMjkNRcgI4nCqQPttSfTQOte1jbAwh
	 geabDja1FjKv+N0M711u0ziK9ws7DTig+68z7yb61NotpTZMp0uLFbnY9ydQa2kwT8
	 pEDHRJ0cTklxJb2/thmp27nByfhdqn4aLgUvb84mgj9KGfITA5vPvwb3lNnctUDKtY
	 X9eg7YHZitJSan9XaqnLufz8uaJgM2BGt5t9ma3UWlbDYP8s1338zd+SQOCVQllMVo
	 g96fCzV4T8ve/dbx/GNl4JZsq4S4gUXTpFuE2+pZtmPV/Un2bkJeosZQpJ5qwrFYri
	 met2VspuJv1Ew==
Message-ID: <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
Date: Thu, 8 May 2025 09:49:12 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 09:46, Thierry Reding wrote:
> On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
>> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
>>> On 07/05/2025 16:37, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>
>>> Missing commit msg
>>>
>>>> ---
>>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
>>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
>>>>  2 files changed, 16 insertions(+)
>>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
>>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
>>>
>>>
>>> Filename equal to the compatible. That's the standard convention for all
>>> the headers since some years.
>>
>> Huh, I cannot find the binding in this patchset. Where is the actual
>> binding added?
> 
> The bindings for this are in
> 
>   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

There is no tegra264 in that binding.

The header always goes with the binding and the drivers.

> 
> There's no 1:1 mapping to a compatible for this because BPMP is many
> things. It's a clock provider, a reset provider, a power domain

Sure, that's fine.

> provider. These definitions reflect the IDs assigned by the BPMP ABI
> and we've used this structure ever since this was introduced back in
> 2016.
> 
> I don't think changing the convention for this is a net advantage.

Headers still should match the compatible one way or another. Can be
nvidia,tegra264.h
(because -clock is redundant and you do not want to use the actual
compatible)


Best regards,
Krzysztof
