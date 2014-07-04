From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/dsi: Add flag for continuous clock behavior
Date: Fri, 04 Jul 2014 11:53:36 +0200
Message-ID: <53B679A0.1060306@samsung.com>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-2-git-send-email-acourbot@nvidia.com>
 <53B5131B.1060702@samsung.com>
 <CAAVeFu+sTWhwCTd9ntqdJQA1aaFV93zHnyRSj6WA-8VicFuvgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAAVeFu+sTWhwCTd9ntqdJQA1aaFV93zHnyRSj6WA-8VicFuvgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/04/2014 07:57 AM, Alexandre Courbot wrote:
> Hi Andrejz,
>
> On Thu, Jul 3, 2014 at 5:23 PM, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi Alexandre,
>>
>> Thanks for the patch.
>>
>> On 07/02/2014 02:19 PM, Alexandre Courbot wrote:
>>> As per section 5.6.1 of the DSI specification, all DSI transmitters must
>>> support continuous clock behavior on the clock lane, while non-continuous
>>> mode support is only optional. Add a flag that allows devices to indicate
>>> that they require continuous clock mode to operate properly.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  include/drm/drm_mipi_dsi.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>>> index 944f33f..5913ef4 100644
>>> --- a/include/drm/drm_mipi_dsi.h
>>> +++ b/include/drm/drm_mipi_dsi.h
>>> @@ -94,6 +94,8 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
>>>  #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
>>>  /* disable EoT packets in HS mode */
>>>  #define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
>>> +/* use continuous clock behavior on the clock lane */
>>> +#define MIPI_DSI_MODE_CLOCK_CONTINUOUS       BIT(10)
>>>
>> According to MIPI DSI specification "All DSI transmitters and receivers
>> shall support continuous clock behavior on the Clock Lane, and
>> optionally may support non-continuous clock behavior". It suggests that
>> continuous clock should be default behavior. So maybe better is to
>> introduce sth like:
>> +#define MIPI_DSI_MODE_CLOCK_NON_CONTINUOUS     BIT(10)
> I started under the assumption that current host drivers assumed
> non-continuous clock (as the Tegra driver currently does).

Exynos DSI driver uses continuous clock.
Currently, in mainline,  there are no more dsi hosts using drm_mipi_dsi.h.
As I stated before I prefer to follow dsi specification and it states
clearly that
continuous behavior is required, non-continouous is optional.
Moreover for tegra chip continuous behavior is also the default one.

Regards
Andrzej

>  In that
> light, it seemed to make sense (and to be less intrusive) to introduce
> that flag as a restriction rather than a capability. But if you think
> this should be a capability I am not strongly against it - either way,
> host drivers need to be changed to take that flag into account.
>
