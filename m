From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/2] Update dts file to support lm90 well
Date: Mon, 07 Oct 2013 13:22:28 -0600
Message-ID: <525309F4.30903@wwwdotorg.org>
References: <1381138109-22727-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381138109-22727-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 03:28 AM, Wei Ni wrote:
> Add nct1008 dt entry on Tegra114 Dalmore.
> Add vcc-supply for nct1008 on Tegra30 Cardhu.
> Didn't add vcc-supply on Tegra20 Ventana, because on this platform,
> the vcc for nct1008 is physically present and enabled.

I have applied the series to Tegra's for-3.13/dt branch.
