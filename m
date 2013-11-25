From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: register as an OF DMA controller
Date: Mon, 25 Nov 2013 15:30:55 -0700
Message-ID: <5293CF9F.6040305@wwwdotorg.org>
References: <1385416416-3536-1-git-send-email-swarren@wwwdotorg.org> <2205346.2EJcydzRLA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2205346.2EJcydzRLA@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/25/2013 03:09 PM, Arnd Bergmann wrote:
> On Monday 25 November 2013 14:53:36 Stephen Warren wrote:
>> v2: Use of_dma_slave_xlate() rather than of_dma_simple_xlate(), as
>>     suggested by Arnd Bergmann.
>>
>> This patch is part of a series with strong internal depdendencies. I'm
>> looking for an ack so that I can take the entire series through the Tegra
>> and arm-soc trees. The series will be part of a stable branch that can be
>> merged into other subsystems if needed to avoid/resolve dependencies.
> 
> Did I suggest of_dma_slave_xlate()? I don't think I've actually heard
> of that function, and I can't find anything in the kernel source or
> using google.
> 
> Why not just use an open-coded xlate function?

Well, you suggested not using of_dma_simple_xlate() since it wasn't
appropriate. I then started to implement an open-coded xlate function,
but found that it was 99% identical to the same thing in the mmp driver,
and hence created a common of_dma_slave_xlate() so as not to just
cut/paste it everywhere. Unfortunately, I only sent that patch to
dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and the DMA maintainers, and there's no
archive of that list:-(
