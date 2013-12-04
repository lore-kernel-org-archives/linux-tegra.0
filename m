From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: Re: [PATCH 7/7] usb: phy-tegra-usb.c: wrong pointer check for remap
 UTMI
Date: Wed, 04 Dec 2013 10:02:23 +0800
Message-ID: <529E8D2F.3070706@gtsys.com.hk>
References: <1386122435-4205-1-git-send-email-chris.ruehl@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386122435-4205-1-git-send-email-chris.ruehl@gtsys.com.hk>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Cc: balbi@ti.com, gregkh@linuxfoundation.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Sorry for the noise, it should be [PATCH] only .. I will resend it.


On Wednesday, December 04, 2013 10:00 AM, Chris Ruehl wrote:
> usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
>
> A wrong pointer was used to test the result of devm_ioremap()
>
> Signed-off-by: Chris Ruehl<chris.ruehl@gtsys.com.hk>
> Acked-by: Venu Byravarasu<vbyravarasu@nvidia.com>
> ---
>   drivers/usb/phy/phy-tegra-usb.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 82232ac..bbe4f8e 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -876,7 +876,7 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
>
>   	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
>   		resource_size(res));
> -	if (!tegra_phy->regs) {
> +	if (!tegra_phy->pad_regs) {
>   		dev_err(&pdev->dev, "Failed to remap UTMI Pad regs\n");
>   		return -ENOMEM;
>   	}

-- 
GTSYS Limited RFID Technology
A01 24/F Gold King Industrial Bld
35-41 Tai Lin Pai Road, Kwai Chung, Hong Kong
Fax (852) 8167 4060 - Tel (852) 3598 9488

Disclaimer: http://www.gtsys.com.hk/email/classified.html
