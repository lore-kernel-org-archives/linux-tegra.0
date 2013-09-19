From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drivers: power: Add support for bq24735 charger
Date: Thu, 19 Sep 2013 11:53:44 -0400
Message-ID: <523B1E08.6050003@nvidia.com>
References: <1379452259-3499-1-git-send-email-rklein@nvidia.com> <CAKDJKT4D7VV1pxC1Bme5wptEW=2uyWBccVCv06tTwgrW20diVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKDJKT4D7VV1pxC1Bme5wptEW=2uyWBccVCv06tTwgrW20diVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 9/19/2013 9:56 AM, Manish Badarkhe wrote:
> Hi
> 
>> +               ret = gpio_request(charger_device->pdata->status_gpio, name);
>> +               if (ret) {
>> +                       dev_err(&client->dev, "Failed gpio request: %d\n", ret);
>> +                       goto err_free_name;
>> +               }
>> +       }
> 
> snip ...
> 
>> +err_free_name:
>> +       if (name && name != charger_device->pdata->name)
>> +               kfree(name);
>> +
>> +       return ret;
>> +}
> 
> Like to know, Is there a need to free gpio which has been requested previously?
> Alternatively, this can be get requested using "devm_" function so
> that it will get
> freed automatically during removal.

As a matter of fact yes, I meant to use the devm_ variant, which is why
I don't have the cleanup. Thanks for catching this! Will fix in V2.

> 
>> +static int bq24735_charger_remove(struct i2c_client *client)
>> +{
>> +       struct bq24735_charger *charger_device = i2c_get_clientdata(client);
>> +
>> +       if (charger_device->irq)
>> +               devm_free_irq(charger_device->dev, charger_device->irq,
>> +                               &charger_device->charger);
>> +
>> +       power_supply_unregister(&charger_device->charger);
>> +
>> +       if (charger_device->charger.name != charger_device->pdata->name)
>> +               kfree(charger_device->charger.name);
>> +
>> +       return 0;
> 
> Ditto, If go with free_gpio.
> 
> 
> Regards
> Manish Badarkhe
> 

Thanks!

-rhyland

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
