From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra20: create a DT header defining CLK IDs
Date: Tue, 14 May 2013 07:59:40 +0200
Message-ID: <20130514.085940.1807211932170883314.hdoyu@nvidia.com>
References: <1368443225-16978-1-git-send-email-hdoyu@nvidia.com><1368443225-16978-2-git-send-email-hdoyu@nvidia.com><519118E3.4060907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519118E3.4060907-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Mon, 13 May 2013 18:46:27 +0200:

> I'm not sure exactly how these patches will get merged. For you
> reference, I anticipate one of two things happening:
> 
> 1)
> 
> * Patches 1, 3, 5 get put into a topic branch, and merged into both the
> clk tree and the Tegra tree.
> 
> * Patches 2, 4, 6 get merged into the Tegra tree.
> 
> * The patches you're going to create for the drivers/clk code get merged
> into Mike's clk tree
> 
> 2)
> 
> * Mike ack's the patches you're going to create for the drivers/clk code.
> 
> * Everything gets merged through the Tegra tree.
> 
> This shouldn't impact you much, but just be aware that the drivers/clk
> changes you create shouldn't depend on anything beyond patches 1, 3, 5
> here and 3.10-rc1, then I can work out the merging with Mike without any
> constraints.

Either way would work. Once Venu's USB patches are merged, mentioned
in [2/6], I'll resend the update version of this series.
drivers/clk/tegra replacement will follow, then.
