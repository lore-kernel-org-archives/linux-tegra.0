From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra114: Enable Cortex-A15 errata 798181
Date: Mon, 15 Jul 2013 12:27:36 -0600
Message-ID: <51E43F18.4090508@wwwdotorg.org>
References: <1372845348-27089-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372845348-27089-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/03/2013 03:55 AM, Joseph Lo wrote:
> The commit 93dc688 (ARM: 7684/1: errata: Workaround for Cortex-A15
> erratum 798181 (TLBI/DSB operations)) introduecd a workaround for
> Cortex-A15 errata 798181. Enabling it for Tegra114.

Applied to Tegra's for-3.12/soc branch.
