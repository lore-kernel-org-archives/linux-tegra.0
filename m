Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD0220686;
	Thu,  8 May 2025 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689851; cv=none; b=Xy6S2XRzAxfreoLMb1S8Ts23/3cWDQIG1D5bHfmp/Cm6q4Mju7Cl1ozYST4Zpxcu3aMMFoGdz7KEMnHEyL14r9imQfychXA/wKG+QkXXLTHetv+p38FcuHY9FDGzkv/C1UivgtDQxKAVQMccTplLtp/rin5fSO6xIptwC/nkkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689851; c=relaxed/simple;
	bh=2K8uNXQXxO0Gc5a70Je+EdtIou/J82MA7oGGP6kUuDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFgxRE4VMS1JZGC1DpzVu1oLeEOLOqnvEUwAtlPRUUXjM/B3hOFn3qyurm9VtSIz+fMG8nxqtLnqDMKz9eoAgmEZshWPgIaxnHZ4VtuvwWh+N7zeAFQLQ67ij2TjZTrvzrKmb88Qy1jSIA9P88XxlBv2CJQ7N9Z3k9gytVi1bx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5BYQSUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5BYQSUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D4C4CEEB;
	Thu,  8 May 2025 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746689850;
	bh=2K8uNXQXxO0Gc5a70Je+EdtIou/J82MA7oGGP6kUuDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5BYQSUwmSe2AIAlk4ED5lhtXyxFsamGRscOe4QLDx9CrHVQ3TavnWpggox44HLAT
	 gkk/L/iG+9ot6GD18JqL/D866EGLF+LblH4Bgc9/CpY25QO9YEGeE0SZ0Dx7/S2+l3
	 jhConMyP61i7Z2Xy9QzXePdid4qdxwQt8cTRZ1gqTQe2isMYm/86vS+iNBxFsoYxLz
	 e3dBjOeHlcjnbbT6YJ/Ius1Td90uNyORh3iJxhVimxptsdf3M3nFoLGK49Zw2A7Bxx
	 Rj+TDElIolOkKhFFV5RCADh+ijvZvl6TtOcmKMyS06o3gLTHmlIF2AGWQ2hlSc5EMd
	 uOabcwplsWa0Q==
Message-ID: <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
Date: Thu, 8 May 2025 09:37:27 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 09:31, Thierry Reding wrote:
> On Thu, May 08, 2025 at 07:48:22AM +0200, Krzysztof Kozlowski wrote:
>> On 07/05/2025 16:37, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> This doesn't currently contain any stream ID or memory client ID
>>> definitions, but they will be added in subsquent patches.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>
>> <form letter>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC (and consider --no-git-fallback argument, so you will
>> not CC people just because they made one commit years ago). It might
>> happen, that command when run on an older kernel, gives you outdated
>> entries. Therefore please be sure you base your patches on recent Linux
>> kernel.
>>
>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>> people, so fix your workflow. Tools might also fail if you work on some
>> ancient tree (don't, instead use mainline) or work on fork of kernel
>> (don't, instead use mainline). Just use b4 and everything should be
>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>> patches to the patchset.
>> </form letter>
> 
> get_maintainers.pl lists 13 people and 7 lists. That's *way* too many
> recipients for something as trivial as this series, in my opinion, so I
> tend to curate the list of recipients manually. I guess I went a bit
> overboard and should've at least listed all DT maintainers explicitly.


Usually that's a sign you combine too many subsystems into one patchset,
so the solution is to split, not remove maintainers/lists from CC.

> 
>>> ---
>>>  include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
>>
>> Filename based on compatible.
> 
> The compatible string for this is nvidia,tegra264-mc, so I don't know


so nvidia,tegra264-mc.h


> how much more you'd like me to make it based on that. Do you expect me
> to add the nvidia, prefix? In that case it would be inconsistent with
> all of the 8 other Tegra MC includes that we have in that directory.


Same story as for every other case, why this would be different? All of
them - amlogic, mediatek, samsung, qcom, every soc - move to new style
since some years, why this one should be different?

Best regards,
Krzysztof
