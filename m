From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/8] usb: gadget: tegra-xudc: Add vbus_draw support
Date: Mon, 4 May 2020 09:40:48 +0530
Message-ID: <b22b696b-69db-a680-f3c6-a54ec6c7acad@nvidia.com>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-3-git-send-email-nkristam@nvidia.com>
 <20200428095956.GB3592148@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200428095956.GB3592148@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 28-04-2020 15:29, Thierry Reding wrote:
>> @@ -2042,6 +2044,19 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
>>   	return 0;
>>   }
>>   
>> +static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
>> +						unsigned int m_a)
>> +{
>> +	struct tegra_xudc *xudc = to_xudc(gadget);
>> +
>> +	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
>> +
>> +	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
>> +		usb_phy_set_power(xudc->curr_usbphy, m_a);
> Do we need to propagate the error code here in case the USB PHY for some
> reason doesn't support the given current? Or is it guaranteed that we
> always do support whatever is passed in here?
> 
> Regardless of whether we support it or not, it might still be useful to
> add proper handling, if for nothing else but to set a good example.
> 
> Thierry
Will update accordingly, propagate the return the code to caller.
