From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Wed, 18 Oct 2017 00:26:45 +0300
Message-ID: <ca4fa045-17f0-9142-6bca-bbf472c1f3bb@gmail.com>
References: <cover.1507752381.git.digetx@gmail.com>
 <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx@gmail.com>
 <20171017201354.efgjrwvakkseyvr7@rob-hp-laptop> <20171017202407.GA10482@ulmo>
 <CAL_JsqKtFD9OgO2privwfBAZeCn3zg1JienmefPk=X2W-+ahJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKtFD9OgO2privwfBAZeCn3zg1JienmefPk=X2W-+ahJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 18.10.2017 00:13, Rob Herring wrote:
> On Tue, Oct 17, 2017 at 3:24 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Oct 17, 2017 at 03:13:54PM -0500, Rob Herring wrote:
>> [...]
>>>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
>> [...]
>>>> +- resets : Must contain an entry for each entry in reset-names.
>>>> +  See ../reset/reset.txt for details.
>>>> +- reset-names : Must include the following entries:
>>>> +  - vde
>>>
>>> -names is pointless when there is only one.
>>
>> I'd prefer to keep it. In the past we occasionally had to add clocks or
>> resets to a device tree node where only one had been present (and hence
>> no -names property) and that caused some awkwardness because verbiage
>> had to be added to the bindings that clarified that one particular entry
>> (the original one) always had to come first.
> 
> The order should be specified regardless of -names and the original
> one has to come first if you add any. That's not awkwardness, but how
> bindings work.

Probably it would be okay to remove '-names' from the binding doc, but keep them
in the actual DT, wouldn't it?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
