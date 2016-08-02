From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 08/12] i2c: core: Add support for 'i2c-bus' subnode
Date: Tue, 2 Aug 2016 07:49:08 +0100
Message-ID: <d0647634-7fc9-05e1-21b0-f96bccd5fc6a@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-9-git-send-email-jonathanh@nvidia.com>
 <CAAObsKDGVz0XCxeqt+W31RZ-KEvqPnQaH0dkTUj2zL9oFZrPBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKDGVz0XCxeqt+W31RZ-KEvqPnQaH0dkTUj2zL9oFZrPBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 02/08/16 07:26, Tomeu Vizoso wrote:
> On 23 June 2016 at 17:59, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> If the 'i2c-bus' device-tree node is present for an I2C adapter then
>> parse this subnode for I2C slaves.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/i2c/i2c-core.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
>> index 952d2f0c02c5..71ad532be1d8 100644
>> --- a/drivers/i2c/i2c-core.c
>> +++ b/drivers/i2c/i2c-core.c
>> @@ -1452,7 +1452,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>>
>>  static void of_i2c_register_devices(struct i2c_adapter *adap)
>>  {
>> -       struct device_node *node;
>> +       struct device_node *bus, *node;
>>
>>         /* Only register child devices if the adapter has a node pointer set */
>>         if (!adap->dev.of_node)
>> @@ -1460,11 +1460,17 @@ static void of_i2c_register_devices(struct i2c_adapter *adap)
>>
>>         dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
>>
>> -       for_each_available_child_of_node(adap->dev.of_node, node) {
>> +       bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
>> +       if (!bus)
>> +               bus = of_node_get(adap->dev.of_node);
>> +
>> +       for_each_available_child_of_node(bus, node) {
>>                 if (of_node_test_and_set_flag(node, OF_POPULATED))
>>                         continue;
>>                 of_i2c_register_device(adap, node);
>>         }
>> +
>> +       of_node_put(bus);
>>  }
> 
> Sorry for not commenting earlier, but I only found the issue yesterday.
> 
> I'm bothered as well by the "modalias failure" error message but in my
> case the node doesn't have any i2c devices, so this patch isn't a
> complete solution to that problem.

But it is a i2c adapter correct? I guess I don't completely understand
the problem?

> Has this been considered already?

Why can't you add a place-holder 'i2c-bus' node for i2c devices so when
they are adding in the future they are placed under this node? This is
what I did for dpaux. See patch 12/12 of this series.

Jon

-- 
nvpublic
