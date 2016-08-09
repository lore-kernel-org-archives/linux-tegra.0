From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] bus: Add support for Tegra Generic Memory Interface
Date: Tue, 9 Aug 2016 14:37:05 +0100
Message-ID: <c6c6d000-d0d4-ac9f-e19e-0d2a513cd3e8@nvidia.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-7-git-send-email-mirza.krak@gmail.com>
 <fae8dbaf-53e9-dcfe-f755-32f7b28f4c9f@nvidia.com>
 <CALw8SCWjs2TnwFcTY=iXv_eskpKaKpvUmoXnTgtpoL8w9neD=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCWjs2TnwFcTY=iXv_eskpKaKpvUmoXnTgtpoL8w9neD=w@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/08/16 08:21, Mirza Krak wrote:
> 2016-08-08 15:47 GMT+02:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:

...

>>> +     return of_platform_default_populate(of_node, NULL, dev);
>>
>> Seems odd to do this here. Why not as the last thing in probe once the
>> GMI has been setup correctly?
> 
> It is done here mostly to avoid clean up in probe. I could move it out
> of tegra_gmi_parse_dt and put it right after that call but still
> before clk enable? Is that less odd?

I would have thought that clocks should be enabled and resets
de-asserted before we even attempt to populate any children. Hence, I
would do this last. Yes that will require some clean-up in probe if this
does fail but seems safest.

Cheers
Jon

-- 
nvpublic
