From: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Add support for Nyan
Date: Mon, 24 Nov 2014 11:07:58 -0800
Message-ID: <CAL1qeaG6cvKsrwtLnqWYYzdbe4jhGqGxi-DRxftWGYsHWE+T5A@mail.gmail.com>
References: <1416757251-4588-1-git-send-email-sjg@chromium.org>
	<547365FB.7010408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547365FB.7010408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 24, 2014 at 9:08 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/23/2014 08:40 AM, Simon Glass wrote:
>>
>> Add support for Tegra124 Nyan. Pinmux is based on norrin with a single
>> change for the reset GPIO.
>
> Allen, can you please confirm the reset GPIO setting for Norrin in the
> pinmux patch you sent? It seems as if the two boards truly are this
> identical, the reset pin would be too.

Well Nyan and Norrin *are* identical - they're different names for the
same board.  It seems from the other patches though that this is for
Big (in which case the name of the config file should reflect that).
Either way, the reset GPIO (PI5) is configured the same across all
Nyan-based boards (Nyan/Norrin, Big, Blaze, Kitty) and I believe what
Simon has here is correct.
