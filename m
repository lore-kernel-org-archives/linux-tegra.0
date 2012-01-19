From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap allocator with IOMMU
 API
Date: Thu, 19 Jan 2012 08:47:57 +0100
Message-ID: <20120119.094757.1744048052874233580.hdoyu@nvidia.com>
References: <20120118.094004.1564213980840408030.hdoyu@nvidia.com><CALJcvx58x60HvHMCLkR48rHuZWTYL-aYc43hmW7Kk8=qYC1Jgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALJcvx58x60HvHMCLkR48rHuZWTYL-aYc43hmW7Kk8=qYC1Jgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "jesse.barker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <jesse.barker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sumit.semwal-l0cyMroinI0@public.gmane.org" <sumit.semwal-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rebecca,

From: Rebecca Schultz Zavin <rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap allocator with IOMMU API
Date: Wed, 18 Jan 2012 22:58:47 +0100
Message-ID: 
 <CALJcvx58x60HvHMCLkR48rHuZWTYL-aYc43hmW7Kk8=qYC1Jgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

> Hi,
> 
> I'm just ramping back up after being on maternity leave so I'm
> pretty buried under on the lists.  Please do continue to CC me
> directly on ION related work.

Congrats! and I'll put you on Cc:.

>> On Tue, Jan 17, 2012 at 11:40 PM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org<mailto:hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>> wrote:
>> Hi,
>> 
>> Recently we've implemented IOMMU heap as an attachment which is one of
>> the ION memory manager(*1) heap/backend. This implementation is
>> completely independent of any SoC, and this can be used for other SoC
>> as well. If our implementation is not totally wrong, it would be nice
>> to share some experience/code here since Ion is still not so clear to
>> me yet.
> 
> I will take a look at your review this code as soon as I can.  The
> intention is to take contributions like these so keep them coming.

Thanks.

>> I found that Linaro also seems to have started some ION work(*2). I
>> think that some of Ion feature could be supported/replaced with Linaro
>> UMM. For example, presently "ion_iommu_heap" is implemented with the
>> standard IOMMU API, but it could be also implemented with the coming
>> DMA API? Also DMABUF can be used in Ion core part as well, I guess.
> 
> It is my intention to leverage the DMABUF api as much as I can.
> I'll be going back over the work on the DMA api over the next few
> weeks and thinking about how to integrate the two solutions.

Good.

>> Currently there's no Ion memmgr code in the upstream
>> "drivers/staging/android"(*3). Is there any plan to support this? Or
>> is this something considered as a completely _temporary_ solution, and
>> never going to be added?
> 
> I expect this is an oversight that occurred when the android drivers
> were added back to staging.  It's not intended to be a temporary
> solution.  That being said, I'm not sure I want to push for it in
> staging.  I'd rather give it a little more time to bake and then at
> some post it as a patch set.
> 
> 
>> It would be nice if we can share some of our effort here since not
>> small Android users need Ion, even temporary.
> 
> Agreed!  Keep sending things my way and I'll get feedback to you as
> quickly as I can.

The following patch may be helpful for this review. This Ion IOMMU
heap patch depends on the following iommu_ops, "GART" and "SMMU"
patches, which is the IOMMU API backend for Tegra20/30.

https://lkml.org/lkml/2012/1/5/25

So currently as long as the standard IOMMU API is usable in any SoC,
this Ion IOMMU heap could work. I think that DMA API could replace
this eventually.

> 
> 
> Any comment would be really appreciated.
> 
>  Hiroshi DOYU
> 
> *1: https://android.googlesource.com/kernel/common.git
> $ git clone https://android.googlesource.com/kernel/common.git
> $ cd common
> $ git checkout -b android origin/android-3.0
> $ git grep -e "<linux/ion.h>" drivers/
> 
> drivers/gpu/ion/ion.c:#include <linux/ion.h>
> drivers/gpu/ion/ion_carveout_heap.c:#include <linux/ion.h>
> drivers/gpu/ion/ion_heap.c:#include <linux/ion.h>
> drivers/gpu/ion/ion_priv.h:#include <linux/ion.h>
> drivers/gpu/ion/ion_system_heap.c:#include <linux/ion.h>
> drivers/gpu/ion/ion_system_mapper.c:#include <linux/ion.h>
> drivers/gpu/ion/tegra/tegra_ion.c:#include <linux/ion.h>
> 
> *2: https://blueprints.launchpad.net/linaro-mm-sig/+spec/linaro-mmwg-cma-ion
> *3: http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=tree;f=drivers/staging/android;h=4a70996505b423f12e2ea61d0aad3d9b0cc7a5c0;hb=HEAD
> 
