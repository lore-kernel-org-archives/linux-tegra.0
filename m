From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/8] usb: chipidea: Add support for Tegra20/30/114/124
Date: Mon, 31 Jul 2017 13:13:42 +0300
Message-ID: <0c409a4d-07b3-29bc-dafd-2e573c6975c6@gmail.com>
References: <cover.1501173271.git.digetx@gmail.com>
 <f103baa439a64b517e6c8cb51c30e81987dfedb3.1501173271.git.digetx@gmail.com>
 <20170727223223.ezyzvmum7c773vel@qmqm.qmqm.pl>
 <832adea3-b5f2-a28c-6be4-0f572052821b@gmail.com>
 <20170728155115.kn2o7iei5yhzmpdq@qmqm.qmqm.pl>
 <20170731011438.GA15241@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731011438.GA15241@b29397-desktop>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 31.07.2017 04:14, Peter Chen wrote:
> On Fri, Jul 28, 2017 at 05:51:16PM +0200, Michał Mirosław wrote:
>> On Fri, Jul 28, 2017 at 01:00:32PM +0300, Dmitry Osipenko wrote:
>>> On 28.07.2017 01:32, Michał Mirosław wrote:
>>>> On Thu, Jul 27, 2017 at 07:46:07PM +0300, Dmitry Osipenko wrote:
>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> All of these Tegra SoC generations have a ChipIdea UDC IP block that can
>>>>> be used for device mode communication with a host. Implement rudimentary
>>>>> support that doesn't allow switching between host and device modes.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> [digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: rebased patches and added DMA alignment quirk for Tegra20]
>>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> Acked-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
>>>>
>>>> This works on my Asus TF300T (Tegra3 device). Minor nit below.
>>>>
>>>> Tested-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org> (on tf300t)
>>>>
>>>
>>> Nice, thank you!
>>>
>>>> [...]
>>>>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>> new file mode 100644
>>>>> index 000000000000..7814500e71fa
>>>>> --- /dev/null
>>>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>> @@ -0,0 +1,160 @@
>>>> [...]
>>>>> +struct tegra_udc_soc_info {
>>>>> +	bool supports_unaligned_dma;
>>>>> +};
>>>> [...]
>>>>> +static const struct tegra_udc_soc_info tegra20_udc_soc_info = {
>>>>> +	.supports_unaligned_dma = false,
>>>>> +};
>>>>> +
>>>>> +static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
>>>>> +	.supports_unaligned_dma = true,
>>>>> +};
>>>>> +
>>>>> +static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
>>>>> +	.supports_unaligned_dma = true,
>>>>> +};
>>>>> +
>>>>> +static const struct tegra_udc_soc_info tegra124_udc_soc_info = {
>>>>> +	.supports_unaligned_dma = true,
>>>>> +};
>>>>> +
>>>>> +static const struct of_device_id tegra_udc_of_match[] = {
>>>>> +	{
>>>>> +		.compatible = "nvidia,tegra20-udc",
>>>>> +		.data = &tegra20_udc_soc_info,
>>>>> +	}, {
>>>>> +		.compatible = "nvidia,tegra30-udc",
>>>>> +		.data = &tegra30_udc_soc_info,
>>>>> +	}, {
>>>>> +		.compatible = "nvidia,tegra114-udc",
>>>>> +		.data = &tegra114_udc_soc_info,
>>>>> +	}, {
>>>>> +		.compatible = "nvidia,tegra124-udc",
>>>>> +		.data = &tegra124_udc_soc_info,
>>>>> +	}, {
>>>>> +		/* sentinel */
>>>>> +	}
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, tegra_udc_of_match);
>>>> [...]
>>>>> +static int tegra_udc_probe(struct platform_device *pdev)
>>>>> +{
>>>> [...]
>>>>> +	/* setup device specific quirks */
>>>>> +	soc = id->data;
>>>>> +
>>>>> +	if (!soc->supports_unaligned_dma)
>>>>> +		udc->data.flags |= CI_HDRC_REQUIRES_ALIGNED_DMA;
>>>> [...]
>>>>
>>>> Some lines would be saved if this was just:
>>>>
>>>> udc->data.flags |= id->data;
>>>>
> 
> I prefer this way too, and add CI_HDRC_REQUIRES_ALIGNED_DMA as
> platform flags for necessary SoCs.
> 

Okay, please let me know if there are any other nitpicks.

-- 
Dmitry
