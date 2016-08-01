From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [RFC] i2c: device-tree: Handling child nodes which are not i2c
 devices
Date: Mon, 1 Aug 2016 11:41:59 +0200
Message-ID: <dd04aac8-5c8a-b10d-b726-b16e6d69c599@axentia.se>
References: <57110A35.2070509@nvidia.com>
 <CAAObsKC-DGH4GedCcZdv2zvesaTSo6ugsHSQU=J0=P1cZeyCDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKC-DGH4GedCcZdv2zvesaTSo6ugsHSQU=J0=P1cZeyCDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2016-08-01 11:19, Tomeu Vizoso wrote:
> On 15 April 2016 at 17:35, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi all,
>>
>> For Tegra we have an i2c device for display port, namely the display
>> port auxiliary channel (or dpaux) as specified by the display port
>> standard. If an design using Tegra does not utilise the display port
>> interface, then the pads assigned to the dpaux can be re-assigned to
>> another generic i2c controller (i2c6 for Tegra124/210). In other words,
>> the pads can be re-used for a generic i2c interface.
>>
>> The registers that control whether the pads are mapped to the dpaux or
>> i2c6 are located in the dpaux register space. Therefore, I am looking at
>> adding pin controller support for dpaux so that i2c6 can request these
>> pads if it is enabled and I was hoping to add a pinmux node the to dpaux
>> device in device-tree to do this. For example, something like ...
>>
>>         dpaux@0,545c0000 {
>>                 ...
>>
>>                 /* pinctrl node */
>>                 pinmux {
>>                         ...
>>                 };
>>         };
>>
>> Although the above works, when doing this I noticed that when the device
>> booted, I would seeing the following error messages on boot ...
>>
>>  i2c i2c-5: of_i2c: modalias failure on ...
>>
>> These error messages being caused by the new pinmux node because it is
>> not recognised as an i2c device. To avoid this error messages we have
>> come up with a couple solutions but wanted to get some feedback on the
>> best approach.
> 
> Hi,
> 
> I'm finding this issue as well on Rockchip SoCs, this is the specific
> node that is raising this warning when an adapter is registered with
> it:
> 
> edp: dp@ff970000 {
>     compatible = "rockchip,rk3288-dp";
>     ...
>     ports {
>         ...
>     };
> };
> 
> Has there been any agreement since this thread waned?
> 
> Thanks,
> 
> Tomeu

This is currently soaking in linux-next:

dt-bindings: i2c: Add support for 'i2c-bus' subnode
https://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=98b00488459e

i2c: core: Add support for 'i2c-bus' subnode
https://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=7e4c224abfe8

Cheers,
Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
