From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv5 1/3] ARM: tegra: Add Tegra AHB driver
Date: Mon, 7 May 2012 08:04:28 +0000
Message-ID: <201205070804.29154.arnd@arndb.de>
References: <1336373032-16881-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1336373032-16881-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>
Cc: swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ohad Ben-Cohen <ohad@wizery.com>, Linus Walleij <linus.walleij@linaro.org>, "John W. Linville" <linville@tuxdriver.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday 07 May 2012, Hiroshi DOYU wrote:
> Tegra AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> High-performance Bus (AHB) architecture.
> 
> The AHB Arbiter controls AHB bus master arbitration. This effectively
> forms a second level of arbitration for access to the memory
> controller through the AHB Slave Memory device. The AHB pre-fetch
> logic can be configured to enhance performance for devices doing
> sequential access. Each AHB master is assigned to either the high or
> low priority bin. Both Tegra20/30 have this AHB bus.
> 
> Some of configuration params could be passed from DT too if needed.
> 
> Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

for the driver, but please fix the issue pointed out by Russell.

	Arnd

