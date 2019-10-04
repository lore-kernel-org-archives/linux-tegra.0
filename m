From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/7] add Tegra194 XUSB host and pad controller support
Date: Fri, 4 Oct 2019 14:23:22 +0200
Message-ID: <20191004122322.GB422178@kroah.com>
References: <20191004081941.4831-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191004081941.4831-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 04, 2019 at 04:19:34PM +0800, JC Kuo wrote:
> Hi,
> 
> This series introduces support for Tegra194 XUSB host and pad
> controller. Tegra194 XUSB host and pad controller are highly
> similar to the controllers found on Tegra186. Therefore, it's
> possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.
> 
> JC Kuo (7):
>   xhci: tegra: Parameterize mailbox register addresses
>   usb: host: xhci-tegra: Add Tegra194 XHCI support
>   phy: tegra: xusb: Protect Tegra186 soc with config
>   phy: tegra: xusb: Add Tegra194 support
>   dt-bindings: phy: tegra: Add Tegra194 support
>   arm64: tegra: Add XUSB and pad controller on Tegra194
>   arm64: tegra: Enable XUSB host in P2972-0000 board

What changed from v1?  You need to put that somewhere, usually in the
patches themselves, below the --- line.

Or at the very least, in the cover letter.

Given that I can't find it anywhere here, I'll expect a v3 with that
information to be sent soon :(

thanks,

greg k-h
