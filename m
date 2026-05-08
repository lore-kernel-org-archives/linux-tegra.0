Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032318F7D
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260644; cv=none; b=jSD2YgPaiEsWraWsDZojGCKufl5ccCPQWDc3bSvwOORJMot3gC/18qNVJts8PkzHnjtaFDXMTvgv3mqA66EnIEhHRDMXCc/sJVgLGpn8SElmFpTcQZ/UvUU/9b7aUyqmYiK/fZ5GuRVSGoP0XK6Fl07vBM4QeoJqD79AX01gxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260644; c=relaxed/simple;
	bh=QvqG1+1JxnbU/5V2L4JChPDrJZMs7pfUYqcMmN79wGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rdh0e9Tsv5Y0v82Ht/32d4kpSeRPys7iE3bg0ANSBFzTFsdFUYZ39T97qzKJlAKMwd8zxnB0n8DzJiY74AmcfMt4rWp99E2tFbPIndrdTYzP26cnkE/rbzBq1ShCOmqXVbdI8S/pPEwdWIkJfTvR9RBUwM/ntpYceutS6ES0Ry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D4noQf+m; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D4noQf+m"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so325ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778260642; x=1778865442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI7X52J6aApGzF9MwcE5Wp5s+0QmxzGTZI8IYa2JNaY=;
        b=D4noQf+m+vt0DecUjylSBEeobNneyrIe2cLEy+w5zlb9IeDFRF2Z8pR9MnSkuLyZqT
         g9Mj/boT4KIqatNDPvQmOswHpqEEfnq/N6GMOYFZ88Iy9hV2UKq9ABwPAFWvezIVUUrC
         XkN6OtspkGLBIZpYfI7H/DWeSqPUYWtDcgCTwkGOvwHym9Stp5jhQQ97/SQtXYQtgvWG
         pW7NVgaNKT+J2RxXrvvTvYoy7QsthDWOFrJYUWBbi6qhQP2vVpCODTBj9pU56jT6wJ0/
         dQ29cbDMDRxgDR+FB97YSM0NZEgocx0BVU7tne8V3peW8sfDbAEOiJpZoXGjzsjAclTk
         AFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260642; x=1778865442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI7X52J6aApGzF9MwcE5Wp5s+0QmxzGTZI8IYa2JNaY=;
        b=bsy1/udPBXi8pMNvdKjIcXjaQYcXwxWsVIAihgr7GSEGwtSvBXeYQBjhv8tBEF3iuT
         70aaCO2DdTNjrrOituoYTEQge6M+PYeUVB8me1QDYNYuzjAcUlfl1mmxX0b+R085jyOl
         h/Cp77MUy1I8IcJ2Ph/AbPz1axL9XNYnn/blpQ6tMmvq+aduT5B9hbSoje4J7442QAjp
         EFQuRV057dTTLu9Jpsyi9F0M4jVrvPiJxJyaipGisJd9KstfV3fEZEyPIhsQzAhKLKze
         TkStYxCBq2o86fPJmmh/K7STJexhCRIXsQOTqj+oesgZjqF2YNh0pTxiFonz296MQn35
         Lh6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Ksbt3dyYia7lrWG5tR4H5F1Yx0bqXAZxBrAPrPtjt38/MdlsV3eGapR6tI7JqIQjN0jasLEyH3D/fwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PEAZN+rRdHG/+3Kd/AXJ+8IM/r6eSEMEoQKRVazWyDb7yPCh
	NQaY2VCzQsDP47Zm8/34Zegvufzde1zLGA0yhwMd769uVUIR3DOe+QbaHwxB2GBpAQ==
X-Gm-Gg: Acq92OFTm3l5WL0QfRNXIoZEYLFD3tIkondNPRBmoSkqjrGjXoqiwGjgQOhpW9Ckejr
	KwmkKxUUKezQPWMgxj2vXwPLafImLevL53JYWGE27dpNPYYLdqoXZa0Nt8egKKSsK0BBsyQ9S9N
	Zepz4OJ1hO3uUjg9M7KbvKiqrMDYriSwrFTnHzbvFBbpgNOokEka4wO2F65Pdxsm7EteiwgE/uM
	BFH+lPvE/Gn1ADCqFeIC5CbjcvISRou7PMVoKwillHUQrxQswylx0Q4OxQUx8dvgj00j7uZKTOb
	hQft6cZ8BnY6/26xHBdCRfluHC2RdvqpvCEDdR3UYM0xeMCsjvcL1haB1C3j/8g2UFPjDpKk5FL
	EMJJLBMMngsR2whJdPugDvxhUKRdFfOElFvcEteLisE42JWgLx7ke3bXf3JWKVtbVc9HQiY8T6u
	lLPJLuAthkGg/ejmPxdsfCexSmU46DS0fXsnnbgbbhXyx7p4vsNUvcPilDKgmq+t4HzOzT
X-Received: by 2002:a17:902:cecd:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2bc74753517mr64435ad.6.1778260641297;
        Fri, 08 May 2026 10:17:21 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c2ccfbeasm311186a91.13.2026.05.08.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:17:20 -0700 (PDT)
Date: Fri, 8 May 2026 17:17:14 +0000
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
Message-ID: <af4amt7Pzmq-xpLf@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af2w01YI01Av0Wg5@google.com>
 <20260508160236.GG9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508160236.GG9254@nvidia.com>

On Fri, May 08, 2026 at 01:02:36PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 09:45:55AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> > > Nothing uses this, just dead code.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index b3ef001ce80d23..ef0907b1a2204f 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
> > >  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> > >  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
> > >  		break;
> > > -	case CMDQ_OP_CFGI_CD_ALL:
> > > -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> > > -		break;
> > >  	case CMDQ_OP_CFGI_ALL:
> > >  		/* Cover the entire SID range */
> > >  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> > 
> > CMDQ_OP_CFGI_CD_ALL is also present in arm-smmu-v3-iommufd.c
> > I'm wondering if we should remove this from the iommufd.c file too?
> 
> > This op code seems to be unused since 5.15, if a guest is running the
> > same Linux driver, it will never generate this command anyway.
> 
> Yes
>  
> > Unless we care about Guest VMs running non-Linux OSes, 
> 
> We certainly do :)
> 
> And who knows, Linux might start using it someday!
> 
> Guest emulation has to cover all the commands a guest is allowed to
> execute, and that is what the iommufd code is doing.

Alright, it makes sense to keep it in iommufd fir diverse guests.
No further concerns.

Thanks,
Praan
