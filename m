From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Tue, 3 May 2016 09:59:14 -0600
Message-ID: <5728CAD2.9050701@wwwdotorg.org>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
 <5723274B.3050209@nvidia.com>
 <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com>
 <57277C70.5080204@wwwdotorg.org> <57279534.5010409@nvidia.com>
 <5727A001.5030609@wwwdotorg.org> <5727A535.2060808@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5727A535.2060808-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/02/2016 01:06 PM, Laxman Dewangan wrote:
>
> On Tuesday 03 May 2016 12:14 AM, Stephen Warren wrote:
>> On 05/02/2016 11:58 AM, Laxman Dewangan wrote:
>>>
>>>
>>> Toggling OE bit is something emulating the open drain here.
>>
>> From the perspective of the external HW that's attached to the GPIO, I
>> believe there's no difference.
>>
>>> I think idea is that when we configure the pin in open drain then it
>>> should be automatically handled by HW  when we want to set pin state
>>> high or low. When we set low, the pin should be driven and when high
>>> then it should be tristated input. We should not need any direction bit
>>> setting.
>>
>> I don't imagine anything in the kernel cares, so long as the correct
>> logic level is present on the pin based on whatever GPIO API was last
>> called.
>>
>> I'd be very surprised if there wasn't hardware that could only
>> implement open-drain by this "emulation" method, so I'd be very
>> surprised if something prohibited that implementation style.
>>
>
> The emulation method implemented just to not drive high for open drain.
> Recently, proper callback added for hw control for open drain and hence
> emulation method is not needed for such HW.
>
> I think if HW support the callback to implement the open drain then use
> the HW method otherwise fallback to emulation method.

I don't see any benefit to that. It makes the code more complex without 
enabling any more features.

For reference, on Tegra124 and earlier, very few pins have open-drain 
control in HW (pinmux) whereas you can emulate it in the GPIO module for 
any pin. In Tegra210 and Tegra186, many pins have open-drain control in 
HW (pinmux) yet a good number still don't, yet you can still emulate 
this in the GPIO module for any pin.
