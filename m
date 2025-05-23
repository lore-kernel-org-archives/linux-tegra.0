Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D0226D08
	for <linux-tegra@vger.kernel.org>; Fri, 23 May 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994186; cv=none; b=jcLyj8Y/K+gEF4t9hY9zu6excMv+EsHXIdrjtNbv8oo5/Hm29RTuxWgn3wKErDiO8YNRZcbR6ug2CemP8lY9A7LMjnizA8EY7oOJ8B3pWOBP6ppBNyME3rmDNLQiFu4YY+FlKqeEUkSFE0rq+JuSr5FHhS604xWxx2pTEHLkRHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994186; c=relaxed/simple;
	bh=PANqLNE4Hy9PQHvQ48fm/8QdTFQug/Qz4dlUcnk+x/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeODvBAyhsULldlX8s5TyRzz8Uwd5qkATygFIPUZcMy++i+Oq6H4n58s75K69OUFRMEVsWXQFI0ekGyxmUgTn1RTwrPsScE34u27llF9MWwOY07nb+ndM8ktzOw6J1h3XrYYAUYr1Bjybs1yLmNkbd/JPs0Gic+Odn9ymZbU7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ngtwQ28S; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ngtwQ28S"
Message-ID: <1328ff08-1de7-4c62-b8f7-b09e15f50737@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747994181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3es2sUYLu5Dzmw+V1ZC3XbDJRR2Hn2vugSOxxMimAl0=;
	b=ngtwQ28SgIPRfxIM+X5gDQunmPRyT2N0rTU6Xo+bVv3pK8vljLIKw/giIwz6B3TOzrPHaz
	YvNzCjG7r8+pulYXliUEFynvKE1BMKtpWeAIJYgZD6N+tAuia5M1T+GD+jzvOkXUP2rqzC
	4/bz5zV2huRUUmwY8Pf8LiYhG0a1kBM=
Date: Fri, 23 May 2025 11:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 "Sheetal ." <sheetal@nvidia.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <52681983-2fe2-45da-b0ee-1e9452ed469e@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <52681983-2fe2-45da-b0ee-1e9452ed469e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 13:10, Péter Ujfalusi wrote:
> 
> 
> On 08/04/2025 11:30, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> The hw_params() function for BE DAI was being called multiple times due
>> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>>
>> Remove the redundant state check to ensure hw_params() is called only once
>> per BE DAI configuration.
> 
> The first sentence tells that the hw_params() of the BE is called
> multiple times.
> 
> The second sentence states that the check is redundant then tells that
> it is removed to not call the hw_params() of the BE, so the check was
> not redundant, it got exercised.
> 
> Which one is true?
> 
> Under what circumstance the __soc_pcm_hw_params() got called multiple
> times? Was it normal or was it error? What causes it?

I share Peter's question. The code has been around since 2016, in what case would the existing logic need to be updated?

One key point is that hw_params() may be called multiple times with different parameters, it's a feature and not a bug. If a call to hw_params() changes an internal state, a follow-up call to hw_params() shall undo the initial state change and rerun the appropriate configuration.

>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>> ---
>> Changes in v2:
>> - Update commit message as its not a fix.
>> - Marked as RFC patch as it requires feedback from other users
>>   perspective as well.
>> - The patch is being sent separately as other patch is not RFC.
>>
>>  sound/soc/soc-pcm.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index d7f6d3a6d312..c73be27c4ecb 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
>>  			continue;
>>  
>>  		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
>> -		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>  		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>>  			continue;
>>  
> 

