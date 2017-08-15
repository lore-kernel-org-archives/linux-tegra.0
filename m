From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/8] usb: gadget: f_ecm/f_eem/f_rndis: Setup
 quirk_avoids_skb_reserve
Date: Tue, 15 Aug 2017 18:45:11 +0300
Message-ID: <06f351c4-039e-e3bb-1989-8b99ab4a5584@gmail.com>
References: <cover.1502280694.git.digetx@gmail.com>
 <4c7b3a3b23b44f4115de1745c65d719a3f70c4db.1502280695.git.digetx@gmail.com>
 <87k2256tz0.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87k2256tz0.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 15.08.2017 12:49, Felipe Balbi wrote:
> Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> This quirk is required to make USB Ethernet gadget working with HW that
>> can't cope with unaligned DMA. For some reason only f_ncm handles that
>> quirk, let's handle it in the rest of the network models. All models have
>> been tested with a ChipIdea UDC driver on NVIDIA Tegra20 SoC that require
>> DMA to be aligned.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/gadget/function/f_ecm.c   | 7 +++++++
>>  drivers/usb/gadget/function/f_eem.c   | 5 +++++
>>  drivers/usb/gadget/function/f_rndis.c | 4 ++++
>>  3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
>> index 4c488d15b6f6..1d198055fd74 100644
>> --- a/drivers/usb/gadget/function/f_ecm.c
>> +++ b/drivers/usb/gadget/function/f_ecm.c
>> @@ -584,6 +584,13 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
>>  			 */
>>  			ecm->port.is_zlp_ok =
>>  				gadget_is_zlp_supported(cdev->gadget);
>> +
>> +			/* Setup DMA alignment workaround for UDC's that
>> +			 * need it.
>> +			 */
>> +			ecm->port.no_skb_reserve =
>> +				gadget_avoids_skb_reserve(cdev->gadget);
> 
> looks like the quirk should be moved to u_ether.c instead.
> 

Indeed, thank you very much for the suggestion. I'll prepare a new revision of
the patch.

-- 
Dmitry
