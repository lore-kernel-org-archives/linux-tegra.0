Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903771D1E7A
	for <linux-tegra@vger.kernel.org>; Wed, 30 Oct 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293940; cv=none; b=MyeqJ4dIxSbYqz7Pd6sYLOvGvLFG4nMyFuOD1tXlayHezOLw2CghgheVfaJi84NZV5dbk7cVt6S+6hNL2tmr/EcXjlmR3Q7clqzp2TcpIyHJfCmaBOUqI6+kwYWkyg05Y3PlR9BmIzL3FpefSB7vEOVUp8G5GeqnFj4Px1TJYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293940; c=relaxed/simple;
	bh=GLmPCKsnRLp7UWJOxMGhqO1S7eCnzR3rTDZxud4PtPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXsDHvcjdQMVjI/ipxdiXZ0g3j0HcAdOQCNB3Mnq/4B5X3E2dyf5k+dmVeBCKUMF/ZkRdPFMfixF+aJyHomy+LfNDRgq8LX62YWsOWSafOXzE70Q5h/JtIiUc1uQvykGYf8gyJE0q9BzBhX6rlFUHI7kVRJ0gOspK+wlowVzpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0z2elTr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0z2elTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6775CC4CEE3;
	Wed, 30 Oct 2024 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730293939;
	bh=GLmPCKsnRLp7UWJOxMGhqO1S7eCnzR3rTDZxud4PtPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0z2elTryGCHcp4StLsu0v6v2EG6rRWLcgnCznBeAokuG9sJvzNvhqsdwPCjFmFFU
	 +R9fIB0gN0UtDK9XSOMmFNb5ybrIddRZ1OhA9gZTByt3rAw/UHMGJ3HHkOgdDfh/To
	 UtR3I//yn80X5mvmimjHxbkYwMdf2qO1tTf7APCxYf6oSH+4lQbsNGibWoAgHUVTiL
	 fccYDnjRCueV2zbW2u2c1su37tWg8zINUJzluecCa9JsmZr+ycspbBZWfC9akFsxmT
	 tIazd/GnZ2ZWCN5c/fAC/kJcUmlC7kBXOvnq1++KnrQEW8An+XTBiPMn62w+nIC31H
	 621pjlrukQ22w==
Date: Wed, 30 Oct 2024 15:08:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Jonathan.Cameron@huawei.com, dan.j.williams@intel.com,
	David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
Message-ID: <ZyIvxWghfaK81I4d@kernel.org>
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
 <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org>
 <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>

On Tue, Oct 29, 2024 at 10:03:31PM +0100, Jan Stancek wrote:
> On Tue, Oct 29, 2024 at 5:24 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > > On Tue, Oct 29, 2024 at 4:07 PM Zi Yan <ziy@nvidia.com> wrote:
> > > >
> > > > +tegra mailing list and maintainers
> > > >
> > > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> > > > >
> > > > > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
> > > > > It hangs very early, with 4k or 64k pages, with no kernel messages printed:
> > > > >
> > > > > EFI stub: Booting Linux Kernel...
> > > > > EFI stub: Using DTB from configuration table
> > > > > EFI stub: Exiting boot services...
> > > > > <hangs here>
> > > > >
> > > >
> > > > Is it possible to have earlycon output? It is hard to debug without any
> > > > information except kernel fails to boot.
> > >
> > > I know it was a long shot, so far I haven't had luck getting it to work.
> >
> > Does it boot with numa=off and numa=fake?
> 
> No, it doesn't.
 
No ideas without the logs, sorry.

> > In the log from successful boot it seems there is no NUMA information in
> > the device tree, can you send the device tree as well please?
> 
> https://people.redhat.com/jstancek/aarch64_numa_boot/device_tree
> 
> Regards,
> Jan

-- 
Sincerely yours,
Mike.
