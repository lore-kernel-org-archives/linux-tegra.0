Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBB2472B9
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952264; cv=none; b=VWiGtubteo24k7WrnA8Qxh/8oG55RjmVu6RhpNCYBY4s0QTG1AXNOcZ+L6RmtFYG1pvf0rIf1H13r9FuJhx3JhoQu/lZ80cIFBdlFh2DrK0jhiFE9sFIhpOxW5uHhtSIUOYVk5lM99jL3AqR1IxiKIAn2MW3CYGtlbynEXDhpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952264; c=relaxed/simple;
	bh=Yd+fxjsRydFKjO90TX3Imy2H/CCh7glVFS4yzzIbM64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cv0upAuBcMKRtxC2H5x99nWZC/IupMC3NdQ33KZKpc7e8bWQw12eo5wCXyts5/F72N7vyjUP1QdoSX7lo42Do1F7RdyaFwdxfX8LsCVnVLo8TcJHZ7oqQiL4OLRV73+Ez81mbop9XDlFOfzmyKpIndJnQbKzY666WZ9eoIDYlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vUEESBuw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vUEESBuw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so209665ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745952261; x=1746557061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbAOOUKsalrnyJTM4wor6y5G5I8sKroNDDc7YCgeN4g=;
        b=vUEESBuwa2AFOvYPkM/3rpp8OuxqK3wanYiyIyw/DVGQgQD+5BjpaVqNrlXb8y1r5f
         1oJ8sPKbPDFBG5qwH+D2ITRFzDK5KiNl7jJ8SsAEDEOgyJfByZW3ZAcV/b5H7nnh6IPq
         Zwm1nzUAq5TMicigxxyCZY4WNgv15d0KIDZT1ChK6eLviB1nrFPZpdTAeFzFyWXDdGJ0
         uqME84iLJ/vC/fu5XWbiIgkLjZW/XjSQkAMIyd2D9dNrBxDwlMPnhnyJzF5YJHLkPTTC
         MevgqxQta010BKpqs89wjiYVX3TrxUM+g3/2mF0lpXvEoiqxos1YEVKvcmgn/ssMpf0j
         o2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745952262; x=1746557062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbAOOUKsalrnyJTM4wor6y5G5I8sKroNDDc7YCgeN4g=;
        b=ktnYThDfQQtvLlX3j7UK6iBsWAQtvBTRBoSERltwwtBE1YQM3J7em9bNLk/v52lCR5
         LOCmH2Y6zTStSuTl3CpiP0hZ9LluY3KX7eBZTWjnDGBbuBPCEWp6I1eQa0EdgdTWmSr2
         Ef3Po6fUoqMCyp8aaV+D7+yhID6Ro4rJWpsNz8BfgUWp0VLoxBWMHBkl9858rO+H89+M
         X9k8yhE0tgQ3g3VmqwETmdMZDWa8+iGtPPPTRnVeFAM4zZO9g8+fharTb4ZRAHAhT+YO
         dlHWCN22HRg+2wbu26HxOptysditlSSjNxCJ19odxotKUePH/m6QJKfZ+h8YYpgLewx1
         8lJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqThJyZZsZERvxOuoh7DF2ZvJgkPVHt80pDwNg7sRXHkfx0l30BGo7MRXW9wtHSWOZ3tSSty+Q1Ifvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhPaB27apZpuJVO4Ju0BGKfa5KojU4uQV4w7YDasVcy5w39Xs
	CEgIVufFnCSyuoY+4AanP3oQ1qgzAmL+SGy+7PLGYzhGTmhHpg9kY8YIrZxnHg==
X-Gm-Gg: ASbGncvbG4UZK+GX4LlmlyCumwTqi9he7R1leXctvmkVzNYSYmSOF38fDEj1K1ShSXx
	vaKSyO5Umm+K7FeWi6vmCmXKZcPKPCQR87z7fRcqSrPO/moF3s4KDaymhXijeFU6f7wUtf0R4TL
	D3FQysRltJselo699qLsePpPFCu4az4P5hXIuhU2Wd1zRV6+IHGgzvA3e+CNi+Zx7dNg/IxR+sX
	1FXpu4hfskdykxywbPqvpQGcBNPWl28dxY1WpzGg91gJCvW+6xbKrOeMiA2JUiBwcgigrwy2aLg
	2podeyIZWC56/jnQtmXTe2ZThMetcnl9v0+oExI1eoAmzJ2RTXazGk6NphXkSQlrH1Iu/wiJ
