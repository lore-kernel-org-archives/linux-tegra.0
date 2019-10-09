From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Wed, 9 Oct 2019 18:39:00 -0500
Message-ID: <20191009233900.GA9109@bogus>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-4-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009024343.30218-4-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 09, 2019 at 10:43:41AM +0800, JC Kuo wrote:
> Extend the bindings to cover the set of features found in Tegra194.
> Note that, technically, there are four more supplies connected to the
> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> , but the power sequencing requirements of Tegra194 require these to be
> under the control of the PMIC.
> 
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
> possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. To deal with
> this, a new device node property "nvidia,disable-gen2" was added to
> Tegra194 that be used to specifically disable Gen 2 speed for a
> particular USB 3.0 port so that the port can be limited to Gen 1 speed
> and avoid the instability.

I suspect this may be a common issue and we should have a common 
property. Typically, this kind of property is in the controller though 
and supports multiple speed limits. See PCI bindings for inspiration.

Rob
