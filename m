From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 01/10] arm/tegra: initial device tree for tegra30
Date: Fri, 18 Nov 2011 10:49:42 -0800
Message-ID: <20111118184942.GA31678@quad.lixom.net>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-2-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740D74C46@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1740D74C46@HQMAIL01.nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 17, 2011 at 11:39:14AM -0800, Stephen Warren wrote:
> Peter De Schrijver wrote at Thursday, November 17, 2011 9:19 AM:
> > This patch adds the initial device tree for tegra30
> 
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.txt
> ...
> > +* harmony: tegra20 based development board
> > +Required root node properties:
> > + - compatible = "nvidia,harmony", "nvidia,tegra20";
> > +
> > +* seaboard: tegra20 based clamshell reference design
> > +Required root node properties:
> > + - compatible = "nvidia,seaboard", "nvidia,tegra20";
> 
> Do we really want to list all the board names here? In the future, there
> could be tens or hundreds. I would argue that we should just document
> nvidia,tegra20 and nvidia,tegra30.

Agreed.

> At a later point, we should fix board-dt.c to solely look for those
> compatible values, although this will have to wait until the pinmux DT
> bindings are present. Then, the kernel won't care about the board names.

Exactly.


-Olof
