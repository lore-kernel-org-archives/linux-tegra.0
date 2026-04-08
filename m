Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA933D16E0
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657217; cv=none; b=jRd5pr/yY/fmG2rL20txyLXORx8yhr+69QgXsfRbhpqMM9QxmginfUFRa+qo49aeSvGYhGDMIeNXGnPgSh5EowmFNkTuo0bgrXbOfDFJ+jRnVhqBboBOOa6S3upJzTbCZAccbC6dRjBet4wSnHo2SSYudie6Dx5xrlx0UNa3RSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657217; c=relaxed/simple;
	bh=Wttzv9znhaZnlT1mge9nFiCtZdZ5bqUkpDVc0uKHWjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mw22n4HjpoLxZtW9kaVbVg8OqDYLwmv6K15+H5+WHdNKFnQYu/SLO79/8np5zipo8cpAD1EFX0d9BjmgWfs7jWhmyfYMxcRQLekjwQv2QzMnz2soee6oNyZXM0HvJGSGJIJkjBaXCt1rpHiuKnlTf0aEBh/GARVdz3i6NNCWN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UyqjWcO8; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UyqjWcO8"
Date: Wed, 8 Apr 2026 22:06:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775657213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dNYg7x7Syglbc8DiB7vhJcupdEbs7o3a4KhHFIj6l3s=;
	b=UyqjWcO8sD0zcp1FHl6Q93dzyFcGLnyxufBJJvMs3khFmRZ5BHJvfFv05eQ4wb6jSg+url
	zJjs2GoPEt04oMCcvqi2fv75qeBKlrq+ckw2mCM09bxT2k4LNIHRSAF67Z1hG4A7ajFVy+
	+FNCLXqiqK+FGuPtQ1B7Hgmn+xpfr8g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Ming Lei <ming.lei@redhat.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 0/3] slab: support memoryless nodes with sheaves
Message-ID: <y5oqhhbecurzrj755sujnqyny6ohmyd4uhslrrigdgpq6shf52@nr5gp7bpit3g>
References: <20260311-b4-slab-memoryless-barns-v1-0-70ab850be4ce@kernel.org>
 <abE6uqdzMUv8k0mU@fedora>
 <8ab58ecb-1fc1-42a1-b67a-c3107de2ece4@kernel.org>
 <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 08, 2026 at 02:04:54PM +0100, Jon Hunter wrote:
> Hi Vlastimil,
> 
> On 11/03/2026 17:22, Vlastimil Babka (SUSE) wrote:
> > On 3/11/26 10:49, Ming Lei wrote:
> > > On Wed, Mar 11, 2026 at 09:25:54AM +0100, Vlastimil Babka (SUSE) wrote:
> > > > This is the draft patch from [1] turned into a proper series with
> > > > incremental changes. It's based on v7.0-rc3. It's too intrusive for a
> > > > 7.0 hotfix, so we'll only be able to fix/reduce the regression in 7.1. I
> > > > hope it's acceptable given it's a non-standard configuration, 7.0 is not
> > > > a LTS, and it's a perf regression, not functionality.
> > > > 
> > > > Ming can you please retest this on top of v7.0-rc3, which already has
> > > > fb1091febd66 ("mm/slab: allow sheaf refill if blocking is not
> > > > allowed"). Separate data point for v7.0-rc3 could be also useful.
> > > > 
> > > > [1] https://lore.kernel.org/all/c6a01f7e-c6eb-454b-9b9e-734526dd659d@kernel.org/
> > > > 
> > > > Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> > > > ---
> > > > Vlastimil Babka (SUSE) (3):
> > > >        slab: decouple pointer to barn from kmem_cache_node
> > > >        slab: create barns for online memoryless nodes
> > > >        slab: free remote objects to sheaves on memoryless nodes
> > > 
> > > Hi Vlastimil and Guys,
> > > 
> > > I re-run the test case used in https://lore.kernel.org/all/aZ0SbIqaIkwoW2mB@fedora/
> > > 
> > > - v6.19-rc5: 34M
> > > 
> > > - 815c8e35511d Merge branch 'slab/for-7.0/sheaves' into slab/for-next: 13M
> > > 
> > > - v7.0-rc3: 13M
> > 
> > Thanks, that's in line with your previous testing of "mm/slab: allow sheaf
> > refill if blocking is not allowed" making no difference here. At least we
> > just learned it helps other benchmarks :)
> > 
> > > - v7.0-rc3 + the three patches: 24M
> > 
> > OK. So now it might be really the total per-cpu caching capacity difference.
> 
> 
> I have also observed a performance regresssion for Linux v7.0-rc for some
> graphics related tests we run. I bisected to ...
> 
> # first bad commit: [e47c897a29491ade20b27612fdd3107c39a07357] slab: add
> sheaves to most caches

Hi, Jon

Thanks for the reporting.
This first bad commit is surprising. In theory, this commit seems couldn't hurt
performance.
Could you possibly manually switch commits to verify this bad commit again,
without using git bisect?

> 
> I came across Ming's report and hence, found this series. I have also tested
> the 3 patches in this series and it did appear to help with one test, but
> overall I am still seeing a ~25% performance regression (the tests are
> taking about 25% longer to run). I am not the owner or author of these
> specific tests and I have not dived into see exactly what is taking longer,
> but I just know they are taking longer to run.
> 
> Anyway, I have not seen any recent updates on this, and so I am not sure if
> there are any other updates or what the current status of this is?
> 
> If there are any more patches available I will be happy to test.
> 
> Thanks!
> Jon
> 
> -- 
> nvpublic

-- 
Thanks,
Hao
