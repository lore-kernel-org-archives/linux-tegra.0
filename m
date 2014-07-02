From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] [cbootimage-configs] Add support for norrin board
Date: Wed, 02 Jul 2014 12:43:15 -0600
Message-ID: <53B452C3.7050009@wwwdotorg.org>
References: <1404160939-10555-1-git-send-email-amartin@nvidia.com> <53B1D5D1.9060606@wwwdotorg.org> <20140702175807.GA30613@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140702175807.GA30613-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 11:58 AM, Allen Martin wrote:
> On Mon, Jun 30, 2014 at 02:25:37PM -0700, Stephen Warren wrote:
>> On 06/30/2014 02:42 PM, Allen Martin wrote:
>>> Norrin (PM370) is an NVIDIA Tegra124 Chromebook reference platform.
>>> It is also called "nyan" in the ChromeOS tree.
>>
>> I thought only some versions/revisions of Nyan were actually Norrin?
>> Isn't nyan-rev0 Venice2, but nyan-rev1 Norrin?
> 
> Yes, although nyan-rev0 is pretty much orphaned at this point in the
> ChromeOS trees, so any place you see "nyan" without the -rev specifier
> you can assume Tegra124 Norrin FFD.

OK, I'll add a note to the commit description when I apply, that "nyan
rev0" is actually Venice2.

>> When we have Norrins with Tegra132 (which I thought was actually the
>> more common version, but perhaps not), what is the plan for naming them;
>> perhaps norrin-t132?
> 
> In the ChromeOS tree Tegra132 Norrin is called "rush", internally
> we've been calling them norrin-t132 (or t132-norrin, , or norrin64, or
> just "norrin" to make it confusing and you figure it out by context :)

OK, let's go with "norrin-t132" for that upstream when it happens, since
I assume we created the board and I have no idea why it got renamed.
