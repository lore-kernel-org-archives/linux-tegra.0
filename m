From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Fri, 25 Nov 2016 17:34:37 +0530
Message-ID: <583828D5.5060507@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com> <1479976734-30498-3-git-send-email-ldewangan@nvidia.com> <20161125095744.GB11512@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161125095744.GB11512@ulmo.ba.sec>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, swarren@wwwdotorg.org, gnurou@gmail.com, jonathanh@nvidia.com, joe@perches.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Thanks Thierry for review.

On Friday 25 November 2016 03:27 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
>> +	  NVIDIA Tegra124/210 SoC has IO pads which supports multi-voltage
>> +	  level of interfacing and deep power down mode of IO pads. The
>> +	  voltage of IO pads are SW configurable based on IO rail of that
>> +	  pads on T210. This driver provides the interface to change IO pad
>> +	  voltage and power state via pincontrol interface.
> This has a lot of chip-specific text. Will all of that have to be
> updated if support for new chips is added?

Then saying that Tegra124 and later..
Hoping, people know our chip releasing sequence as numbering are not in 
sequence.

>
>> +#include <linux/regulator/consumer.h>
>> +#include <soc/tegra/pmc.h>
> Have you considered moving this code into the PMC driver? It seems a
> little over the top to go through all of the platform device creation
> and driver registration dance only to call into a public API later on.

Yes, we had discussion on this and suggestion came to use the pinctrl 
framework.
If we do in the pmc driver then we will need lots of DT processing for 
getting information from DT which we can directly get from the pinctrl 
core framework.
Also client driver may need to have the control dynamically and get the 
IO pads from DT. So implementing all in pmc will be huge duplication 
over already existing framework.



>
>> +#include "../core.h"
>> +#include "../pinconf.h"
>> +#include "../pinctrl-utils.h"
>> +
>> +#define TEGRA_IO_RAIL_1800000UV 1800000
>> +#define TEGRA_IO_RAIL_3300000UV 3300000
> Is there really a point in having these defines? They are really long
> and effectively don't carry more information than just the plain
> numbers.


using macros is always good instead of magic number in code and hence it 
is there.

>
>
>> +#define tegra_io_uv_to_io_pads_uv(io_uv)				\
>> +		(((io_uv) == TEGRA_IO_RAIL_1800000UV) ?			\
>> +		  TEGRA_IO_PAD_1800000UV : TEGRA_IO_PAD_3300000UV)
>> +
>> +#define tegra_io_voltage_is_valid(io_uv)			\
>> +	({ typeof(io_uv) io_uv_ = (io_uv);			\
>> +	    ((io_uv_ == TEGRA_IO_RAIL_1800000UV) ||		\
>> +	     (io_uv_ == TEGRA_IO_RAIL_3300000UV)); })
>>
> Maybe make both of these static inline functions to improve readability?
> I find the above very hard to read.

OK, will convert to the inline but dont think it will be less complex.
>> +	enum tegra_io_pad_voltage pad_volt;
>>
>> +
>>
>> +
>> +#define TEGRA_IO_PAD_INFO(_pin, _name, _id, _lpstate, _vsupply)	\
>> +	{							\
>> +		.name = _name,					\
>> +		.pins = {(_pin)},				\
>> +		.id = TEGRA_IO_PAD_##_id,			\
>> +		.vsupply = (_vsupply),				\
>> +		.supports_low_power = (_lpstate),		\
>> +	}
>> +
>> +static const struct tegra_io_pads_cfg tegra124_io_pads_cfg_info[] = {
>> +	TEGRA124_PAD_INFO_TABLE(TEGRA_IO_PAD_INFO),
>> +};
>> +
>> +static const struct tegra_io_pads_cfg tegra210_io_pads_cfg_info[] = {
>> +	TEGRA210_PAD_INFO_TABLE(TEGRA_IO_PAD_INFO),
>> +};
> That's a weird way of writing these tables. Why not do something simpler
> and much more common such as:
>
> 	#define TEGRA_IO_PAD_INFO(...) ...
>
> 	static const struct tegra_io_pads_cfg tegra124_io_pads_cfgs[] = {
> 		TEGRA_IO_PAD_INFO(...),
> 		...
> 	};
>
> 	static const struct tegra_io_pads_cfg tegra210_io_pad_cfgs[] = {
> 		TEGRA_IO_PAD_INFO(...),
> 		...
> 	};

This is done to use the same table for initialing two different 
structure. If we go as above  then we will endup with the two tables.

or define and then redefine the TEGRA_IO_PAD_INFO.


>
>> +
>>
>> +
>> +module_platform_driver(tegra_io_pads_pinctrl_driver);
>> +
>> +MODULE_DESCRIPTION("NVIDIA TEGRA IO pad Control Driver");
>> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
>> +MODULE_LICENSE("GPL v2");
> Like I said above, I think there's a lot of boilerplate in here that's
> simply there to create a virtual device and bind a driver to it. All of
> that comes with very little to no benefit. I think this could all just
> be moved into the PMC driver and be simplified quite a bit.
>

What did you not like here?
Let me specific to my query to get idea about your view:
1. Do you agree for the interface as pinctrl here?
2. Do you want to call the probe() function implemented here as simple 
function call from pmc's probe?
3. If (2) is yes then how do you want to differentiate T124 or T210? Via 
argument?

It will be really help if you can provide the pseudo code from PMC and 
this driver so that I can implement the same in the next patch.


