From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] gpu: host1x: use %pa to print dma_addr_t
Date: Mon, 16 Sep 2013 17:18:54 -0700
Message-ID: <52379FEE.2080004@infradead.org>
References: <1378960909-15773-1-git-send-email-olof@lixom.net> <20130916151716.GA5613@ulmo> <CAOesGMjUeyKDtNU+zVpPYWyQX8ESoUhqaHXLuW5jJ=u2ggEb5A@mail.gmail.com> <1379346848.1934.13.camel@joe-AO722> <CAOesGMjK47GfxQ6-xxZ36aU7k6i3s5uecNpVFsdEbfULnLxWOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMjK47GfxQ6-xxZ36aU7k6i3s5uecNpVFsdEbfULnLxWOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Joe Perches <joe@perches.com>, Thierry Reding <thierry.reding@gmail.com>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 09/16/13 17:06, Olof Johansson wrote:
> On Mon, Sep 16, 2013 at 8:54 AM, Joe Perches <joe@perches.com> wrote:
>> On Mon, 2013-09-16 at 08:46 -0700, Olof Johansson wrote:
>>> On Mon, Sep 16, 2013 at 8:17 AM, Thierry Reding
>>> <thierry.reding@gmail.com> wrote:
>>>> On Wed, Sep 11, 2013 at 09:41:49PM -0700, Olof Johansson wrote:
>>>>> This removes two warnings where dma_addr_t variables were printed using
>>>>> %x when built with CONFIG_ARM_LPAE=y, thus having 64-bit dma_addr_t:
>>>>>
>>>>>   drivers/gpu/host1x/hw/cdma_hw.c:57:3: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'dma_addr_t'
>>>>>   drivers/gpu/host1x/hw/debug_hw.c:175:10: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t'
>>>>
>>>> Hi Olof,
>>>>
>>>> I can't reproduce this. Does this perhaps depend on some other patch?
>>>> When I enable LPAE I do see similar warnings in drivers/iommu/tegra-*.c
>>>> and those can indeed be fixed using an equivalent patch.
>>>
>>> You need to enable LPAE on a platform that also selects
>>> ARCH_DMA_ADDR_T_64BIT, I don't think tegra does. If you do it with
>>> multi_v7_defconfig you'll see them.
>>>
>>> However, see discussion on another of the emails in the series; I'll
>>> have to introduce a new format specifier instead.
>>
>> Or not.
>>
>> I don't know whether or not the dma_addr_t really needs a
>> fixed 18 byte output length for 64 bit uses.
>>
>> I think always using a cast for dma_addr_t addresses like:
>>
>>         printk("dma_addr_t: %#llx\n", (u64)addr);
>>
>> would probably work just fine.
> 
> Sigh. Any color would do. I just want to get rid of the mostly-bogus
> warnings that makes it harder to spot real problems, I really don't
> care how they're resolved.
> 
> None of the affected platforms today use 64-bit DMA anyway, so casting
> down to u32 is equally acceptable. I'll repost with that instead.

Casting to u64 and using %llx is preferred for this throughout the kernel,
not u32.

That way you would never have to 'fix' those when those platforms use
64-bit DMA (this is where you say that they never will :).



-- 
~Randy
