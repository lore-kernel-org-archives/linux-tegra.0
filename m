From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Linaro-mm-sig] [RFC 0/2] DMA-mapping & IOMMU - physically
 contiguous allocations
Date: Tue, 16 Oct 2012 11:04:29 +0100
Message-ID: <CAHkRjk52DH9_QPQwGF0HUcjsH3+WTRCF41uDKJW7LyxD65pJdw@mail.gmail.com>
References: <1350309832-18461-1-git-send-email-m.szyprowski@samsung.com>
 <CAAQKjZMYFNMEnb2ue2aR+6AEbOixnQFyggbXrThBCW5VOznePg@mail.gmail.com>
 <20121016090434.7d5e088152a3e0b0606903c8@nvidia.com> <20121016085928.GV21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121016085928.GV21164-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 16 October 2012 09:59, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Tue, Oct 16, 2012 at 09:04:34AM +0300, Hiroshi Doyu wrote:
>> In addition to those contiguous/discontiguous page allocation, is
>> there any way to _import_ anonymous pages allocated by a process to be
>> used in dma-mapping API later?
>>
>> I'm considering the following scenario, an user process allocates a
>> buffer by malloc() in advance, and then it asks some driver to convert
>> that buffer into IOMMU'able/DMA'able ones later. In this case, pages
>> are discouguous and even they may not be yet allocated at
>> malloc()/mmap().
>
> That situation is covered.  It's the streaming API you're wanting for that.
> dma_map_sg() - but you may need additional cache handling via
> flush_dcache_page() to ensure that your code is safe for all CPU cache
> architectures.

For user-allocated pages you first need get_user_pages() to make sure
they are in memory (and will stay there). This function also calls
flush_dcache_page(). Then you can build the sg list for dma_map_sg().

-- 
Catalin
