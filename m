From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2] MAINTAINERS: Add DesignWare, i.MX6, Armada, R-Car
 PCI host maintainers
Date: Thu, 12 Dec 2013 15:48:16 -0500
Message-ID: <20131212204816.GA2609@titan.lakedaemon.net>
References: <20131211183237.GI4699@google.com>
 <20131212204610.GK4699@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131212204610.GK4699@google.com>
Sender: linux-sh-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, Richard Zhu <r65037@freescale.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-sh@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Simon Horman <horms@verge.net.au>, Valentine Barshak <valentine.barshak@cogentembedded.com>, Wei Yongjun <weiyj.lk@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 12, 2013 at 01:46:10PM -0700, Bjorn Helgaas wrote:
> [+cc Thomas]
> 
> On Wed, Dec 11, 2013 at 11:32:37AM -0700, Bjorn Helgaas wrote:
> > If this looks reasonable, I'll merge it via the PCI tree for v3.13.
> 
> OK, here's another try.  I'm not actually trying to nominate anybody; I
> just tried to write down the list we came up with in an earlier discussion [1].
> 
> I'd like confirmation from the following people that they approve of being
> listed here:
> 
>   Richard Zhu (IMX6)
>   Thomas Petazzoni (MVEBU)
>   Magnus Damm (R-CAR)
> 
> I think everybody else listed has already said they approve.
> 
> [1] http://lkml.kernel.org/r/CAErSpo5tN==4nSv2u3SUBe_L4VsWn4P7TN+LtrC172Qj1vhtog@mail.gmail.com
> 
> 
> MAINTAINERS: Add DesignWare, i.MX6, Armada, R-Car PCI host maintainers
> 
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Add entries for PCI host controller drivers in drivers/pci/host/.
> 
> Signed-off-by: Mohit Kumar <mohit.kumar@st.com>		(DesignWare)
> Signed-off-by: Pratyush Anand <pratyush.anand@st.com>	(DesignWare)
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>	(R-CAR)
> Acked-by: Jason Cooper <jason@lakedaemon.net>		(MVEBU)

If Thomas is ok with it:

Double-Plus-Acked-by: Jason Cooper <jason@lakedaemon.net>

for the mvebu bits.

thx,

Jason.
