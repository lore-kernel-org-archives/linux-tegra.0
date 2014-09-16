From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Tegra xHCI support
Date: Tue, 16 Sep 2014 09:57:17 -0700
Message-ID: <CAL1qeaGf6JSuq=ekZY7Pp2zSAB0+0S9fZ70xWpct2MJ=pTSmug@mail.gmail.com>
References: <1409693701-16520-1-git-send-email-abrestic@chromium.org>
	<CAAObsKAYqpJMJnxSMxhkkRtnoEwLwgUa1y7ij5ZHvHf1jRok+Q@mail.gmail.com>
	<CAL1qeaF7U9aoBp5gQPS=r+pe6krKmXdP1qak2gjhNqQMoHFB8A@mail.gmail.com>
	<CAAObsKAXO-pBtqd1jNj8faXqpE+5Wb0RFzPp+jn9FH0B=dHq8g@mail.gmail.com>
	<CAL1qeaEk_r5XAKvvJfwXN9+Wi9EjC_2MgBfoP92TK=F+Ou9QTA@mail.gmail.com>
	<CAAObsKAwgfx1g2p7PQP+=HudvAHHpcPi47gEH6BrxEgLu6w2VQ@mail.gmail.com>
	<CAL1qeaEC9O8-jgjGC44cFctoZPpp4dRVfQ=mhSb_2on7GgiU0w@mail.gmail.com>
	<54172B3F.9030901@wwwdotorg.org>
	<CAL1qeaEK=C4j+G5CA_91xJNe25d=-y47EyZAYnaMh46fNYVDAw@mail.gmail.com>
	<54185698.7020600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54185698.7020600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 16, 2014 at 8:26 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/15/2014 01:30 PM, Andrew Bresticker wrote:
>>
>> On Mon, Sep 15, 2014 at 11:09 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> wrote:
>>>
>>> On 09/15/2014 11:06 AM, Andrew Bresticker wrote:
>>>>
>>>> On Mon, Sep 15, 2014 at 12:00 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
>>>> wrote:
>>>>>
>>>>> On 12 September 2014 18:37, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>> wrote:
>>>>>>
>>>>>> On Tue, Sep 9, 2014 at 1:21 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
>>>>>> wrote:
>>>>>>>
>>>>>>> On 8 September 2014 18:22, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> On Mon, Sep 8, 2014 at 8:34 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> On 2 September 2014 23:34, Andrew Bresticker
>>>>>>>>> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>>>>>>>>
>>>>>>>>>> Tested on Venice2, Jetson TK1, and Big with a variety of USB2.0
>>>>>>>>>> and
>>>>>>>>>> USB3.0 memory sticks and ethernet dongles using controller
>>>>>>>>>> firmware
>>>>>>>>>> recently posted by Andrew Chew [2].
>
> ...
>>>>
>>>> Stephen, Thierry, have either of you had a chance to test this series?
>>>
>>>
>>> I haven't had a chance to yet. I just went to try it out, and found that
>>> it
>>> depends on a whole slew of other patches that I don't have. Is there a
>>> git
>>> branch somewhere to save me having to track down all the dependencies?
>>
>>
>> Yes, Tomeu has the branch he used for testing here:
>> http://cgit.collabora.com/git/user/tomeu/linux.git/log/?h=3.17rc4-xhci
>
>
> Hmm. That git server was quite reluctant to cough up its bits, but it did
> eventually.
>
>> You'll also need the firmware Andrew Chew posted:
>> https://patchwork.ozlabs.org/patch/384013/
>
>
> The XHCI driver can't load its firmware unless it's a module; if I make it
> built-in, it fails immediately with error -2 during "Direct firmware
> loading". The driver needs to work with either immediate or deferred
> firmware loading.

If you want the driver to be built-in, you'll either need to build the
firmware in as well (i.e. EXTRA_FIRMWARE) or enable
FW_LOADER_USER_HELPER_FALLBACK to load with userspace/uevent (though
apparently this is deprecated).

> The following USB2 devices had problems:
>
> 0b95:7720 ASIX Electronics Corp. AX88772
>
>> [  489.140536] usb 1-3: new high-speed USB device number 81 using
>> xhci-tegra
>> [  489.260860] usb 1-3: device descriptor read/64, error -71
>> [  489.370804] xhci-tegra 70090000.usb: Setup ERROR: setup context command
>> for slot 1.
>> [  489.378463] usb 1-3: hub failed to enable device, error -22
>> [  489.500531] usb 1-3: new high-speed USB device number 82 using
>> xhci-tegra
>> [  489.655708] usb 1-3: can't set config #1, error -71
>> [  489.661231] usb 1-3: USB disconnect, device number 82
>> [  489.940531] usb 1-3: new high-speed USB device number 83 using
>> xhci-tegra
>> [  490.060860] usb 1-3: device descriptor read/64, error -71
>> [  490.170805] xhci-tegra 70090000.usb: Setup ERROR: setup context command
>> for slot 1.
>> [  490.178462] usb 1-3: hub failed to enable device, error -22
>
> (repeats over and over)
>
> 15a4:1336 Afatech Technologies, Inc. SDHC/MicroSD/MMC/MS/M2/CF/XD Flash Card
> Reader
>
> The power light comes on, and the activity light just keeps flashing fast.
> Usually the activity light flashes a couple times and then turns off. There
> is nothing in dmesg at all for this device.
>
> 05e3:0608 Genesys Logic, Inc. USB-2.0 4-Port HUB
>
> Not detected. There is nothing in dmesg at all for this device.
>
> 1bcf:0c31 Sunplus Innovation Technology Inc. SPIF30x Serial-ATA bridge
>
> Not detected. There is nothing in dmesg at all for this device.

Thanks, I'll try to figure out what's going on here.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
