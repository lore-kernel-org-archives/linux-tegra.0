Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F045242D65
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448478; cv=none; b=iUwNqnHv2c1uffTCEKdlDXJFvqluZ0p4RcSlqk0nf9LOuW7x5Qcq0ogJ82mSCUHDC89Zo30j78FPpPkEvqhTH2LlyhYodlTUzWNw4U1b9ZLxQ8PNi2PVT+9gS/lnIcrxwzIFZG/2hn0wFmRzh7X+b7WxB62UWoFYWJloZP6Eaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448478; c=relaxed/simple;
	bh=UI/i7a3o2twKZmU9gVBMd/iTOYSldALT0tkSLrczf58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMTCKKqeHqQ7Cev/8kCNDuKldS/9iMzTVaIcWMcleigoVmwsJyumNhGRXfrQLJqxMVo/YNRWLgo43g73iSVC6LIUE+TN/n04uF0SUz1H1Pb+OgtfATNVhvdexVwUuvmLWor/8UKoqtbTe5UtYnaeTdI+Sr2CfWXKP0JZdyIUAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TEE3SSjd; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TEE3SSjd"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-91550dda53cso455012285a.1
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2026 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448476; x=1781053276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkdC3dWZFs3uTmguQZS1ztKpgkqPeW1kWupRwLRFJ1I=;
        b=TEE3SSjdaOKT3qKoSZziF9lfHb7uvUwFRVZJ+tPid0PloYtwPLECjHqyLvaE4pSOhF
         sBSuMq2nQJnYsxxRJySw7Mt0X0tzKEPpd/u6jBGEdO7XEvIa/FmyhLJCFfilV6M2BPWL
         DhxfFMGHWxtmzfIc0LOLyfC3oe8TAddwqfUfXJFZnK396ViZHtZlKIRhO6eoMbb3nY//
         YgK9RoFwmqpYKqd/6GJ/HH1nJKLz6dwHuoaRyqG1f4Tdd45zRFywQT4CGLckmVKiMdg3
         jOfBq7t1nPYPs9vTB/F4tkDrH3xtVzdZYVqS64BibvtQM7XUGqn+wAnfp3kqLZs1tYxK
         yyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448476; x=1781053276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkdC3dWZFs3uTmguQZS1ztKpgkqPeW1kWupRwLRFJ1I=;
        b=NXNzqNCMgX/kM2U6O95G6scgKrtUiNy31NGDA4vj8PkXOBi4wdzLwLEwxLO/G4vE9E
         ONC6Av5W/fHxVRoSVo4tw7w2YZ/D3jy91xVEla7D2KqzM1sl7HOVhuze8paal/ZIlM/Z
         1aer8MFIN+r8V1uu3mxmtyR3gVeqakBdX4mn8VLAitdkjy6RqTHEkOuD3vnWWOmcn+H4
         t9Z68kmrIGYNtOP4nINOfNSk0iCjgugqnmb/qcH8M7Aq759xjK9LODJagilWAtO2dDtL
         FrCOyYW2FRuXXOPQddgx66Nro7OUYJuxMOhviyWO2XCnzTfPo8Zf8b9OIKHNN174Y4UR
         +86g==
X-Forwarded-Encrypted: i=1; AFNElJ8DQI4RDvJweDtKeB8SFl9Lf0nzHRrsMOw+G5OVQdMJ0brixsi0d7ZJ7FBMS4ISXgcOt6jlKIUOm8c60A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBN2UqFHs+OPBfPbFgUHUPWdpkPcmFlME6wxzGBdD0wD0+xrDU
	oemha4CBsUdtTXooRwcEwDCzgAGHGLHkqxGcKYmciSmX7QLY1BFeRBV+wsNctDQSp+k=
X-Gm-Gg: Acq92OGi5XkJ/1Yl6+gxcFRRPpKCIWC0jhDASsab5Hj5Sf+Fqb/d+3jXIYmncbPLZ0Z
	6XIR3ig8L/Nlm1hspLBEXPaCHQnlfZk3W33hv0I823LdoxwMeSw1mlVPtZbzEgDC7UOVW933nsa
	iU3mgZGFcjZQuj+cz5ryu7Ey2OfjALQ/7zkDkb1yUqTCuTwL4HHdjTEjNQKJgIaE0hlDwSl2ocE
	VVEemyV/JLylZGdhfUVpnlWLU3OzJt7NT4c3gBsqZJYVJWv0M9EGmG+slfDiZt4Ntxg0jjQfIXS
	xJFbERnnhQeqGIyNC4+nBYAYDm40708t9aphjPYELg5hyHrQcG9qjr9q4Sl8de4/joKMaRWHatE
	Fy5K2aKD8Yb7DRiB1sztyRH8np5pk/sucuUCpFZHtRIzBnDvl+UCKw/cSjzfoGsCOeIZ1InRWqv
	QRuQjkmkhUbf9rKTC7E26lSkym+RiWcWLu7Zu7z6KQJCBFxUn4O7JwirdUJ65gOMw1eYYDTJIF2
	zYmHGfiy9o29BM6wOuW4yTpJmE=
X-Received: by 2002:a05:620a:21c5:b0:915:6c4b:eb60 with SMTP id af79cd13be357-9158a7b6304mr201153885a.29.1780448476209;
        Tue, 02 Jun 2026 18:01:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afbcsm101995885a.9.2026.06.02.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:01:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUZys-00000004xXc-0zdZ;
	Tue, 02 Jun 2026 22:01:14 -0300
Date: Tue, 2 Jun 2026 22:01:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <20260603010114.GO2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah87dzHOOTNGBBmt@willie-the-truck>

On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> > +	/*
> > +	 * On Tegra264 (see ARM_SMMU_OPT_TLBI_TWICE) re-issue the same
> > +	 * cmdlist with another CMD_SYNC to satisfy the erratum.
> > +	 * Callers must ensure the batch carries a uniform opcode class
> > +	 * so that checking the first command is enough; the iommufd
> > +	 * VSMMU path enforces this with arm_vsmmu_can_batch_cmd().
> > +	 */
> > +	if (!ret && sync && arm_smmu_cmd_needs_tlbi_twice(smmu, &cmds[0]))
> 
> Can you move the arm_smmu_cmd_... part to the start of the conjunction,
> please? If you make it a static key as I mentioned previously, then
> hopefully that should mean everything else is moved out of line.
> 
> > +		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
> 
> Sashiko is also unhappy here if n == 0 because we probably shouldn't
> be inspecting the command array in that case.

That seems like an AI mistake though, we shouldn't actually ever pass
in 0 sized batches? 'zero streams' should fail probe, not get into
this code, that might be missing but I wouldn't add checks here..

Jason
