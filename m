From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/22] Unified SMMU driver among Tegra SoCs
Date: Mon, 8 Jul 2013 19:11:48 +0200
Message-ID: <20130708.201148.1964850060334610089.hdoyu@nvidia.com>
References: <1373021097-32420-1-git-send-email-hdoyu@nvidia.com><20130708.114736.1280783845180530098.hdoyu@nvidia.com><51DADF91.30009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51DADF91.30009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Mon, 8 Jul 2013 17:49:37 +0200:

> > For tegra device driver maintainers, please try this series to make
> > your device work with IOMMU enabled. I guess that some of drivers may
> > need to set its swgroup ID correctly in DT, and also you may need to
> > check the usage of DMA mapping API correctly. For your convenience,
> > you can get this series by git fetch:
> 
> So are you saying this series will break some device drivers unless some
> driver changes and/or DT additions are made? If so, those changes should
> be (an early) part of this series; we can't break functionality.

Agree. Do we have any list of tests to run, especially for device drivers?
