From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH V2 6/8] phy: tegra: xusb: Add support for charger detect
Date: Mon, 11 May 2020 08:49:37 +0530
Message-ID: <229333de-8dd6-2d09-c8ad-99afdcec703f@nvidia.com>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-7-git-send-email-nkristam@nvidia.com>
 <20200428105510.GH3592148@ulmo>
 <ea0f5906-4681-8b84-a55a-e959ce40aece@nvidia.com>
 <20200504155029.GB614153@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200504155029.GB614153@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 04-05-2020 21:20, Thierry Reding wrote:
> 
> On Mon, May 04, 2020 at 02:32:51PM +0530, Nagarjuna Kristam wrote:
>>> On 28-04-2020 16:25, Thierry Reding wrote:
>>>> On Wed, Apr 15, 2020 at 01:55:06PM +0530, Nagarjuna Kristam wrote:
> [...]
>>>> diff --git a/drivers/phy/tegra/xusb-tegra-cd.c b/drivers/phy/tegra/xusb-tegra-cd.c
>>>> +static void tegra_xusb_padctl_utmi_pad_dcd(struct tegra_xusb_padctl *padctl,
>>>> +					      u32 index)
>>>> +{
>>>> +	u32 value;
>>>> +	int dcd_timeout_ms = 0;
>>>> +	bool ret = false;
>>>> +
>>>> +	/* Turn on IDP_SRC */
>>>> +	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
>>>> +	value |= OP_I_SRC_EN;
>>>> +	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
>>>> +
>>>> +	/* Turn on D- pull-down resistor */
>>>> +	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>>>> +	value |= USBON_RPD_OVRD_VAL;
>>>> +	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>>>> +
>>>> +	/* Wait for TDCD_DBNC */
>>>> +	usleep_range(10000, 120000);
>>>   From the comment this looks like we're waiting for some hardware
>>> condition. Can we somehow obtain this rather than implementing a fixed
>>> sleep? Especially since the range here is so large.
>>>
>> As per data sheet we need to wait for 10 micro seconds as settle time.
> Okay, so TDCD_DBNC is a value that comes from a timing diagram in a
> datasheet? Seems fine to leave it as-is then. Perhaps add parentheses
> and mention which exact datasheet that's from, and perhaps which figure
> so that people can more easily reference it. Provided there is a
> publicly available datasheet, of course.
> 
Will update reference to table in the data sheet where these values are 
recommended. ITs part of BC 1.2 spec from USB.

> Actually, one other thing: If the data sheet says to wait 10 us, why do
> you use an upper range of 120 us? Shouldn't a range of 10-20 us be good
> enough?
> Yes, will reduce it to 20ms.

-Nagarjuna
