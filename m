From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: tegra: initial support for apalis t30
Date: Mon, 02 Jun 2014 14:33:38 -0600
Message-ID: <538CDFA2.5020704@wwwdotorg.org>
References: <c5522b0efcbfc7690dcde6aaf78b9dd568f99604.1401665237.git.marcel@ziswiler.com> <b470c9c8631a6ef021d140192eb07006de3cfd93.1401665237.git.marcel@ziswiler.com> <538CA5C3.5050709@wwwdotorg.org> <538CDC08.7020106@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538CDC08.7020106-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/02/2014 02:18 PM, Marcel Ziswiler wrote:
> On 06/02/2014 06:26 PM, Stephen Warren wrote:

>>> +    pwmleds {
>>> +        compatible = "pwm-leds";
>>> +
>>> +        pwm3 {
>>> +            label = "PWM3";
>>> +            pwms = <&pwm 1 19600>;
>>> +            max-brightness = <255>;
>>> +        };
>>> +        pwm2 {
>>> +            label = "PWM2";
>>> +            pwms = <&pwm 2 19600>;
>>> +            max-brightness = <255>;
>>> +        };
>>> +        pwm1 {
>>> +            label = "PWM1";
>>> +            pwms = <&pwm 3 19600>;
>>> +            max-brightness = <255>;
>>> +        };
>>
>> Nit: Why not sort those nodes in numerical order?
> 
> Sure, the only question is ordering based on what. I choose the actual
> Tegra PWM instance while you propose to use our Apalis instance
> numbering which in this particular case turns out to be the opposite but
> makes us even more happy to comply.

Sorting by reg value, or if there is no reg value then alphanumerically,
is what I've tried to (remember to) require for the Tegra DTs.
