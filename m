From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 5/9] of: Add NVIDIA Tegra XHCI controller binding
Date: Wed, 25 Jun 2014 17:13:10 -0600
Message-ID: <53AB5786.8090904@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>	<1403072180-4944-6-git-send-email-abrestic@chromium.org>	<53AB4495.1020000@wwwdotorg.org> <CAL1qeaG=nLxDHrsVuuL9c-JdKB+TrNN785+8v=hb0MAFJ=5juw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaG=nLxDHrsVuuL9c-JdKB+TrNN785+8v=hb0MAFJ=5juw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/25/2014 05:01 PM, Andrew Bresticker wrote:
> On Wed, Jun 25, 2014 at 2:52 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
>>> Add device-tree binding documentation for the XHCI controller present
>>> on Tegra124 and later SoCs.
>>
>>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xhci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xhci.txt
>>
>>> +Required properties:
>>> +--------------------
>>
>>> + - clock-names: Must include the following entries:
>>> +    - xusb_host
>>> +    - xusb_falcon_src
>>> +    - xusb_ss
>>> +    - xusb_ss_src
>>> +    - xusb_hs_src
>>> +    - xusb_fs_src
>>> +    - pll_u_480m
>>> +    - clk_m
>>> +    - pll_e
>>
>>> + - reset-names: Must include the following entries:
>>> +   - xusb_host
>>> +   - xusb_ss
>>
>> Usually the CAR has a reset control for each clock. So, I would expect
>> as many entries in reset-names as in clock-names. Even if the SW doesn't
>> currently touch all the reset lines, we should make sure the binding
>> requires them to be present so that any DT will contain the entries if
>> they're ever needed in the future.
> 
> The xusb_{falcon,host,hs,fs,ss}_src clocks all share the same reset
> bit (143), so I can add a single entry for those.
> 
>> In the CAR documentation, I see "XUSB_DEV" as a clock/reset bit. Is that
>> missing from the list above?
> 
> This is used when XUSB is in device mode, which the driver does not
> support.  I can add those clocks here though if you want.

That'd be a good idea. That way, the DT doesn't have to change later.

>>> +Optional properties:
>>
>>> + - s1p05v-supply: 1.05V supply regulator.
>>> + - s1p8v-supply: 1.8V supply regulator.
>>> + - s3p3v-supply: 3.3V supply regulator.
>>
>> What are those supplies for? I would have expected any input to the SoC
>> to have a name that described its purpose, and the pins and DT
>> properties would be named to match.
> 
> I *think* this what they are from looking at the schematic, but I'll
> have to ask around:
>  - s1p05v: avddio_pex, dvddio_pex, and maybe avdd_pll_erefe
>  - s1p8v: avdd_pll_utmip
>  - s3p3v: avdd_usb, hvdd_pex, hvdd_pex_pll_e
> Should these be separated out as they are for PCIe?

Yes, I think they should be separated. I wonder if the supplies for PCIe
shouldn't have been added to the XUSB padctrl rather than PCIe node
though? It probably doesn't matter much either way.
