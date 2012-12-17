From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] arm: tegra: Add new DT property to USB node.
Date: Mon, 17 Dec 2012 14:07:59 -0700
Message-ID: <50CF89AF.3000308@wwwdotorg.org>
References: <1355468348-8821-1-git-send-email-vbyravarasu@nvidia.com> <1355468348-8821-2-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1355468348-8821-2-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, Felipe Balbi <balbi@ti.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, linux@arm.linux.org.uk, sjg@chromium.org, olof@lixom.net, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/2012 11:59 PM, Venu Byravarasu wrote:
> As Tegra USB host driver is using instance number for resetting
> PORT0 twice, adding a new DT property for handling this.

Alan, Greg, Felip,e

This series looks fine to me.

I'd like to take all the Tegra-related USB patches through the Tegra
tree for 3.9 if possible (so I'm looking for your acks here). I believe
Venu plans to significantly clean up the EHCI/PHY driver split for
Tegra, rework the drivers, and add support for Tegra30 in addition to
Tegra20. Some of this requires changes to some Tegra board files and
device trees to maintain "git bisect" I don't know for sure yet, but I
believe that rework may also end up conflicting with other clock-related
rework that will show up for Tegra in 3.9. Are you OK with this? I'll
certainly look for your review/acks on the patches before picking them
up though.

Thanks.
