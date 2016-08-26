From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Fri, 26 Aug 2016 08:25:08 +0100
Message-ID: <a7851104-1aa1-fd8d-a594-545a01046cdf@nvidia.com>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
 <1472045838-22628-4-git-send-email-mirza.krak@gmail.com>
 <de2fb909-829e-6c04-4f6a-442cbb9171c9@nvidia.com>
 <CALw8SCVcPymDZ8NyUbeanRF0TCT1TZzL6iRDticYA42FWrEWqw@mail.gmail.com>
 <CALw8SCWtTvWGmKru2MX7T7sFpoUpD-V400+w2nPkxaFB5WUKSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCWtTvWGmKru2MX7T7sFpoUpD-V400+w2nPkxaFB5WUKSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 26/08/16 05:53, Mirza Krak wrote:

...

>> I have an idea which is following:
>>
>> gmi@70090000 {
>>          status = "okay";
>>          #address-cells = <2>;
>>          #size-cells = <1>;
>>          ranges = <4 0 0x48000000 0x00040000>;
>>
>>          cs4 {
>>                  compatible = "simple-bus";
>>                  #address-cells = <2>;
>>                  #size-cells = <1>;
>>                  ranges;
>>
>>                  nvidia,snor-cs = <4>;
>>                  nvidia,snor-mux-mode;
>>                  nvidia,snor-adv-inv;
>>
>>                  can@0 {
>>                          compatible = "nxp,sja1000";
>>                          reg = <4 0 0x100>;
>>                          ...
>>                  };
>>
>>
>>                  can@40000 {
>>                          compatible = "nxp,sja1000";
>>                          reg = <4 0x40000 0x100>;
>>                          ...
>>                  };
>>          };
>> };
>>
>> Do not know if above will work at all (not able to test at current
>> location), anyway I will play around with it some more and get back to
>> you.
> 
> Gave above a test run and it works like a charm. Are we happy with that?

Does it not work with #address-cells = <1>? Seems odd to have the cs in
the reg for the device.

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
