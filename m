From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 0/6] usb: host: xhci-tegra: Add Tegra186 XUSB support
Date: Mon, 8 Apr 2019 10:07:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1904081006330.1440-100000@iolanthe.rowland.org>
References: <20190408081739.GB6644@ulmo>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408081739.GB6644@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 8 Apr 2019, Thierry Reding wrote:

> On Mon, Apr 01, 2019 at 12:40:44PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi,
> > 
> > This series introduces support for XUSB to the Tegra186 SoC. This is
> > mostly the same as on earlier generations in that it provides an XHCI
> > compatible interface with a bit of vendor-specific glue. Perhaps the
> > most notable change is the removal of the IPFS wrapper. Patches for
> > the UPHY related changes that control the PHYs for the XUSB controller
> > were merged into v5.1.
> > 
> > This version is a rebase of the series posted here:
> > 
> >     http://patchwork.ozlabs.org/project/linux-tegra/list/?series=88193
> > 
> > There have been no code changes and I collected Reviewed-by and Acked-by
> > tags.
> > 
> > Greg, can you pick up patches 1-3 with Rob's and Mathias' Acked-by,
> > respectively? I'll pick up patches 4-6 into the Tegra tree.
> 
> Hi Greg,
> 
> would you mind picking up patches 1-3 of this series?

FYI: Greg is on vacation for the coming week, with no email access.

Alan Stern
