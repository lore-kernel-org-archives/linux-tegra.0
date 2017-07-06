From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/9] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 6 Jul 2017 19:15:37 +0300
Message-ID: <27f9dadc-3750-2c41-cff0-eab845523fe0@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx@gmail.com>
 <20170706012409.GD24420@b29397-desktop>
 <d23f841a-f46d-bf3f-cdb6-9d9c033e80bd@gmail.com>
 <1499345493.4445.12.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499345493.4445.12.camel-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "marvin24-Mmb7MZpHnFY@public.gmane.org" <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Peter.Chen-3arQi8VN3Tc@public.gmane.org" <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06.07.2017 15:51, Marcel Ziswiler wrote:
> On Thu, 2017-07-06 at 13:24 +0300, Dmitry Osipenko wrote:
>> On 06.07.2017 04:24, Peter Chen wrote:
>>> On Wed, Jul 05, 2017 at 08:19:53PM +0300, Dmitry Osipenko wrote:
>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMToUJ55TTLPZA@public.gmane.org
>>>> .org>
>>>>
>>>> Override the compatible string of the first USB controller to
>>>> enable
>>>> device mode.
>>>>
>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@pub
>>>> lic.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/tegra20-trimslice.dts | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> b/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> index b902ab594afa..96b4f3f9827b 100644
>>>> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> @@ -336,7 +336,9 @@
>>>>  	};
>>>>  
>>>>  	usb@c5000000 {
>>>> +		compatible = "nvidia,tegra20-udc";
>>>>  		status = "okay";
>>>> +		dr_mode = "otg";
>>>
>>> If this board supports peripheral-only, you need to
>>> set dr_mode as "peripheral".
>>>
>>
>> It should support OTG, but we aren't going to implement the host mode
>> switch for
>> now. Stephen claims that the host mode is working with the tegra-ehci 
>> driver, it
>> would be nice if anyone could confirm this.
> 
> I can confirm that on Colibri T20, Apalis/Colibri T30 and Apalis TK1
> host mode works just fine with the regular tegra-ehci driver.
> 

Good to know, thank you :)

> I'm about to give your patch set a try on those boards as well and will
> give further feedback.
> 

Okay, but we won't be able to switch those boards to the UDC driver until the
peripheral/host mode switching would be implemented. As Stephen pointed, it
would be a user-visible regression.

-- 
Dmitry
