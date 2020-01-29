From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Wed, 29 Jan 2020 15:59:07 -0800
Message-ID: <20200129155907.75868e8a36c5fffc3ec354b9@linux-foundation.org>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
        <20200117232254.2792-4-richardw.yang@linux.intel.com>
        <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
        <20200126185951.c9246349befcccce210a4ab8@linux-foundation.org>
        <b5eb4766-38ba-0153-2844-cc303fe0dc07@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b5eb4766-38ba-0153-2844-cc303fe0dc07@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dan.j.williams@intel.com, aneesh.kumar@linux.ibm.com, kirill@shutemov.name, yang.shi@linux.alibaba.com, thellstrom@vmware.com, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-tegra@vger.kernel.org

On Wed, 29 Jan 2020 20:18:56 +0300 Dmitry Osipenko <digetx@gmail.com> wrote:

> 27.01.2020 05:59, Andrew Morton пишет:
> > On Sun, 26 Jan 2020 17:47:57 +0300 Dmitry Osipenko <digetx@gmail.com> wrote:
> ...
> >> Hello Wei,
> >>
> >> Starting with next-20200122, I'm seeing the following in KMSG on NVIDIA
> >> Tegra (ARM32):
> >>
> >>   BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:190
> >>
> >> and eventually kernel hangs.
> >>
> >> Git's bisection points to this patch and reverting it helps. Please fix,
> >> thanks in advance.
> > 
> > Thanks.  I had these tagged for 5.7-rc1 anyway, so I'll drop all five
> > patches.
> > 
> 
> Hello Andrew,
> 
> FYI, I'm still seeing the offending patches in the today's next-20200129.

hm, me too.  Stephen, it's unexpected that 9ff4452912d63f ("mm/mremap:
use pmd_addr_end to calculate next in move_page_tables()") is still in
the -next lineup?  It was dropped from -mm on Jan 26?
