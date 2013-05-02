From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement suspend/resume callbacks
Date: Thu, 02 May 2013 12:42:30 -0600
Message-ID: <5182B396.308@wwwdotorg.org>
References: <1366797267-29567-1-git-send-email-ldewangan@nvidia.com> <20130430103046.GD1960@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130430103046.GD1960-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, djbw-b10kYP2dOMg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/30/2013 04:30 AM, Vinod Koul wrote:
> On Wed, Apr 24, 2013 at 03:24:27PM +0530, Laxman Dewangan wrote:
>> Implement suspend/resume callbacks to store APB DMA channel's
>> register on suspend and restore APB DMA channel's register on
>> resume.
...
> You dont seem to handle suspend when DMA is active? Otherwise looks fine.
> Stephen, you okay with this patch?

Yes, I think this looks fine. Sorry for the slow response; I was on
vacation.

One question though: Laxman mentioned that DMA clients were responsible
for suspending their DMA accesses themselves. Does the dmaengine core
define the semantics here; are DMA drivers supposed to handle suspend
with active DMAs, or should DMA clients suspend their DMA accesses
themselves as Laxman suggests? If the latter, I wonder if we actually
need to save/restore all the registers, since after resume, a new DMA
access would be started in all cases, which would then reprogram the HW.
