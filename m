From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Tue, 3 May 2016 00:36:29 +0530
Message-ID: <5727A535.2060808@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com> <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com> <5723274B.3050209@nvidia.com> <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com> <57277C70.5080204@wwwdotorg.org> <57279534.5010409@nvidia.com> <5727A001.5030609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5727A001.5030609@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 03 May 2016 12:14 AM, Stephen Warren wrote:
> On 05/02/2016 11:58 AM, Laxman Dewangan wrote:
>>
>>
>> Toggling OE bit is something emulating the open drain here.
>
> From the perspective of the external HW that's attached to the GPIO, I 
> believe there's no difference.
>
>> I think idea is that when we configure the pin in open drain then it
>> should be automatically handled by HW  when we want to set pin state
>> high or low. When we set low, the pin should be driven and when high
>> then it should be tristated input. We should not need any direction bit
>> setting.
>
> I don't imagine anything in the kernel cares, so long as the correct 
> logic level is present on the pin based on whatever GPIO API was last 
> called.
>
> I'd be very surprised if there wasn't hardware that could only 
> implement open-drain by this "emulation" method, so I'd be very 
> surprised if something prohibited that implementation style.
>

The emulation method implemented just to not drive high for open drain.
Recently, proper callback added for hw control for open drain and hence 
emulation method is not needed for such HW.

I think if HW support the callback to implement the open drain then use 
the HW method otherwise fallback to emulation method.


>> Otherwise, if pin is configured as open drain then:
>>
>> Set out = 0
>>
>> and when it need to set pin to high then oe = 0 else oe =1. Do not
>> toggle any other bits.
>>
>> On this case, we need to store that pin is configured as open drain so
>> that set_value should toggle OE instead of OUT.
>
> That sounds like a reasonable implementation.
>

Let me create the patch for review and further discussion.

>> Or do you want to have different implementation?
>

