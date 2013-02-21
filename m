From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [v2 1/4] ARM: tegra20: create a DT header defining CLK IDs
Date: Thu, 21 Feb 2013 14:25:36 +0200
Message-ID: <20130221122536.GJ23234@tbergstrom-lnx.Nvidia.com>
References: <1360868369-20093-1-git-send-email-hdoyu@nvidia.com>
 <1360868369-20093-2-git-send-email-hdoyu@nvidia.com>
 <511D45E0.1080105@wwwdotorg.org>
 <20130215092407.GO3073@tbergstrom-lnx.Nvidia.com>
 <511E6639.1090909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <511E6639.1090909@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, Russell King <linux@arm.linux.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 15, 2013 at 05:45:45PM +0100, Stephen Warren wrote:

...

> > I would suggest removing this clock. It's not actually implemented in the CCF
> > and rather useless. If you would gate the CPU clock from the CPU by writing to
> > this register, how would you ungate it? :) Note that this would gate the clock
> > to all CPUs.
> 
> (Note that my comment was re: all clocks, not just that one clock)
> 
> Can't the PMC or flow-controller ungate the clock based on some event?

I don't think the flow-controller controls this gate. The usual way of
clockgating a core is to execute a WFI instruction. That will trigger
clockgating the core, unless the flow-controller has been programmed to do
something else. The flow-controller will ungate the clock when there is an
interrupt.

> Either way, that clock definition exists in HW, right? So I don't think
> there's actually any harm in including the definition in the binding
> even if we never implement/use it.

The clock definition seems to exist in HW yes, the corresponding resetbit
however is marked as 'reserved' in the Tegra114 documentation.

Cheers,

Peter.
