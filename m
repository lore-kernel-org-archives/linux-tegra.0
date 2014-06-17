From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: Sync to the latest
 cros_ec_commands.h from EC sources
Date: Tue, 17 Jun 2014 18:43:51 +0200
Message-ID: <1403023431.1984.37.camel@x220>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
		 <1398879850-9111-6-git-send-email-dianders@chromium.org>
		 <20140520084602.GF24991@lee--X1> <1402483068.3798.82.camel@x220>
		 <CAD=FV=XL9tnEqza8Zx8mt_Z7-bj8TCzdeyHMhnpewKp_1CR-ig@mail.gmail.com>
		 <1402646902.28881.15.camel@x220>
		 <CAD=FV=XcK5R1sdNwoJkFPapwWQ9vqxvmQi_L3BqTSt8EKRTNHw@mail.gmail.com>
	 <1402995202.1984.22.camel@x220> <53A06AD4.3000704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A06AD4.3000704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2014-06-17 at 10:20 -0600, Stephen Warren wrote:
> On 06/17/2014 02:53 AM, Paul Bolle wrote:
> > So, in summary, while we're apparently only discussing a single comment,
> > I would appreciate it if it could be reworded, preferably by dropping
> > that the CONFIG_ prefix. But other people might care very little, as
> > they don't share this particular pet peeve.
> 
> Can't your tool maintain a whitelist or ignore list?

Sure it can. But I do think I should try to fix the (in my view, at
least) problems I find before adding stuff to a whitelist or (whatever).

> There are many
> cases where the kernel can pull in headers/data from other projects
> (Firmware interfaces to an arbitrarily large set of HW, Device trees,
> IO/network protocools, perhaps more). It feels quite unreasonable for
> the kernel to decide that it exclusively owns the CONFIG_* namespace
> even in comments, and that every other project it interacts with must
> not use that namespace.

As I said, this is more my peeve. Then again, referring to a macro from
some other project is likely to confuse people.


Paul Bolle
