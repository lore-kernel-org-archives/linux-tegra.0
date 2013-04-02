From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpio: palmas: add dt support
Date: Tue, 02 Apr 2013 09:30:49 -0600
Message-ID: <515AF9A9.4060407@wwwdotorg.org>
References: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com> <CACRpkdY_9pEkNfp7L82nGjsjFOi-VXwPHo7_3XwjCz8XcN8osg@mail.gmail.com> <5153DC24.7040309@nvidia.com> <515459D8.4010001@nvidia.com> <CACRpkdYTcEzVMK-7V_T1qxtz1Pbw_um8pzasM=pTJ+vFnZasAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYTcEzVMK-7V_T1qxtz1Pbw_um8pzasM=pTJ+vFnZasAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 03:01 AM, Linus Walleij wrote:
> On Thu, Mar 28, 2013 at 3:55 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 03/27/2013 11:59 PM, Laxman Dewangan wrote:
>>> On Wednesday 27 March 2013 06:30 PM, Linus Walleij wrote:
>>>> On Thu, Mar 21, 2013 at 3:30 PM, Laxman Dewangan
>>>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>
>>>>> +#ifdef CONFIG_OF
>>>>> +static struct of_device_id of_palmas_gpio_match[] = {
>>>>> +       { .compatible = "ti,palmas-gpio"},
>>>>> +       { },
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
>>>>> +#endif
>>>>
>>>> But please drop the #ifdef here unless it causes compile errors
>>>> (I don't think it will.)
>>>>
>>>
>>> I am using this table as
>>>
>>> driver.of_match_table = of_match_ptr(of_palmas_gpio_match),
>>> of_match_ptr is macro which is NULL in case of CONFIG_OF not defined.
>>> So if I remove ifdefs then it may create build warning as unused variable.
>>
>> I think Linus's point is that you can simply remove the use of
>> of_match_ptr(). The only disadvantage of doing so is that the table will
>> always be included in the object file, but it's so small that it's
>> probably not worth worrying about.
> 
> Oh I wasn't that smart :-)
> 
> But what you're saying seems true.
> 
> The of_match_ptr() is something
> I haven't quite seen before and don't quite understand the
> semantics of, why would we use that?

Very roughly,

of_match_ptr(x) == CONFIG_OF ? x : NULL

(although with ifdefs rather than the ternary operator)

So, if you have ifdef'd the match table with CONFIG_OF, and reference it
from code outside that ifdef, then you need to use of_match_ptr() to
reference the table, so it isn't referenced when CONFIG_OF is not
defined, and hence never causes link problems.
