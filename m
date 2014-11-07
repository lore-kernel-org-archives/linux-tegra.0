From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 04/13] of: document new emc-timings subnode in nvidia,tegra124-car
Date: Fri, 07 Nov 2014 14:10:57 +0100
Message-ID: <545CC4E1.4010605@collabora.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com> <1414599796-30597-5-git-send-email-tomeu.vizoso@collabora.com> <545B172C.4060105@nvidia.com> <CAL_JsqKYSF3JVrXH_dkqRXQrgUU3igzvoK1C2k1Caz-4UuHX6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKYSF3JVrXH_dkqRXQrgUU3igzvoK1C2k1Caz-4UuHX6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/06/2014 04:12 PM, Rob Herring wrote:
> On Thu, Nov 6, 2014 at 12:37 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
>>>                 #clock-cells = <1>;
>>>                 #reset-cells = <1>;
>>>         };
>>> @@ -60,4 +83,23 @@ Example board file:
>>>         &tegra_car {
>>>                 clocks = <&clk_32k> <&osc>;
>>>         };
>>> +
>>> +       clock@0,60006000 {
>>> +               emc-timings@3 {
>>> +                       nvidia,ram-code = <3>;
>>> +
>>> +                       timing@12750000 {
>>> +                               clock-frequency = <12750000>;
>>> +                               nvidia,parent-clock-frequency =
>>> <408000000>;
>>> +                               clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
>>> +                               clock-names = "emc-parent";
> 
> Why do you need both clocks and hardcoded values? clock-frequency is
> the desired freq you want to set TEGRA124_CLK_PLL_P to?

For the EMC clock to run at 12.75 MHz, its parent should become
TEGRA124_CLK_PLL_P and it has to be running at 408 MHz.

> The clocks property really belongs as part of the memory controller
> node or a memory device node.

What would be the rationale for that? The clock provider needs to know
what clock should become the parent of the EMC clock when changing rates.

Thanks,

Tomeu
