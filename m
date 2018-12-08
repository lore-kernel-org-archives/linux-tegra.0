From: Alexander Van Brunt <avanbrunt@nvidia.com>
Subject: Re: [PATCH V3] arm64: Don't flush tlb while clearing the accessed bit
Date: Sat, 8 Dec 2018 00:05:44 +0000
Message-ID: <BYAPR12MB271295B398729E07F31082A7CFAA0@BYAPR12MB2712.namprd12.prod.outlook.com>
References: <1540805158-618-1-git-send-email-amhetre@nvidia.com>
 <20181029105515.GD14127@arm.com>
 <BN7PR12MB2708B742FD3448589AD0F259CFF30@BN7PR12MB2708.namprd12.prod.outlook.com>
 <BYAPR12MB27129A4EE7BBF57B1CAB5094CFAE0@BYAPR12MB2712.namprd12.prod.outlook.com>
 <20181206191850.GC20796@arm.com>
 <BYAPR12MB271239AAF4A0B79D756850C6CFA90@BYAPR12MB2712.namprd12.prod.outlook.com>
 <BYAPR12MB27120C304F7B085A0CA36124CFA90@BYAPR12MB2712.namprd12.prod.outlook.com>,<20181207175330.GC11430@edgewater-inn.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207175330.GC11430@edgewater-inn.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sachin Nikam <Snikam@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

> > > My problem with that is it's not really much different to just skippi=
ng the
> > > page table update entirely. Skipping the DSB is closer to what is don=
e on
> > > x86, where we bound the stale entry time to the next context-switch.
> > =20
> > Which of the three implementations is the "that" and "it" in the first =
sentence?
>
> that =3D it =3D skipping the whole invalidation + the DSB

The TLB is tiny compared to the size of the inactive list. Somehow a TLB ha=
s to
not be evicted during the page's life in the inactive list. That is not an =
easy
feat except for the hottest of pages.

If there is a context-switch, most of the original thread's TLBs will be
evicted because TLBs have a hard time to hold two thread's working sets. So=
, in
practice, that is almost the same as the x86 guarantee.

The worst case cannot have a large impact because the maximum number of pag=
es
that will not have the TLB evicted is the number of pages in the TLB. For
example, a 1024 entry TLB can at worst result in 4 MB of pages erroneously
reclaimed. That is not bad on a system with 4+ GB of memory.

We did benchmark the extreme case where half the pages accessed where not
evicted from the TLB. In the read case, skipping the DSB was ~10% faster th=
an
skipping the invalidate or doing the invalidate and the DSB.

Compared to the improvement in the average performance and variability in t=
he
other cases we tested, the 10% loss in a carefully crafted test is not as
important.
