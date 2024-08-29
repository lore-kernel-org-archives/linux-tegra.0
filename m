Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FA1917FB
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931804; cv=none; b=twIdxrsCACx2TVfo6vLtT02++7US+ecfaj7Q7eUm1V3gAdJ7b8wCMlfBqyiYHT38B73EHxTiq3qUHFhEKwiZoFJYrLSDdVXpd6UqBqjYQQROfOtKRrhO5lTj+uL1ZQ+XO0iwikwUWj0pzauCkxhvviIzUP7g7modCskiXRN+my0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931804; c=relaxed/simple;
	bh=2L5clSdNBS/T6QTGXkM3oBsR50kY8JLLlyNTq5ZNk7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BFPt4cFWedIFHq3s308V1GqgSDLYZUqiAIXmUPyrjpk9EBFIGH5rKT4nJBARn69Bvol+E+L7GxCtCf/acQss0uYn+qrh7sMIv46XFu658Dtw2duhnq56ay3SbXvd4bYeohXLGXN7dS9UO9GLz/AypTo39+nhdOLS8qP5EraLQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmmVM3d1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmmVM3d1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724931803; x=1756467803;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2L5clSdNBS/T6QTGXkM3oBsR50kY8JLLlyNTq5ZNk7s=;
  b=nmmVM3d1IU9Jozar5w+pIHt6FfrA3pgSJFJouFrmARm+Hlt1KcmUMBzu
   JoszT4zFgchlznOmD9lsxrgUYe6QIh3a5r1TzEuNYcVqDXD1Qrsz1PGx1
   pE4oTopCu/R991ZROLpChslY8pJyd8Ub0zNRlCt04vcMNMKM4vEE0g62N
   URvtUMPRYtzUF+xOGCxBqn2OVewUqytXf1o3bHNDO1KHgrsHzGMytbgEL
   3cU/Czayn4x/NNQlh5ZvppHOek6TWzU+AeNYW4OUPYXAvl1w+O57R0Q8R
   QWikyWOQyiXHnbYfOAmyBl53jf9aFKW4SGUlThWb0INp2PeAqR0vQVVdS
   g==;
X-CSE-ConnectionGUID: Crb17DkDSLOOeg78egIwqA==
X-CSE-MsgGUID: fudYpaePTWSjoYPjMI3sqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34174090"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34174090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:43:23 -0700
X-CSE-ConnectionGUID: wjhhsfb6RaOOelKKSvefqQ==
X-CSE-MsgGUID: LvcbZOWsTz+6hLzyG+qTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63380853"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.14])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:43:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
In-Reply-To: <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
 <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
Date: Thu, 29 Aug 2024 14:43:16 +0300
Message-ID: <87wmjzwo4r.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 29 Aug 2024, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Aug 22, 2024 at 08:42:50PM GMT, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>>  2 files changed, 18 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 682011166a8f..2f3781e04b0a 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -133,7 +133,7 @@ struct tegra_output {
>>  	struct drm_bridge *bridge;
>>  	struct drm_panel *panel;
>>  	struct i2c_adapter *ddc;
>> -	const struct edid *edid;
>> +	const struct drm_edid *drm_edid;
>
> It perhaps might've been less confusing if this wasn't gratuitously
> renamed, but either way (and assuming you want to take this through
> drm-misc):

I've been doing that to ensure all call sites, especially kfree(), get
changed.

> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
