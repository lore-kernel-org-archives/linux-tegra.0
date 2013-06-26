From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/11] ARM: tegar: remove the limitation that Tegra114
 can't support suspend
Date: Wed, 26 Jun 2013 13:40:08 -0600
Message-ID: <51CB4398.8050900@wwwdotorg.org>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com> <1372152475-18617-10-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152475-18617-10-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/25/2013 03:27 AM, Joseph Lo wrote:
> The Tegra114 can support suspend function now, removing the limitation.

OK, so this is the first point at which system suspend is enabled on
Tegra114. However, some of the changes in earlier patches sounded like
the might affect, or be required by, cpuidle too. Is that the case? If
so, can you assure me that bisectability of Tegra114 cpuidle is
maintained across this whole series?
