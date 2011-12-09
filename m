From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in
 device tree
Date: Fri, 9 Dec 2011 13:52:00 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17518605B1@HQMAIL01.nvidia.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
 <1323291510-22338-2-git-send-email-swarren@nvidia.com>
 <20111208043149.GA31372@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111208043149.GA31372-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Wednesday, December 07, 2011 9:32 PM:
> On Wed, Dec 07, 2011 at 01:58:26PM -0700, Stephen Warren wrote:
> 
> > +	audio-routing =
> > +		"Headphone Jack", "HPOUTR",
> > +		"Headphone Jack", "HPOUTL",
> > +		"Int Spk", "ROP",
> > +		"Int Spk", "RON",
> > +		"Int Spk", "LOP",
> > +		"Int Spk", "LON",
> > +		"Mic Jack", "MICBIAS",
> > +		"IN1L", "Mic Jack";
> 
> Before we do this we first need to come up with a way of specifying the
> DAPM nodes.  For the CODEC pins I'm fairly comfortable with just
> documenting the fact that we want to use the pins as labelled on the
> CODEC datsheet but for other objects on the board we need to come up
> with something.  The tricky bit here is jacks - we need to be able to
> express headsets, translate them into the separate input and output
> widgets that DAPM uses while coping with multiple biases and custom
> detection methods.

I'd originally made this property specific to the Tegra+WM8903 machine
driver, and you'd asked me to make it generic. Is there room to use
the binding above for the Tegra+WM8903 machine driver only, in order
to get the driver converted to DT, then define/implement something
completely generic to replace it, i.e. the stuff below?

This would be a fair bit of work to implement, but what are your thoughts
on the binding example below? It's very strongly based on ASoC, but since
that's so strongly based on the HW, I think you can consider it a pure
HW model rather than something derived from the way the driver works.

(The example isn't meant to represent any particular machine, although I
stole a bunch of it from Harmony to start with)

wm8903.dtsi:

/define/ WM8903_PORT_I2S0 0
/define/ WM8903_PIN_HPOUTL 0
/define/ WM8903_PIN_HPOUTR 1
...

tegra-harmony.dts:

wm8903: wm8903@... {
	#embedded-audio-pin-cells = <1>;
	#embedded-audio-port-cells = <1>;
};

i2s1: i2s@... {
	#embedded-audio-port-cells = <0>;
};

sound {
	compatible = "nvidia,tegra-audio-wm8903-harmony",
		     "nvidia,tegra-audio-wm8903"
	model = "NVIDIA Tegra Harmony";

	/*
	 * This is a more device-tree-idiomatic way of representing the
	 * routing table (using phandles and pin IDs) rather than text.
	 * This assumes my /define/ feature in dtc for the symbolic
	 * names
	 */
	audio-routing = <
		&hp                     &wm8903 WM8903_PIN_HPOUTR
		&hp                     &wm8903 WM8903_PIN_HPOUTL
		&spk                    &wm8903 WM8903_PIN_ROP
		&spk                    &wm8903 WM8903_PIN_RON
		&spk                    &wm8903 WM8903_PIN_LOP
		&spk                    &wm8903 WM8903_PIN_LON
		&imic                   &wm8903 WM8903_PIN_MICBIAS
		&wm8903 WM8903_PIN_IN1L &imic
	>;

	/*
	 * A completely generic OF binding would need nodes representing
	 * DAI links, but this binding just for Tegra+WM8903 can assume
	 * just a single link, and hence put the properties right here.
	 */
	nvidia,i2s-controller = <&i2s1>;
	nvidia,audio-codec = <&wm8903 WM8903_PORT_I2S0>;

	spk: endpoint@0 {
		compatible = "embedded-audio-endpoint";
		name = "Int Speakers";
		type = "Speakers";
		#embedded-audio-pin-cells = <0>;
		enable-gpios = <&codec 2 0>;
	};

	hp: endpoint@1 {
		compatible = "embedded-audio-endpoint";
		name = "Headphones";
		type = "Headphone";
		#embedded-audio-pin-cells = <0>;
		/*
		 * GPIO inversion: Could be handled with separate
		 * {en,dis}able-gpios properties as here, or could be
		 * represented in the GPIO controller's binding,
		 * i.e. the extra GPIO cells.
		 */
		/*
		 * This is really used for "hp_mute" on Kaen; perhaps
		 * mute is different to disable...
		 */
		disable-gpios = <&gpio NNN 0>;
	};

	emic: endpoint@2 {
		compatible = "embedded-audio-endpoint";
		name = "Ext Microphone";
		type = "Microphone";
		#embedded-audio-pin-cells = <0>;
		enable-gpios = <&gpio 184 0>; /* gpio PX0 */
	};

	imic: endpoint@3 {
		compatible = "embedded-audio-endpoint";
		name = "Int Microphone";
		type = "Microphone";
		#embedded-audio-pin-cells = <0>;
		supply = <&reg-dmic>;
	};

	lin: endpoint@4 {
		compatible = "embedded-audio-endpoint";
		name = "Line In";
		type = "Line Input";
		#embedded-audio-pin-cells = <0>;
	};

	lout: endpoint@5 {
		compatible = "embedded-audio-endpoint";
		name = "Line Out";
		type = "Line Output";
		#embedded-audio-pin-cells = <0>;
	};

	headsetj: jack@0 {
		compatible = "embedded-audio-jack";
		hosts = <&hp &emic>;
	};

	linj: jack@1 {
		compatible = "embedded-audio-jack";
		hosts = <&lin>;
	};

	loutj: jack@2 {
		compatible = "embedded-audio-jack";
		hosts = <&lout>;
	};

	gpio@0 {
		compatible = "embedded-audio-detect-gpio";
		gpio = <&gpio 178 0>; /* gpio PW2 */
		/*
		 * GPIO inversion: Could use an explicit property here,
		 * or, could be represented in the GPIO controller's
		 * binding, i.e. the extra GPIO cells.
		 */
		debounce-interval = <250>; /* mS */
		/*
		 * Always the whole jack here, or do we need to specify
		 * which endpoints within the jack?
		 */
		affected-jack = <&linj>;
	};

	micbias@0 {
		/*
		 * Is "micbias" the correct name here? Perhaps current-
		 * detect? If all mics need a mic bias, so it's a well
		 * known name, it's OK.
		 */
		compatible = "embedded-audio-detect-micbias";
		/*
		 * Here, I'm assuming that struct snd_soc_codec_driver
		 * would gain a generic "start mic detect" function, so
		 * a generic machine driver could activate that without
		 * having to link against e.g. wm8903_mic_detect().
		 */
		micbias = <&wm8903 WM8903_PIN_MICBIAS>;
		/*
		 * "1" below is index into headsetj's hosted endpoints.
		 * Perhaps this should reference <&imic> instead, and
		 * then map that back to the jack?
		 */
		affected-jack-endpoint = <&headsetj 1>;
	};

	/*
	 * Custom detection methods could be implemented by additional
	 * nodes with their own compatible values and bindings, hence
	 * handled entirely by that custom code.
	 */
};

-- 
nvpublic
