Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716A350A34;
	Tue, 21 Oct 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076206; cv=none; b=R0/fX8gz8rwM1FqdxL+U6dUDAu5pseV8fCyMIhNntI7ViVreGG5z+33IcdSdiU3N3nyliDgCM2xvoOiC2UyFoyu72Ay6GVVOgd8VII1miHHl/lSoFO6rFThzuWCmlaQ8/GFMOAM9sB1DBX9124qdvmAR53Wbne7yE6i2viPxOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076206; c=relaxed/simple;
	bh=scbDqlVwwhiuUcweIByTM6Pz93MVCn/SPZxSxem+ilk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nhw5//EcL6dXGKtjVWmTB1hsBFTlU7BAcCYCrmUj4xvlYghX5Ul4DEQVAXwmYUtyaDF6EUsrdFXohcVqprUauIQD31itdEJkgdHi7mUZJhhC5MoHemyyVhNHo4CJHIbVixGekMZvZozA3obGsOwO+EXQdFABkBrq2HA8IF3wZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdofap9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdofap9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD28DC4CEF1;
	Tue, 21 Oct 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761076205;
	bh=scbDqlVwwhiuUcweIByTM6Pz93MVCn/SPZxSxem+ilk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vdofap9md2kxoyzWTJWcbXVLos3HV7kzNdlbjoVK5kIjyA2RC6x0gKOYW7RNvleed
	 0Ldfij3JLmOz+DK1mWgVIt/zm91+uOtc/g8cnNVjbs0iDy8VfdR6sg6p9kRNrn65Ew
	 4rgQvT2w3/xYUOP8/z52T/PW6f9CwQSAEqG89xahjVVXe9BdLaFv1iBPDEKZN6HLkY
	 iqSbBHkEYInRRVASJh0U7sCOmPBslV7QZlnKKikha/HakILFWNAoPABWdclSW/ajfq
	 ourFyNtn9SIZyD+khlbb80hToHKnkKEqhuf/LD96pxY0tPTFCGTiGUnU9lFnxgiPDy
	 BBhoZDl/Ro5rQ==
Message-ID: <da53e358-2d14-4dc7-ba88-79f8eceb2011@kernel.org>
Date: Tue, 21 Oct 2025 21:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
 <ee6b80a7-4505-466e-a433-5f186d747945@kernel.org>
 <CALHNRZ9nXYRgjmpbR5KiQpsSf4hu4=qcgoh8F9_5b9yXF_5Btw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CALHNRZ9nXYRgjmpbR5KiQpsSf4hu4=qcgoh8F9_5b9yXF_5Btw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2025 21:19, Aaron Kling wrote:
> On Tue, Oct 21, 2025 at 2:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 21/10/2025 20:29, Aaron Kling via B4 Relay wrote:
>>> This series borrows the concept used on Tegra234 to scale EMC based on
>>> CPU frequency and applies it to Tegra186 and Tegra194. Except that the
>>> bpmp on those archs does not support bandwidth manager, so the scaling
>>> iteself is handled similar to how Tegra124 currently works.
>>>
>>> This was originally part of a larger series [0], but it was requested to
>>> be split into smaller series.
>>>
>>> [0] https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-09413724e781@gmail.com
>>
>> Please keep correct versioning and changelog in the future. Try yourself:
>>
>> b4 diff '<20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>'
>> Grabbing thread from
>> lore.kernel.org/all/20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com/t.mbox.gz
>> ---
>> Analyzing 6 messages in the thread
>> Could not find lower series to compare against.
>>
>> I think I emphasized last time how important is to make it readable and
>> easy for maintainers.
> 
> You said to split it, which I don't see how that means anything other
> than 'make new series'. How am I supposed to keep versioning when I

New series with old changelog! Why splitting means that entire old
discussions, old tags, old reviews, everything should be discarded?

> had to make three entirely new series?

I do not see where is the problem - it is trivial. If you use git, you
just keep numbering. If you use b4, you just force-revision n+1.

Best regards,
Krzysztof
