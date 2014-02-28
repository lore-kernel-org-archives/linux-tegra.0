From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 09/10] ARM: tegra: Rename as3722 node to pmic
Date: Fri, 28 Feb 2014 10:20:58 -0700
Message-ID: <5310C57A.6050200@wwwdotorg.org>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com> <1393605629-30514-9-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-9-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/28/2014 09:40 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Device tree node name should reflect the kind of device rather than the
> specific name of the device.

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> -		as3722: as3722@40 {
> +		pmic: pmic@40 {

The patch is fine, so I'll apply it, but note that the naming rule
applies to the node name only, since that's visible in the compiled DTB,
but not the label name, so this could have been left as:

		as3722: pmic@40

That would have avoided the rest of the diffs in this patch, and might
have been useful on a board with a bunch of different PMICs that need to
be differentiated between.
