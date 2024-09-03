Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526318BB8C
	for <linux-tegra@vger.kernel.org>; Tue,  3 Sep 2024 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380761; cv=none; b=Zhj2Vc7QeywVgqHFqONHat25+K6bvCssoCfsXQYIgzVc+MO1VM72SBOIS+XgnjX4/oMr1fSuCuTdvpSblJQgjYXJ6U96yP6DbeaXNfCBf1x2zpVeFiXRkweuVMAL4jEtvXB+2DfC59mvt2HJtE0EEI78FbKtxYKAjysSZkKIQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380761; c=relaxed/simple;
	bh=VoKYPh++tWILoWaGfi256XRcWGMk5WZ3zkpYUVbSCek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UQA67r0Pp5Ql5u/kZDSGh3GuJOh5XXDQ97rjQR/imv0se62DSvrwy6IHRGgnUfggy7yg7GpwI2JmdZdZvpDrK4PyFL4b6yuqqiTOuf4yx4L33kruYKDwCDLwzSjSHL5YUUihTgSs+RGPt0vV6ajzoLhiDm7jZ+2e0E9CG5urRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyTSuvq0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyTSuvq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725380760; x=1756916760;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=VoKYPh++tWILoWaGfi256XRcWGMk5WZ3zkpYUVbSCek=;
  b=hyTSuvq0LSs0BCJOP6FPjFkfO2N3yzQGUW8O6eEr3+VaKGpSKFeBDYJF
   ngyfzyjrEdVfyqVm1MabxpPCcRSQg/oQbfz04zxC19n1I0XSS3xpct4TA
   ArcuPS8+n/A3q+jvZOTIb5ZnWKAU4xGbvsYkNteaQDadTNxl0zUAuEI5B
   2kx+oB6CQ/+xOTGgxTP3Mgoe2uvXT8qy5huieu6OBODts5KWdU6cTaWUW
   Ue695FDxeiG0aGwyQZ5u9CuH4/0qurLNsP+ebEkl68IQHvrQE2nxQMg4S
   049utWhin8TNtneNWiaVgeZBhDHd+fLjt/fovPGR47K60IDN1hv+ROsiC
   Q==;
X-CSE-ConnectionGUID: P41AyrwlS/Ksa4QfY/1mLg==
X-CSE-MsgGUID: qB9IRAFIRUuCLGIgp6+qaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34562544"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34562544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:26:00 -0700
X-CSE-ConnectionGUID: PUGcUR2FSteX2dmEFU22rg==
X-CSE-MsgGUID: tJF6xGK/REei/qiCMswLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69119688"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:25:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel test robot
 <dan.carpenter@linaro.org>, Thierry Reding <treding@nvidia.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix potential uninitialized variable use
In-Reply-To: <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240902161317.2437148-1-jani.nikula@intel.com>
 <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
Date: Tue, 03 Sep 2024 19:25:41 +0300
Message-ID: <87frqgu2ka.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 03 Sep 2024, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Mon, Sep 02, 2024 at 07:13:17PM GMT, Jani Nikula wrote:
>> It's likely either output->drm_edid or output->ddc is non-NULL, but
>> avoid the uninitialized variable usage anyway.
>> 
>> Reported-by: kernel test robot <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
>> Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: linux-tegra@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/tegra/output.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Do you want to apply this or should I? In the former case:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
