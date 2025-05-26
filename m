Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255F25569
	for <linux-tegra@vger.kernel.org>; Mon, 26 May 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276341; cv=none; b=CF97w94ii2/qYqONoN6W7SPiNFrQUEYrSDmiJC7OV0Fu2X02UIRt0FLXeVtyuiQgww+sluQU4y0FPxAs0RNQoXZELI74vDWJeTrEDfLZNlnTbwlCgf7iwOqjs4By3txgXhPJNMz6N9FPN6GQRcV4/T3+WWoQ0Z2TjNFJir461/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276341; c=relaxed/simple;
	bh=3O9uODhheyd75IXO4fOpFql0g/mYJkjjqhqvQGXfe/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM+CbGbI+tfwYE/tsb2R/bdCgVmIq8tkTwzpFmNBgB9BWR7KEROF+Plqknslb1yLxa3ET/lNmdiTk0F0A8EKazasYR+t/JUZAAmePcR0WRMYlVKRiFG6bLchSFxqd+9gt2pj9JQRjQFghBqSx+98TSOOIzXarY8y74VPooVLix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rWhW4KQu; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rWhW4KQu"
Message-ID: <3e8810e3-1346-498d-8914-f5f81167cb5c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748276327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJv5lA8od/YM8eLH9W+Fh4Qc3lU7Hef1zizGNnnPSAI=;
	b=rWhW4KQuPO92q53OSQnBIRJvVbyKz3u1xKvSx69boc3nVQP0/cpc3sZ150fKQMfHS5dGOS
	//7rDdV+0ONn3ZHEw60J4K27fl9aA8YK1kRk7VH3jHEw8n+c5xkFwh/QnJoeq/aAB/LsEW
	b5hh2yRWgo5JeuICWGPwzIC5DrqX480=
Date: Mon, 26 May 2025 18:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: "Sheetal ." <sheetal@nvidia.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <52681983-2fe2-45da-b0ee-1e9452ed469e@linux.intel.com>
 <1328ff08-1de7-4c62-b8f7-b09e15f50737@linux.dev>
 <897155bb-da81-485a-869c-da587e063bc2@nvidia.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <897155bb-da81-485a-869c-da587e063bc2@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


>> I share Peter's question. The code has been around since 2016, in what 
>> case would the existing logic need to be updated?
> 
> As such it is not causing any issue. But I think if the BE DAI state is 
> already SND_SOC_DPCM_STATE_HW_PARAMS, there is no need to call it again. 
> Similar to how dpcm_be_dai_prepare() and dpcm_be_dai_startup() won't 
> call BE DAI prepare() / open() callbacks if the state is already 
> SND_SOC_DPCM_STATE_PREPARE or SND_SOC_DPCM_STATE_OPEN respectively.
> 
> For example:
> 
> When two or more streams sharing a common BE DAI are started 
> consecutively, the following sequence can cause multiple unnecessary 
> hw_params() calls for the BE DAI:
> (1) Stream1 hw_params() called for BE DAI and updates state to
>     SND_SOC_DPCM_STATE_HW_PARAMS
> (2) Before Stream1 BE DAI prepare() call triggered,
>     Stream2 dpcm_be_dai_hw_params() call happened and now BE DAI 
> hw_params() callback happen again unnecessarily as the state of BE DAI 
> is still SND_SOC_DPCM_STATE_HW_PARAMS.

It's possible that the second call uses different parameters. Don't make 
the assumption that the parameters are exactly the same between FEs, see 
more below.

>> One key point is that hw_params() may be called multiple times with 
>> different parameters, it's a feature and not a bug. If a call to 
>> hw_params() changes an internal state, a follow-up call to hw_params() 
>> shall undo the initial state change and rerun the appropriate 
>> configuration.
> 
> As per my understanding, after hw_params() callback, prepare() will be 
> called and the BE DAI state will be updated to PREPARE now, then 
> hw_params() callback for same BE DAI will not occur as condition will be 
> unmet. Not sure how the different parameters will be configured in this 
> case? Please clarify.

prepare() is a different stage, you shouldn't assume that the transition 
between hw_params() and prepare() is immediate.

You could have two FEs that try to configure different parameters, i.e. 
S16LE or S32LE before the prepare stage is reached. Not to mention that 
sound servers such as PulseAudio or PipeWire do make repeated calls to 
hw_params() with different configurations to figure out what is 
supported, i.e. prepare() and trigger() stages are not reached.

Note that the DPCM logic is far from perfect, in the case of shared BEs 
the hw_params should not be propagated from FEs. In the case of a mixer, 
it would be very useful to have a boundary between FE and BE, with the 
mixer pre-configured to e.g. 48kHz S32LE. The existing propagation from 
FE to BE can be problematic in that the last configuration will be 
retained, and that's not necessarily the highest resolution. We had 
similar problems in the past when we tried to be smart with PulseAudio 
and automatically select 44.1kHz or 48 kHz. That causes all kinds of 
issues where the change of configuration only happens when all streams 
are idle, and while a stream is active the configuration cannot be 
reconfigured. It's much simpler to decide what the BE settings are once 
and not try to adapt.

In other words, the existing logic is fine, only redundant in the case 
of *identical* hw_params for all streams feeding into a common BE. I 
don't feel it's worth changing for now, if we change something in the 
logic that should be a bigger change to add constraints between domains, 
and allow for more than two domains.

>>>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update commit message as its not a fix.
>>>> - Marked as RFC patch as it requires feedback from other users
>>>>    perspective as well.
>>>> - The patch is being sent separately as other patch is not RFC.
>>>>
>>>>   sound/soc/soc-pcm.c | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>>> index d7f6d3a6d312..c73be27c4ecb 100644
>>>> --- a/sound/soc/soc-pcm.c
>>>> +++ b/sound/soc/soc-pcm.c
>>>> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct 
>>>> snd_soc_pcm_runtime *fe, int stream)
>>>>                       continue;
>>>>
>>>>               if ((be->dpcm[stream].state != 
>>>> SND_SOC_DPCM_STATE_OPEN) &&
>>>> -                (be->dpcm[stream].state != 
>>>> SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>>>                   (be->dpcm[stream].state != 
>>>> SND_SOC_DPCM_STATE_HW_FREE))
>>>>                       continue;
>>>>
>>>
>>
> 
> 

