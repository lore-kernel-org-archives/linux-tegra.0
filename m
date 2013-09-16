From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpu: host1x: use %pa to print dma_addr_t
Date: Mon, 16 Sep 2013 08:54:08 -0700
Message-ID: <1379346848.1934.13.camel@joe-AO722>
References: <1378960909-15773-1-git-send-email-olof@lixom.net>
	 <20130916151716.GA5613@ulmo>
	 <CAOesGMjUeyKDtNU+zVpPYWyQX8ESoUhqaHXLuW5jJ=u2ggEb5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMjUeyKDtNU+zVpPYWyQX8ESoUhqaHXLuW5jJ=u2ggEb5A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-09-16 at 08:46 -0700, Olof Johansson wrote:
> On Mon, Sep 16, 2013 at 8:17 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Sep 11, 2013 at 09:41:49PM -0700, Olof Johansson wrote:
> >> This removes two warnings where dma_addr_t variables were printed using
> >> %x when built with CONFIG_ARM_LPAE=y, thus having 64-bit dma_addr_t:
> >>
> >>   drivers/gpu/host1x/hw/cdma_hw.c:57:3: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'dma_addr_t'
> >>   drivers/gpu/host1x/hw/debug_hw.c:175:10: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t'
> >
> > Hi Olof,
> >
> > I can't reproduce this. Does this perhaps depend on some other patch?
> > When I enable LPAE I do see similar warnings in drivers/iommu/tegra-*.c
> > and those can indeed be fixed using an equivalent patch.
> 
> You need to enable LPAE on a platform that also selects
> ARCH_DMA_ADDR_T_64BIT, I don't think tegra does. If you do it with
> multi_v7_defconfig you'll see them.
> 
> However, see discussion on another of the emails in the series; I'll
> have to introduce a new format specifier instead.

Or not.

I don't know whether or not the dma_addr_t really needs a
fixed 18 byte output length for 64 bit uses.

I think always using a cast for dma_addr_t addresses like:

	printk("dma_addr_t: %#llx\n", (u64)addr);

would probably work just fine.
