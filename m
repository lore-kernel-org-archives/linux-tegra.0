From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Implement 6395/1 for Tegra
Date: Wed, 14 Nov 2012 13:54:33 -0700
Message-ID: <50A40509.5080006@wwwdotorg.org>
References: <1352903243-5389-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352903243-5389-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/14/2012 07:27 AM, Peter De Schrijver wrote:
> This patch implements ARM linux patch 6395/1 for Tegra. See commit
> 1a8e41cd672f894bbd74874eac601e6cedf838fb for details.

I've applied this patch to Tegra's for-3.8/soc branch with the following
enhanced commit description:

>     ARM: tegra: Implement 6395/1 for Tegra
>     
>     This patch implements ARM linux patch 6395/1 for Tegra. See commit
>     1a8e41c "ARM: 6395/1: VExpress: Set bit 22 in the PL310 (cache
>     controller) AuxCtlr register" for details.
>     
>     Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     [swarren: added commit subject for referenced patch]
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
