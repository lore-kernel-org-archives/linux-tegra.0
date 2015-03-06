From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Fri, 06 Mar 2015 13:46:41 -0700
Message-ID: <54FA1231.9000709@wwwdotorg.org>
References: <1425672435-19031-1-git-send-email-daniels@collabora.com>	<54FA0EBB.3080208@wwwdotorg.org> <CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2015 01:42 PM, Simon Glass wrote:
> Hi Stephen,
>
> On 6 March 2015 at 13:31, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 03/06/2015 01:07 PM, Daniel Stone wrote:
>>>
>>> Update the pinmux, in particular USB and SD/MMC pin configuration, from
>>> downstream ChromeOS kernel. Fixes external USB falling off completely
>>> during heavy eMMC activity.
>>
>>
>> Simon (and Tomeu),
>>
>> Can you comment on this change? If the data currently in
>> tegra-pinmux-scripts is wrong, where did it come from if not the ChromeOS
>> kernel?
>
> Sorry, I have no direct knowledge.

Oh, I see the answer in the patch description:

> commit 4a5373e4bd6477addd3764e25989f74d34eba8c6
> Author: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Date:   Tue Feb 3 11:29:03 2015 +0100
>
>     Add support for Nyan-big
>
>     Add support for Tegra124 Nyan-big. Pinmux is based on norrin with a single
>     change for the reset GPIO.

The need for Daniel's patch seems like a good reason not to base one 
board's pinmux on another board, assuming they're identical...

Daniel, have you confirmed that 100% of the data in your patch matches 
that used by the ChromeOS kernel, such that there shouldn't be any more 
fixes needed down the line?
