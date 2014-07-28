From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/5] ARM: imx: Remove references to platform_bus in mxc
 code
Date: Mon, 28 Jul 2014 09:45:40 +0800
Message-ID: <20140728014538.GH8821@dragon>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <Catalin.Marinas@arm.com>, paul@pwsan.com, Arnd Bergmann <arnd@arndb.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 25, 2014 at 03:23:49PM +0100, Pawel Moll wrote:
> The bus devices created to be parents for other peripherals
> were using platform_bus as a parent, not being platform
> devices themselves. Remove the references, making them
> virtual devices instead.
> 
> Cc: Shawn Guo <shawn.guo@freescale.com>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Pawel Moll <pawel.moll@arm.com>

Acked-by: Shawn Guo <shawn.guo@freescale.com>
