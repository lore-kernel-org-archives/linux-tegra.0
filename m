From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 2/9] dt-bindings: pinctrl: Deprecate Tegra XUSB pad
 controller binding
Date: Mon, 18 Apr 2016 13:26:22 +0200
Message-ID: <CACRpkdaSXajvsyncgGdyN61TOSpV_5fA+rwzeXYjyrpG++OMGQ@mail.gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
	<1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
	<CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ@mail.gmail.com>
	<20160418111200.GA17716@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160418111200.GA17716-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 18, 2016 at 1:12 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Mar 15, 2016 at 10:01:25AM +0100, Linus Walleij wrote:
>> On Fri, Mar 4, 2016 at 5:19 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> > This is an old version of the binding that isn't flexible enough to
>> > describe all aspects of the XUSB pad controller. Specifically with the
>> > addition of XUSB support (for SuperSpeed USB) the existing binding is
>> > no longer suitable.
>> >
>> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> That's unfortunate, not to say unelegant. I want to know Stephen's
>> opinion on these patches (probably they are in another mail)
>> before merging.
>>
>> Will the new binding also work with SuperDuperSpeed USB and
>> SuperSuperMegaUltraOrtonSpeed USB I wonder... or will we
>> change the bindings again?
>
> Linus, Stephen's gave his Acked-by on this patch (provided it gets
> merged into patch 1/9, which I've done locally), would you be willing to
> give your Acked-by so that this change can go in via the PHY tree where
> the new bindings are introduced?

Yes I trust Stephen to know what's right for Tegra.
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
