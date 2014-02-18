From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: palmas: support IRQ inversion at the board level
Date: Tue, 18 Feb 2014 10:42:05 -0700
Message-ID: <53039B6D.8080004@wwwdotorg.org>
References: <1392415108-4365-1-git-send-email-swarren@wwwdotorg.org> <20140217092658.GC17875@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140217092658.GC17875@lee--X1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/17/2014 02:26 AM, Lee Jones wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Some boards or SoCs have an inverter between the PMIC IRQ output pin and
>> the IRQ controller input signal.
>>
>> The IRQ specifier in DT is meant to represent the IRQ flags at the input
>> to the IRQ controller.
>>
>> The Palmas HW's IRQ output has configurable polarity. The driver
>> currently selects the output polarity by querying the input polarity at
>> the IRQ controller. This works fine if the IRQ signal is routed directly
>> from the PMIC to the IRQ controller with no intervening logic. However,
>> if the signal is inverted between the two, this automatic polarity
>> selection gets the wrong answer.
>>
>> Add an additional optional DT and platform data parameter which indicates
>> that such an inversion occurs. If this option is enabled, the Palmas
>> driver will configure its IRQ output to the opposite polarity of the IRQ
>> controller's input.
>>
>> An alternative would have been to add a new non-optional DT parameter to
>> indicate the exact desired output polarity. However, this would have been
>> an incompatible change to the DT binding.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> If this patch could be applied to its own branch (w/ signed tag) in the
>> MFD tree, that would great; then I can pull patch 1/2 into the Tegra tree
>> so that I can apply patch 2/2 to the Tegra tree. Thanks.
>> ---
>>  Documentation/devicetree/bindings/mfd/palmas.txt | 6 ++++++
>>  drivers/mfd/palmas.c                             | 4 ++++
>>  include/linux/mfd/palmas.h                       | 1 +
>>  3 files changed, 11 insertions(+)
> 
> For the core changes:
>   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks. Since you ack'd this and are an MFD maintainer, was that an
indication that I should take this patch through the Tegra tree?
