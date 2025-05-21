Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C6134BD;
	Wed, 21 May 2025 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815407; cv=none; b=nRpJ3mkk8lN38OwzTvCRu1IxiFemYc9da9ygHqXBHnOP6kuaQZ9JrkJh9kuPH6OaynZEVq+cC90JXWv9bhQeJG1Z2028+9oltUKjpqjhT1Ua0kamJ1Sat2Vk/PVhBkAf9kiz/6b5un8rRh+jnhj3Gr2KOodWuEcSfyGz7PEu+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815407; c=relaxed/simple;
	bh=cMaKD3mmDQWRev0bMklrhXvNe4m3PVlxM8z80KK7dUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GA6eLCJJiVbZiZelOqPMybGIqqTWzazYpKnj4qWYizpAak3ZEm6rtzLPWa3mrNmdrV5JHR+i6N50gBnlJXkIFJvZ1++VRdgu3eeWvc8vmc/PvdhWNgQO7wDwjlYH+10am04BzZzGYQ1LnKZMtdKyQK/tFZEtzaxGWF9r2ds2ttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQbhvR+H; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQbhvR+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747815406; x=1779351406;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cMaKD3mmDQWRev0bMklrhXvNe4m3PVlxM8z80KK7dUg=;
  b=cQbhvR+HpzHtwgCWt1icybymuxIAH4ZBBHLh9yz3TjquNxYz7fyVZotD
   vEO36PH9Vex5n3AWEryB8OQNKJ7wZfZVYjRaHQ1b9uAAOwUvSnJvd2i7o
   LILo1MIwOj1Sw1mRjQn10jFX9flW1mrWZWOMOKrXoB1OEjaaaqf8W/FQE
   QSa4vdte0o1HlwPPR/r49Ox/qYFACDchuvnnzE8tFemejL8AfqMLjL+ns
   jz0jhoZi86SAi6cF73HLm3t8NfhyEyG4ZojwggVfobtlgvM7eMPkJv9Xz
   NROlB0OunuYIVkZKzfPPJ7PSry3MK6wUQWQWklJCCL4ajs5kO9znZidvd
   Q==;
X-CSE-ConnectionGUID: IYkxn1YJTce4hrNe2T4rVA==
X-CSE-MsgGUID: OVz/Bfg2QXWkAgb2+k5Hvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49918170"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49918170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:16:45 -0700
X-CSE-ConnectionGUID: o8khXraoQd+4yk09d3gF3g==
X-CSE-MsgGUID: kCi7LireSnCTE1i/eM/pHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144693286"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.35]) ([10.245.246.35])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:16:41 -0700
Message-ID: <72b3954d-55d5-45ed-8a51-c0b1edd3783c@linux.intel.com>
Date: Wed, 21 May 2025 11:17:54 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: "Sheetal ." <sheetal@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
 <ed48f3cf-077d-4b42-ba0a-ba35d849d4dd@linux.intel.com>
 <b9884fbe-bdc7-489b-b4e6-981121333707@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <b9884fbe-bdc7-489b-b4e6-981121333707@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/05/2025 08:25, Sheetal . wrote:
>>
>> Picked the patch to run it through our CI:
>> https://github.com/thesofproject/linux/pull/5414
> 
> Please share feedback or comments if any.

sorry fort he delay, but we have CI maintenance and movement.

The patch looks good and makes sense, it was just hard to tell from the
commit message what is the reason for it.

Reviewed-by: Peter Ujfalusi <peter.ujflausi@linux.intel.com>

