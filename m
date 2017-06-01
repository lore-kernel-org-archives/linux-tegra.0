From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Thu, 1 Jun 2017 12:05:09 +0530
Message-ID: <CAFp+6iG9JyCeaFCA48eW7E6SmxdPTM7AfmfW1KG6bx0DwDt04A@mail.gmail.com>
References: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
 <1495452207-6129-5-git-send-email-vivek.gautam@codeaurora.org> <53360973-098e-14fa-88e9-b0864822359a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53360973-098e-14fa-88e9-b0864822359a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, May 31, 2017 at 7:53 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 22/05/17 12:23, Vivek Gautam wrote:
>> Make use of reset_control_array_*() set of APIs to manage
>> an array of reset controllers available with the device.
>>
>> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  drivers/soc/tegra/pmc.c | 91 +++++++++++++++++--------------------------------
>>  1 file changed, 31 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index e233dd5dcab3..668f5d3d3635 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -124,8 +124,8 @@ struct tegra_powergate {
>>       unsigned int id;
>>       struct clk **clks;
>>       unsigned int num_clks;
>> -     struct reset_control **resets;
>> -     unsigned int num_resets;
>> +     struct reset_control *reset;
>> +     struct reset_control_array *resets;
>
> It's a shame we can't avoid this additional reset pointer, but maybe
> there is no good alternative for now. So ...
>
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks for the testing and Ack.

Best regards
Vivek

>
> Cheers
> Jon
>
> --
> nvpublic
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
