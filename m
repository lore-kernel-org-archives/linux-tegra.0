From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: tegra-xusb: Fix allocation of pins
Date: Tue, 19 May 2015 16:23:15 +0100
Message-ID: <555B5563.5060604@nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com> <1432044863-2035-3-git-send-email-jonathanh@nvidia.com> <20150519143340.GE26748@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519143340.GE26748-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/05/15 15:33, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 19, 2015 at 03:14:22PM +0100, Jon Hunter wrote:
> [...]
> 
> One more thing:
> 
> [...]
>> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
>> index 3e8e4a914fb4..c61594066e26 100644
>> --- a/drivers/pinctrl/pinctrl-tegra-xusb.c
>> +++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
>> @@ -125,6 +125,23 @@ static const char *tegra_xusb_padctl_get_group_name(struct pinctrl_dev *pinctrl,
>>  	return padctl->soc->pins[group].name;
>>  }
>>  
>> +static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinctrl,
>> +					    unsigned group,
>> +					    const unsigned **pins,
>> +					    unsigned *num_pins)
>> +{
>> +	struct tegra_xusb_padctl *padctl = pinctrl_dev_get_drvdata(pinctrl);
>> +
>> +	/*
>> +	 * For the tegra-xusb pad controller groups are synonomous
>> +	 * with lanes/pins and there is always one lane/pin per group.
>> +	 */
>> +	*pins = &padctl->soc->pins[group].number;
> 
> Shouldn't this be the same as pinctrl->desc->pins? In that case, maybe a
> better solution would be to make .get_group_pins() mandatory again and
> turn this into a pinctrl helper function that can be used by all group-
> only pinctrl drivers?

Yes I believe that you are right. However, I don't think a helper
function would work here, because this function returns a pointer to an
array of pin numbers. In the case of xusb this is simplified a bit
because we are only returning a single number here for the group.
However, if you look at other pinctrl devices (such as pinctrl-tegra.c)
there could be more than one number in the array.

Cheers
Jon
