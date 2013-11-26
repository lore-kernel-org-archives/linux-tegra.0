From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 16/31] ASoC: tegra: use reset framework
Date: Tue, 26 Nov 2013 11:45:50 -0700
Message-ID: <5294EC5E.3050207@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org> <20131116095529.GF15393@sirena.org.uk> <528A4C8C.3030200@wwwdotorg.org> <20131118183716.GR2674@sirena.org.uk> <5293C787.1030005@wwwdotorg.org> <20131126131410.GK14725@sirena.org.uk> <5294CCDD.30803@wwwdotorg.org> <20131126183739.GR14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131126183739.GR14725-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/26/2013 11:37 AM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 09:31:25AM -0700, Stephen Warren wrote:
> 
>> ... so, I thought you were OK with that one issue. Were there
>> other issues you didn't mention before?
> 
> Probably not but I'd need to reread it, I don't think I got that
> much further than noticing that there weren't any clock changes
> (the fact that the clock dependency was getting added in a DMA
> series set off alarm bells).  To be honest given the number of
> revisions that seem to be required I'd been expecting to see a
> respin of the series, the ASoC generic DMA changes did need a
> respin before they can be merged and I do want to get them into the
> ASoC tree.

OK, I'll repost.

I'm waiting to repost the ASoC core changes until the dmaengine API
change settles. Hopefully very soon.
