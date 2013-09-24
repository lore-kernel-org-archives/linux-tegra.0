From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch V2] drivers: power: Add support for bq24735 charger
Date: Tue, 24 Sep 2013 14:13:02 -0400
Message-ID: <5241D62E.1060705@nvidia.com>
References: <1379607514-11200-1-git-send-email-rklein@nvidia.com> <20130919202706.GB4470@ulmo> <523B6257.4040302@nvidia.com> <20130920075302.GB8575@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130920075302.GB8575@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 9/20/2013 3:53 AM, Thierry Reding wrote:
>>>> +     name = charger_device->pdata->name;
>>>> +     if (!name) {
>>>> +             name = kasprintf(GFP_KERNEL, "bq24735-%s",
>>>> +                              dev_name(&client->dev));
>>>
>>> Won't the device name already include bq24735 because of the driver
>>> name?
>>
>> In my experience this comes up with a name like "bq24735-5-0009". Thats
>> why I added the bq24735 in the beginning, so the name is more descriptive.
> 
> Yes, you're right. Perhaps in that case it's even easier to just stick
> with a static string such as "bq24735" or "bq24735-charger". It's likely
> to be the only device of that type in a machine. If you want to include
> the device name, perhaps something like "%s/bq24735" (5-0009/bq24735) is
> clearer that 5-0009 is actually the bus-specific name.
> 

So it turns out if I try to put in a '/' or '\' they are translated to
'!' in sysfs, so the name comes out to be '5-0009!bq24735'. Perhaps
'bq24735@5-0009' to still signify that the 5-009 is more of an address
than chip name? What do you think Thierry?

-rhyland

-- 
nvpublic
