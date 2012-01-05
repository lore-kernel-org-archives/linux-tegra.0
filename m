From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] gpio: tegra: Parameterize the number of banks
Date: Thu, 05 Jan 2012 11:24:43 -0600
Message-ID: <4F05DCDB.40806@gmail.com>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com> <1325702378-20863-6-git-send-email-swarren@nvidia.com> <4F04AE71.2090203@gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF17761F145E@HQMAIL01.nvidia.com> <CACxGe6tyZKW37sGiDauvikU70ZVLHFVrXjBPJk2Kgee1Rj3sbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tyZKW37sGiDauvikU70ZVLHFVrXjBPJk2Kgee1Rj3sbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/04/2012 04:00 PM, Grant Likely wrote:
> On Wed, Jan 4, 2012 at 1:00 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Rob Herring wrote at Wednesday, January 04, 2012 12:54 PM:
>>> On 01/04/2012 12:39 PM, Stephen Warren wrote:
>>>> Tegra20's GPIO controller has 7 banks, and Tegra30's controller has 8
>>>> banks. Allow the number of banks to be configured at run-time by the
>>>> device tree.
>> ...
>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
>> ...
>>>>  Required properties:
>>>>  - compatible : "nvidia,tegra20-gpio"
>>>>  - reg : Physical base address and length of the controller's registers.
>>>> +- nvidia,num-banks : The number of GPIO banks. This should be 7 for
>>>> +  Tegra20 and 8 for Tegra30. This must match the number of interrupt
>>>> +  specifiers in the interrupts property.
>>>
>>> You can determine the number of banks based on the compatible property
>>> rather than needing an additional property.
>>
>> That's certainly possible.
>>
>> However, if say nvidia,tegraNNN-gpio has 9 banks, we then have to
>> explicitly edit the driver to know that, whereas by using a property,
>> we wouldn't have to change the driver at all to support a future GPIO
>> controller. So, isn't it better to explicitly represent this in DT?
>>
>> Note that I have no idea how many GPIO banks our future chips will have,
>> so this might not turn out to save any work at all, but perhaps.
> 
> It's an engineering/design decision that requires taste and instinct.
> Either approach is fine, you decide which one will be the best in the
> long term.

Agreed. I'm really fine with it either way.

Trying to predict future h/w is a bit pointless IMO. H/w designers
always find new ways to do things differently. i.MX family has gpio
interrupts hooked up 3 different ways for example. How would you handle
the case that the banks are sparsely implemented?

Is adding support for a different number of banks every couple of years
really an issue? It's much more important to have properties for which
change with every board.

Rob
