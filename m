From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix naming in GPIO DT binding header
Date: Mon, 11 Apr 2016 09:04:09 +0200
Message-ID: <CACRpkdZxeV07_rb2xL+HRGp-ay1B-U=_tEbPCYqvM+ZYD-wpYQ@mail.gmail.com>
References: <1459884307-24043-1-git-send-email-swarren@wwwdotorg.org>
	<20160406172845.GC28843@ulmo.ba.sec>
	<5705481D.3030700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5705481D.3030700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 6, 2016 at 7:32 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 04/06/2016 11:28 AM, Thierry Reding wrote:
>>
>> On Tue, Apr 05, 2016 at 01:25:07PM -0600, Stephen Warren wrote:
>>>
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> According to the Tegra TRM, GPIOs are aggregated into /ports/ of 8 GPIOs,
>>> not into /banks/. Fix <dt-bindings/gpio/tegra-gpio.h> to correctly
>>> reflect
>>> this naming convention. While this seems like silly churn, it will become
>>> slightly more important once we introduce the GPIO binding for upcoming
>>> Tegra chips.
>>>
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   include/dt-bindings/gpio/tegra-gpio.h | 68
>>> +++++++++++++++++------------------
>>>   1 file changed, 34 insertions(+), 34 deletions(-)
>>
>>
>> It's not clear to me where this should be applied. This is technically
>> part of the GPIO controller bindings, in which case it'd need to go via
>> the GPIO tree. I'm fine with taking it through the Tegra tree, too, but
>> in case you agree that it should go through the GPIO tree:
>>
>> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I typically consider bindings part of the SoC code-base they related to, so
> I'd imagine this going through the Tegra tree. I didn't Cc LinusW on the
> patch because of that thinking and oversight, but have done so now just in
> case he feels strongly.

No strong opinion, only time I care is when we merge a new driver
and it #includes <dt-bindings/...>.

Take it through the tegra tree.
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
