Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0565C361DBA
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233567; cv=none; b=KHDoCmwW9zVJtttvY+bGid/C3hr9B9eSyWAU1ANqEg2W1T4Tf8H1sZ0AzvMjP++3ApeWMNaJVRSLGvKb7MXR2SwYc+N5K6VSAkgQGmpjdl33R3HnRLoMMKRgpviUDdtntqDXQBt63c0uxaztBxggP1c9FUzCx6Cseqbp/Xluqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233567; c=relaxed/simple;
	bh=28WD+GanvSlqlE4kskyOHuvwJirkuIyfWK1K37ilNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ/G0MBRLIBk5rxg0MBV5SKkxjHvCPod2A25u8bzDGxzPIVLdolu7f3ZbthWZFq5AoFeXSazdVFdeMmp2l5eh8Oq8d+nQLSvIp9oY2x9HwYkT8m8OZ+pKqC6Wh1Zz/jS+A9iKxdPRCo7p3zZeQKiQovqxQ65sR0AOKjRycto9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQlK8mmg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQlK8mmg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba180a022dso64455ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778233565; x=1778838365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HALsDsAQa8BlgwZadqAF4txAKJki3KeCnTRDOv4wNSI=;
        b=wQlK8mmgfJ1W2spXthSA7cpiNmPqDxg11ZmJ92MSBe7N6AxzYpez5/C5HWySKrZvSr
         sRV6RlImPiXolR293bUhP0qgEOrXfBrrf+I2YjEr9A34RtT7UtsFMXCvO2kgCLTuy3iW
         4WZiJxBj3UbmtRwQCmhsz3YZOCWmBoF2mxk6DOAAWKwn3UQy4XtxDeppb96JepGaJVll
         913zDf2oKOnGb2VLKahPQaSlYnozzos1Wva4o0rFokqA4YNmQ31woiGIhWQPxrpQSNzM
         uIuJiyWb3OPND1K2K6rvKO8kNlBQuUI06TkwaNfj80V07TVucYw80DGu56UDNSBEB5S2
         HASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233565; x=1778838365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HALsDsAQa8BlgwZadqAF4txAKJki3KeCnTRDOv4wNSI=;
        b=AOS+Ti0vRlwqbNWGqXuMpFE4btHVB+vXy++v4pTsO8fdQwUVibtR/TKCg9mzXlorfx
         wXcixtIGZsBMJZdVsojxwB8Ec85xUguydGG6gzDNiEwCvfjIDCBW+RPXRhwemrNkNued
         Bmrhh7qaGWbMDgK5taCDWl6DmH73+WAeJ4E03xZ5Z7+x1MOC9XVyYOnwwhMd6LICE3TY
         33JMlQFCpJSgIa3T+rWpRCZml8G6GCPFDW/levLQj7ldTv8SBQvCYeLsz16PnDBQMD32
         DE6kYjFGdC8QrcWjVX9/7xC6ba3RvgAyF+kpheOIbv18bT07kv8zQgjf1l5R4gD8881W
         y9Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+parOJiQjKgJLEdDtUbO+myl8MhJ0GaQsPoZYa1mKvzQzyWcK2x+2jTC2aK9pAW7Sen7yS/6PD7bEB0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEaVLNgLvgVQ+N4kxPthWXcT3xNudsCjoBwEGnCqbw+A081dV
	4ZSpsTQyyHYMJriprB5qFXUGlDd8HAY0mqWi0YR+5az5QVsfrxG98eWLyW7Ri0S4Bw==
X-Gm-Gg: Acq92OEoOV804MnRHQfO3jIueYdEjixDKTUzcM+bgKo4//5qtkJiko0mrjWmQ2YNHBH
	aebtVVp7xqPotI0Wtq3mZyifziLpSgicRhPKiXxrFGoHWbRH6qrcTO2JbPSiKukJCd4UFqUeDV3
	U4FAGbOx9JUeRlQ0o7e/4YWiiL5vxpVdX0+tWn5p4FoTC0jAfxrpXetXg4hvyc0ECdLWXXlw2YP
	Lu01g4k8LsUSQk/m1YQKe0LNoRJ5vLWXaA35hmMScuGBWDwv0mm1E5HP02rYTNSvy0fkLm6jxil
	Cv4dErIXyk3C5Am2cr1GM2JqCHrC6yowQXzb9XItqQP/nkQUKqTjbo9/WUQUkao5tl96YbxQBQT
	elkP+4rsx+euZkVHOscoVG9cmjrj0dAnJ/guqEbPVExnV/V2kTCOi0EqK6HcQqKWiks4ch6YMS/
	XLi8Zu4HV0MkXyfuaV70ETvtyNs1rsNakWZqpDukyH5RnSps6FKsazsE0z+pEWWB8CLO4q
X-Received: by 2002:a17:902:e549:b0:2b7:b03d:9dce with SMTP id d9443c01a7336-2bae9e98dafmr2720055ad.18.1778233564632;
        Fri, 08 May 2026 02:46:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac6bcsm14904885ad.70.2026.05.08.02.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:46:04 -0700 (PDT)
Date: Fri, 8 May 2026 09:45:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
 arm_smmu_cmdq_build_cmd()
Message-ID: <af2w01YI01Av0Wg5@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> Nothing uses this, just dead code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b3ef001ce80d23..ef0907b1a2204f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>  		break;
> -	case CMDQ_OP_CFGI_CD_ALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> -		break;
>  	case CMDQ_OP_CFGI_ALL:
>  		/* Cover the entire SID range */
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);

CMDQ_OP_CFGI_CD_ALL is also present in arm-smmu-v3-iommufd.c
I'm wondering if we should remove this from the iommufd.c file too?

This op code seems to be unused since 5.15, if a guest is running the
same Linux driver, it will never generate this command anyway.

Unless we care about Guest VMs running non-Linux OSes, I think we should
be able to remove this from iommufd.c too.

For this change alone (preferably along with removal from iommufd.c):

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
