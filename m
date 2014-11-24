From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Add support for Nyan
Date: Mon, 24 Nov 2014 13:13:48 -0800
Message-ID: <CAL1qeaGD9J+p=JoTPX5GuSmcZ2YnqbWExL-o5XuVfCZKdS0Bgw@mail.gmail.com>
References: <1416757251-4588-1-git-send-email-sjg@chromium.org>
	<547365FB.7010408@wwwdotorg.org>
	<CAL1qeaG6cvKsrwtLnqWYYzdbe4jhGqGxi-DRxftWGYsHWE+T5A@mail.gmail.com>
	<547387A5.2060500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547387A5.2060500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 24, 2014 at 11:31 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/24/2014 12:07 PM, Andrew Bresticker wrote:
>>
>> On Mon, Nov 24, 2014 at 9:08 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> wrote:
>>>
>>> On 11/23/2014 08:40 AM, Simon Glass wrote:
>>>>
>>>>
>>>> Add support for Tegra124 Nyan. Pinmux is based on norrin with a single
>>>> change for the reset GPIO.
>>>
>>>
>>> Allen, can you please confirm the reset GPIO setting for Norrin in the
>>> pinmux patch you sent? It seems as if the two boards truly are this
>>> identical, the reset pin would be too.
>>
>>
>> Well Nyan and Norrin *are* identical - they're different names for the
>> same board.
>
>
> Oh. It's a bit of an epic fail to have multiple names for the exact same
> thing:-(
>
> When you say Nyan, are you talking about Nyan the family of boards (of which
> Big is one member), or do you consider Nyan to be a single board? Olof
> previously told me that Nyan was a family, of which Big was a member. So,
> I'm not sure if Norrin is another name for the family, or another name for a
> specific member.

When I said Nyan above, I meant the actual Nyan board (which is also
known as Norrin).  The Nyan family of boards is composed of Nyan (aka
Norrin), Big (Acer Chromebook, which I believe this patch is referring
to), Blaze, and Kitty.

>> It seems from the other patches though that this is for
>> Big (in which case the name of the config file should reflect that).
>
>
> Yes. All of the kernel, U-Boot, and tegra-pinmux-scripts (and
> tegra-uboot-flasher if relevant) should use the exact same name for the
> board. If what's currently known as Norrin in tegra-pinmux-scripts should
> actually be called Nyan or Nyan-big, we should rename it.

No, the Norrin one is fine (other than the possible error Simon
mentioned).  Calling it Nyan would be fine too.

The file in this patch should be called Big or Nyan-Big, since it is
for the Acer Chromebook.

>> Either way, the reset GPIO (PI5) is configured the same across all
>> Nyan-based boards (Nyan/Norrin, Big, Blaze, Kitty) and I believe what
>> Simon has here is correct.
>
>
> If the entire pinmux identical across all of those boards too, or does it
> just happen that's true for this one pin?

There are slight pinmux differences between the boards.  The only one
I'm aware of between Nyan (Norrin) and Nyan-Big is that the sense of
the SD write-protect GPIO (Q4) is reversed.  I don't think that the
matters for this config file though, so technically they could share
it.  Perhaps it's best to keep them separate though since they are
separate boards.