X-Google-Smtp-Source: AGHT+IHAAAZnrzfCTnyRFSrfgzM7EUKVTFf0g+y/q4rYabIT5b7Fav3BwFROBr2u073eUGpUmQ9SUw==
X-Received: by 2002:a17:902:d2ca:b0:216:21cb:2e14 with SMTP id d9443c01a7336-22df41fb4admr245055ad.21.1745952261334;
        Tue, 29 Apr 2025 11:44:21 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740399415bcsm362b3a.73.2025.04.29.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:44:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:44:10 +0000
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
Subject: Re: [PATCH v2 11/22] iommufd: Add for-driver helpers
 iommufd_vcmdq_depend/undepend()
Message-ID: <aBEd-kacX84dkUuf@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
 <aBDIpz7w8wxIn_AF@google.com>
 <aBEIBKdjuecVHgpU@Asurada-Nvidia>
 <aBEThP2Bn0YDgXfu@google.com>
 <aBEVboMt0OtZmt4Y@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEVboMt0OtZmt4Y@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 11:07:42AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 05:59:32PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 10:10:28AM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 12:40:07PM +0000, Pranjal Shrivastava wrote:
> > > > On Fri, Apr 25, 2025 at 10:58:06PM -0700, Nicolin Chen wrote:
> > > > >  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
> > > > >  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> > > > >  				       unsigned long vdev_id)
> > > > 
> > > > If I'm getting this right, I think we are setting up dependencies like:
> > > > vcmdq[2] -> vcmdq[1] -> vcmdq[0] based on refcounts of each object,
> > > > which ensures that the unmaps happen in descending order..
> > > 
> > > Yes.
> > > 
> > > > If that's right, Is it fair to have iommufd_vcmdq_depend/undepend in the
> > > > core code itself? Since it's a driver-level limitation, I think we
> > > > should just have iommufd_object_depend/undepend in the core code and the
> > > > iommufd_vcmdq_depend/undepend can move into the CMDQV driver?
> > > 
> > > The moment we added iommufd_object_depend/undepend, we already had
> > > a blur boundary here since we had no choice to handle in the driver
> > > but to ask core for help.
> > > 
> > > The iommufd_vcmdq_depend/undepend is just a pair of macros to help
> > > validating the structure inputs that are core defined. It is quite
> > > fair to put next to the raw functions. I also had the notes on top
> > > of the raw functions suggesting callers to use the macros instead.
> > > 
> > 
> > Well, yes.. in that case let's call the macros something else? The
> > current names suggest that the macros only setup dependencies for vcmdq
> > and not any "two sibling structures created by one of the allocators
> > above" as mentioned by the note. Maybe we could rename the macro to
> > something like: `iommufd_container_obj_depend`?
> 
> That's the intention of the macros: to validate vCMDQ structure
> and help covert a driver-defined vcmdq structure to the required
> core field, as we only have vCMDQ objects using them.
> 
> If we have use case for other objects in the future, we should
> add another iommufd_vxxxx_depend/undepend macros.

Thanks for clarifying the rationale behind the VCMDQ-specific naming.

On the point of needing new iommufd_vxxxx_depend macros for future
object types, I don't think that would be required because the current
static_asserts within these macros validate the container->member.obj
embedding pattern, not the struct type of the container itself which
makes the macro logic inherently reusable for any other object type 
that adopts the same embedding.

However, if there's  a strong preference against making it generic,
I don't have any issues since we only use it for vCMDQs right now.

My main point was to keep the core code seem generic to aid other
implementations in the future... today NVIDIA has CMDQV, tomorrow maybe
someone else would have something for vdevice or something. Anyway, I
don't feel strongly about this. Just trying to help :)

> 
> Nicolin

Thanks,
Praan

