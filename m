From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dts: add aliases and DMA requestor for serial
 controller
Date: Tue, 25 Dec 2012 15:13:47 +0530
Message-ID: <50D97553.80001@nvidia.com>
References: <1355898671-3960-1-git-send-email-ldewangan@nvidia.com> <50D1F2CB.3090206@wwwdotorg.org> <50D2AD02.6060101@nvidia.com> <50D344E9.70305@wwwdotorg.org> <50D3E320.2090804@nvidia.com> <50D4CBB0.7080603@wwwdotorg.org> <50D614D9.8020106@nvidia.com> <50D93AB6.7040905@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D93AB6.7040905-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 25 December 2012 11:03 AM, Stephen Warren wrote:
> On 12/22/2012 01:15 PM, Laxman Dewangan wrote:
>
>> This way it is straight
>> forward for the uart user to directly see the uart instance on board and
>> decide the port number rather than going to what are other uart and
>> their corresponding driver.
> Still, there is some precedent in the kernel for your approach. So, I
> guess we can go ahead with using the aliases as-is.
>

So can I assume this patch is fine and I need not to re-spin it for 
removing aliases?
