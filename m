From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 1/1] staging: nvec: check return value
Date: Thu, 19 Dec 2019 18:40:45 +0100 (CET)
Message-ID: <alpine.OSX.2.21.1912191837580.5811@macbook-pro.fritz.box>
References: <1576648598-12257-1-git-send-email-wangxidong_97@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576648598-12257-1-git-send-email-wangxidong_97@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xidong Wang <wangxidong_97@163.com>
Cc: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello Xidong,

On Wed, 18 Dec 2019, Xidong Wang wrote:

> In nvec_kbd_probe(), the return value of devm_input_allocate_device()
> should be checked before it is used.
>
> Signed-off-by: Xidong Wang <wangxidong_97@163.com>

looks good to me. Thanks!

Acked-by: Marc Dietrich <marvin24@gmx.de>

> ---
> drivers/staging/nvec/nvec_kbd.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
> index 01dbb66..386d619 100644
> --- a/drivers/staging/nvec/nvec_kbd.c
> +++ b/drivers/staging/nvec/nvec_kbd.c
> @@ -123,6 +123,8 @@ static int nvec_kbd_probe(struct platform_device *pdev)
> 		keycodes[j++] = extcode_tab_us102[i];
>
> 	idev = devm_input_allocate_device(&pdev->dev);
> +	if (!idev)
> +		return -ENOMEM;
> 	idev->name = "nvec keyboard";
> 	idev->phys = "nvec";
> 	idev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP) | BIT_MASK(EV_LED);
> -- 
> 2.7.4
>
>
