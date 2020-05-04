From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 4/4] usb: gadget: tegra-xudc: add port_speed_quirk
Date: Mon, 4 May 2020 09:33:37 +0530
Message-ID: <691d5a8e-0ca8-e763-9b85-54625db84076@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
 <20200428122512.GN3592148@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200428122512.GN3592148@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 28-04-2020 17:55, Thierry Reding wrote:
> 
> On Thu, Apr 16, 2020 at 01:04:20PM +0530, Nagarjuna Kristam wrote:
>> Add port_speed_quirk that modify below registers to limit/restore OTG
>> port speed to GEN1/GEN2.
>> SSPX_CORE_CNT56
>> SSPX_CORE_CNT57
>> SSPX_CORE_CNT65
>> SSPX_CORE_CNT66
>> SSPX_CORE_CNT67
>> SSPX_CORE_CNT72
>>
>> The basic idea is to make SCD intentionally fail, reduce SCD timeout and
>> force device transit to TSEQ. Enable this flag to only Tegra194.
>>
>> Based on work by WayneChang<waynec-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
> You're telling readers what you're doing, but after reading the commit
> message, I have no idea why this is being done. Can you provide more
> information on why exactly is this needed? Why do we have to limit the
> OTG port speed?
> 
> Thierry
Will re-word the commit message to explain on why this is needed.

Thanks,
Nagarjuna
