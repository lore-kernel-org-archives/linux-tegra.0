From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Tue, 28 Jan 2020 18:59:48 +0300
Message-ID: <d66bb20e-c0e7-caef-cbbc-aa216c2be7d6@gmail.com>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
 <20200128004301.GD20624@richard>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200128004301.GD20624@richard>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yang <richardw.yang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, aneesh.kumar-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org, yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

28.01.2020 03:43, Wei Yang пишет:
> On Sun, Jan 26, 2020 at 05:47:57PM +0300, Dmitry Osipenko wrote:
>> 18.01.2020 02:22, Wei Yang пишет:
>>> Use the general helper instead of do it by hand.
>>>
>>> Signed-off-by: Wei Yang <richardw.yang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>> ---
>>>  mm/mremap.c | 7 ++-----
>>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>> index c2af8ba4ba43..a258914f3ee1 100644
>>> --- a/mm/mremap.c
>>> +++ b/mm/mremap.c
>>> @@ -253,11 +253,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>>>  
>>>  	for (; old_addr < old_end; old_addr += extent, new_addr += extent) {
>>>  		cond_resched();
>>> -		next = (old_addr + PMD_SIZE) & PMD_MASK;
>>> -		/* even if next overflowed, extent below will be ok */
>>> +		next = pmd_addr_end(old_addr, old_end);
>>>  		extent = next - old_addr;
>>> -		if (extent > old_end - old_addr)
>>> -			extent = old_end - old_addr;
>>>  		old_pmd = get_old_pmd(vma->vm_mm, old_addr);
>>>  		if (!old_pmd)
>>>  			continue;
>>> @@ -301,7 +298,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>>>  
>>>  		if (pte_alloc(new_vma->vm_mm, new_pmd))
>>>  			break;
>>> -		next = (new_addr + PMD_SIZE) & PMD_MASK;
>>> +		next = pmd_addr_end(new_addr, new_addr + len);
>>>  		if (extent > next - new_addr)
>>>  			extent = next - new_addr;
>>>  		move_ptes(vma, old_pmd, old_addr, old_addr + extent, new_vma,
>>>
>>
>> Hello Wei,
>>
>> Starting with next-20200122, I'm seeing the following in KMSG on NVIDIA
>> Tegra (ARM32):
>>
>>  BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:190
>>
> 
> Thanks.
> 
> Would you mind letting me know which case you are testing?

Nothing special, systemd starts to fall apart during boot.

> Or the special thing is 32-bit platform?
I have a limited knowledge about mm/, so can't provide detailed explanation.

Please take a look at this:

[1]
https://elixir.bootlin.com/linux/v5.5/source/arch/arm/include/asm/pgtable-2level.h#L210

[2]
https://elixir.bootlin.com/linux/v5.5/source/include/asm-generic/pgtable.h#L549

[3]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0ba10b512eb2e2a3888b6e6cc0e089f5e7a191b
