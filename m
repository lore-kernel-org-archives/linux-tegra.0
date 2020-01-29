From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Wed, 29 Jan 2020 23:24:41 +0000
Message-ID: <20200129232441.GI25745@shell.armlinux.org.uk>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
 <20200129094738.GE25745@shell.armlinux.org.uk>
 <20200129215745.GA20736@richard>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200129215745.GA20736@richard>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, akpm@linux-foundation.org, dan.j.williams@intel.com, aneesh.kumar@linux.ibm.com, kirill@shutemov.name, yang.shi@linux.alibaba.com, thellstrom@vmware.com, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 30, 2020 at 05:57:45AM +0800, Wei Yang wrote:
> On Wed, Jan 29, 2020 at 09:47:38AM +0000, Russell King - ARM Linux admin wrote:
> >On Sun, Jan 26, 2020 at 05:47:57PM +0300, Dmitry Osipenko wrote:
> >> 18.01.2020 02:22, Wei Yang пишет:
> >> > Use the general helper instead of do it by hand.
> >> > 
> >> > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >> > ---
> >> >  mm/mremap.c | 7 ++-----
> >> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >> > 
> >> > diff --git a/mm/mremap.c b/mm/mremap.c
> >> > index c2af8ba4ba43..a258914f3ee1 100644
> >> > --- a/mm/mremap.c
> >> > +++ b/mm/mremap.c
> >> > @@ -253,11 +253,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> >> >  
> >> >  	for (; old_addr < old_end; old_addr += extent, new_addr += extent) {
> >> >  		cond_resched();
> >> > -		next = (old_addr + PMD_SIZE) & PMD_MASK;
> >> > -		/* even if next overflowed, extent below will be ok */
> >> > +		next = pmd_addr_end(old_addr, old_end);
> >> >  		extent = next - old_addr;
> >> > -		if (extent > old_end - old_addr)
> >> > -			extent = old_end - old_addr;
> >> >  		old_pmd = get_old_pmd(vma->vm_mm, old_addr);
> >> >  		if (!old_pmd)
> >> >  			continue;
> >> > @@ -301,7 +298,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> >> >  
> >> >  		if (pte_alloc(new_vma->vm_mm, new_pmd))
> >> >  			break;
> >> > -		next = (new_addr + PMD_SIZE) & PMD_MASK;
> >> > +		next = pmd_addr_end(new_addr, new_addr + len);
> >> >  		if (extent > next - new_addr)
> >> >  			extent = next - new_addr;
> >> >  		move_ptes(vma, old_pmd, old_addr, old_addr + extent, new_vma,
> >> > 
> >> 
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
> >The above is definitely wrong - pXX_addr_end() are designed to be used
> >with an address index within the pXX table table and the address index
> >of either the last entry in the same pXX table or the beginning of the
> >_next_ pXX table.  Arbitary end address indicies are not allowed.
> >
> 
> #define pmd_addr_end(addr, end)						\
> ({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
> 	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> })
> 
> If my understanding is correct, the definition here align the addr to next PMD
> boundary or end.
> 
> I don't see the possibility to across another PMD. Do I miss something?

Look at the definition of p*_addr_end() that are used when page tables
are rolled up.

> >When page tables are "rolled up" when levels don't exist, it is common
> >practice for these macros to just return their end address index.
> >Hence, if they are used with arbitary end address indicies, then the
> >iteration will fail.
> >
> >The only way to do this is:
> >
> >	next = pmd_addr_end(old_addr,
> >			pud_addr_end(old_addr,
> >				p4d_addr_end(old_addr,
> >					pgd_addr_end(old_addr, old_end))));
> >
> >which gives pmd_addr_end() (and each of the intermediate pXX_addr_end())
> >the correct end argument.  However, that's a more complex and verbose,
> >and likely less efficient than the current code.
> >
> >I'd suggest that there's nothing to "fix" in the v5.5 code wrt this,
> >and trying to "clean it up" will just result in less efficient or
> >broken code.
> >
> >-- 
> >RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> >FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> >According to speedtest.net: 11.9Mbps down 500kbps up
> 
> -- 
> Wei Yang
> Help you, Help me
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
