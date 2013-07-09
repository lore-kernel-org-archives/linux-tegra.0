From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 10/11] ARM: dts: tegra114: dalmore: add GPIO power
 key support
Date: Tue, 09 Jul 2013 11:03:48 -0600
Message-ID: <51DC4274.8040607@wwwdotorg.org>
References: <1372845047-25147-1-git-send-email-josephl@nvidia.com> <1372845047-25147-11-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372845047-25147-11-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/03/2013 03:50 AM, Joseph Lo wrote:
> Adding the GPIO power key and enabling the wake up function.

I think I'll skip this one patch, because Laxman posted a more complete
patch "[PATCH V2] ARM: tegra: enable gpio-keys on dalmore". which
includes this change, plus defines another 3 keys.
