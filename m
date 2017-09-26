From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/2] NVIDIA Tegra20 video decoder driver
Date: Wed, 27 Sep 2017 01:17:10 +0300
Message-ID: <c89255ca-2492-f29b-8999-b97901f60cb9@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <20170926065447.GC6250@kroah.com>
 <d2d4c970-d921-c282-b70e-00247c5de50f@gmail.com>
 <20170926213549.GE3418@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926213549.GE3418-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 27.09.2017 00:35, Greg Kroah-Hartman wrote:
> On Tue, Sep 26, 2017 at 03:32:23PM +0300, Dmitry Osipenko wrote:
>> On 26.09.2017 09:54, Greg Kroah-Hartman wrote:
>>> On Tue, Sep 26, 2017 at 01:15:41AM +0300, Dmitry Osipenko wrote:
>>>> This driver provides accelerated video decoding to NVIDIA Tegra20 SoC's,
>>>> it is a result of reverse-engineering efforts. Driver has been tested on
>>>> Toshiba AC100 and Acer A500, it should work on any Tegra20 device.
>>>>
>>>> In userspace this driver is utilized by libvdpau-tegra [0] that implements
>>>> VDPAU interface, so any video player that supports VDPAU can provide
>>>> accelerated video decoding on Tegra20 on Linux.
>>>
>>> Why not use the v4l2 api instead?  Doesn't that provide the same needed
>>> user/kernel api here instead of creating yet-another-custom ioctl?
>>>
>>
>> 1) The HW doesn't generalize for the common API. Like for example, it isn't
>> capable of unpacking bitstream encoded with CABAC (Context-adaptive binary
>> arithmetic coding), so unpacking should be done in software and then VDE HW
>> isn't capable of decoding such a stream in a fully-automated manner, software
>> would have to feed engine with a chunks of macroblocks untill the whole frame is
>> decoded. That lameness is partially hidden in the BLOB's firmware, that firmware
>> actually is just a driver BTW.
>>
>> 2) We want to have decoding integrated with the presentation of the decoded
>> video frame. So having v4l interface for decoding would be just an extra
>> unnecessary shim, increasing CPU / memory resources usage and complexity of the
>> code.
>>
>> 3) The decoding and presentation are already implemented using VDPAU API and
>> proven to work decently in that way.
> 
> This sounds like something you should be talking over with the media
> driver developers, why are they not even cc:ed on this submission?
> 
> I need their ack on this new api before I can take this.
> 

Indeed, will cc media on V2.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
