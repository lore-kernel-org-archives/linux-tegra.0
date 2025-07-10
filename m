Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF82EFDA7
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165807; cv=none; b=mbV5smdr5ql8NtrmkXPoXjANCZgNYGlKRO/2syZ+JB1/hBRwrSzDpmdw3Hq1GePilYzGqVho6MfB9RFpQ8D4Tm2tXCemP0HfqWEz0l5GuBmS465gTF2Kw0VaFNm1plIFOwOfXaxVu+BKyH05BsCxu6+YrxD6/3mlRg/6+1K4yf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165807; c=relaxed/simple;
	bh=FL1g7AAqZse2G2GgfyKga3py6hCil3qJCjBWU6lZuGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BScnswGOqCVvFW7+UVK2i4KqjGfrJ10FOSEzHjb7UhzNrAp8MFdoQjUU++1dBxYYgGrWfQZADiWJFKveVZMTBhkJbF+jjn/fUVL3Gd45YEDUz0ulTYs9mQGNyQnbHAMj3IesexNIPR/YbdCggGAbq4iwJ9yA5BdemFFO76+3kK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDO8tI3t; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDO8tI3t"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-237f18108d2so4035ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752165804; x=1752770604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=;
        b=mDO8tI3trph7Q7JCSujSBTzLMo0Dca9w+tnxTk1Z9AxTmypcTu9xM3d5v6X4Y9aDPR
         qvT7kLoghGCVduxDadhOfisxcw5UghPWM9/4GmXMhy5GZhgA3e6/Ysuldp4RiY3UqRdW
         WrsHi5qi7zczH1pSQJCRKMEOnmFrJvc8xoOUV2LSbRtWVuRKYPknQs5B00kZit3XMbaG
         u2aWPRu1E8Pe2myaDn0QwYrXROD+EIbA69jI/yFXi+y6y40mO/a6ws4u8h7xJDHtkWB9
         ZoViebSMvBSqM2X03ZCmCWZQWYyrcVnT1TYGv90j4J50wLt6GGwbi1zz7iKhyYKauS9e
         XWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165805; x=1752770605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=;
        b=p/hgjl5sQvUobfbGOaJGApfdUObgHtxwiD+ma4ncDjNmU2wkprUpIfBXkcluAmvvyq
         URkQOlt+P3NKPyO0jZAtqFqMSFdipqU8kzB1s0u7h654CWBQxs62YKUNJv/Gq3VKXxi6
         v+5Gh6vCjovfFaNVb07kqX1gkKo4fLCtZhk20vzAqgUJOBfQcBtAKKEW26CRbhOlv76O
         qxGMjUzfulYnuF/7F0QIqT7X7EPtrqiZARimfcI07i5qxLfldrTyNoi17Mp+WWOJX26/
         SaRCI9LwaUTNYh1ZXSz0j55l0c56aZmdRmbSEIC/QoVLFrHyZi5cvBwu7PLhKKeLG8o9
         u7dA==
X-Forwarded-Encrypted: i=1; AJvYcCVGsY6jz9r2pcTzDZ+d7u5XH32Ozo2VoqVM73EyMOIfr9CWg8s0lwmYBmBGvU/K4ps0Yokcfc94aDGbJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn51w/cL7msXmGH2ZCqVmykfKm7mf8vvUlALkPSiUjOwxw8KhU
	rc1pnFXHRVyI9IOcYEG+Ri/pXVKTat8KXHshvVspjtM+D43aslr3QvC1GOBE3Ei5NA==
X-Gm-Gg: ASbGncsO7ZwftNpOOoTqtD8UNJ7YID+D7sbx+7faRBhMHv8X6wIfAdQZ8jUkQWyBwGq
	r3i1Czlvk4V9wmDQwNmU/8rE+R8YPrHsTjPduA7aBS+Kqav1pu+8Tc9n9atI7IGO9a6fbkEYOrP
	06WV384D9pcIVBE+HQ1BTojZXTAB5m9GDE4jZKLvGBil1FxEU8OjgRKOJRZ+GI4azgK4F31o1A/
	YatggYlWe7ZZvPhSWnCrcmUdH24p83Tu5OTK3RzdvAV+QgaX8zkuHGrZP/WrchnkrUj/73HxdlB
	PunqxRXWS3ox56jpuKhdYx/916PEw2HXjtoFSOOnibsnYBoBID0H9mgaaJJ7ZZD9yXqQzhhGZej
	CubVvK+kbvmg6dLGrvwCB1xLA93WIcsk=
X-Google-Smtp-Source: AGHT+IEFm5EK2K+aFRgM2luBkKYZSMINjT3NZbf79E/WEwhVEuFkFUby27jaM+gbx9d+ftRkB3XZMQ==
X-Received: by 2002:a17:902:e94c:b0:234:9fd6:9796 with SMTP id d9443c01a7336-23de43702c4mr3052595ad.19.1752165804369;
        Thu, 10 Jul 2025 09:43:24 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm24897415ad.226.2025.07.10.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:43:23 -0700 (PDT)
Date: Thu, 10 Jul 2025 16:43:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, bagasdotme@gmail.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aG_togvop53dLSZM@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
 <aG-fZv39ci6yip3z@google.com>
 <20250710153202.GO1599700@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710153202.GO1599700@nvidia.com>

On Thu, Jul 10, 2025 at 12:32:02PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 11:09:26AM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 09, 2025 at 10:59:14PM -0700, Nicolin Chen wrote:
> > > Test both IOMMU_HW_INFO_TYPE_DEFAULT and IOMMU_HW_INFO_TYPE_SELFTEST, and
> > > add a negative test for an unsupported type.
> > > 
> > > Also drop the unused mask in test_cmd_get_hw_capabilities() as checkpatch
> > > is complaining.
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > 
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > 
> > Note: I see a couple of warnings while building the selftests on Jason's
> > tree, but these seem unrelated to this series:
> 
> This is fixed in v6.16-rc5
> 

Alright, this was on the `for-next` branch when the head was at:
3e2a9811f6a9cefd310cc33cab73d5435b4a4caa
iommufd: Apply the new iommufd_object_alloc_ucmd helper

But I see that on `for-rc` [1] the fixes are merged.

> Jason

Thanks
Praan

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git/commit/?h=for-rc
