From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: RE: [PATCH v2 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
Date: Thu, 4 Apr 2013 17:51:09 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E50BE4899@BGMAIL02.nvidia.com>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
 <1364978502-22887-2-git-send-email-vbyravarasu@nvidia.com>
 <515C7E07.4040505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <515C7E07.4040505@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "balbi@ti.com" <balbi@ti.com>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: linux-tegra-owner@vger.kernel.org [mailto:linux-tegra-
> owner@vger.kernel.org] On Behalf Of Stephen Warren
> Sent: Thursday, April 04, 2013 12:38 AM
> To: Venu Byravarasu
> Cc: gregkh@linuxfoundation.org; balbi@ti.com;
> stern@rowland.harvard.edu; linux-tegra@vger.kernel.org; linux-
> usb@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
> 
> On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> > The existing Tegra USB bindings have a few issues:
> ...
> > This patch fixes the binding definition to resolve these issues.
> 
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-
> phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-
> phy.txt
> 
> >  Required properties :
> ...
> > +  - vbus-supply: regulator for VBUS
> 
> Doesn't the driver only need to control VBUS if the port is in OTG mode?
> 
> If there is no VBUS control, and the HW provides VBUS, I think that the
> port can only operate in host mode.
> 
> If there is no VBUS control, and the HW does not provide VBUS, I think
> that the port can only operate in peripheral mode.
> 
> If there is VBUS control, then shouldn't the port always operate in OTG
> mode, or are there other reasons to control VBUS even in host-only mode?
> 
> If VBUS control is only useful for OTG mode, then I think the
> vbus-supply property should be documented in a "Required properties for
> dr_mode == otg" section.

Agree, will do it in next patch update.

> 
> I assume that VBUS control makes no sense for a peripheral-mode-only
> port, so if VBUS control is useful for host-only mode as well as OTG
> mode, then I think the vbus-supply property should be documented in a
> "Required properties for dr_mode != peripheral" section.
> 
> Is the following table correct?
> 
> Port operating mode:	host	peripheral	otg
> --------------------	----	----------	---
> VBUS control required:	no	no		yes
> VBUS control useful:	yes[1]?	no		yes
> 
> [1] perhaps for power-saving/suspend???
 
For waking system up from sleep via devices connected to USB, I think Vbus is always
kept ON in host mode. 

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
