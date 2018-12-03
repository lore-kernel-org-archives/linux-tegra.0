From: Alexander Van Brunt <avanbrunt@nvidia.com>
Subject: Re: [PATCH V3] arm64: Don't flush tlb while clearing the accessed bit
Date: Mon, 3 Dec 2018 21:20:25 +0000
Message-ID: <BYAPR12MB27129A4EE7BBF57B1CAB5094CFAE0@BYAPR12MB2712.namprd12.prod.outlook.com>
References: <1540805158-618-1-git-send-email-amhetre@nvidia.com>,
 <20181029105515.GD14127@arm.com>,<BN7PR12MB2708B742FD3448589AD0F259CFF30@BN7PR12MB2708.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BN7PR12MB2708B742FD3448589AD0F259CFF30@BN7PR12MB2708.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Ashish Mhetre <amhetre@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sachin Nikam <Snikam@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

>=A0If we roll a TLB invalidation routine without the trailing DSB, what so=
rt of
>=A0performance does that get you?

It is not as good. In some cases, it is really bad. Skipping the invalidate=
 was
the most consistent and fast implementation.

Methodology:

We ran 6 tests on Jetson Xavier with three different implementations of
ptep_clear_flush_young: the existing version that does a TLB invalidate and=
 a
DSB, our proposal to skip the TLB invalidate, and Will's suggestion to just=
 skip
the DSB. The 6 tests are read and write versions of sequential access, rand=
om
access, and alternating between a fixed page and a random page. We ran each=
 of
the (6 tests) * (3 configs) 31 times and measured the execution time.

The Jetson Xavier platform has 8 Carmel CPUs, 16 GB of DRAM, and an NVMe ha=
rd
drive. Carmel CPUs have a unique feature where they batch up TLB invalidate=
s
until either the very large buffer overflows or it executes a DSB.

Below we report statistically significant (p < .01) differences in the mean
execution time or the variation in execution time. There are 36 comparisons
tested. Because of that, there is a 50% chance that at least one of the 36
comparisons would have a p <=3D 1 / 36. p =3D .01 should make false positiv=
es
unlikely.

Sequential Reads:

Executing a TLB invalidate but skipping the DSB had 3.5x more variation tha=
n an
invalidate and a DSB and it had 12.3x more run-to-run variation than skippi=
ng
the TLB invalidate and the DSB. The run-to-run variation when skipping the =
DSB
was 38% of the execution time. This is likely because Carmel's feature of
batching up TLB invalidates until it executes a DSB and the need to wait fo=
r
the other 7 cores to compete the invalidate.

Skipping the TLB invalidate was 8% faster than executing an invalidate and =
a
DSB. It also had 3.5x less run-to-run variation. Because the run-to-run
variation with the implementation that executed a TLB invalidate but not a =
DSB
was so much higher, its execution time could not be estimated with enough
precision to say that it is statistically different from the other two
implementations.

Random Reads:

Executing a TLB invalidate but not a DSB was the faster and had less run-to=
-run
variation than either of the other implementations. It is 8% faster and has=
 ~3x
lower run-to-run variation than either alternative. The run-to-run variatio=
n
when skipping the DSB was 1.5% of the overall execution time.

Skipping the TLB invalidate was not statistically different from the existi=
ng
implementation that does a TLB invalidate and a DSB.

Alternating Random and Hot Page Reads:

In this test, executing a TLB invalidate but not a DSB was the fastest. It =
was
12% faster than an invalidate and a DSB. It was 9% faster than executing no
invalidate. Similarly, skipping the invalidate was 4% faster than executing=
 an
invalidate and a DSB (9% + 4% !=3D 12% because of rounding).

The run-to-run variation was the lowest when executing an invalidate and a =
DSB.
Its variation was 1% of the time.  That is 64% of variation when skipping t=
he
DSB and 22% of executing no TLB invalidate (5% of the execution time).

This test was meant to test the effects of a TLB not being updated with the
newly young PTE in memory. By never executing a TLB invalidate, then the ke=
rnel
almost never gets a chance to take a page fault because the access flag is
clear. By executing an invalidate but not executing a DSB probably results =
in
the TLB usually updated with the PTE value before the page falls off the LR=
U
list. So, it makes sense that skipping the DSB is the fastest. The cases wh=
ere
the hot page erroneously evicted are likely the reason why the variation
increases with looser TLB invalidate implementations.

Sequential Writes:

There were no statistically significant results in this test. That is likel=
y
because IO was limiting the write speed. Also, the write tests had much mor=
e run
-to-run variation (about 10% of the execution time) than the read tests.

For openness, the existing implementation that executes an invalidate and D=
SB
was faster by 8% but didn't quite meet the requirements to be statistically
significant. Its p-value was .014. Since it less than 1 / 36 =3D .028, it i=
s
unlikely to be coincidental. But, every other result reported has a p < .00=
4.

Random Writes:

Skipping the invalidate was the fastest. It was 51% faster than executing a=
n
invalidate and a DSB. It was 38% faster than executing an invalidate but no=
t a
DSB. The run-to-run variations were not statistically different.

Alternating Random and Hot Page Writes:

Similar to random writes, skipping the invalidate was the fastest. It was 4=
6%
faster than executing an invalidate and a DSB and 45% faster than executing=
 an
invalidate without a DSB. The run-to-run variations were not statistically
different.

Conclusion:

There were no statistically significant results where executing a TLB inval=
idate
and a DSB was fastest. Except for the sequential write case where there wer=
e no
significant results, it was slower by 8-50% than the alternatives.

Executing a TLB invalidate but not a DSB was faster than not executing a TL=
B
invalidate in the two random read cases by about 8%. However, skipping the
invalidate was faster in the random write tests by about 40%.

The existing implementation that executes an invalidate and a DSB had 3-4x =
less
run-to-run variation than the alternatives in the one hot page read test. T=
hat
is the strongest reason to continue fully invalidating TLBs. However, at wo=
rst
it had a 5% execution time. I think that going from 1% to 5% on this test i=
s
more than made up for by reducing the variation in the sequential read test=
 from
12% to 4% by skipping the invalidates altogether.

Because these are microbenchmarks that represent small parts of real
applications, I think that we should use the worst case run-to-run variatio=
n to
choose the implementation that has the least variation. Using that metric,
skipping the invalidate has a worst case of 5% (random read), skipping just=
 the
DSB has a worst case of 38% (sequential read), and executing an invalidate =
and a
DSB has a worst case of 12% (sequential read).
