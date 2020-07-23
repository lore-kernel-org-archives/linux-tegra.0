From: Sami Tolvanen <samitolvanen-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
Date: Thu, 23 Jul 2020 12:07:24 -0700
Message-ID: <20200723190724.GA1339461@google.com>
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22>
 <1595233294.8055.0.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1595233294.8055.0.camel@mtkswgap22>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ACPI Devel Maling List <linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wsd_upstream <wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 20, 2020 at 04:21:34PM +0800, Neal Liu wrote:
> Gentle ping on this patch.
> 
> 
> On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> > On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > >
> > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > changes to the original control flow graph of a compiled binary,
> > > > making it significantly harder to perform such attacks.
> > > >
> > > > init_state_node() assign same function callback to different
> > > > function pointer declarations.
> > > >
> > > > static int init_state_node(struct cpuidle_state *idle_state,
> > > >                            const struct of_device_id *matches,
> > > >                            struct device_node *state_node) { ...
> > > >         idle_state->enter = match_id->data; ...
> > > >         idle_state->enter_s2idle = match_id->data; }
> > > >
> > > > Function declarations:
> > > >
> > > > struct cpuidle_state { ...
> > > >         int (*enter) (struct cpuidle_device *dev,
> > > >                       struct cpuidle_driver *drv,
> > > >                       int index);
> > > >
> > > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > > >                               struct cpuidle_driver *drv,
> > > >                               int index); };
> > > >
> > > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > > failed since they use same callee.
> > > 
> > > Can you please explain this in a bit more detail?
> > > 
> > > As it stands, I don't understand the problem statement enough to apply
> > > the patch.
> > > 
> > 
> > Okay, Let's me try to explain more details.
> > Control Flow Integrity(CFI) is a security mechanism that disallows
> > changes to the original control flow graph of a compiled binary, making
> > it significantly harder to perform such attacks.
> > 
> > There are multiple control flow instructions that could be manipulated
> > by the attacker and subvert control flow. The target instructions that
> > use data to determine the actual destination.
> > - indirect jump
> > - indirect call
> > - return
> > 
> > In this case, function prototype between caller and callee are mismatch.
> > Caller: (type A)funcA
> > Callee: (type A)funcB
> > Callee: (type C)funcC
> > 
> > funcA calls funcB -> no problem
> > funcA calls funcC -> CFI check failed
> > 
> > That's why we try to align function prototype.
> > Please feel free to feedback if you have any questions.

I think you should include a better explanation in the commit message.
Perhaps something like this?

  init_state_node assigns the same callback function to both enter and
  enter_s2idle despite mismatching function types, which trips indirect
  call checking with Control-Flow Integrity (CFI).

> > > > Align function prototype of enter() since it needs return value for
> > > > some use cases. The return value of enter_s2idle() is no
> > > > need currently.
> > > 
> > > So last time I requested you to document why ->enter_s2idle needs to
> > > return an int in the code, which has not been done.  Please do that.

Rafael, are you happy with the commit message documenting the reason,
or would you prefer to also add a comment before enter_s2idle?

Sami
