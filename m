From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/6] usb: host: tegra: Tegra30 support
Date: Thu, 01 Aug 2013 15:18:24 -0600
Message-ID: <51FAD0A0.1000208@wwwdotorg.org>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com> <1375292522-7855-7-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292522-7855-7-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
> The Tegra30 EHCI controller is mostly compatible with the Tegra20
> controller, except Tegra30 includes the HOSTPC register extension.
> The has_hostpc capability bit must be set in the ehci_hcd structure if
> the controller has such extensions. The new tegra_ehci_soc_config
> structure is added to describe the differences between the SoCs.

Aside from the minor issues I already pointed out, the series briefly,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
