From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv5 1/3] ARM: tegra: Add Tegra AHB driver
Date: Mon, 7 May 2012 10:24:48 +0000
Message-ID: <201205071024.48958.arnd@arndb.de>
References: <20120507074228.GK26481@n2100.arm.linux.org.uk> <201205070859.29174.arnd@arndb.de> <20120507.122333.2024326166703361049.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120507.122333.2024326166703361049.hdoyu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "balbi@ti.com" <balbi@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "ccross@android.com" <ccross@android.com>, "olof@lixom.net" <olof@lixom.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "ohad@wizery.com" <ohad@wizery.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linville@tuxdriver.com" <linville@tuxdriver.com>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.ke>
List-Id: linux-tegra@vger.kernel.org

On Monday 07 May 2012, Hiroshi Doyu wrote:
> Tegra doesn't enable ARM_AMBA and Tegra doesn't use the following
> "drivers/amba/bus.c" right now. I needed to make this directory
> available to ones without ARM_AMBA enabled.

Ah, right. I looked at arch/arm/Kconfig earlier to see if
tegra enabled ARM_AMBA but was accidentally looking
at ARCH_INtegraTOR when grepping for TEGRA ;-)

Your proposed solution sounds good then.

	Arnd
