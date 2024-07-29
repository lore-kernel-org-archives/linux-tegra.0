Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377D1494DC;
	Mon, 29 Jul 2024 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722267079; cv=none; b=SNGPOEKM1QYc+aHSkQujjUgvB/jTC0VtirwhzroqAlUGXiGl8M7cfy7IfmPtDrw0dOaneRt+YR3i5HiFDUZF1cj42W9Gvxj/bCFwYK2jbjG+5kewoF9EU671u4gVFYyZjLyRBdhEPJbV5jOEc0SjeKejG8jlSkypLzgkC6aUGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722267079; c=relaxed/simple;
	bh=koUyD7aox0HAEQE+rmy8pQQqygbJWnJvy7PxdrM4gZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+7fNW4m6G5WJBIQBwnloBqaEj9tRfdlPbN46dhCD2kKdFcYY7PhGSlHNPBZd4vQ4Q5MrpxXPzW/OPkGtEvz/SpDHJfjqekPR8j+ouvaUoBzr1LZ5Rp9eifC8vKkCKjapv1YME4/vKqdVA1w+Nx/+C4bLOXkHhSUOMwK2PtDKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXgZqMzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXgZqMzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B3EC4AF09;
	Mon, 29 Jul 2024 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722267078;
	bh=koUyD7aox0HAEQE+rmy8pQQqygbJWnJvy7PxdrM4gZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXgZqMzJ6v5VjFl/P1Cw3QOo6+CmEbAWcChu2X/YCfqs5s5j7wRzSIPgjV4PBFAb8
	 t1hCkNaXuoI6BuBZxB5JBQOuZvXMOBJ26GMdyYiJBKLnQHgUn/s/LdY2iVQu6BGopA
	 w/T7sGniEYdrgHlpDD/Pse8JK/FWgzMhSfthFO5sVKdHG9hG7bbSiAkOnlO1GsaihK
	 zdU6EnFqZXY65nQ7XiY7Mcu1JoURflUihFMiHTuqPje5l3QbbqHEiwoCDrQSz1XwVA
	 T/yAoaFMvYMRucglsl+wnWbVbVIbnZxk2ve4SLxlTqs9c9+UpGef+XD2/42M9Y4wtn
	 bt1nVtFYh+xWw==
Message-ID: <8b75756d-aec9-4c28-96be-81cd12496757@kernel.org>
Date: Mon, 29 Jul 2024 17:31:16 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] memory: tegra: Cleanup Tegra210 EMC frequency
 scaling
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
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
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/2024 13:31, Diogo Ivo wrote:
> Hello,
> 
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.
> 
> The motivation behind these changes (besides improving readability and
> maintainability) is to make it simpler to add support in the future for
> frequency change revisions other than 7, where we can reuse a large
> portion of the modularized code rather than essentially repeating 2k
> lines of code with minimal changes.
> 
> There are no functional changes with this patch set, as it is only meant
> as preparation for following patches where revision 6 support is added.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Changes in v4:
> - PATCH 07/07: Add missing parenthesis around operands when calculating
>   delay
> - Link to v3: https://lore.kernel.org/r/20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt
> 
> ---
> Diogo Ivo (7):
>       memory: tegra: Remove periodic compensation duplicate calls
>       memory: tegra: Move DQSOSC measurement to common place
>       memory: tegra: Reword and correct comments
>       memory: tegra: Change macros to interpret parameter as integer
>       memory: tegra: Loop update_clock_tree_delay()
>       memory: tegra: Move compare/update current delay values to a function
>       memory: tegra: Rework update_clock_tree_delay()
> 
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 429 ++++++--------------------
>  1 file changed, 86 insertions(+), 343 deletions(-)
> ---
> base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> change-id: 20240704-tegra210_emcfreq-9d2466310cec

I don't understand what happened with this series. lore cannot find
anything for above change-id. b4 diff also fails:
b4 diff '<20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>'
Grabbing thread from
lore.kernel.org/all/20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 8 messages in the thread
Could not find lower series to compare against.

Link to v3 does not point to v3, but to some resend. Changelog is
incomplete - mentions only v3, but what happened between v1->v2, v2->v3?

There is canonical way to send patches which makes everything
straightforward (and IMHO easy). It's called b4. But you can just use
git format-patch and git send-email. Whatever you choose, this makes
maintainer life easy.

Way you sent patches is somehow broken, I don't know how, but it does
not make maintainer life easy.

Please reply with changelog and explanation where is original v3.


Best regards,
Krzysztof

