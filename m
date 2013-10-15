From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Tue, 15 Oct 2013 09:17:19 -0600
Message-ID: <525D5C7F.10508@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-18-git-send-email-treding@nvidia.com> <52587967.6050806@wwwdotorg.org> <20131012114122.GF22284@mithrandir> <525C338D.50801@wwwdotorg.org> <20131015081318.GG7856@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131015081318.GG7856-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 02:13 AM, Thierry Reding wrote:
> On Mon, Oct 14, 2013 at 12:10:21PM -0600, Stephen Warren wrote:
>> On 10/12/2013 05:41 AM, Thierry Reding wrote:
>>> On Fri, Oct 11, 2013 at 04:19:19PM -0600, Stephen Warren
>>> wrote:
>>>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>>>> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> 
>>>>> Tegra114 TMDS configuration requires a new peak_current
>>>>> field and the driver current override bit has changed
>>>>> position.
>>>> 
>>>>> diff --git a/drivers/gpu/drm/tegra/hdmi.c 
>>>>> b/drivers/gpu/drm/tegra/hdmi.c
>>>> 
>>>>> static const struct tmds_config tegra2_tmds_config[] = {
>>>>> @@ -223,6 +224,85 @@ static const struct tmds_config 
>>>>> tegra3_tmds_config[] = {
>>>> 
>>>> Not related to this patch, but those should have been named 
>>>> tegra20_tmds_config[] and tegra30_tmds_config[].
>>>> 
>>>>> static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
>>>> 
>>>>> -	value = tmds->drive_current |
>>>>> DRIVE_CURRENT_FUSE_OVERRIDE; - tegra_hdmi_writel(hdmi,
>>>>> value, HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT); +	if 
>>>>> (of_device_is_compatible(np, "nvidia,tegra114-hdmi")) {
>>>> 
>>>> Let's not check this at run-time. Instead,
>>>> host1x_drm_subdevs[]'s .data field should be used to contain
>>>> either flags or a pointer to a configuration structure,
>>>> either of which can be directly consulted to determine the
>>>> properties of the HW in a feature-oriented/semantic way.
>>>> 
>>>> drivers/gpio/gpio-tegra.c's 
>>>> tegra20_gpio_config/tegra30_gpio_config/tegra_gpio_of_match 
>>>> provide a good example of this.
>>>> 
>>>> This means that if Tegra124 is identical to Tegra114, yet a 
>>>> hypothetical Tegra999 is different, you don't have to keep 
>>>> adjusting these if conditions throughout the code; they can 
>>>> simply refer to the same feature bit forever.
>>> 
>>> Okay, I'll see what I can come up with. It's unfortunately not
>>> as simple as the GPIO driver's parameterization, and who knows
>>> what other differences will be introduced in some later
>>> versions of this block.
>>> 
>>> What I mean is that at some point it becomes questionable
>>> whether it makes sense to parameterize at all if you have to
>>> encode the register offset and bit position within that
>>> register for a large number of bits.
>> 
>> Well, I wasn't advocating that we shouldn't have an if statement
>> at all. Simply that the if statement shouldn't be doing string
>> compares of specific HW. Either of the following would be fine:
>> 
>> if (hdmi->soc_data->some_feature_flag) // just represents some
>> code; doesn't have to be a function call do_something(); else; 
>> do_something_else();
>> 
>> or:
>> 
>> do_something(hdmi->soc_data->some_feature_value);
> 
> But the fact that a bit has moved from one register to another can 
> hardly be defined as feature. At least I couldn't come up with any 
> sensible name for one.

The feature is the name/identification of the register the field is
in. For example, foo_field_in_bar_reg. Admittedly this isn't "feature"
in the typical sense, but more a "facet of the SW-visible interface".

> We could of course just add a version number into a per-SoC
> descriptor and use that, but that's not any better than checking
> for the compatible value, really.

Even that would be better; it'd avoid a strcmp() every time the code
ran, and also allow the of_match table's data to map from compatible
value to register layout ID. It's quite possible that we have 4 SoCs:

SoC / Register location of field X / Other features, etc.
100   A                              P
200   B                              Q
300   B                              Q
400   B                              R

Where P, Q, R need different compatible values, but the location of
the register field we're talking about isn't 1:1 with the compatible
values, but rather many:1.

> Ideally of course the hardware wouldn't change in these ways from
> one generation to the next...
> 
> That said, I've opted to go with putting the register and bit
> position into a per-SoC descriptor and parameterize on that, along
> with a boolean flag for the existence of the IO peak current
> register.

Sounds good.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
