From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: assume CONFIG_OF
Date: Tue, 19 Feb 2013 10:06:16 -0700
Message-ID: <5123B108.1010207@wwwdotorg.org>
References: <1360965237-14857-1-git-send-email-swarren@wwwdotorg.org> <CAA9_cme3e-VWFs+5o6g88dXmURsjojT08o9Cw+=r7=AfRKz5gQ@mail.gmail.com> <20130217150735.GK29960@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130217150735.GK29960-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/17/2013 08:07 AM, Vinod Koul wrote:
> On Fri, Feb 15, 2013 at 02:18:59PM -0800, Dan Williams wrote:
>> On Fri, Feb 15, 2013 at 1:53 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Tegra only supports, and always enables, device tree. Remove all ifdefs
>>> and runtime checks for DT support from the driver.
>>>
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Acked-by: Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
>>
>> ..adding Vinod.
>
> I think it should assume CONFIG_DMA_OF?

I'm not quite sure what you're saying. There are no ifdefs in the driver
related to CONFIG_DMA_OF, so there's no code (ifdefs) that could benefit
from (be removed due to) assuming that.

Do you mean this driver should be updated to support the generic DMA DT
bindings? Yes, that's true. However, a patch to do so would be
completely unrelated. We've been holding off doing such a conversion
until the dmaengine core support for CONFIG_DMA_OF is in the kernel, so
we can use it.
