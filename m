Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9F28C863;
	Tue, 13 May 2025 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134575; cv=none; b=Gr+lUpp2vw6i5XmxgpfA6FUPipJHudBA4F2J9ZiIVDFHFFotIs+3mloBVg+g/IhN7aip+u3vBueUqJ8+LQFZWp6S1H6CidIHeJDhg6+gQodbVpKiTPMqMhv9dda4RfYDFNh9CziumXetPDhwDbXM6cjsO7jCpQSH8yCN+zulkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134575; c=relaxed/simple;
	bh=PuSZtEwH/xHLs5A8wyth+7ZTwg8pPqLvreBhp8FJUA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmokRBmCFhCnnAJmv7aI1C//L6ApQSw48vvy0ufRaTmvKjSTCYucqdbnbOEjijd1Ou03cykyvR3VJXKNkC1Rv63/vZUEyN8vLjlVZaaDDsrzfFSuqU5Ks61ix7h+AgVmvUq61D+ocEVwD8HxtmhKOqKE86oloerkgUdjPONZK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuPOw4jp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuPOw4jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747134574; x=1778670574;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PuSZtEwH/xHLs5A8wyth+7ZTwg8pPqLvreBhp8FJUA0=;
  b=RuPOw4jpJ+X8DrJgVndrRpFJn6FQLGXemujEFwebheslOJ7Clr8IIUhl
   xAt/x4oSfCMiDYgFNI68T71F4UFlvfP2mp4/3IhplrEN9wYBWgZ/PV3bM
   SjNCeeReAk/ITgh5CFeO0D4N3tr4tY381DT/eB8gTCF3h+GDCt4TkOwpm
   hfDCUVsCg9ujCPcfSOUbXLDLKDZRlPU13DIgMGQP5Afz7Z10+Ww0CBeTz
   8I7iN59+XVDk9y6CAhg3ciOukgMejiEqRZTb632xBzT3BOStvYOXDyira
   DT+NgkhVazU8khAwcSDMPCmlxcQUtUx7oEzZ6eG7zdqEeWRPXHJFjAgUa
   g==;
X-CSE-ConnectionGUID: PsYCsLQpSwWqYmHlRKT7ww==
X-CSE-MsgGUID: dRzNCnHCRZySHz3nLY7RKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48666372"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48666372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 04:09:33 -0700
X-CSE-ConnectionGUID: MZ6QgjQYQiajde8s+G5A1g==
X-CSE-MsgGUID: jsJsgqVUSDWxF6KZoHjvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138159969"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.168]) ([10.245.246.168])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 04:09:29 -0700
Message-ID: <52681983-2fe2-45da-b0ee-1e9452ed469e@linux.intel.com>
Date: Tue, 13 May 2025 14:10:42 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: "Sheetal ." <sheetal@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/04/2025 11:30, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> The hw_params() function for BE DAI was being called multiple times due
> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
> 
> Remove the redundant state check to ensure hw_params() is called only once
> per BE DAI configuration.

The first sentence tells that the hw_params() of the BE is called
multiple times.

The second sentence states that the check is redundant then tells that
it is removed to not call the hw_params() of the BE, so the check was
not redundant, it got exercised.

Which one is true?

Under what circumstance the __soc_pcm_hw_params() got called multiple
times? Was it normal or was it error? What causes it?

> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
> Changes in v2:
> - Update commit message as its not a fix.
> - Marked as RFC patch as it requires feedback from other users
>   perspective as well.
> - The patch is being sent separately as other patch is not RFC.
> 
>  sound/soc/soc-pcm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d7f6d3a6d312..c73be27c4ecb 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
>  			continue;
>  
>  		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
> -		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>  		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>  			continue;
>  

-- 
Péter

