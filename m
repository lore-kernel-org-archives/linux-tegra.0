From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/9] ARM: tegra: Add host1x, DC and HDMI to Tegra114 device
 tree
Date: Mon, 07 Oct 2013 15:19:02 -0600
Message-ID: <52532546.1010506@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-5-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add host1x, DC (display controller) and HDMI devices to Tegra114
> device tree.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +		dc@54200000 {
> +			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";

Is the HW really 100% backwards-compatible, such that any driver that
only knew about the Tegra20 HW could work unmodified on Tegra114?
Perhaps that's possible, since your large driver patch doesn't seem to
have a patch to add Tegra114 DC support...
