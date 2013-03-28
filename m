From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: palmas: add dt support
Date: Thu, 28 Mar 2013 08:55:20 -0600
Message-ID: <515459D8.4010001@nvidia.com>
References: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com> <CACRpkdY_9pEkNfp7L82nGjsjFOi-VXwPHo7_3XwjCz8XcN8osg@mail.gmail.com> <5153DC24.7040309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5153DC24.7040309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/27/2013 11:59 PM, Laxman Dewangan wrote:
> On Wednesday 27 March 2013 06:30 PM, Linus Walleij wrote:
>> On Thu, Mar 21, 2013 at 3:30 PM, Laxman Dewangan
>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> +#ifdef CONFIG_OF
>>> +static struct of_device_id of_palmas_gpio_match[] = {
>>> +       { .compatible = "ti,palmas-gpio"},
>>> +       { },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
>>> +#endif
>>
>> But please drop the #ifdef here unless it causes compile errors
>> (I don't think it will.)
>>
> 
> I am using this table as
> 
> driver.of_match_table = of_match_ptr(of_palmas_gpio_match),
> of_match_ptr is macro which is NULL in case of CONFIG_OF not defined.
> So if I remove ifdefs then it may create build warning as unused variable.

I think Linus's point is that you can simply remove the use of
of_match_ptr(). The only disadvantage of doing so is that the table will
always be included in the object file, but it's so small that it's
probably not worth worrying about.
