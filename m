From: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Mon, 9 Mar 2015 15:39:55 +0000 (UTC)
Message-ID: <loom.20150309T163859-768@post.gmane.org>
References: <1425672435-19031-1-git-send-email-daniels@collabora.com>	<54FA0EBB.3080208@wwwdotorg.org> <CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew@mail.gmail.com> <54FA1231.9000709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Stephen Warren <swarren@...> writes:
> On 03/06/2015 01:42 PM, Simon Glass wrote:
> > On 6 March 2015 at 13:31, Stephen Warren <swarren@...> wrote:
> >> Can you comment on this change? If the data currently in
> >> tegra-pinmux-scripts is wrong, where did it come from if not the 
ChromeOS
> >> kernel?
> >
> > Sorry, I have no direct knowledge.
> 
> Oh, I see the answer in the patch description:

Thanks for looking at this.

> > commit 4a5373e4bd6477addd3764e25989f74d34eba8c6
> > Author: Simon Glass <sjg@...>
> > Date:   Tue Feb 3 11:29:03 2015 +0100
> >
> >     Add support for Nyan-big
> >
> >     Add support for Tegra124 Nyan-big. Pinmux is based on norrin with a 
single
> >     change for the reset GPIO.
> 
> The need for Daniel's patch seems like a good reason not to base one 
> board's pinmux on another board, assuming they're identical...

Indeed.

> Daniel, have you confirmed that 100% of the data in your patch matches 
> that used by the ChromeOS kernel, such that there shouldn't be any more 
> fixes needed down the line?

Actually, no, I hadn't. The diff is annoying to produce, as the format 
used in chromeos-3.10 is totally different (different pin naming 
scheme, aggregation of one entry to multiple nvidia,pins entries), but 
I managed to get a full diff with a blindingly horrible bit of Perl[0] 
(take chromeos-3.10 entries, map names -> numbers, map back from 
numbers to current upstream names, produce DT fragment), and then 
manually reconcile that back to tegra-pinmux-scripts to remove the 
delta.

There is only a small delta remaining between the two after manually 
harmonising these. First, the nvidia,lock property was set downstream 
but t-p-s doesn't seem to have any facility for handling this - is that 
a problem? Secondly, chromeos-3.10 used TEGRA_PIN_PULL_DOWN for rcv-sel 
being enabled, which just happened to map to 1 (ENABLED). And lastly, 
there are a number of entries in nyan-big.config which aren't present 
in the downstream config. If these entries are unneeded (presumably 
unused ... ?), should they be removed?

These patches are sitting in 
git://git.collabora.com/git/user/daniels/tegra-pinmux-scripts - I'll 
post them after myself & Tomeu have done some more testing on them, as 
there are a rather worrying amount of changes. I can do the same to 
Blaze as well, but that'll have to wait a couple of days as I don't 
actually have one on my desk.

Cheers,
Daniel

[0]: It really is horrible, and is only intended to be throwaway. 
http://people.collabora.com/~daniels/tmp/reconcile-downstream-dt.pl
