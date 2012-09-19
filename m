From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Add Avionic Design Plutux support
Date: Wed, 19 Sep 2012 10:48:37 -0600
Message-ID: <5059F765.6040609@wwwdotorg.org>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de> <1347979144-24462-3-git-send-email-thierry.reding@avionic-design.de> <5059EB47.5010600@wwwdotorg.org> <20120919164242.GB19464@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120919164242.GB19464-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/19/2012 10:42 AM, Thierry Reding wrote:
> On Wed, Sep 19, 2012 at 09:56:55AM -0600, Stephen Warren wrote:
>> On 09/18/2012 08:39 AM, Thierry Reding wrote:
>>> The Plutux is a set-top box device based on the Tamonten SOM
>>> and can be connected to a display via HDMI.
>> 
>>> diff --git a/arch/arm/boot/dts/tegra20-plutux.dts
>>> b/arch/arm/boot/dts/tegra20-plutux.dts
>> 
>>> +	sound { +		compatible = "ad,tegra-audio-plutux", +
>>> "nvidia,tegra-audio-wm8903"; +		nvidia,model = "Avionic Design
>>> Plutux"; + +		nvidia,audio-routing = +			"Headphone Jack",
>>> "HPOUTR", +			"Headphone Jack", "HPOUTL", +			"Int Spk",
>>> "ROP", +			"Int Spk", "RON", +			"Int Spk", "LOP", +			"Int
>>> Spk", "LON", +			"Mic Jack", "MICBIAS", +			"IN1L", "Mic
>>> Jack"; + +		nvidia,i2s-controller = <&tegra_i2s1>; +
>>> nvidia,audio-codec = <&wm8903>; + +		nvidia,spkr-en-gpios =
>>> <&wm8903 2 0>; +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio
>>> PW2 */ +		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0
>>> */ +		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
>> 
>> Does your board really have all of those GPIOs? Having both 
>> int-mic-en-gpios and ext-mic-en-gpios is something pretty unique
>> to Harmony so far,
> 
> The hardware was kept as close to Harmony as possible on purpose
> in order to reduce the time needed for customization. This is
> obviously no longer true now because the hardware is already about
> 18 months old but you can't change hardware retroactively...
> 
> Again I'll make sure to double check this against the schematics
> but I'm pretty sure these are the connections.
> 
>> and also a pretty broken HW design, so I'd hope people haven't
>> copied it.
> 
> Would you mind explaining why it is broken? I haven't really been 
> involved with the codec parts so I don't have very deep insights.

The issue is roughly that there's only 1 micbias signal, yet two
microphones, so if micbias current indicates that a mic is attached,
there's no way to know which mic is attached.

The driver currently hard-codes the int mic GPIO to disabled and the
ext mic GPIO to enabled, essentially completely ignoring the internal
mic completely and pretending there's just one. On Harmony, the int
mic is actually a header that you can optionally connect a mic to, and
hence I'd assume most people don't, and hence just use the ext mic
anyway. hence the driver's behaviour is pretty reasonable. Hopefully
that behaviour will work fine for your board too? If not, the driver
would probably need to grow a control to select between the two mics,
but I suppose that wouldn't affect the DT.
