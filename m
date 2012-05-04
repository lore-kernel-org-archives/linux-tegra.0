From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] ARM: tegra: Add Tegra Memory Controller(MC) driver
Date: Fri, 4 May 2012 08:41:38 +0000
Message-ID: <201205040841.39351.arnd@arndb.de>
References: <1336063897-12083-1-git-send-email-hdoyu@nvidia.com> <CAOesGMivxdDhkEoZh=LuvtKRPfgXi=8X4chEL-cJazjgeo_ONA@mail.gmail.com> <20120504083424.0f394a6db8e95763e59ae2a0@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120504083424.0f394a6db8e95763e59ae2a0@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Colin Cross <ccross@android.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 04 May 2012, Hiroshi Doyu wrote:
> > Since tegra has a custom memory controller it's not as obvious that it
> > needs to go in a shared location, indeed. But it's easier to use the
> > same practices across platforms, and if there are other vendors that
> > end up sharing IP blocks for memory down the road, having them in a
> > common location makes sense.
> 
> I think that the above TI's patch is:
> 
>   Add TI EMIF SDRAM controller driver
>     http://lwn.net/Articles/494922/
> 
> I'm moving this Tegra MC driver under drivers/memory, "tegra{20,30}-mc.c".

Ok, very good!

	Arnd
