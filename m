From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ASoC: WM8903: Add device tree binding
Date: Tue, 06 Dec 2011 14:17:43 -0600
Message-ID: <4EDE7867.2060306@gmail.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com> <1322863721-29793-6-git-send-email-swarren@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE@HQMAIL01.nvidia.com> <4EDE67D2.2020507@gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF1750B774C0@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1750B774C0-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2011 02:09 PM, Stephen Warren wrote:
> Rob Herring wrote at Tuesday, December 06, 2011 12:07 PM:
>> On 12/06/2011 12:22 PM, Stephen Warren wrote:
>>> Stephen Warren wrote at Friday, December 02, 2011 3:09 PM:
>>>> Document the device tree binding for the WM8903 codec, and modify the
>>>> driver to extract platform data from the device tree, if present.
>>>
>>> Mark,
>>>
>>> I just realized that when I was re-organizing all the WM8903 patches, I
>>> dropped the part that added the of_match table to the driver:
>>>
>>> +static const struct of_device_id wm8903_of_match[] __devinitconst = {
>>> +	{ .compatible = "wlf,wm8903", },
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, wm8903_of_match);
>>>
>>> Now, everything still works without this. Looking at the Linux OF code,
>>> it works by retrieving the compatible property, taking everything after
>>> the comma if present, and then creating an i2c_board_info with that
>>> type, which in this case is "wm8903" and matches wm8903.c's i2c_device_id
>>> table. See drivers/of/of_i2c.c:of_i2c_register_devices() and the call to
>>> base.c:of_modalias_node().
>>>
>>> So, the question is: Should I go back and add the of_match table, or
>>> is I2C intended to work without it perpetually? I notice that you added
>>> an of_match table for all the other WM codecs.
>>
>> It definitely tries to match first with the OF match table, so it should
>> probably be added back.
> 
> OK, I have no issues putting it back.
> 
> But, I certainly can't find any code in drivers/i2c or drivers/of/of_i2c.c
> that matches the compatible property against the of_match_table. Can
> you point it out please. As best I can tell, I2C bus/controller drivers call
> of_i2c_register_devices() which calls of_modalias_node() which only
> operates in the manner I described. I don't think any generic instantiation
> code can be operating instead, since there's nothing in
> of_i2c_register_devices() that skips devices that have already been
> instantiated via other means. Nothing in drivers/i2c seems to touch of_node
> or the compatible property.
> 
Because it is not i2c specific code. But look at i2c_device_match which
calls of_driver_match_device:

static int i2c_device_match(struct device *dev, struct device_driver *drv)
{
        struct i2c_client       *client = i2c_verify_client(dev);
        struct i2c_driver       *driver;

        if (!client)
                return 0;

        /* Attempt an OF style match */
        if (of_driver_match_device(dev, drv))
                return 1;

        driver = to_i2c_driver(drv);
        /* match on an id table if there is one */
        if (driver->id_table)
                return i2c_match_id(driver->id_table, client) != NULL;

        return 0;
}

Rob
