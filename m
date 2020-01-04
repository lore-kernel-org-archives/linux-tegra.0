From: Rob Herring <robh@kernel.org>
Subject: Re: [Patch V3 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Fri, 3 Jan 2020 17:37:17 -0700
Message-ID: <20200104003717.GA11747@bogus>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, 30 Dec 2019 16:39:38 +0530, Nagarjuna Kristam wrote:
> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> entry is used by XUSB pad controller driver to register for role changes
> for OTG/Peripheral capable USB 2 ports.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V3:
>  - Added Acked-by updates to commit message.
> ---
> V2:
>  - Moved usb-role-switch to seperate Required section as suggested by Thierry.
>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
> ---
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
