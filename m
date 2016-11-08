From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 21:15:15 +0530
Message-ID: <5821F30B.8010306@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com> <58201401.8050805@nvidia.com> <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com> <5821A6D3.7010000@nvidia.com> <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw@mail.gmail.com> <5821D49E.2070308@nvidia.com> <20161108144211.GA2244@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161108144211.GA2244@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 08 November 2016 08:12 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Nov 08, 2016 at 07:05:26PM +0530, Laxman Dewangan wrote:
>>
>> Yes, it can be integrated with the regulator handle and then it can call the
>> required configurations through notifier and regulator_get_voltage().
>> But I think it is too much complex for the static configurations. This
>> mandate also to populate the regulator handle and all power tree.
> It looks as if regulator notifiers should be able to support whatever
> use-cases we may have (I suspect that we really only need pre- and post-
> voltage-change notifications.
>

Yes, we have pre/post and abort notification from regulator.
REGULATOR_EVENT_PRE_VOLTAGE_CHANGE,
REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE,
REGULATOR_EVENT_VOLTAGE_CHANGE,

So it can be done dynamically.
As the notification is atomic context, we need to support atomic context 
of pmc register configurations.


>> The simple way for static configuration (case where voltage does not get
>> change), just take the power tree IO voltage from DT and configure the IO
>> pad control register.
> For static configurations where we have a regulator along with a pinmux
> setting for the I/O voltage we could potentially run into issues where
> both settings don't match. How would we handle that?

As a process, we are generating the IO pad control DT configuration from 
the customer pinmux spreadsheet. So there is data population by hardware 
(system eng) team and SW just use the auto-generated dtsi file in SW. 
This avoided the error/mistake created by the SW engineer.



>
>> For dynamic case, there is some sequence need to be followed based on
>> voltage direction change (towards lower or towards higher) for the voltage
>> change and the IO pad voltage configuration and it is simple to do it from
>> client driver.
> Are patches available for this? It'd be useful to know how this will end
> up being used in order to come up with the best solution.
>
> In general I think it's good to send a complete series of patches, even
> if it's long and spans multiple subsystems. As it is it's difficult for
> anyone else (myself included) to understand where this is headed, which
> makes it more complicated than necessary to get at the final solution.


The dynamic setting is used by mmc driver and it is handled by mmc team. 
They are waiting for framework/infrastructure to be available for their 
patches.

However, in downstream, we have all these implemented. In downstram we 
have pad control driver but instead of new framework, we decided to do 
it through pinctrl framework.

So if you look for mmc driver in downstream, you can get the  actual 
code about usage.
However, for clarity, here is sequence:

1. Voltage from 3.3V to 1.8V

     ret = regulator_set_voltage(regulator, 1800000, 1800000);
     if (!ret)
             ret = padctrl_set_voltage(padctrl, 1800000);

2. Voltage from 1.8V to 3.3V
     ret = padctrl_set_voltage(padctrl, 3300000);
     if (!ret)
         ret = regulator_set_voltage(regulator, 3300000, 3300000);



With pinctrl framework, the APIs will be
pinctrl_lookup_state(pinctrl, "io-pad-3v3");

or
pinctrl_lookup_state(pinctrl, "io-pad-1v8");


The static setting is doen during initialization of the driver.


>>
>> I like to have both approach, through pinmux DT and also from regulator. So
>> based on the platform, if regulator supported then populate required
>> properties in DT for regulator else go on standard pinmux DT way (for
>> non-regulator cases).
> Again, it would be best to see this in actual use. Right now it's not
> clear that we'll even have both cases. Implementing both approaches will
> mean potentially unused code.

We can have the only one say regulator approach then it will be 
mandatory to have regulator nodes for all vdd-io so that io-pads are 
configured properly.

In the probe, it will get regulator and if found the get_voltage and 
configure pmc.

I am thinking about supporting IO pad configuration(static) in case we 
do not have regulator enabled/up in platform and want to set IO pads 
manually from DT.




> On another note: in my experience you seldom need both cases, since the
> dynamic configuration is the hard one, and the static configuration will
> usually be a special case of the dynamic configuration.
>
>
Cases will be with regulator support available or not.

So if we donot want to support the cases, where actual regualator 
support is not available then we will not need to set IO pads voltage 
via DT framework.

However, we will still needs low-power support from pinctrl framework.
