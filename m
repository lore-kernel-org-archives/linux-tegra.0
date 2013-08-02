From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] usb: phy: tegra: Fix wrong PHY parameters
Date: Fri, 2 Aug 2013 17:15:39 +0300
Message-ID: <51FBBF0B.5020908@nvidia.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com> <1375292522-7855-3-git-send-email-ttynkkynen@nvidia.com> <51FACE74.3070909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51FACE74.3070909-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/02/2013 12:09 AM, Stephen Warren wrote:
> On 07/31/2013 11:41 AM, Tuomas Tynkkynen wrote:
>> Some of the PHY parameters are not set according to the TRMs:
>>
>> - UTMIP_FS_PREABMLE_J should be set, not cleared
>> - UTMIP_XCVR_LSBIAS_SEL should be cleared, not set
>> - UTMIP_PD_CHRG should be set in host mode and cleared in device mode
>> - UTMIP_XCVR_SETUP is a two-part field; the upper bits were not set
> 
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> 
>>  #define   UTMIP_XCVR_SETUP(x)			(((x) & 0xf) << 0)
>> +#define   UTMIP_XCVR_SETUP_MSB(x)		((((x) & 0x7f) >> 4) << 22)
> 
> You may as well s/0x7f/0x70/ since the shift clears the 4 LSBs. I'm
> pretty sure I mentioned this in downstream review. Perhaps check my
> review comments to see if anything else was missed?
> 

Well in my opinion that increases the risk of typoing the mask.
I'll fix along with the other things.
