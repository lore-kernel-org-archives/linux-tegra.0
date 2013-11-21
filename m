From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 11/31] dma: add channel request API that supports
 deferred probe
Date: Thu, 21 Nov 2013 11:13:57 +0200
Message-ID: <1385025237.6723.28.camel@smile>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
	 <1384548866-13141-12-git-send-email-swarren@wwwdotorg.org>
	 <CAPcyv4heN3PFc+n2RDBviA0zvyU4jfi5VLOcQVR6oRPi1woPTA@mail.gmail.com>
	 <1384766276.14845.155.camel@smile> <528A5170.3090809@wwwdotorg.org>
	 <1384862421.14845.222.camel@smile> <528B9CAE.3040600@wwwdotorg.org>
	 <CAPcyv4jR2MufF6PqB3cUwNdQZfzGWVdj1UunBkeyMYm-KvkpCQ@mail.gmail.com>
	 <528BFDD0.3090503@wwwdotorg.org>
	 <CAPcyv4i7o0RP4ovG1S8RbiV9wqV+VZWX+2vBm3iKnVLCYfrnBQ@mail.gmail.com>
	 <528CFE68.6060908@wwwdotorg.org>
	 <CAPcyv4hjJDOq+qEvuCG32PLQcWeHVyeVDCy=5UM8KX445OxY_w@mail.gmail.com>
	 <528D0C06.9080006@wwwdotorg.org>
	 <1384979000.2067.5.camel@dwillia2-mobl1.amr.corp.intel.com>
	 <528D28A1.2050307@wwwdotorg.org>
	 <CAPcyv4jRYu7iTOuiXuj9F-t5dpF3ErVHT4X-PKrkJAYfn91a0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPcyv4jRYu7iTOuiXuj9F-t5dpF3ErVHT4X-PKrkJAYfn91a0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-11-20 at 19:22 -0800, Dan Williams wrote:
> On Wed, Nov 20, 2013 at 1:24 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

[]

> I'm proposing that clients explicitly handle an updated
> dma_request_slave_channel and we skip this interim
> dma_request_slave_channel_no_err step.

Actually this makes more sense.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
