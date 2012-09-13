From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] arm: tegra: fixing compilation error
Date: Thu, 13 Sep 2012 09:09:15 -0600
Message-ID: <5051F71B.6030604@wwwdotorg.org>
References: <1347513385-14158-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1347513385-14158-1-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 09/12/2012 11:16 PM, Venu Byravarasu wrote:
> As usb_phy.h got moved from mach to include/linux/usb
> and renamed as tegra_usb_phy.h, correcting it in the include
> path.

This should no longer be necessary assuming there's a new linux-next today.

(Note that I did point out this issue on our internal mailing list; are
you not subscribed to that?)
