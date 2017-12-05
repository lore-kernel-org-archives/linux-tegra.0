From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] staging: Introduce NVIDIA Tegra video decoder
 driver
Date: Tue, 5 Dec 2017 15:17:58 +0300
Message-ID: <3ac6a087-def2-014f-673d-1be9d5094635@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
 <1a3798f337c0097e67d70226ae3ba665fd9156c2.1508448293.git.digetx@gmail.com>
 <ad2da9f4-8899-7db3-493f-5aa15297c33c@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ad2da9f4-8899-7db3-493f-5aa15297c33c-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Hans,

On 04.12.2017 17:04, Hans Verkuil wrote:
> Hi Dmitry,
> 
> As you already mention in the TODO, this should become a v4l2 codec driver.
> 
> Good existing examples are the coda, qcom/venus and mtk-vcodec drivers.
> 
> One thing that is not clear from this code is if the tegra hardware is a
> stateful or stateless codec, i.e. does it keep track of the decoder state
> in the hardware, or does the application have to keep track of the state and
> provide the state information together with the video data?
> 
> I ask because at the moment only stateful codecs are supported. Work is ongoing
> to support stateless codecs, but we don't support that for now.
> 

It is stateless. Is there anything ready to try out? If yes, could you please
give a reference to that work?

> Anyway, I'm OK with merging this in staging. Although I think it should go
> to staging/media since we want to keep track of it.
> 

Awesome, I'll move driver to staging/media in V5. Thanks!
