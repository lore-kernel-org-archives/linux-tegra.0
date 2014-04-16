From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: make Venice's +3.3V_RUN regulator always
 on
Date: Wed, 16 Apr 2014 17:14:58 -0600
Message-ID: <534F0EF2.9030209@wwwdotorg.org>
References: <1397600984-25198-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397600984-25198-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/15/2014 04:29 PM, Stephen Warren wrote:
> This regulator supplies power to pretty much everything on the board, so
> it doesn't make sense to allow it to turn off. Mark it boot-on and
> always-on so it doesn't get turned off. Without this, I see issues with
> the eMMC device; it can't be correctly detected during boot.

I've applied this to Tegra's for-3.16/dt branch.
