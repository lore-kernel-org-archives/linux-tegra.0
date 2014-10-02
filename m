From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] set: check seek success
Date: Thu, 02 Oct 2014 16:58:47 -0600
Message-ID: <542DD8A7.7040705@wwwdotorg.org>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de> <1412237788-20611-4-git-send-email-patrick@georgi-clan.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412237788-20611-4-git-send-email-patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/02/2014 02:16 AM, Patrick Georgi wrote:
> This could silently fail which leads to surprising behaviour.

> diff --git a/src/set.c b/src/set.c

> -	fseek(fp, offset, SEEK_SET);
> +	if (!fseek(fp, offset, SEEK_SET)) {

fseek is supposed to return the current offset, or -1 on error. I think 
that should say if (fseek(...) < 0) or if (fseek(...) == -1)) or if 
(fseek(...) != offset).
