Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8034FF59;
	Wed,  8 Apr 2026 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658679; cv=none; b=A81fk0gtRhVmbcUvxj6OwXdJXWa435+B3zzO/1coqS3GNXc1X7KX3hMEN4InQOcqNiIq/DOmcCEiUxrpcF67flMMvn+ijauNtxUX1IWkscic01Hp045JE/wjgvO0uVRHZI27A9ysjHtgvRUP98cf+GgiYwhTqLho8xBq5I3yk1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658679; c=relaxed/simple;
	bh=rp82Q+HbL0irHGo0AxK6OBmxsXzUT57NdgiG+MbUIxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfdI/vCKzSKgKopjxtVtQqVWiKJfqxzu9L5MLWuAeYbfoVx+D6RjDDUQno3ZQ28Ad5n+f+KoVhE6M9bCanUZ4J69qTvmeTh118+1W9viGjQL6dBws0PyWl4o9nJSVeMYkh0t1MUcOA020C2heXtqeSMhoR2o6KxGjzphpkEUfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjWKjNin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjWKjNin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FE9C19421;
	Wed,  8 Apr 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775658678;
	bh=rp82Q+HbL0irHGo0AxK6OBmxsXzUT57NdgiG+MbUIxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjWKjNinK6NPSf8ibRKFX5mh4vW3bLqveebZfgse5j0hRMlZys3BBhEdi5sPKHb+r
	 8l0c5xMGBxbv/v/QBqPLDGh6BQ5DLedpD3iBrNwsCypK/HJGGEU0VmoEjJ+c42Hiyl
	 jXykW59a5WIkIEa+6NF0Y6KPHuM3CE0mTKPXj+XM3ykjQYbS6KknDtcqLYL4p6sQXZ
	 /KBqv4pFfjnyB+rU3fqAt5w6XV7DC5mDWODYZE4RR5ttznVxyI2aSinjKwKmyWDk6C
	 9qPKmZk28iMey2lW95rMdai9hbdtCKeaMm09R5LzMs617FXP9X4zIy41rb6dh2ztPH
	 2q3ND2KXB8TLw==
Date: Wed, 8 Apr 2026 23:31:16 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 0/3] slab: support memoryless nodes with sheaves
Message-ID: <adZmtJ0rPgj7OQrc@hyeyoo>
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

On Wed, Apr 08, 2026 at 02:04:54PM +0100, Jon Hunter wrote:
> Hi Vlastimil,

Hi Jon,

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
> I have also observed a performance regresssion for Linux v7.0-rc for some
> graphics related tests we run. I bisected to ...
> 
> # first bad commit: [e47c897a29491ade20b27612fdd3107c39a07357] slab: add
> sheaves to most caches
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

As far as I remember we didn't get to fully recovering the performance
yet. Interestingly even when most of allocations go through the fastpath
it didn't fully recover [1].

[1] https://lore.kernel.org/all/abI9DKxuwl_4Gasj@hyeyoo

I was suspecting it's probably because of:
  - false sharing on something (sheaves, obj metadata, etc.), or
  - suboptimal NUMA placement, or
  - something outside slab involved

But I don't have enough data to back up any of these theories yet.

> If there are any more patches available I will be happy to test.

Thanks!

Before diving deeper, could you please share the NUMA topology from
`numactl -H` on your machine?

It's probably a NUMA machine? (and hopefully not memoryless ones!)

-- 
Cheers,
Harry / Hyeonggon
