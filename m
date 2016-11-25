From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 25 Nov 2016 17:10:26 +0530
Message-ID: <5838232A.7040702@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com> <1479976734-30498-2-git-send-email-ldewangan@nvidia.com> <20161125091354.GA11512@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125091354.GA11512-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 25 November 2016 02:43 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, Nov 24, 2016 at 02:08:53PM +0530, Laxman Dewangan wrote:
>> +
>> +The DT property of the IO pads must be under the node of pmc i.e.
>> +pmc@7000e400 for Tegra124 onwards.
> The PMC is at a different address on Tegra186, so I think we should just
> drop this to avoid having to update it whenever a new chip relocates it
> to a different address.

I wanted to provide the example. So let me say that "i.e. pmc@7000e400 
for Tegra124". In this way we will not need to update for every chips 
and also give idea bout the node.

>
> Come to think of it, if these I/O pads are represented as subnodes in
> the PMC device tree node, perhaps this should be merged into the PMC
> documentation?

Based on my MFD and sub devices experience, maintainers prefer to have  
different DT binding document for subsystem child devices.
So if we say the io-pad is sub device of pmc then it will be in 
respective subsystem dt binding.
>
>> +
>> +See the TRM to determine which properties and values apply to each IO pads.
> Perhaps give a reference to where in the TRM this can be found?
Do we have fixed link for the TRM? and do we really need to provide the 
link here? If link get changed then we will need to change all places.


>
>> +low-power-enable:		enable low power mode.
>> +low-power-disable:		disable low power mode.
> Why the extra padding with tabs? I find that difficult to read. Also, no
> need for a fullstop since it's not a proper sentence.

Just to make proper alignment. Regular typing is not preferred in general.

>> +IO voltage pin names are as follows:
>> +	audio -> vddio-audio
>> +	audio-hv -> vddio-audio-hv
>> +	cam ->vddio-cam
>> +	dbg -> vddio-dbg
>> +	dmic -> vddio-dmic
>> +	gpio -> vddio-gpio
>> +	pex-ctrl -> vddio-pex-ctrl
>> +	sdmmc1 -> vddio-sdmmc1
>> +	sdmmc3 -> vddio-sdmmc3
>> +	spi -> vddio-spi
>> +	spi-hv -> vddio-spi-hv
>> +	uart -> vddio-uart
> It's slightly confusing to only have this list for Tegra210. I assume
> that is because on Tegra124 there is no way to control the voltage of
> the pins, but I think that could be made clearer.

I think I made it in first few paragraph of this document but will add 
here also.

>   Also, it might be
> worth explicitly mentioning that this is a subset of the list of pins
> given above and that the other pins (those not in this list) don't
> support 1.8/3.3 V control, but only the low power state.
ok.

>
> +			audio-hv {
> +				pins = "audio-hv";
> +				low-power-disable;
> +			};
> I wonder if this is at all useful. Shouldn't we rather put all pads into
> a low-power state by default and only take them out of the low-power
> state when the driver decides to do so?
>

We can not do this all disable by default and enable by driver. it may 
be possible that some of io-pads need to be enable during boot.

We need to only depends on platform specific data provided from DT here 
for configurations.

However, for dynamic control, driver can use pinctrl framework for 
optimizing the power.
