From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Tegra xHCI support
Date: Wed, 10 Sep 2014 12:24:53 +0200
Message-ID: <541026F5.9000609@collabora.com>
References: <1409693701-16520-1-git-send-email-abrestic@chromium.org>	<CAAObsKAYqpJMJnxSMxhkkRtnoEwLwgUa1y7ij5ZHvHf1jRok+Q@mail.gmail.com>	<CAL1qeaF7U9aoBp5gQPS=r+pe6krKmXdP1qak2gjhNqQMoHFB8A@mail.gmail.com>	<CAAObsKAXO-pBtqd1jNj8faXqpE+5Wb0RFzPp+jn9FH0B=dHq8g@mail.gmail.com> <CAL1qeaFUaqs9SDv1p+dYDYLn9hwDxdTQ=K-wo+Qa5+KGY=U47w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFUaqs9SDv1p+dYDYLn9hwDxdTQ=K-wo+Qa5+KGY=U47w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel@lists.>
List-Id: linux-tegra@vger.kernel.org

On 09/09/2014 07:09 PM, Andrew Bresticker wrote:
> On Tue, Sep 9, 2014 at 1:21 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>> On 8 September 2014 18:22, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> On Mon, Sep 8, 2014 at 8:34 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>>>> On 2 September 2014 23:34, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>>>
>>>>> Tested on Venice2, Jetson TK1, and Big with a variety of USB2.0 and
>>>>> USB3.0 memory sticks and ethernet dongles using controller firmware
>>>>> recently posted by Andrew Chew [2].
>>>>
>>>> I have had mixed results when testing this on a Jetson TK1 board. Of 8
>>>> USB devices I tested with, about half where probed correctly, but the
>>>> other half repeatedly fail in hub_port_init because in the GET_STATUS
>>>> right after the reset, the C_PORT_CONNECTION bit is set.
>>>>
>>>> I don't see any correlation between the failure and the kind of usb
>>>> device, but I don't have much experience with USB implementations
>>>> either.
>>>
>>> Hmm... I haven't seen that before.  Which particular devices were you using?
>>
>> Here they are:
>>
>> work:
>>
>> Genius keyboard: 05d5:6782
>> Logitech mouse: 046d:c06a
>> Denver MP3 player: 10d6:1100
>> Atheros Bluetooth dongle: 0cf3:3005
>>
>> don't work:
>>
>> MCS7830 ethernet dongle: 9710:7830
>> Genesys Logic hub: 05e3:0608
>> Alcor flash drive: 058f:6387
>> JMicron SATA bridge: 152d:2329
> 
> I have the same SATA bridge and it is enumerating fine for me, but
> I've ordered the hub as well and will check that out.
> 
> Did you have any other patches applied when testing these?

Here is the branch, including the .config I used:

http://cgit.collabora.com/git/user/tomeu/linux.git/log/?h=3.17rc4-xhci

> Were you
> using either SATA or PCIe at the same time?

Nope, haven't even tried those yet.

> Just trying to figure out
> if there's anything else different between our setups.

Yeah, I'm afraid I don't have any good suggestion to make. But maybe you
will find some error on my part in how I have applied the patches or in
the config.

Regards,

Tomeu

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
