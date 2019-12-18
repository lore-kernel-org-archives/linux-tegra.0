From: Rob Herring <robh@kernel.org>
Subject: Re: [Patch V2 02/18] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Date: Wed, 18 Dec 2019 17:24:06 -0600
Message-ID: <20191218232406.GA19924@bogus>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-3-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576660591-10383-3-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 18, 2019 at 02:46:15PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 and Tegra186 SoC. This controller supports the USB 3.0
> specification.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - used enum instead of oneOf and const.
>  - Moved reg, reg-names, clocks, clock-names to property section from allOf.
>  - Limited allOf to min and max items based on soc.
>  - Updated description for power-domains.
>  - Added V1 reference
> ---
> V1
>  - This document is yaml version of [1], with difference of usb-role-switch
>    removal.
> [1] https://patchwork.kernel.org/patch/11156253/ 
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 +++++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
