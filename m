From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] USB: PHY: Tegra: Get rid of instance number to differentiate
 PHY type
Date: Fri, 18 Jan 2013 10:04:09 -0700
Message-ID: <50F98089.6040008@wwwdotorg.org>
References: <1358343022-28919-1-git-send-email-vbyravarasu@nvidia.com> <1358343022-28919-4-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1358343022-28919-4-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 06:30 AM, Venu Byravarasu wrote:
> Tegra20 USB has 3 PHY instances:
> Instance 1 and 3 are UTMI. Instance 2 is ULPI.
> 
> As instance number was used to differentiate ULPI from UTMI,
> used DT param to get this info and processed accordingly.

> diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
> index f03e157..a6a89d4 100644
> --- a/include/linux/usb/tegra_usb_phy.h
> +++ b/include/linux/usb/tegra_usb_phy.h
> @@ -60,6 +60,7 @@ struct tegra_usb_phy {
>  	struct usb_phy u_phy;
>  	struct device *dev;
>  	bool is_legacy_phy;
> +	bool is_ulpi_phy;
>  };

I see the code that uses this new field, but it doesn't appear to be set
anywhere...
