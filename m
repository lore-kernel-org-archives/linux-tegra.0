Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201B24B28
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 01:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420325; cv=none; b=lCmYJpSGgOB5HD1x0LtmedES5ftBu0QtTociL+CckRe9+qFtbcWMpCcft71/v/d95Pk7RQiV4xi4jHRJxFkEJEqR3LXhb0FCz/1eNcDE9i9MyX/ptO+CzdTglgleCArn9P5uXNwkgV/DFK7tPgNeBYcaqQU21moELVkXTGsqjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420325; c=relaxed/simple;
	bh=vPktWFba1CaphVOiurjNVMsrvjbgo6h4NsplM3lBGxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWVjqfq6M/Z9B7KmulWowmYPRSWrh2Jc8HAeTshiMRcWcBGCHIyLEE5WzLLll9W58NnNRGVjPWYAoUJyc+mzufoXWSAtGuqifQ/Wdu6fB/6Nawf+XQkByP+6LbIMX56ducH3dsNyT0U7fgVH5pqY6KeeevAKc00puB2Jsah2zMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8IqLnjY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8IqLnjY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-237f270513bso280465ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jul 2025 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751420323; x=1752025123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kp2cPDX2Gx1yqqbKf91cIrL6zATVqvS/PN2+ecRrrmc=;
        b=t8IqLnjYPzVIKJvLqEcu5L4RelzvpZlXd5WVV1p0NW72QL3BDNku6DZAAQndt51A5R
         R8E1uck1wsiTur+DaeswyeSy9Km91e/QwM5r6kZZDGD1Pmq2pE2mMiq5DvirzfwaziMi
         OxgVlvj7VLisQdOAUMlv8jF9kBu7qVTvKhPdbAFdOlZhEI9vvGeeVdIlmMbWUSsyu5C6
         fci+24DChMbsS4ptDZu6qy4BZ0XWcQ6om44Cp5knQ6hf18TkAQF4uifLwFKEX5oLhwDD
         TVb2GU8dNxtpbFG8ouYw/NrGgMUIpKVyn8I6oDNLXVJ3qg9aAi04Oi67FPx6Bzs2X4W+
         NYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420323; x=1752025123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp2cPDX2Gx1yqqbKf91cIrL6zATVqvS/PN2+ecRrrmc=;
        b=JmFf0E8lfWLW3KiS8F62ltcOLCHOaA7zgDjiqHZ087G5+KUC1F4+08wnKmom/icL9Q
         2eeIFOjLpvlSx7pQsss85pTXDSddZ37DqNryqVdEItNwG/M/4WKbsWHBIK9cf3ySWwI/
         4N4zGTKQEdsMdZXqKnOzsReGBMYg5ZnzaGjBCcOBsyc0mtjuyPpwmuXwKfg6gm0wIDLu
         hc67/Juz1NMDUIYcCF4oxngFJly0Z9h2zUOTH1n5I4Ved/hAR9Te+JQZjJGnBcvY+u9+
         MG0n5ZRx0eemLBb1DfqquyG7m6NVEvaz+vD+3fOwohu9XjNbULWhDZ3qXSExVplxr7Wq
         TecQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrdjWstuycOFbzxkPx4kT4dwA7KG/vrY8FyqA47+av5LW+gTid2LLApLuEtnTt9L4kZ+5Z5nn253YklQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhw5N0kk5K9pVKqHsNn5WwmBw7/q8qp6BZimIahGVdpsH/X2z2
	zQwjidRmB9il5NKJHaXBpWBzc3AMRGmQ/34HH2uquA8FIjnn6q03u7cv9fVNKtd6bQ==
X-Gm-Gg: ASbGncuCaHn96p56g7tkHIXe4cUOy+5lu+1McsA9tgOXilW8b/ZW/NQ1X7unMzzwiMo
	++KjIOcRO3+k6zKr8/nmTz3orXpXMhsSrTg4JFVABm+PcRudqrMR2lf2TkZ0HlK4B2OcBkTAB1f
	Rz49C4WLsBYYX7VRLLJA0HBQHKplTAPaXtPzAmhwP7Ub+VbG08YZCMv/euATb0jitgLMGPy4p3h
	tbny0RM5F/LzjugPZjzuYwrG2kJUotkIu/Ki6bHU4VyNZw8p3nC3+la+u/gb6If7c7AyzZJPdVh
	oGMNewKmN2v+yMPdFGaKHFEgosl8jBE/DZgsIGY4gH1cY95e6pWGCZod5GIB5bFk3XE70maqFP6
	J5pC9Aw2qNoS0qtfquqES
X-Google-Smtp-Source: AGHT+IGlz2Z9E445R3idcc5ZRjEaWuytfr7E4KLC8vSsZvwO+Dw22SVfjYoD7L1quVzpUqXy09mcbA==
X-Received: by 2002:a17:902:c401:b0:235:e1fa:1fbc with SMTP id d9443c01a7336-23c5fd70ee8mr4718365ad.0.1751420322911;
        Tue, 01 Jul 2025 18:38:42 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b394sm13073470b3a.36.2025.07.01.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:38:42 -0700 (PDT)
Date: Wed, 2 Jul 2025 01:38:33 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGSNmf5Q82xEbDpX@google.com>
References: <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGSBTpY0nkdp2TTL@Asurada-Nvidia>

On Tue, Jul 01, 2025 at 05:46:06PM -0700, Nicolin Chen wrote:
> On Wed, Jul 02, 2025 at 12:14:28AM +0000, Pranjal Shrivastava wrote:
> > Thus, coming back to the two initial points:
> > 
> > 1) Issuing "non-invalidation" commands through .cache_invalidate could
> >    be confusing, I'm not asking to change the op name here, but if we
> >    plan to label it, let's label them as "Trapped commands" OR
> >    "non-accelerated" commands as you suggested.
> 
> VCMDQ only accelerates limited invalidation commands, not all of
> them: STE cache invalidation and CD cache invalidation commands
> still go down to that op.
> 

Right, I'm just saying the "other" non-accelerated commands that are
NOT invalidations also go down that op. So, if we add a comment, let's 
not call them "non-invalidation" commands.

> > 2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
> >    mentions we'd like to "fix" the issuing of commands through the main
> >    cmdq and instead like to group by "type", if that "type" is the queue
> >    type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
> 
> I recall that FIXME is noted by Jason at that time. And it should
> be interpreted as "group by opcode", IIUIC.

I see.. I misunderstood that..

> 
> The thing is that for a host kernel that enabled in-kernel VCMDQs,
> those trapped user commands can be just issued to the smmu->cmdq
> or a vcmdq (picked via the get_secondary_cmdq impl_op).
> 

Ohh.. so maybe some sort of a load balancing thing?

> >    what do we plan to do differently there, given that the op is only
> >    for trapped commands *have* to go through the main CMDQ?
> 
> If we do something differently there, it could just do a one-time
> get_secondary_cmdq call to pick a in-kernel vcmdq over smmu->cmdq
> to fill in all the trapped commands.
> 

Alright.

> And this is not related to this series at all.

Agreed, sorry for the confusion then.. I thought that the "type" meant
the queue type.. I guess it's all done then. I have no further questions

Thanks for the clarification!

> 
> Nicolin

Praan
