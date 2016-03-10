From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage] Allow @ in paths consumed by cbootimage
Date: Thu, 10 Mar 2016 16:53:52 -0700
Message-ID: <56E20910.60406@wwwdotorg.org>
References: <CAE-gjdUeMdnNcPOZJpCz1_V7FKAh0aHMpqkhkkWpA4XpjPOo4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE-gjdUeMdnNcPOZJpCz1_V7FKAh0aHMpqkhkkWpA4XpjPOo4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <pgeorgi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/10/2016 10:34 AM, Patrick Georgi wrote:
> Signed-off-by: Patrick Georgi <pgeorgi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

This patch is corrupted; all the TABs seem to have been replaced with 
spaces. Perhaps you pasted the patch into an email editor instead on 
using git send-email?

This patch makes me dislike the current config file parsing code; I have 
no idea why it works like it does rather than just using strsep(..., 
",") to split up the input lines. Still, that's a pre-existing issue and 
nothing to do with your patch.
