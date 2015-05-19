From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: tegra-xusb: Fix allocation of pins
Date: Tue, 19 May 2015 16:09:26 +0100
Message-ID: <555B5226.3090500@nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com> <1432044863-2035-3-git-send-email-jonathanh@nvidia.com> <20150519143041.GD26748@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519143041.GD26748-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/05/15 15:30, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 19, 2015 at 03:14:22PM +0100, Jon Hunter wrote:
>> Commit e5b3b2d9ed20 ("pinctrl: allows not to define the get_group_pins
>> operation") allows pin controllers not to register the get_group_pins()
>> function. However, a side-effect of not registering this function is
>> that pins are not allocated and potentially multiple devices could
>> attempt to configure the same pins [1]. Although this problem exists in
>> the pinctrl core, because only a few devices are impacted by this, fix
>> this for tegra-xusb by adding the get_group_pins() function.
> 
> If I understand correctly this effectively makes get_group_pins()
> mandatory, doesn't it? In that case, shouldn't commit e5b3b2d9ed20 be
> reverted?

Yes may be it should. I will defer to Linus here.

>> Please note that in addition to adding the get_group_pins() functions
>> the pins/lanes for the tegra-xusb also need to be registered when
>> calling pinctrl_register(). This also allows the current pinmux state
>> to be viewed by the debugfs node "pinmux-pins" for the tegra-xusb pad
>> controller.
> 
> This sounds like a logically separate change and hence could warrant a
> separate patch. I'll defer to Linus on this, though, so:

It needs to be registered as part of this patch otherwise the pins will
not be registered and pin_request() will fail. Today pin_request() does
not even get called for these pins. So I believe that this is needed as
part of this patch.

May be I was not clear above, but the debugfs "pinmux-pins" entry shows
nothing today for these pins. A by-product of this fix is that now we
can view the pinmux state of the pins via the debugfs.

> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon
