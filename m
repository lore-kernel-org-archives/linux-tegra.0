From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: add support for rcv-sel and drive
 type
Date: Tue, 15 Jan 2013 16:00:29 +0530
Message-ID: <50F52FC5.9000109@nvidia.com>
References: <1357630357-7309-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1357630357-7309-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Pritesh Raithatha <praithatha@nvidia.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Linus W,


On Tuesday 08 January 2013 01:02 PM, Laxman Dewangan wrote:
> From: Pritesh Raithatha <praithatha@nvidia.com>
>
> NVIDIA's Tegra114 added two more configuration parameter in pinmux i.e.
> rcv-sel and drive type.
>
> rcv-sel: Select between High and Normal VIL/VIH receivers.
> 	RCVR_SEL=1: High VIL/VIH
> 	RCVR_SEL=0: Normal VIL/VIH
>
> drv_type: Ouptput drive type:
> 	33-50 ohm driver: 0x1
> 	66-100ohm driver: 0x0
>
> Add support of these parameters to be configure from DTS file.
>
> Tegra20 and Tegra30 does not support this configuration and hence initialize their
> pinmux structure with reg = -1.
>
> Originally written by Pritesh Raithatha.
> Changes by ldewangan:
> 	- remove drvtype_width as it is always 2.
> 	- Better describe the change.
>
> Signed-off-by: Pritesh Raithatha <praithatha@nvidia.com>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> ---

Can you please review the series and let us know if any thing I can do 
for closing this?

Thanks,
Laxman



