From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove 0, prefix from unit-addresses
Date: Mon, 11 Apr 2016 10:05:21 -0600
Message-ID: <570BCB41.2030504@wwwdotorg.org>
References: <1460383271-27306-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460383271-27306-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2016 08:01 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> When Tegra124 support was first merged the unit-addresses of all devices
> were listed with a "0," prefix to encode the reg property's second cell.
> It turns out that this notation is not correct, and the "," separator is
> only used to separate fields in the unit address (such as the device and
> function number in PCI devices), not individual cells for addresses with
> more than one cell.

> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts

> -	gpu@0,57000000 {
> +	gpu@57000000 {
>   		/*
>   		 * Node left disabled on purpose - the bootloader will enable
>   		 * it after having set the VPR up

So the bootloader doesn't actually do that for the new node name at 
present. I have written a patch to make it do so, but haven't sent it 
yet since I wrote it in the middle of a large cleanup of U-Boot. I 
expect I can shuffle it to the front of the series and send it soon 
though. Without a new bootloader that contains this change, IIUC all 
graphics will be non-operative if this change is applied.

Aside from that,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
