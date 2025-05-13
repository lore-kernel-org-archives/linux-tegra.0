Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32B1E5B91;
	Tue, 13 May 2025 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116873; cv=none; b=TvlWX00YUCJ6WjY/e7Zk6Dx6+4Pt7mfvv4BdWckJFdFiK2pwMz2v7xpXhhSAeS/aCacPw6ppjZCy1OoBl1h05rgObskqrS6hk5zLR6O9wuzZUWkhTDtn/mdi53KMW4twCElYUyWxLDim2lBY4DQUzPvNiqx1jS0JUPRttAVyjYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116873; c=relaxed/simple;
	bh=HOmzNXqztGAZsaFVQfIfDU/4Qjyx5oPPAvkLmf8pL7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftDM8jZyVKHavHTuPnrxE65wB3nwvOHCRvHt8AoqDB5qQIJpnrmdGqZV1ZF69taEpHEm+Yl9Ft51V0l5ezGiT8ZuSbUT/iRI+5IbovAWFLhdhZ5Uu8UOoYLr5QGNFG8/5vPrEj0ee5+0vozoXySKVkEQG6jUhP+xR3Wwdh/aTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD3Yv2lx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD3Yv2lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747116872; x=1778652872;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HOmzNXqztGAZsaFVQfIfDU/4Qjyx5oPPAvkLmf8pL7E=;
  b=YD3Yv2lxsb7M2ksYaggDHwnRoMmKz8ysGLEj6/e0G3GDt7Oecd0f82jG
   MPuqRWeP/siDHzXuEk4ESgnho1nVpJ2YlgCoxcIB8dkT/Eoszm67m7NTR
   maiTP6IhHbK2JCLtRvxzU9A7COEgflhuwbTfh1jAaSWcJRYtSTms7qTPo
   Uf7k0wdH9f99yLA1K5wJH+vhu6/GSuIFKfAAqfIa41TQ/Cf9JHXSnRZW7
   cpiNcK4XZ2T5/9W1W/ybz0KaIhbXtovva82dIO3BGoGCJnKJEgvqrcuc2
   6KG8lg3Wq5TbkgTj+9Tuu8rN73SEmoKMUw0+jbYi3OBW6s4Y5zKHiHYDE
   A==;
X-CSE-ConnectionGUID: 7lkNM550SAS0dvpf/mr+IQ==
X-CSE-MsgGUID: Lra29f41Tmay4OIV2hCgBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74342996"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="74342996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:14:31 -0700
X-CSE-ConnectionGUID: Q8dKl/ghQqSx2j9DSk9yYg==
X-CSE-MsgGUID: m+YRzKW2QCmhrccsHkrA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137511088"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.168]) ([10.245.246.168])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:14:28 -0700
Message-ID: <ed48f3cf-077d-4b42-ba0a-ba35d849d4dd@linux.intel.com>
Date: Tue, 13 May 2025 09:15:41 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: Sameer Pujar <spujar@nvidia.com>, "Sheetal ." <sheetal@nvidia.com>,
 broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/05/2025 15:01, Sameer Pujar wrote:
> 
> 
> 
> On 08-04-2025 14:00, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> The hw_params() function for BE DAI was being called multiple times due
>> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>>
>> Remove the redundant state check to ensure hw_params() is called only
>> once
>> per BE DAI configuration.
>>
>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>> ---
>> Changes in v2:
>> - Update commit message as its not a fix.
>> - Marked as RFC patch as it requires feedback from other users
>>    perspective as well.
>> - The patch is being sent separately as other patch is not RFC.
>>
>>   sound/soc/soc-pcm.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index d7f6d3a6d312..c73be27c4ecb 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct
>> snd_soc_pcm_runtime *fe, int stream)
>>               continue;
>>             if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
>> -            (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>               (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>>               continue;
>>   
> 
> Reviewed-by: Sameer Pujar <spujar@nvidia.com>
> 
> 
> Earlier Intel systems needed multiple hw_params() call and I am not sure
> if that still holds good. Given https://lkml.org/lkml/2021/9/28/1267, it
> would be good to get feedback from Intel and I have added few people
> based on the earlier discussion.

Picked the patch to run it through our CI:
https://github.com/thesofproject/linux/pull/5414

-- 
Péter

