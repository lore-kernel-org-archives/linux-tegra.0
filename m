From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 09/16] pwm: tegra: Add device tree support
Date: Tue, 03 Apr 2012 14:43:51 -0500
Message-ID: <4F7B52F7.5030608@gmail.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de> <1332945238-14897-10-git-send-email-thierry.reding@avionic-design.de> <4F7602CD.2010808@wwwdotorg.org> <20120402083749.GA6576@avionic-0098.adnet.avionic-design.de> <4F79C8D4.2000306@wwwdotorg.org> <20120403175511.GA26399@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120403175511.GA26399-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/03/2012 12:55 PM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 04/02/2012 02:37 AM, Thierry Reding wrote:
>>> * Stephen Warren wrote:
>>>> On 03/28/2012 08:33 AM, Thierry Reding wrote:
>>>>> Add auxdata to instantiate the PWFM controller from a device tree,
>>>>> include the corresponding nodes in the dtsi files for Tegra 20 and
>>>>> Tegra 30 and add binding documentation.
>>>>>
>>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>>>
>>>>> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
>>>> ...
>>>>> +#ifdef CONFIG_OF
>>>>> +static struct of_device_id tegra_pwm_of_match[] = {
>>>>> +	{ .compatible = "nvidia,tegra20-pwm" },
>>>>> +	{ .compatible = "nvidia,tegra30-pwm" },
>>>>
>>>> Could you swap those two lines, so that tegra30-pwm matches first. It
>>>> makes no difference at present, but might in the future if the driver
>>>> actually has to differentiate the two SoCs.
>>>
>>> I thought the matching order was determined by the compatible property in the
>>> device tree, not the OF match table of the driver.
>>
>> At least logically, yes. However, of_match_device() appears to iterate
>> over each match table entry, checking whether it matches any string in
>> the compatible flag. Perhaps this could be considered a bug?
> 
> It certainly is counter-intuitive. Maybe Grant or Rob can comment?

I think the rule should be the match list is most specific to least
specific and/or mutually exclusive like compatible strings. Most
examples with multiple entries in the kernel seem to fall into the
mutually exclusive case.

For this case, I think would just drop tegra30-pwm altogether and only
add it to the driver when you need to distinguish between the 2. The dts
should have both though for Tegra3.

Rob
