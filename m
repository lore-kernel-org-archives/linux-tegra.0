From: Ashish Mhetre <amhetre@nvidia.com>
Subject: Re: [PATCH] mm: Expose lazy vfree pages to control via sysctl
Date: Mon, 21 Jan 2019 13:36:00 +0530
Message-ID: <27bd8776-87fa-69ad-7b6e-4425251b5e9c@nvidia.com>
References: <1546616141-486-1-git-send-email-amhetre@nvidia.com>
 <20190104180332.GV6310@bombadil.infradead.org>
 <a7bb656a-c815-09a4-69fc-bb9e7427cfa6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7bb656a-c815-09a4-69fc-bb9e7427cfa6@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: vdumpa@nvidia.com, mcgrof@kernel.org, keescook@chromium.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Snikam@nvidia.com, avanbrunt@nvidia.com
List-Id: linux-tegra@vger.kernel.org

The issue is not seen on new kernel. This patch won't be needed. Thanks.

On 06/01/19 2:12 PM, Ashish Mhetre wrote:
> Matthew, this issue was last reported in September 2018 on K4.9.
> I verified that the optimization patches mentioned by you were not=20
> present in our downstream kernel when we faced the issue. I will check=20
> whether issue still persist on new kernel with all these patches and=20
> come back.
>=20
> On 04/01/19 11:33 PM, Matthew Wilcox wrote:
>> On Fri, Jan 04, 2019 at 09:05:41PM +0530, Ashish Mhetre wrote:
>>> From: Hiroshi Doyu <hdoyu@nvidia.com>
>>>
>>> The purpose of lazy_max_pages is to gather virtual address space till i=
t
>>> reaches the lazy_max_pages limit and then purge with a TLB flush and=20
>>> hence
>>> reduce the number of global TLB flushes.
>>> The default value of lazy_max_pages with one CPU is 32MB and with 4=20
>>> CPUs it
>>> is 96MB i.e. for 4 cores, 96MB of vmalloc space will be gathered=20
>>> before it
>>> is purged with a TLB flush.
>>> This feature has shown random latency issues. For example, we have seen
>>> that the kernel thread for some camera application spent 30ms in
>>> __purge_vmap_area_lazy() with 4 CPUs.
>>
>> You're not the first to report something like this.=C2=A0 Looking throug=
h the
>> kernel logs, I see:
>>
>> commit 763b218ddfaf56761c19923beb7e16656f66ec62
>> Author: Joel Fernandes <joelaf@google.com>
>> Date:=C2=A0=C2=A0 Mon Dec 12 16:44:26 2016 -0800
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 mm: add preempt points into __purge_vmap_area_l=
azy()
>>
>> commit f9e09977671b618aeb25ddc0d4c9a84d5b5cde9d
>> Author: Christoph Hellwig <hch@lst.de>
>> Date:=C2=A0=C2=A0 Mon Dec 12 16:44:23 2016 -0800
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 mm: turn vmap_purge_lock into a mutex
>>
>> commit 80c4bd7a5e4368b680e0aeb57050a1b06eb573d8
>> Author: Chris Wilson <chris@chris-wilson.co.uk>
>> Date:=C2=A0=C2=A0 Fri May 20 16:57:38 2016 -0700
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 mm/vmalloc: keep a separate lazy-free list
>>
>> So the first thing I want to do is to confirm that you see this problem
>> on a modern kernel.=C2=A0 We've had trouble with NVidia before reporting
>> historical problems as if they were new.
>>
