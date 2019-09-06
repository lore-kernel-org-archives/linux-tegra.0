From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [Patch V8 7/8] usb: gadget: Add UDC driver for tegra XUSB
 device mode controller
Date: Fri, 6 Sep 2019 09:43:12 +0800
Message-ID: <1567734192.7317.68.camel@mhfsdcap03>
References: <1567585440-13751-1-git-send-email-nkristam@nvidia.com>
         <1567585440-13751-8-git-send-email-nkristam@nvidia.com>
         <1567593053.7317.64.camel@mhfsdcap03>
         <36447248-1ddb-ff1d-a731-de6afb445a9d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36447248-1ddb-ff1d-a731-de6afb445a9d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2019-09-05 at 09:57 +0530, Nagarjuna Kristam wrote:
> 
> On 04-09-2019 16:00, Chunfeng Yun wrote:
> > On Wed, 2019-09-04 at 13:53 +0530, Nagarjuna Kristam wrote:
> >> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> >> XUSB device mode controller supports SS, HS and FS modes
> >>
> >> Based on work by:
> >>   Mark Kuo <mkuo@nvidia.com>
> >>   Hui Fu <hfu@nvidia.com>
> >>   Andrew Bresticker <abrestic@chromium.org>
> >>
> >> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> >> Acked-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  drivers/usb/gadget/udc/Kconfig      |   12 +
> >>  drivers/usb/gadget/udc/Makefile     |    1 +
> >>  drivers/usb/gadget/udc/tegra-xudc.c | 3791 +++++++++++++++++++++++++++++++++++
> >>  3 files changed, 3804 insertions(+)
> >>  create mode 100644 drivers/usb/gadget/udc/tegra-xudc.c
> >>
> >> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> >> index d354036..0fe7577 100644
> >> --- a/drivers/usb/gadget/udc/Kconfig
> >> +++ b/drivers/usb/gadget/udc/Kconfig
> >> @@ -441,6 +441,18 @@ config USB_GADGET_XILINX
> >>  	  dynamically linked module called "udc-xilinx" and force all
> >>  	  gadget drivers to also be dynamically linked.
> >>  
> >> +config USB_TEGRA_XUDC
> >> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> >> +	depends on ARCH_TEGRA || COMPILE_TEST
> >> +	depends on PHY_TEGRA_XUSB
> >> +	select USB_CONN_GPIO
> > To me, needn't select this driver, without it, the driver still build
> > pass
> > 
> Yes compilation passes with out this. Added select for getting USB_CONN_GPIO
> driver functionality.
We can enable it in defconfig, think about one day use type-c to do
dual-role switch, or other ways, will needn't select it then.

> 
> >> +	help
> >> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
> >> +
> >> +	 Say "y" to link the driver statically, or "m" to build a
> >> +	 dynamically linked module called "tegra_xudc" and force all
> >> +	 gadget drivers to also be dynamically linked.
> >> +
> >>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
> >>  
