From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add AHB driver
Date: Wed, 25 Apr 2012 12:15:22 +0000
Message-ID: <201204251215.22889.arnd@arndb.de>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com>
 <20120425083747.466f5c98330af8964d980b8c@nvidia.com>
 <20120425074639.GB3423@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120425074639.GB3423@arwen.pp.htv.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 25 April 2012, Felipe Balbi wrote:
>   On Wed, Apr 25, 2012 at 08:37:47AM +0300, Hiroshi Doyu wrote:
> > On Tue, 24 Apr 2012 21:56:45 +0200
> > Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> > 
> > > On Tue, Apr 24, 2012 at 03:05:14PM +0300, Hiroshi DOYU wrote:
> > > > The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> > > > High-performance Bus (AHB) architecture.
> > > > 
> > > > The AHB Arbiter controls AHB bus master arbitration. This effectively
> > > > forms a second level of arbitration for access to the memory
> > > > controller through the AHB Slave Memory device. The AHB pre-fetch
> > > > logic can be configured to enhance performance for devices doing
> > > > sequential access. Each AHB master is assigned to either the high or
> > > > low priority bin. Both Tegra20/30 have this AHB bus.
> > > > 
> > > > Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
> > > > Cc: Felipe Balbi <balbi@ti.com>
> > > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > > ---
> > > > Update:
> > > > - Use platform_device to get info from dt dynamically.(Felipe/Arnd)
> > > > ---
> > > >  arch/arm/mach-tegra/Makefile    |    1 +
> > > >  arch/arm/mach-tegra/tegra-ahb.c |  285 +++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 286 insertions(+), 0 deletions(-)
> > > 
> > > 1. I thought we weren't going to have any more drivers under
> > >    arch/arm
> > 
> > Can this driver be located under "drivers/misc"? Or is there any better place?
> 
> maybe drivers/platform/arm/ ??

I really wouldn't want to add that directory: It has the risk of letting
people add random crap there that may or may not be related to ARM (the
company) and/or ARM (the architecture).

I think it could go into drivers/amba/ along with the primecell bus driver.
The two drivers are for two different aspects of the AMBA spec and don't
actually depend on one another as far as I can tell, but it's at least
a fitting name, and it doesn't depend on the ARM architecture, which is
important because the driver could be used on other architectures that
are connected to an AHB bus.

	Arnd
