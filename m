From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/12] dma: various minor clean ups for slave drivers
Date: Mon, 15 Jul 2013 15:03:43 +0530
Message-ID: <20130715093343.GN16653@intel.com>
References: <1369656882-25241-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20130530174727.GE3767@intel.com>
 <CAA9_cmdNiLfJjv-8Mh-Xb1ifZb4aw_9NGCVW6aWsfq6BN-DYyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAA9_cmdNiLfJjv-8Mh-Xb1ifZb4aw_9NGCVW6aWsfq6BN-DYyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
Cc: Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhang Wei <zw-cP1dWloDopncfH5dbZw2EIK/uTPJOYU7MrMQPFiV5cM@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 31, 2013 at 05:09:51PM -0700, Dan Williams wrote:
> On Thu, May 30, 2013 at 10:47 AM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, May 27, 2013 at 03:14:30PM +0300, Andy Shevchenko wrote:
> >> Here is a set of small independent patches that clean up or fix minor things
> >> across DMA slave drivers.
> > The series looks fine. I am going to wait a day more and apply, pls speak up if
> > you disagree and ack if you agree
> 
> Looks ok to me.  Reminds we can probably take this one step further
> and provide a generic implementation for the common case.  It's just a
> bit inconsistent though that some engines will poll the completion
> handler (try to advance the state of the last completed cookie)
> whereas others just assume things will be completed asynchronously.
agree with that. These are the inconsistencies some of which are based on
hardware and some are user iterpretations...

--
~Vinod
