From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCHv5 1/3] ARM: tegra: Add Tegra AHB driver
Date: Tue, 8 May 2012 08:12:33 +0300
Message-ID: <20120508081233.8883eb8ec2a8bc99b4039334@nvidia.com>
References: <201205070859.29174.arnd@arndb.de>
 <20120507.122333.2024326166703361049.hdoyu@nvidia.com>
 <201205071024.48958.arnd@arndb.de>
 <20120507.143647.508182574757518311.hdoyu@nvidia.com>
 <20120507183611.GA725@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120507183611.GA725@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linville@tuxdriver.com" <linville@tuxdriver.com>, "balbi@ti.com" <balbi@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "olof@lixom.net" <olof@lixom.net>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "ccross@android.com" <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 7 May 2012 20:36:11 +0200
"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org> wrote:

> On Mon, May 07, 2012 at 01:36:47PM +0200, Hiroshi Doyu wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > Subject: Re: [PATCHv5 1/3] ARM: tegra: Add Tegra AHB driver
> > Date: Mon, 7 May 2012 12:24:48 +0200
> > Message-ID: <201205071024.48958.arnd@arndb.de>
> > 
> > > On Monday 07 May 2012, Hiroshi Doyu wrote:
> > > > Tegra doesn't enable ARM_AMBA and Tegra doesn't use the following
> > > > "drivers/amba/bus.c" right now. I needed to make this directory
> > > > available to ones without ARM_AMBA enabled.
> > > 
> > > Ah, right. I looked at arch/arm/Kconfig earlier to see if
> > > tegra enabled ARM_AMBA but was accidentally looking
> > > at ARCH_INtegraTOR when grepping for TEGRA ;-)
> > > 
> > > Your proposed solution sounds good then.
> > 
> > Thank you for reviewing patches & ACK. Attached the update one here,
> > instead of sending a while series again.
> > 
> > >From 16cc2b0fab00c33cd24bb5c43c45a4cda646ad42 Mon Sep 17 00:00:00 2001
> > From: Hiroshi DOYU <hdoyu@nvidia.com>
> > Date: Wed, 18 Apr 2012 11:41:56 +0300
> > Subject: [PATCHv5 1/3] ARM: tegra: Add Tegra AHB driver
> > 
> > Tegra AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> > High-performance Bus (AHB) architecture.
> > 
> > The AHB Arbiter controls AHB bus master arbitration. This effectively
> > forms a second level of arbitration for access to the memory
> > controller through the AHB Slave Memory device. The AHB pre-fetch
> > logic can be configured to enhance performance for devices doing
> > sequential access. Each AHB master is assigned to either the high or
> > low priority bin. Both Tegra20/30 have this AHB bus.
> > 
> > Some of configuration params could be passed from DT too if needed.
> > 
> > Change-Id: I184e0e1ce033e76881353a4bb99234e2850e99c2
> 
> What nonsense is this?  Please never put that in a patch you want
> accepted upstream, as it makes no sense and we just have to edit it out
> by hand, making us grumpy...

Sorry, my bad.

Stephen, would you mind removing that line when you take them in?
