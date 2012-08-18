From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH REBASE 1/2] i2c: tegra: I2_M_NOSTART functionality not
 supported in Tegra20
Date: Sat, 18 Aug 2012 18:20:11 +0530
Message-ID: <502F8F83.5030902@nvidia.com>
References: <1345230155-4252-1-git-send-email-ldewangan@nvidia.com> <20120818124703.GC12839@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120818124703.GC12839-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks for review.

On Saturday 18 August 2012 06:17 PM, Wolfram Sang wrote:
> * PGP Signed by an unknown key
>
> On Sat, Aug 18, 2012 at 12:32:34AM +0530, Laxman Dewangan wrote:
>> +	bool has_continue_xfer_support;
> I wonder if it makes sense to carry a pointer here to the
> tegra_i2c_hw_feature in use instead of copying all entries by hand,
> since they might get more and more.
>

Ok, we can store the hw pointer in device structure. I will send the new 
patch.

>>   };
>>
>>   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long reg)
>> @@ -563,7 +574,17 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>   	if (i2c_dev->is_suspended)
>>   		return -EBUSY;
>>
>> -	clk_prepare_enable(i2c_dev->div_clk);
>> +	/* Support I2C_M_NOSTART only if HW support continue xfer. */
>> +	for (i = 0; i<  num - 1; i++) {
>> +		if ((msgs[i + 1].flags&  I2C_M_NOSTART)&&
>> +			!i2c_dev->has_continue_xfer_support) {
>> +			dev_err(i2c_dev->dev,
>> +				"mesg %d have illegal flag\n", i + 1);
>> +			return -EINVAL;
>> +		}
>> +	}
> Drivers are requested to explicitly check for features of the I2C bus
> (like M_NOSTART) before using them, so I'd skip this extra check.
>

Ok, I kept this as part of flag checking so illegal flag should not be 
passed. I will remove this on next version patch.

>> +
>> +	clk_prepare_enable(i2c_dev->clk);
>  From a glimpse, this change looks unrelated at least. Even wrong, no?
>

It was already there, just before above check. Due to insertion of 
check, this code shifted, otherwise it is not a new code.
