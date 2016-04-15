From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] ARM: tegra: add DT binding for Tegra186 GPIO controllers
Date: Fri, 15 Apr 2016 11:17:57 +0200
Message-ID: <CACRpkdbazmBE6rMO0EKmK6qxqL7uaWNQmf=SNEDBJPCTVteFiA@mail.gmail.com>
References: <1460483197-5130-1-git-send-email-swarren@wwwdotorg.org>
	<CACRpkdYmcEQBN5QwjLa-Wyorv-otPdJh5C1KgKwUjUBWXvnb_w@mail.gmail.com>
	<570FB459.8090802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <570FB459.8090802@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 14, 2016 at 5:16 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 04/14/2016 06:42 AM, Linus Walleij wrote:
>> On Tue, Apr 12, 2016 at 7:46 PM, Stephen Warren <swarren@wwwdotorg.org>
>> wrote:

>> I suspect that the Tegra definition of a "port" is close to what other
>> people
>> call a "bank" like I try to define in this patch?
>> http://marc.info/?l=linux-gpio&m=145941547420164&w=2
>
> There are similarities, but the concepts are quite different. In that
> thread, the term "bank" actually refers to an instance of a standalone HW IP
> block. Here, "port" is definitely something internal to a single HW block.

OK I get it. I wonder if we can make that common terminology as well.

GPIO bank := unique instance of a common IP block
GPIO port := unique line range inside an IP block

>> Again that use case. Can you please enter the mentioned thread
>> and provide some input on how you see this working?
>
> I don't believe that thread applies to the Tegra GPIO controller.

OK

>> I noticed that the #defines in that tegra186-gpio.h file are not used
>> in the example below. Something seems wrong: this mapping must
>> be important. I don't see which of the required properties it should go
>> into either.
>
> The defines would be used to calculate the GPIO ID cell of the GPIO
> specifier in DT. They work in exactly the same way as other headers in
> include/dt-bindings/gpio, in particular tegra-gpio.h is very similar in
> structure.
>
> At present, there is no upstream-targeted Linux driver for this HW, and the
> upstream DT has not been written. I'm working on a U-Boot driver, so need
> the binding defined for that. You can find the U-Boot driver in this commit
> list:

OK I am ACKing this, your effort to use the Linux DTS as point of
reference should be encouraged.

>> So we definately need this stuff used in the example.
>
> Hmm. I really hope not. That would prevent getting DT bindings defined early
> on for the HW, before drivers and DT are written for a platform. Any
> existing Tegra DT file is a good example though; the structure of this
> binding is essentially identical to the previous Tegra GPIO controller
> binding. The only thing different is the exact values that go into the
> properties, and the non-linear mapping of GPIO IDs.

It's cool.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I assume you want to merge this through the Tegra tree, or
should I apply it to the GPIO tree?

Yours,
Linus Walleij
