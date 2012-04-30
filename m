From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/4] ARM: tegra: Add AHB driver
Date: Mon, 30 Apr 2012 14:47:36 +0000
Message-ID: <201204301447.36246.arnd@arndb.de>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com> <20120426215903.GH24211@n2100.arm.linux.org.uk> <20120427084015.cb7c8e00c7d9a4cd01faa5ae@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120427084015.cb7c8e00c7d9a4cd01faa5ae-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 27 April 2012, Hiroshi Doyu wrote:
> What about having this driver under "drivers/amba"?
> 
> If other similiar drivers are coming up, it's easy to find rather than
> having this arch/arm/mach-*. There may be some possibility of
> generalization later, then. Also it meets the requirement of no
> "struct xxxx_driver" under arch/arm. Arnd?

I'm fine with either drivers/amba (arguing that it's for a specific
amba bus even if it's highly platform specific) or arch/arm/mach-tegra
(arguing that it's platform code and not actually a device driver even
if it appears like one). If Russell doesn't mind having it in
drivers/amba, I'd say we should go for that.

	Arnd
