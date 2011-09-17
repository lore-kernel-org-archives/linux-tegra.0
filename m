From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Add SoC detection macros
Date: Sat, 17 Sep 2011 22:56:59 +0200
Message-ID: <3353131.FJY7smc8i5@wuerfel>
References: <1315555339-12685-1-git-send-email-amartin@nvidia.com> <20110917112321.GE16381@n2100.arm.linux.org.uk> <20110917181907.GA16141@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110917181907.GA16141-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Saturday 17 September 2011 20:19:07 Jean-Christophe PLAGNIOL-VILLARD wrote:
> 
> I agree about it I just mean that if you have the same board with 2 SoC which
> are pin to pin compatible detect the soc type will be usefull as the soc
> resource may not be the same

In that scenario, you would put all SOC specific data into one .dtsi
file and all board data into another .dtsi file and then create a
description for the combination using a trivial .dts file with two
include statements. This is all solved outside of the kernel already,
so there is no need for infrastructure in the kernel.

	Arnd
