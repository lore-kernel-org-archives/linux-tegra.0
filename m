Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EC3AC0E7;
	Mon, 13 Apr 2026 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082317; cv=none; b=hZ4m+BaBKuG+3kESSyPTu5y7N39hmdiNZjv7djDupGaxoibsbUvQs8yTwMuTuxmAmc21485rMH4NK+ysESRDT+xSHbHpEVlrOmo8jQEdqi+eMPmJ/dX70hSWSsK1AoONAYEupBg6bGQ3S2kMgm1bG9K5P1UY3fhApDr+pj7n4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082317; c=relaxed/simple;
	bh=cPdjbkwgMbN+VgL2rPaXpYq7s7kGzAbIz9UpEqUzzOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpRvqyzkQxef/XulO4jAPvRfIx/A/IpaF7JYGp/5esSsVUD9S2U1EZXZjruSO71yNBnEOmnZKp5F35L6uh+1rQxdlhT5iOEwnmlubSFlUelbGUyBhPuqtpNztqexwTcn3Bh6mQgiF/anmJ/0E+bo+OJt4cuxJmHdlkgTHzlBXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0yAr08U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0yAr08U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43CDC116C6;
	Mon, 13 Apr 2026 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776082316;
	bh=cPdjbkwgMbN+VgL2rPaXpYq7s7kGzAbIz9UpEqUzzOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S0yAr08UViSRm2TYvimSu0pT2PUTswB7jZHWxAVTH2aGoZKOA5MLddB2to0FjYK7h
	 UeV7+4VuvgrXi2LXqIQeT45FD7WpLHBP7tyOxUJUxBBvMHo8jqR9P+GvkeK5AKUCxJ
	 ts/eDEpSuy/TdvX+a7BxJL53TjlShuDPj7v/pyjXe4I9MCn3jUzvO5zMpXadsSYe0g
	 c/UZKQ5GicYWhNI6MdCiEeg6m/o00+tZQgdvIwXf5kFY5vZZTnA81d8CwBSRbj7C58
	 0crIq7DUnL0fdgfNy7Id3/27v6B/7Oi3Elx7EAkbxnARbTnNcSWry6fyrPeU3ZbM/x
	 4rpucJ+0EA62w==
Message-ID: <918239a4-a759-409e-a9c7-1d8d11912f56@kernel.org>
Date: Mon, 13 Apr 2026 14:11:52 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] slab: support memoryless nodes with sheaves
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>, Ming Lei <ming.lei@redhat.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260311-b4-slab-memoryless-barns-v1-0-70ab850be4ce@kernel.org>
 <abE6uqdzMUv8k0mU@fedora> <8ab58ecb-1fc1-42a1-b67a-c3107de2ece4@kernel.org>
 <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/26 15:04, Jon Hunter wrote:
> Hi Vlastimil,
> 
> On 11/03/2026 17:22, Vlastimil Babka (SUSE) wrote:
> 
> 
> I have also observed a performance regresssion for Linux v7.0-rc for 
> some graphics related tests we run. I bisected to ...
> 
> # first bad commit: [e47c897a29491ade20b27612fdd3107c39a07357] slab: add 
> sheaves to most caches
> 
> I came across Ming's report and hence, found this series. I have also 
> tested the 3 patches in this series and it did appear to help with one 
> test, but overall I am still seeing a ~25% performance regression (the 

Hm with the numactl output you posted, such configuration shouldn't be
affected by this series at all, so wonder if it's just noise.

> tests are taking about 25% longer to run). I am not the owner or author 
> of these specific tests and I have not dived into see exactly what is 
> taking longer, but I just know they are taking longer to run.

Are the tests available somewhere you can point us to?

Thanks,
Vlastimil

> Anyway, I have not seen any recent updates on this, and so I am not sure 
> if there are any other updates or what the current status of this is?
> 
> If there are any more patches available I will be happy to test.
> 
> Thanks!
> Jon
> 

