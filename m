From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/7] add Tegra194 XUSB host and pad controller support
Date: Mon, 7 Oct 2019 13:03:11 +0200
Message-ID: <20191007110311.GA614644@kroah.com>
References: <20191004162906.4818-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191004162906.4818-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 05, 2019 at 12:28:59AM +0800, JC Kuo wrote:
> Hi,
> 
> This series introduces support for Tegra194 XUSB host and pad
> controller. Tegra194 XUSB host and pad controller are highly
> similar to the controllers found on Tegra186. Therefore, it's
> possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.

I've taken patches 1 and 2 through my USB tree.  If you want/need me to
take the others, please get acks from those maintainers on them so I can
do so.

thanks,

greg k-h
