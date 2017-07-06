From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/9] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 6 Jul 2017 13:43:03 +0300
Message-ID: <a5dc9b07-b3a5-4764-c066-0e9d250770a1@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx@gmail.com>
 <20170706012409.GD24420@b29397-desktop>
 <d23f841a-f46d-bf3f-cdb6-9d9c033e80bd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d23f841a-f46d-bf3f-cdb6-9d9c033e80bd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06.07.2017 13:24, Dmitry Osipenko wrote:
> On 06.07.2017 04:24, Peter Chen wrote:
>> On Wed, Jul 05, 2017 at 08:19:53PM +0300, Dmitry Osipenko wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Override the compatible string of the first USB controller to enable
>>> device mode.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/tegra20-trimslice.dts | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
>>> index b902ab594afa..96b4f3f9827b 100644
>>> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
>>> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
>>> @@ -336,7 +336,9 @@
>>>  	};
>>>  
>>>  	usb@c5000000 {
>>> +		compatible = "nvidia,tegra20-udc";
>>>  		status = "okay";
>>> +		dr_mode = "otg";
>>
>> If this board supports peripheral-only, you need to
>> set dr_mode as "peripheral".
>>
> 
> It should support OTG, but we aren't going to implement the host mode switch for
> now. Stephen claims that the host mode is working with the tegra-ehci driver, it
> would be nice if anyone could confirm this.
> 

Stephen, git blame tells that it is you enabled that port on TrimSlice and
AC100. Could you test them again please?

-- 
Dmitry
