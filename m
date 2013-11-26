From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: register as an OF DMA controller
Date: Mon, 25 Nov 2013 17:13:41 -0800
Message-ID: <CAPcyv4g5jGmk4Kf1nDLxLhKSrYCYwQby31-fyBOGLbNuBFkceg@mail.gmail.com>
References: <1385416416-3536-1-git-send-email-swarren@wwwdotorg.org>
	<2205346.2EJcydzRLA@wuerfel>
	<5293CF9F.6040305@wwwdotorg.org>
	<CAPcyv4jLh6cyaP2DmnOkc11xeKsB0QtbXQ9VV3BBmHVVt2iHXA@mail.gmail.com>
	<5293D9EB.9070900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5293D9EB.9070900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 25, 2013 at 3:14 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/25/2013 04:09 PM, Dan Williams wrote:
>> On Mon, Nov 25, 2013 at 2:30 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> On 11/25/2013 03:09 PM, Arnd Bergmann wrote:
>>>> On Monday 25 November 2013 14:53:36 Stephen Warren wrote:
>>>>> v2: Use of_dma_slave_xlate() rather than of_dma_simple_xlate(), as
>>>>>     suggested by Arnd Bergmann.
>>>>>
>>>>> This patch is part of a series with strong internal depdendencies. I'm
>>>>> looking for an ack so that I can take the entire series through the Tegra
>>>>> and arm-soc trees. The series will be part of a stable branch that can be
>>>>> merged into other subsystems if needed to avoid/resolve dependencies.
>>>>
>>>> Did I suggest of_dma_slave_xlate()? I don't think I've actually heard
>>>> of that function, and I can't find anything in the kernel source or
>>>> using google.
>>>>
>>>> Why not just use an open-coded xlate function?
>>>
>>> Well, you suggested not using of_dma_simple_xlate() since it wasn't
>>> appropriate. I then started to implement an open-coded xlate function,
>>> but found that it was 99% identical to the same thing in the mmp driver,
>>> and hence created a common of_dma_slave_xlate() so as not to just
>>> cut/paste it everywhere. Unfortunately, I only sent that patch to
>>> dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and the DMA maintainers, and there's no
>>> archive of that list:-(
>>
>> There is, however, an archive of the patches:
>>
>> dma: add common of_dma_slave_xlate()
>> https://patchwork.kernel.org/patch/3234751/
>>
>> dma: mmp_pdma: use of_dma_slave_xlate()
>> https://patchwork.kernel.org/patch/3234761/
>
> Ah, that's useful.
>
>> ..btw I think we should squash those two together.
>
> Isn't it more typical to do core work in one patch, then port each
> driver individually? That keeps the patches small and logically
> distinct, which could help bisect in some cases. But I guess I can go
> either way.

Including a user conversion in the same patch that introduces the api
change makes it clear what is going on...  for example a reviewer
could see that the code comes from mmp_pdma unmolested.  Inevitably
the first question is always "show me the user".  The bisect case is
also a good example.  Since the api change by itself dead code if we
revert the only user we implicitly want to revert the core change.
