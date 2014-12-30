From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the GPU rail
 clamp
Date: Tue, 30 Dec 2014 17:42:32 +0100
Message-ID: <1419957752.4082.2.camel@lynxeye.de>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
			 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
		 <1419426990.2179.7.camel@lynxeye.de> <549B7638.2010405@nvidia.com>
	 <1419539683.2165.6.camel@lynxeye.de> <54A0C148.6030400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A0C148.6030400-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 29.12.2014, 10:49 +0800 schrieb Vince Hsu:

[...]

> >> That's a read fence to assure the post of the previous writes through
> >> Tegra interconnect. (copy-paster from
> >> https://android.googlesource.com/kernel/tegra.git/+/28b107dcb3aa122de8e94e48af548140d519298f)
> > I see what it does, the question is more about why this is needed.
> > What is the Tegra interconnect? According to the TRM the Tegra contains
> > some standard AXI <-> AHB <-> APB bridges. That a read is needed to
> > assure the write is posted to the APB bus seems to imply that there is
> > some write buffering in one of those bridges. Can we get this documented
> > somewhere?
> The TRM does mention a read after the write. Check the section 32.2.2.3.
> 
Unfortunately this doesn't seem to be included in the public TRM. It
would be nice if this could be documented either in the next version of
the TRM or as a public Appnote.

Thanks,
Lucas
