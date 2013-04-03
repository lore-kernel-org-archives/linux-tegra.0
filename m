From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 6/7] usb: phy: tegra: Add error handling & clean up.
Date: Wed, 03 Apr 2013 13:35:32 -0600
Message-ID: <515C8484.507@wwwdotorg.org>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com> <1364978502-22887-7-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364978502-22887-7-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> Check return values from all GPIO APIs and handle errors accordingly.
> Remove clk_disable_unprepare which is no more needed.

checkpatch fails:

> WARNING: line over 80 characters
> #27: FILE: drivers/usb/phy/phy-tegra-usb.c:547:
> +		dev_err(phy->dev, "gpio %d direction not set\n", phy->reset_gpio);
> 
> WARNING: line over 80 characters
> #34: FILE: drivers/usb/phy/phy-tegra-usb.c:553:
> +		dev_err(phy->dev, "gpio %d direction not set\n", phy->reset_gpio);
> 
> total: 0 errors, 2 warnings, 72 lines checked
> 
> 0006-usb-phy-tegra-Add-error-handling-clean-up.patch has style problems, please review.
