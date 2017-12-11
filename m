From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] staging: Introduce NVIDIA Tegra video decoder
 driver
Date: Mon, 11 Dec 2017 03:12:55 +0300
Message-ID: <c9d8ad71-2fb3-4ce9-2672-9006511f5079@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
 <1a3798f337c0097e67d70226ae3ba665fd9156c2.1508448293.git.digetx@gmail.com>
 <ad2da9f4-8899-7db3-493f-5aa15297c33c@xs4all.nl>
 <3ac6a087-def2-014f-673d-1be9d5094635@gmail.com>
 <93c98569-0282-80d9-78ad-c8ab8fd9db92@xs4all.nl>
 <f46f397d-28e1-f4e5-55d4-9863214e8f6c@gmail.com>
 <1512934179.4281.15.camel@ndufresne.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512934179.4281.15.camel-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10.12.2017 22:29, Nicolas Dufresne wrote:
> Le dimanche 10 décembre 2017 à 21:56 +0300, Dmitry Osipenko a écrit :
>>> I've CC-ed Maxime and Giulio as well: they are looking into adding support for
>>> the stateless allwinner codec based on this code as well. There may well be
>>> opportunities for you to work together, esp. on the userspace side. Note that
>>> Rockchip has the same issue, they too have a stateless HW codec.
>>
>> IIUC, we will have to define video decoder parameters in V4L API and then make a
>> V4L driver / userspace prototype (ffmpeg for example) that will use the requests
>> API for video decoding in order to upstream the requests API. Does it sound good?
> 
> Chromium/Chrome already have support for that type of decoder in their
> tree. In theory, it should just work.

Everything is possible, in theory ;)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
