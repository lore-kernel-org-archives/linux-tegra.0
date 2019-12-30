From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V2 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Mon, 30 Dec 2019 10:47:25 +0530
Message-ID: <ba264e94-33c9-41bb-be23-3a8cad6cef52@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-4-git-send-email-nkristam@nvidia.com>
 <20191219132650.GJ1440537@ulmo>
 <74d94004-2022-3b04-6cd9-d6b1e9eca230@nvidia.com>
 <20191229093643.GA47966@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191229093643.GA47966@mithrandir>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 29-12-2019 15:06, Thierry Reding wrote:
> On Fri, Dec 27, 2019 at 12:09:22PM +0530, Nagarjuna Kristam wrote:
>> On 19-12-2019 18:56, Thierry Reding wrote:
>>> On Wed, Dec 18, 2019 at 02:46:16PM +0530, Nagarjuna Kristam wrote:
> [...]
>>>> @@ -551,11 +556,42 @@ static const char *const modes[] = {
>>>>    	[USB_DR_MODE_OTG] = "otg",
>>>>    };
>>>> +static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
>>>> +{
>>>> +	dev_dbg(dev, "%s calling notifier for role is %d\n", __func__, role);
>>> I don't understand what "for role is %d" means here. I think perhaps you
>>> meant to simply say "for role %d"? Also, perhaps add parentheses after
>>> the "%s" to clarify that you're referring to a function.
>>>
>> Yes, intention is to print role, Will update as mentioned "for role %d"
> It might be better to print the name of the role here because I suspect
> very few people know the value of the role defines without looking them
> up. I thought there was already a function to return the role name for
> a given enum usb_role, but it seems like we only have name -> enum
> conversion. Might be worth adding that, but doesn't have to be as part
> of this series.
> 
> Thierry

Will add a structure to define strings for roles enums, similar to modes
usage in this driver.

-Nagarjuna
