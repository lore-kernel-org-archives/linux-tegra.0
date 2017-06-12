From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Mon, 12 Jun 2017 11:25:08 +0300
Message-ID: <2f5be984-eceb-0113-dd3c-4dbd22337062@kapsi.fi>
References: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
 <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <20170607221102.2bctvsdciv7y26lk@rob-hp-laptop>
 <782ec765-f949-3023-93e3-a731f8bb524a@kapsi.fi>
 <CAL_JsqJO2XbYjN2Hon_MJm_KO8HoZkx15ZYyhLRjWnhL9opTZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJO2XbYjN2Hon_MJm_KO8HoZkx15ZYyhLRjWnhL9opTZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09.06.2017 23:54, Rob Herring wrote:
> On Thu, Jun 8, 2017 at 2:32 AM, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
>> On 08.06.2017 01:11, Rob Herring wrote:
>>>
>>> On Thu, Jun 01, 2017 at 11:04:04AM +0300, Mikko Perttunen wrote:
>>>>
>>>> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
>>>> registers that initiate CPU frequency/voltage transitions.
>>>
>>>
>>> What the block is should also go in the binding doc. With that,
>>
>>
>> I don't know how to explain it in more detail; this thing is literally just
>> a few magic registers that route into some CPU control logic to trigger
>> frequency/voltage transitions :)
>
> Copy the commit msg text to the binding doc. That's all I'm asking for.
>
> Rob
>

I see. Will do, thanks.

Mikko
