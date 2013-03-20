From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: add input supply names
Date: Wed, 20 Mar 2013 10:42:26 -0600
Message-ID: <5149E6F2.5070205@wwwdotorg.org>
References: <1363598989-25112-1-git-send-email-ldewangan@nvidia.com> <20130320123128.GM28775@opensource.wolfsonmicro.com> <5149B19E.90400@nvidia.com> <5149DEB5.7000709@wwwdotorg.org> <20130320163833.GT28775@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320163833.GT28775-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 10:38 AM, Mark Brown wrote:
> On Wed, Mar 20, 2013 at 10:07:17AM -0600, Stephen Warren wrote:
>> On 03/20/2013 06:54 AM, Laxman Dewangan wrote:
> 
>>> I generally send a patches on single git-send command git
>>> send-emal --to=ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org 0000.patch 0001.patch
> 
>> Don't do that; send *.patch. If you don't, then patches 2..n
>> don't end up being "in-reply-to" patch 1, so they won't show up
>> as a single email thread.
> 
> The two should be equivalent (though the glob is much easier to
> type)? The result of the globbing ought to be what Laxman is typing
> by hand assuming that he's getting the order correct.

If you send *.patch at once, git send-email adds an in-reply-to header
to the email which sets up the threading. If you send the patches
1-by-1, this header isn't added, since git send-email doesn't have a
clue what message ID it chose for patch 1. Unless you pass the
--in-reply-to command-line option, that is.
