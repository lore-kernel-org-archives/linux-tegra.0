From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Overhaul Venice2 regulators
Date: Thu, 27 Feb 2014 15:19:47 -0700
Message-ID: <530FBA03.1050608@wwwdotorg.org>
References: <1393345802-6121-1-git-send-email-thierry.reding@gmail.com> <530D14D2.3040008@wwwdotorg.org> <20140226110210.GA30008@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140226110210.GA30008-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2014 04:02 AM, Thierry Reding wrote:
> On Tue, Feb 25, 2014 at 03:10:26PM -0700, Stephen Warren wrote:
>> On 02/25/2014 09:30 AM, Thierry Reding wrote:
>>> Some of the regulators and the relationships to other regulators are
>>> wrong. This commit attempts to rectify this by making them more similar
>>> to what the schematics contain. This starts by adding a +VDD_MUX supply
>>> that represents the 12V input and derives the main +3.3V_SYS and +5V_SYS
>>> supplies from that. The majority of the other regulators derive from one
>>> of those three.
>>>
>>> While at it, rename the regulators to match the names in the schematics
>>> to make them easier to match up.
>>
>>> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
>>
>>>  			regulators {
>>> -				vsup-sd2-supply = <&vdd_ac_bat_reg>;
>>> -				vsup-sd3-supply = <&vdd_ac_bat_reg>;
>>> -				vsup-sd4-supply = <&vdd_ac_bat_reg>;
>>> -				vsup-sd5-supply = <&vdd_ac_bat_reg>;
>>> +				vsup-sd2-supply = <&vdd_5v0_sys>;
>>> +				vsup-sd3-supply = <&vdd_5v0_sys>;
>>> +				vsup-sd4-supply = <&vdd_5v0_sys>;
>>> +				vsup-sd5-supply = <&vdd_5v0_sys>;
>>>  				vin-ldo0-supply = <&as3722_sd2>;
>>> -				vin-ldo1-6-supply = <&vdd_ac_bat_reg>;
>>> +				vin-ldo1-6-supply = <&vdd_3v3_run>;
>>>  				vin-ldo2-5-7-supply = <&as3722_sd5>;
>>> -				vin-ldo3-4-supply = <&vdd_ac_bat_reg>;
>>> -				vin-ldo9-10-supply = <&vdd_ac_bat_reg>;
>>> -				vin-ldo11-supply = <&vdd_ac_bat_reg>;
>>> +				vin-ldo3-4-supply = <&vdd_3v3_sys>;
>>> +				vin-ldo9-10-supply = <&vdd_5v0_sys>;
>>> +				vin-ldo11-supply = <&vdd_3v3_run>;
>>
>> Looking at the schematic, the binding should require a vin-ldo3-lv and
>> vin-lod3_sw property too, although that's not really anything to do with
>> this change.
> 
> Indeed. And also vin-gpio and vin-gpio-lv. I'm not sure to which degree
> we really want to describe the power tree. Some of these properties are
> of no relevance to the operating system. Well, maybe for some special
> cases they might be.

I guess any supply that can reasonably expected will never have SW
control in any design ever (which may be reasonable for inputs to a PMIC
that are derived directly from a battery or AC input), can reasonably be
left out. I suppose if we ever do need SW control, we can always make
them optional supplies later.

>>>  				sd3 {
>>> -					regulator-name = "vddio-ddr-2phase";
>>> +					regulator-name = "+1.35V_LP0";
>>
>> Both sd2 and sd3 nodes have the same value for regulator-name. I'm not
>> sure that's correct, even if both the outputs are indeed wired together
>> on the board?
> 
> As far as I can tell the name is only used for descriptive purposes, so
> this should work. It could be annoying if either of them fails for some
> reason and an error message wouldn't necessarily point to the exact
> regulator.
> 
> Then again, if one of these were to fail, I'm not sure one would even
> get to see any output because they power the DRAMs.
> 
> The reason why I chose to give them the same name is that they aren't
> distinguishable in the schematics, so any other name would be arbitrary
> again. Perhaps naming them something like +1.35V_LP0(sd2) and
> +1.35V_LP0(sd3) would work?

Yes, that might be better. I believe the regulator-name is used for
debugfs filename regulator/${regulator-name}, so one of these isn't
showing up at present.


>> BTW, all the AS3728 chips (SD0, SD1, SD6) get +5V_SYS as input, as well
>> as one of +VDD_MUX_GPU, +VDD_MUX_CORE, +VDD_MUX_CPU. This doesn't seem
>> to be represented anywhere in the DT.
> 
> Like I said above, I think that's below the level of detail that we may
> want to represent in DT.
> 
> If we decide that we need it anyway, I think we can do it in a separate
> patch. It will also require changes to the regulator core to implement
> multiple supply support.
> 
> Perhaps another idea would be to not support multiple regulators in one
> vin-supply property, but maybe add other properties.

Yes, if we do address this issue (and it's probably fine not to), we
should definitely use different properties; each property is meant to
represent a specific supply to the chip; it's not like each chip is
supposed to choose some different name for the supply property, then
throw all of its sources into that one property.

>>> 		vdd_3v3_run: regulator@3 {
>>> 			compatible = "regulator-fixed";
>>> 			reg = <3>;
>>> 			regulator-name = "+3.3V_RUN";
>>> 			regulator-min-microvolt = <3300000>;
>>> 			regulator-max-microvolt = <3300000>;
>>> 			vin-supply = <&vdd_3v3_sys>;
>>> 		};
>>
>> Isn't this controlled by signal PMU_REGEN3 (AS3722 GPIO1) ; that seems
>> to be routed into the "ON" pin on U20A7 SLG5NV1430V. Is this something
>> you're planning on fixing later, by creating a standalone PMU_REGEN3
>> regulator, and inserting into the hierarchy?
> 
> That's something that could be done. One of the issues is that there
> isn't a proper regulator for PMU_REGEN3, but at the same time it is used
> to control also the +1.8V_VDDIO_LP0_OFF regulator. That means we'd have
> to used a dummy regulator to wrap the PMU_REGEN3 GPIO just so it can be
> used as the input for multiple other regulators.
> 
> Of course in that case it isn't simply an enable pin anymore. Therefore
> it will need to be listed in a vin-supply property, rather than the gpio
> property for the regulator. But since the regulator is also fed by other
> supplies this too will require multiple supply support in the regulator
> core.
> 
> One other issue is that PMU_REGEN3 is also used to discharge the
> +1.05V_RUN, +3.3V_RUN and +1.8V_VDDIO_LP0_OFF rails. I can't claim to
> completely understand that circuitry, but it seems that when PMU_REGEN3
> is pulled low, then all of the above rails will be discharged. For both
> +3.3V_RUN and +1.8V_VDDIO_LP0_OFF shouldn't be too bad because they are
> dependent on PMU_REGEN3 anyway. But for +1.05V_RUN that's not the case.
> That's used for PCIe and SATA (both not used on Venice2 I think) as well
> as HDMI (AVDD_HDMI_PLL).

Hmm. So if we turn off (pull low) PMU_REGEN3 while +1.05V_RUN is
enabled, we'll end up shorting +1.05V_RUN to ground? Is that possible in
the latest version of your patch? If not, then I'll just trust your
latest patch:-) If it is possible, then I think we need to rejig the
patch somehow so we absolutely can't do that.

...
> The Tegra HDMI block has two input voltages, VDD and PLL. These are both
> represented by the vdd-supply and pll-supply properties. However, at
> least on Dalmore and on Venice2 now, the vdd-supply is one controllable
> via a GPIO and therefore goes to the +5V pin on the HDMI connector
> rather than the 3.3V AVDD_HDMI input of Tegra. For all other boards it
> seems like we don't handle that pin at all, presumably because it is
> always on anyway (on Beaver, the +5V pin of the HDMI connector is
> supplied by +SYS_3V3 and +VDD_1V8, both of which are always on).
> 
> To rectify the situation I think we'll need another supply in the HDMI
> DT bindings, say hdmi-supply, that can be used to describe the signal
> that should go to the connector's +5V pin. Or perhaps add a subnode
> connector to the hdmi node to represent this more accurately:
> 
> 	hdmi@54280000 {
> 		vdd-supply = <&vdd_3v3_hdmi>;
> 		pll-supply = <&vdd_hdmi_pll>;
> 
> 		...
> 
> 		connector {
> 			supply = <&vdd_5v0_hdmi>;
> 		};
> 	};
> 
> Does that sound reasonable?

Yes. I think a hdmi-supply property would be fine; I don't think we need
another node? Either way is fine though.
