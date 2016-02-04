From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Tegra 2 NAND Flash Support
Date: Thu, 4 Feb 2016 15:20:19 +0100
Message-ID: <20160204152019.3995f5cc@bbrezillon>
References: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446496402-8142-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Lucas,

Sorry for the late reply, but in my defence, I was not in Cc of the
different iterations of this series.

On Mon,  2 Nov 2015 21:33:17 +0100
Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:

> Hi all,
> 
> New and hopefully last round of the Tegra NAND controller driver.
> I fixed some last bugs that people found during review and testing
> and I think the driver is ready for merging.
> 
> v4 fixes some minor errors in the ECC handling and makes timing
> calculations a bit more conservative.

Some of the comments I made on your v1 were left unanswered (and were
not addressed in your new versions). Can you address them or let me
know why you can't?

For example, I still think your NAND controller should be represented
with its own node in the DT, and all NAND devices as child nodes of the
controller node.
I also think you should create ECC layout dynamically instead of
defining a new one for each new OOB size value.

Also, could you confirm that you driver supports raw accesses (I think
it does, but I'd like to be sure)?

Thanks,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
