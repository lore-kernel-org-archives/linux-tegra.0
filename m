From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] usb: phy: tegra: Add support for device tree-based
 vbus regulator control
Date: Thu, 27 Jun 2013 10:20:43 +0300
Message-ID: <op.wzbtct1hpdlnwf@mperttunen-lnx>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-2-git-send-email-mperttunen@nvidia.com>
 <51CB217B.1040308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CB217B.1040308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 26 Jun 2013 20:14:35 +0300, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>  
wrote:

> On 06/26/2013 03:59 AM, Mikko Perttunen wrote:
>> After this patch, usb vbus regulators for tegra usb phy devices can be  
>> specified
>> with the device tree attribute vbus-supply = <&x> where x is a  
>> regulator defined
>> in the device tree.
>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c  
>> b/drivers/usb/phy/phy-tegra-usb.c
>
>> @@ -250,12 +251,24 @@ static int utmip_pad_open(struct tegra_usb_phy  
>> *phy)
>>  		return PTR_ERR(phy->pad_clk);
>>  	}
>>
>> +	phy->vbus = devm_regulator_get(phy->dev, "vbus");
>> +	/* On some boards, the VBUS regulator doesn't need to be controlled */
>> +	if (IS_ERR(phy->vbus)) {
>> +		if (PTR_ERR(phy->vbus) == -ENODEV) {
>> +			dev_notice(phy->dev, "no vbus regulator");
>> +			phy->vbus = NULL;
>> +		} else {
>> +			return PTR_ERR(phy->vbus);
>> +		}
>> +	}
>
> I think this code should be added to some more core initialization
> function; IIRC, there are separate utmip_pad_open() and some other
> function for ULPI mode, and in the future there may be more for HSIC,  
> etc.

I don't think ULPI and VBUS have a VBUS pin, though. The pinmux doesn't
even list a pin for USB2 which is a ULPI/HSIC only controller.

>
> For the error-handling, I think it'd be better to do:
>
> * If property doesn't exist, set phy->vbus to some error value, e.g.
> ERR_PTR(-ENODEV).
> * If property does exist, call devm_regulator_get().
> ** If devm_regulator_get() returned any error, return it.
>
> Or, does devm_regulator_get() return -ENODEV if-and-only-if the
> vbus-supply DT property does not exist?

Yes, devm_regulator_get uses regulator_dev_lookup which returns -ENODEV
if of_reg_regulator returns NULL, and there is no other place a -ENODEV
could be returned from. Comment in regulator_dev_lookup:

	/*
	 * If we couldn't even get the node then it's
	 * not just that the device didn't register
	 * yet, there's no node and we'll never
	 * succeed.
	 */
	*ret = -ENODEV;

>
> and ...
>
>> @@ -280,6 +293,14 @@ static void utmip_pad_power_on(struct  
>> tegra_usb_phy *phy)
>>  	spin_unlock_irqrestore(&utmip_pad_lock, flags);
>>
>>  	clk_disable_unprepare(phy->pad_clk);
>> +
>> +	if (phy->vbus) {
>
> Here, check if (IS_ERR(phy->vbus) instead. The reason is if
> devm_regulator_get() returns either a valid value or an error-pointer,
> then NULL could in theory be a valid value (it's up the the regulator
> API to determine that), and hence this code shouldn't assume that it can
> use NULL to represent "no regulator".

I'll fix this along with the problems with the other patches.

- Mikko
