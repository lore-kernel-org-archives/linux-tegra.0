From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher scripts PATCH] Fix "typo" in comment re: padding calculations
Date: Wed, 19 Aug 2015 10:57:04 -0600
Message-ID: <55D4B560.4020603@wwwdotorg.org>
References: <1439925257-22522-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439925257-22522-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/18/2015 01:14 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The binary format is U-Boot code + DTB + pad + flash image. U-Boot moves
> the DTB out of the way of BSS. The pad is to prevent U-Boot trashing the
> flash image, not the DTB. Fix the comment to reflect that.

Patch is applied.
