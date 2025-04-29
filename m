Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58319F424
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950245; cv=none; b=JrQucb8YulaBx/MPR8QiHD5tNLXYXDBgSjEyUH8/pCZV4nxqeNja3r7Vg6bbhQxxcypn0bKyi2u42iPlw433ChCEed8OFLXYSx2jAiR4m180ABT3dmWfp1GSqRnhyrW/bXApHItoYOfAxz0QOifvqfIEdTX97FlxIfYd5lH8MN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950245; c=relaxed/simple;
	bh=Ziulb9mMltIWQNEALJDPRlCWsnKPBKb9mm4o9Za3zo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4BRCTBK0gk5T2Qd7iNr3acfBK45yfnaiePaKiMcWUzAd2alWCeMGp313Bb3WYItk/1nNZX1Qa/Fx3oIcgjHsmUB9yYqwfIgteeVwRw+iykS8ILkiGwMeS0gLtfoQBiVZerHfQBqMskNucXoDY73bJqs6TQbk6MmnhB7RdHBBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qGyu/E3f; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGyu/E3f"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242ac37caeso43265ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745950243; x=1746555043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=qGyu/E3fthiFZeH93oRX/PX4jUwxbwTNQFN9rDwqn4UUhnO6idkhVsVvOq54Uqe/X5
         JqqeThXu0muKP/BvVDBSuAJw1O+L5ZXhVvcmzSfGa9ARMMQ9WDq1ok0nNNwqaOqK5Qe8
         0wQKbVLZa/WNb2LPjb1UAO2sELZt44MdlhDP+sFTQhkB8qnxbXamoo0rh7HhCOrEHFf+
         PAfpztp3a+GvKt4rRVipQPLagMsc43PP0tqYxafXsWbGZuMKcc/vYq4hejMRpy7gTpMB
         nGpsTTigmEli8jWVDyQE+qy3JfAs/cnipM8BCzvJG9cYO3K7Nky3ByqO8v6u0OQT6p6m
         JdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950243; x=1746555043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=I1Qnp9NljEtwBD4T4OVM0O5Pae5hwzn2pGLRpNFXGFSrTMLPqUvsW/gXzHQc2mYBP7
         NHdXlq8y55AF2RfQrEhmfX0II6M7uO7tnGtp2/S8H+GNc+K4z8U71XQcumnsKvzc45nc
         Re7AyNc6aGq+tTbRkjE10+4ogR6EFcTOjfJgxwgbkojILaivX+vOBC8F5eD5VmDxIH1D
         mElzzsrsWD46egLl9hiY6w0c47LFoS8cVNvHaQdLCP2/rLO78VntJAB8tbM9NVf7Yqru
         N51mYM0UWPScqPYtdG/xOxF56EWg3OFf2o+lDs/RLRmBuZukYUoWNcqZlMRHpdodR4p6
         9NSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflDow5YR+7bZK71o3vk3FFfNKg5fky+TRCfHGMzV8MPUqk4JO5ji35zfmnJEGZ61pjaQ5S8YI+AeYKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgIdch90yLA72oby6vJjwu+lj5nSRFJczlV765PKbHt43wrE0m
	BU9o4JKRJOJLVaa1kALkvYjvuIa4U4tEW2JSe0VgZgUa0wWxg3bumzXP5AuA6A==
X-Gm-Gg: ASbGncsF4XCk/iVbnnn7PZzztnSuoYWXxvhGZBI3GOQv6Jb9HbnJxZ1CwCyXKLHbjMv
	Bo7YC8NHMgdoAZR1JizQmbyR5t42Nic9ZlEKNRV1t9k9jPnxipFPP1hDe5nSvkV7+PNF89b1TRw
	DBDPa7c0e9j77BRGS+uH/PEv7R35+ER48cb/0iv/KiLUsRg44y/GiYIIufc2Iv3+k1SbwjbHdAW
	ZQ78k1UjPpJuZHHn1dheYFXhNc/R2zm4SgmU4/P8Tdy40YA1t/vStbpoYds+RNgh6RyLNO8FaF5
	N2+MZvjFkcV2YdOXdxGPW2PFS3YU7da0KFT3u+hWi9HgasXT+wx7Li8VEQv7KTCkAb/AStOw
X-Google-Smtp-Source: AGHT+IEGtuGPnrFdA7EnAS7AeHO3rAMJ1bXf2n0ATFrXiwa1CPLZUhde5Z8nusKLhSnrBiMW3CwVgA==
X-Received: by 2002:a17:902:d486:b0:224:38a:bd39 with SMTP id d9443c01a7336-22df406ab2dmr130415ad.20.1745950242565;
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912efbsm10222670b3a.23.2025.04.29.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:10:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEWFw2wq40SHjTn@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCNkcLp6XZpjYYT@google.com>

On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> [...] 
> > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > 
> > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > for each VTINF/vSMMU.
> > 
> 
> Ack. I'm just wondering why would a single VM want more than one vCMDQ
> per vSMMU?
> [...]

I guess the only thing on this patch from me was to understand why
would a single VM want more than one vCMDQ per vSMMU? (Just curious to
know :) )

Apart from that,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> > Thanks
> > Nicolin
> 

Thanks,
Praan
