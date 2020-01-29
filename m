From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch V3 12/18] usb: gadget: tegra-xudc: support multiple device
 modes
Date: Wed, 29 Jan 2020 12:20:09 +0530
Message-ID: <7478f53a-c236-5442-8abb-7531edb89b29@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-13-git-send-email-nkristam@nvidia.com>
 <20200128181020.GJ2293590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200128181020.GJ2293590@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 28-01-2020 23:40, Thierry Reding wrote:
>>   	struct tegra_xudc_save_regs saved_regs;
>>   	bool suspended;
>>   	bool powergated;
>>   
>> -	struct usb_phy *usbphy;
>> +	struct usb_phy **usbphy;
>> +	int current_phy_index;
> Can be unsigned int. It's also very long. It might be better to choose a
> shorter name so that when you use it, the lines don't get excessively
> long. Alternatively you could keep this field name and instead declare
> local variables to reference the current PHY to make lines shorter.
> 
> Actually, looking at this a bit more, I don't see current_phy_index ever
> used by itself (other than the assignment and one check to see if a PHY
> has been selected). So why not just store a pointer to the current PHY
> and avoid all the dereferencing?
> 
> Thierry

current_phy_index main purpose is to quickly get which index for USB 2 
and 3 phy's to be used. This is used at mulitple functions. Based on 
your comment above, I believe its good to use 2 pointers for UTMI and 
USB 3 phy's, which are points to current phy index. This ensures to keep 
line length as less as possible.

Thanks,
Nagarjuna
