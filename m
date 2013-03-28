From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: palmas: add dt support
Date: Thu, 28 Mar 2013 11:35:19 +0530
Message-ID: <5153DD9F.2090101@nvidia.com>
References: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com> <CACRpkdY_9pEkNfp7L82nGjsjFOi-VXwPHo7_3XwjCz8XcN8osg@mail.gmail.com> <51531706.4040608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51531706.4040608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 March 2013 09:27 PM, Stephen Warren wrote:
> On 03/27/2013 07:00 AM, Linus Walleij wrote:
>> On Thu, Mar 21, 2013 at 3:30 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>>   #ifdef CONFIG_OF_GPIO
>>> -       palmas_gpio->gpio_chip.of_node = palmas->dev->of_node;
>>> +       palmas_gpio->gpio_chip.of_node = pdev->dev.of_node;
>>>   #endif
>> OK I think that #ifdef is necessary...
> Laxman,
>
> Don't we need to resolve and agree on the final DT bindings before we
> can start making changes like this? It's not clear yet whether everyone
> is on the same page re: how the MFD sub-devices are modelled in DT -
> whether each sub-component really is a standalone device, or whether the
> MFD itself instantiates all its children based on internal static tables
> rather than DT.
Yes, we need to agree on DT. I sent the patch based on the patches came 
from TI/Slimlogic and other discussion about DT patches.
Recently, you commented on  DT for palmas, it need to  be completely IP 
based or hw based. Mix will not work.
If it is IP based then almost all palmas-* file need to be rewrite, no 
one is written as IP based. All are using palma structures, palma 
header, palma macro etc
which should not be there.

>
> Given that, I'm not sure why the Slimlogic people aren't CC'd on this
> patch:-(

I have not added then on my original patch as 
./script/get_maintainers.pl did not give me name.
However, you added immediately them (TI and slimlogic) on this patch 
itself. I have not got any feedback from them yet.



I
