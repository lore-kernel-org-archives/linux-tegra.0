From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v4 04/13] of: document new emc-timings subnode in nvidia,tegra124-car
Date: Thu, 13 Nov 2014 10:36:05 +0100
Message-ID: <CAAObsKCxZvZE_3DOW3KXJUtdqy6s-vVYLQMzmQGLiurPsPjxWg@mail.gmail.com>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
 <1415779051-26410-5-git-send-email-tomeu.vizoso@collabora.com> <20141112141856.GA26488@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141112141856.GA26488@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12 November 2014 15:18, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Nov 12, 2014 at 08:56:27AM +0100, Tomeu Vizoso wrote:
> [...]
>>  Example SoC include file:
>>
>>  / {
>> -     tegra_car: clock {
>> +     tegra_car: clock@60006000 {
>>               compatible = "nvidia,tegra124-car";
>>               reg = <0x60006000 0x1000>;
>>               #clock-cells = <1>;
>> @@ -60,4 +83,23 @@ Example board file:
>>       &tegra_car {
>>               clocks = <&clk_32k> <&osc>;
>>       };
>> +
>> +     clock@60006000 {
>> +             emc-timings@3 {
>
> Shouldn't this be following the same naming scheme as the memory
> controller's subnodes?
>
>> +                     nvidia,ram-code = <3>;
>> +
>> +                     timing@12750000 {
>
> And this?

Thanks for pointing these out. My bad.

Regards,

Tomeu
