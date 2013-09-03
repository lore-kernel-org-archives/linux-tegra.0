From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 2/3] drm/panel: Add simple panel support
Date: Tue, 03 Sep 2013 12:49:30 -0600
Message-ID: <52262F3A.2020507@wwwdotorg.org>
References: <1377876321-26835-1-git-send-email-treding@nvidia.com> <1377876321-26835-3-git-send-email-treding@nvidia.com> <60046BAF-42E8-40FB-A45D-045B7C92513E@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <60046BAF-42E8-40FB-A45D-045B7C92513E-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/30/2013 01:24 PM, Kumar Gala wrote:
> 
> On Aug 30, 2013, at 10:25 AM, Thierry Reding wrote:
> 
>> Add a driver for simple panels. Such panels can have a regulator that
>> provides the supply voltage and a separate GPIO to enable the panel.
>> Optionally the panels can have a backlight associated with them so it
>> can be enabled or disabled according to the panel's power management
>> mode.
>>
>> Support is added for three panels: An AU Optronics 10.1" WSVGA, a
>> Chunghwa Picture Tubes 10.1" WXGA and a Panasonic 10.1 WUXGA TFT LCD
>> panel.

>> diff --git a/Documentation/devicetree/bindings/panel/panel-simple.txt b/Documentation/devicetree/bindings/panel/panel-simple.txt

>> +Required properties:
>> +- compatible: should be one of:
>> +  - "auo,b101aw03": AU Optronics Corporation 10.1" WSVGA TFT LCD panel
>> +  - "cptt,claa101wb03": Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>> +  - "pc,vvx10f004b00": Panasonic Corporation 10.1" WUXGA TFT LCD panel
>> +
> 
> It would seem there should be a more generic compatible to cover the basic "panel-simple" case.

I would suggest only documenting "simple-panel" here, and not
documenting the specific panels at all; the panel-specific compatible
values would show up simply due to the rule that all compatible values
in *.dts should contain the exact HW model (e.g. "auo,b101aw03"), plus
any HW they're compatible with (i.e. "simple-panel").

I'd suggest "simple-panel" rather than "panel-simple" since IIRC other
simple bindings are "simple-xxx" rather than "xxx-simple".

>> +Optional properties:
>> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
>> +- power-supply: regulator to provide the supply voltage
>> +- enable-gpios: GPIO pin to enable or disable the panel
>> +- backlight: phandle of the backlight device attached to the panel
>> +
> 
> If these are all optional, what does it mean to be a "panel-simple"?

I think at least ddc-i2c-bus and backlight should be required
properties. I suppose it might be possible for the panel to be
always-on, and hence enable-gpios/power-supply could be optional?
