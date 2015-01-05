From: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: request deferred probe when
 failing to get phy
Date: Mon, 5 Jan 2015 15:12:58 +0100
Message-ID: <CAAObsKDYSVp_W5Qz_43Lyd=nqfQJPw=ttN1-7ENRX19n79gHnA@mail.gmail.com>
References: <1419416190-4321-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419416190-4321-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24 December 2014 at 11:16, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The commit 1290a958d48e ("usb: phy: propagate __of_usb_find_phy()'s error on
> failure") changed the condition to return -EPROBE_DEFER to host driver.
> Originally the Tegra host driver depended on the returned -EPROBE_DEFER to
> get the phy device later when booting. Now we have to do that explicitly.

With this patch, USB works again on this nyan-blaze board.

Tested-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Thanks,

Tomeu

> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi,
>
> This fixes a regression found on 3.19-rc1. The USB host can't be probed and
> the USB failed on Jetson TK1.
>
> Thanks,
> Vince
>
>
>  drivers/usb/host/ehci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 19a9af1b4d74..ff9af29b4e9f 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -451,7 +451,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>
>         u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
>         if (IS_ERR(u_phy)) {
> -               err = PTR_ERR(u_phy);
> +               err = -EPROBE_DEFER;
>                 goto cleanup_clk_en;
>         }
>         hcd->usb_phy = u_phy;
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
