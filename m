From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 5/6] usb: host: ehci-tegra: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Sat, 10 May 2014 23:43:10 +0400
Message-ID: <536E814E.4020805@cogentembedded.com>
References: <1399715823-19839-1-git-send-email-gautam.vivek@samsung.com> <1399715823-19839-6-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1399715823-19839-6-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, swarren@wwwdotorg.org, kgene.kim@samsung.com, thierry.reding@gmail.com
List-Id: linux-tegra@vger.kernel.org

Hello.

On 05/10/2014 01:57 PM, Vivek Gautam wrote:

> Using devm_ioremap_resource() API should actually be preferred over
> devm_ioremap(), since the former request the mem region first and then
> gives back the ioremap'ed memory pointer.
> devm_ioremap_resource() calls request_mem_region(), therby preventing
> other drivers to make any overlapping call to the same region.

> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>   drivers/usb/host/ehci-tegra.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 572634c..ccc6433 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -411,9 +411,8 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>   	}
>   	hcd->rsrc_start = res->start;
>   	hcd->rsrc_len = resource_size(res);
> -	hcd->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
>   	if (!hcd->regs) {

    This has to be changed as well as devm_ioremap_resource() returns error, 
not NULL.

> -		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>   		err = -ENOMEM;

    This needs to be changed as well, to pass up the error code 
devm_ioremap_resource() returned.

WBR, Sergei
