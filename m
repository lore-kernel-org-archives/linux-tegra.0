From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: cardhu: Add drm components
Date: Mon, 03 Dec 2012 10:48:40 +0800
Message-ID: <50BC1308.4050407@gmail.com>
References: <1354254256-10212-1-git-send-email-markz@nvidia.com> <50B908F1.8000407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B908F1.8000407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/01/2012 03:28 AM, Stephen Warren wrote:
> On 11/29/2012 10:44 PM, Mark Zhang wrote:
>> This patch adds the RGB & HDMI nodes in Tegra 30 cardhu's dts.
>> This makes the LVDS & HDMI working.
> 
> This still doesn't add any of the backlight/panel GPIO programming,
> which I believe is required before we enable any LCDs. We could add the
> HDMI node without that though.

Okay. So I think I may misunderstood your words several days ago, when I
submitted the v1 and v2 version for this patch.

So let's hold on this and wait for the backlight/panel working on cardhu.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
