From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: moving stuff away from mach/clk.h
Date: Thu, 29 Nov 2012 11:25:02 -0700
Message-ID: <50B7A87E.5070302@wwwdotorg.org>
References: <1353999553-5196-1-git-send-email-sivaramn@nvidia.com> <1353999553-5196-2-git-send-email-sivaramn@nvidia.com> <50B6FCE5.7080003@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B6FCE5.7080003-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/28/2012 11:12 PM, Prashant Gaikwad wrote:
> On Tuesday 27 November 2012 12:29 PM, Sivaram Nair wrote:
>> This patch moves some stuff away from mach/clk.h to other mach-tegra
>> files. This is part of the efforts to get rid of mach/clk.h which in
>> turn will help to enable single zImage.
>>
>> Signed-off-by: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/mach-tegra/clock.c            |    1 +
>>   arch/arm/mach-tegra/clock.h            |   12 ++++++++++--
>>   arch/arm/mach-tegra/include/mach/clk.h |   11 -----------
>>   3 files changed, 11 insertions(+), 13 deletions(-)
> 
> This patch will not add any real value since I have removed clk_cfg_ex
> functionality in clock code rework.
> It's just that I will have to rebase my changes on this.
> 
> Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In that case, I may as well not apply patch 2/2 at all, and I'll just
take your clock code cleanup instead. I assume that will be posted for
inclusion into 3.9?
