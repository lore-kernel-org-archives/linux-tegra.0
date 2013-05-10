From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 04/10] Revert "usb: phy: tegra: don't call into
 tegra-ehci directly"
Date: Fri, 10 May 2013 10:26:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1305101024470.1313-100000@iolanthe.rowland.org>
References: <1368194051-4925-5-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368194051-4925-5-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, swarren@wwwdotorg.org, balbi@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 10 May 2013, Venu Byravarasu wrote:

> This reverts commit ee5d5499edb94cd03738a52a7e234b139da8fd72.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
> ---
> As PHY is being registered as separate driver, solution proposed with
> this patch cannot work anymore.
> Hence pushed patch 10 of this series to address the issue.

You can't just revert a change like this -- doing so will recreate the 
original problem that ee5d5499ed was meant to fix.

You have to fix the problem _first_.  Then you can revert that commit.

Alan Stern
