Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6486198A35
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730219058; cv=none; b=Yq0FkHsE8McxXdxO1MQwXYqr8J/1h863xulbU3BqOZkeBulQWgp2UWvEgMiSHwUxAoKhNY24SsLEhxHiIt3+LjtyGE2oL11V9g81qE4M7vKLyFKnQ4xG7ay8mmDy44TrhXBBfc7sYUffpR/J5/X3i4tXkZ3kUeGr1UK6nzLOe8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730219058; c=relaxed/simple;
	bh=NOaPvxkToVhU79onE/sW9k0JS2iIC2jJuOMIw51wRx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOPSXww76JLsFD45a9iE0LNIweHx5a6wsVkqNboV7yHhBOb/3kpeTb0yoIVKzzHQEt0RswRU/+Aq/TBjo7SdfIQptzcw8zyMNSq9l2Y3gUZ68iHSI/sMdrdoO2n/X4OboamXMn1ojDwWnGT4lPINsQGhetSj55j0VaKOttMHag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9/1Oxfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9/1Oxfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB128C4CECD;
	Tue, 29 Oct 2024 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730219058;
	bh=NOaPvxkToVhU79onE/sW9k0JS2iIC2jJuOMIw51wRx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9/1Oxfn14anXZ89hpcXZKgHXYYEUz+zOs6G3JukRct4h9UUAAeHvuqCn2wcU6xQO
	 /p9IMc4V4mxQFujNSk6RKXn81xudvQDuyQn6u8V2TY/G4ecSFJUACMAUqrPotEmLGi
	 vhHrURVNY6XRelm/0OaJMAuC5TdJgeZiiMBNWdM6TKEezYODxnh0c4k0n4jvJOyred
	 /YK6+zhm8BjAYC8ZkZqWcG2p2p5nWHt18sxfI0330+OuAIiNPAbRQ5MU+adiQ0wnY0
	 935VVRbOXo6IbMnVXXmjJTe8AS7StekkfYConmC3zBoEDTXa9IXaGaoNIGjUxAZHTB
	 vAn0KPxx9ElRA==
Date: Tue, 29 Oct 2024 18:20:22 +0200
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
Message-ID: <ZyELRjoDLmHeVvSR@kernel.org>
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
 <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>

On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> On Tue, Oct 29, 2024 at 4:07 PM Zi Yan <ziy@nvidia.com> wrote:
> >
> > +tegra mailing list and maintainers
> >
> > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> >
> > > Hi,
> > >
> > > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> > >
> > > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
> > > It hangs very early, with 4k or 64k pages, with no kernel messages printed:
> > >
> > > EFI stub: Booting Linux Kernel...
> > > EFI stub: Using DTB from configuration table
> > > EFI stub: Exiting boot services...
> > > <hangs here>
> > >
> >
> > Is it possible to have earlycon output? It is hard to debug without any
> > information except kernel fails to boot.
> 
> I know it was a long shot, so far I haven't had luck getting it to work.

Does it boot with numa=off and numa=fake?

In the log from successful boot it seems there is no NUMA information in
the device tree, can you send the device tree as well please?

> > Since the previous commit boots and I assume both kernels are compiled
> > with the same gcc toolchain, this should not be caused by the binuils
> > bug in 2.42[1]. Is your binutils version 2.42?
> 
> Yes, both are compiled locally, with binutils 2.41
> 
> >
> > Thanks.
> >
> >
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=31924
> >
> > > Here's a log from successful boot with previous commit:
> > > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.txt
> > > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config
> > >
> > > # lscpu
> > > Architecture:             aarch64
> > >   CPU op-mode(s):         32-bit, 64-bit
> > >   Byte Order:             Little Endian
> > > CPU(s):                   12
> > >   On-line CPU(s) list:    0-11
> > > Vendor ID:                ARM
> > >   BIOS Vendor ID:         NVIDIA
> > >   Model name:             Cortex-A78AE
> > >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> > >     BIOS CPU family:      257
> > >     Model:                1
> > >     Thread(s) per core:   1
> > >     Core(s) per cluster:  12
> > >     Socket(s):            1
> > >     Cluster(s):           1
> > >     Stepping:             r0p1
> > >     CPU(s) scaling MHz:   100%
> > >     CPU max MHz:          1971.2000
> > >     CPU min MHz:          115.2000
> > >     BogoMIPS:             62.50
> > >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
> > > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
> > > flagm paca pacg
> > > Caches (sum of all):
> > >   L1d:                    768 KiB (12 instances)
> > >   L1i:                    768 KiB (12 instances)
> > >   L2:                     3 MiB (12 instances)
> > >   L3:                     6 MiB (3 instances)
> > > NUMA:
> > >   NUMA node(s):           1
> > >   NUMA node0 CPU(s):      0-11
> > > Vulnerabilities:
> > >   Gather data sampling:   Not affected
> > >   Itlb multihit:          Not affected
> > >   L1tf:                   Not affected
> > >   Mds:                    Not affected
> > >   Meltdown:               Not affected
> > >   Mmio stale data:        Not affected
> > >   Reg file data sampling: Not affected
> > >   Retbleed:               Not affected
> > >   Spec rstack overflow:   Not affected
> > >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > > disabled via prctl
> > >   Spectre v1:             Mitigation; __user pointer sanitization
> > >   Spectre v2:             Mitigation; CSV2, BHB
> > >   Srbds:                  Not affected
> > >   Tsx async abort:        Not affected
> > >
> > > Regards,
> > > Jan
> >
> >
> > Best Regards,
> > Yan, Zi
> >
> 

-- 
Sincerely yours,
Mike.
