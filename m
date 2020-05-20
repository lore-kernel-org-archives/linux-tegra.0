From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Date: Wed, 20 May 2020 10:21:25 -0600
Message-ID: <CAL_JsqJOPzD_3+bygrMB+JSkDOZo=m0R28LDXSOU_Z=quTNeRw@mail.gmail.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo> <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
 <20191204091703.d32to5omdm3eynon@vireshk-i7> <20191204093339.GA2784830@ulmo>
 <20191204095138.rrul5vxnkprfwmku@vireshk-i7> <20200407100520.GA1720957@ulmo>
 <CAL_Jsq+rMYAZ=ub0U7qdHSsWgbQugodhvigFCxrFm49HwrCmAQ@mail.gmail.com> <20200520153854.GA2154237@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200520153854.GA2154237@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:THERMAL" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 9:39 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, May 20, 2020 at 08:43:03AM -0600, Rob Herring wrote:
> > On Tue, Apr 7, 2020 at 4:05 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > On Wed, Dec 04, 2019 at 03:21:38PM +0530, Viresh Kumar wrote:
> > > > On 04-12-19, 10:33, Thierry Reding wrote:
> > > > > Yeah, the code that registers this device is in drivers/base/cpu.c in
> > > > > register_cpu(). It even retrieves the device tree node for the CPU from
> > > > > device tree and stores it in cpu->dev.of_node, so we should be able to
> > > > > just pass &cpu->dev to tegra_bpmp_get() in order to retrieve a reference
> > > > > to the BPMP.
> > > > >
> > > > > That said, I'm wondering if perhaps we could just add a compatible
> > > > > string to the /cpus node for cases like this where we don't have an
> > > > > actual device representing the CPU complex. There are a number of CPU
> > > > > frequency drivers that register dummy devices just so that they have
> > > > > something to bind a driver to.
> > > > >
> > > > > If we allow the /cpus node to represent the CPU complex (if no other
> > > > > "device" does that yet), we can add a compatible string and have the
> > > > > cpufreq driver match on that.
> > > > >
> > > > > Of course this would be slightly difficult to retrofit into existing
> > > > > drivers because they'd need to remain backwards compatible with existing
> > > > > device trees. But it would allow future drivers to do this a little more
> > > > > elegantly. For some SoCs this may not matter, but especially once you
> > > > > start depending on additional resources this would come in handy.
> > > > >
> > > > > Adding Rob and the device tree mailing list for feedback on this idea.
> > > >
> > > > Took some time to find this thread, but something around this was
> > > > suggested by Rafael earlier.
> > > >
> > > > https://lore.kernel.org/lkml/8139001.Q4eV8YG1Il-sKB8Sp2ER+y1GS7QM15AGw@public.gmane.org/
> > >
> > > I gave this a try and came up with the following:
> > >
> > > --- >8 ---
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > index f4ede86e32b4..e4462f95f0b3 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > @@ -1764,6 +1764,9 @@ bpmp_thermal: thermal {
> > >         };
> > >
> > >         cpus {
> > > +               compatible = "nvidia,tegra194-ccplex";
> > > +               nvidia,bpmp = <&bpmp>;
> >
> > Is there more than 1 bpmp? If not you don't need this. Just lookup the
> > node by compatible.
>
> There no SoCs currently than need to differentiate between multiple
> BPMPs, so yes, it would be possible to look up the node by compatible.
> But we also used to assume that PCs would only ever come with a single
> GPU or audio card and that's always caused a lot of work to clean up
> when it turned out to no longer be true.

Job security. ;)

> Also, we already have a couple of devices referencing the BPMP by
> phandle like this, so having this in a CCPLEX node would keep things
> consistent.
>
> One of the reasons why we initially did it this way was also so that we
> could make the dependencies explicit within device tree. If we look up
> by compatible string, then the driver is the only one with the knowledge
> about where to get at it. If we have the explicit reference we at least
> have a chance of determining the dependency by just looking at the
> device tree.

This case probably makes sense, but then driver dependencies can
evolve and you'd be updating the DT for every dependency. There's just
this general mindset that a driver can't look at the DT outside of its
own node.

> > >                 #address-cells = <1>;
> > >                 #size-cells = <0>;
> > >
> > > --- >8 ---
> > >
> > > Now I can do something rougly like this, although I have a more complete
> > > patch locally that also gets rid of all the global variables because we
> > > now actually have a struct platform_device that we can anchor everything
> > > at:
> > >
> > > --- >8 ---
> > > static const struct of_device_id tegra194_cpufreq_of_match[] = {
> > >         { .compatible = "nvidia,tegra194-ccplex", },
> > >         { /* sentinel */ }
> > > };
> > > MODULE_DEVICE_TABLE(of, tegra194_cpufreq_of_match);
> > >
> > > static struct platform_driver tegra194_ccplex_driver = {
> > >         .driver = {
> > >                 .name = "tegra194-cpufreq",
> > >                 .of_match_table = tegra194_cpufreq_of_match,
> > >         },
> > >         .probe = tegra194_cpufreq_probe,
> > >         .remove = tegra194_cpufreq_remove,
> > > };
> > > module_platform_driver(tegra194_ccplex_driver);
> > > --- >8 ---
> > >
> > > I don't think that's exactly what Rafael (Cc'ed) had in mind, since the
> > > above thread seems to have mostly talked about binding a driver to each
> > > individual CPU.
> > >
> > > But this seems a lot better than having to instantiate a device from
> > > scratch just so that a driver can bind to it and it allows additional
> > > properties to be associated with the CCPLEX device.
> >
> > What additional properties? A continual stream of properties added 1
> > by 1 would negatively affect my opinion of this.
>
> I don't expect there would be many. I think there's an earlier
> generation of Tegra that requires a regulator and I can imagine that's
> pretty common. But other than that I would expect this to be a fairly
> narrow set of properties.
>
> > > Rob, any thoughts on this from a device tree point of view? The /cpus
> > > bindings don't mention the compatible property, but there doesn't seem
> > > to be anything in the bindings that would prohibit its use.
> >
> > What happens when you have more than one cpu related driver in
> > addition to cpufreq? You may still have to end up creating child
> > platform devices and then gained very little.
>
> That's only if you absolutely want to stick with the "one driver per
> subsystem" model. I personally think that's completely obsolete these
> days. If you have a CPU complex device that can do both CPU frequency
> scaling and put the CPU into idle states, for example, then there is
> really no reason to artificially split that into two separate drivers
> just to match the subsystems that we have.
>
> Most subsystems that I've come across work just fine if a single driver
> registers with multiple subsystems.

Yes exactly. If only everyone thought this way...

> I also know that some people like it better when things are nicely split
> up into multiple drivers. But I really don't see how that simplifies
> things. In fact in my opinion that makes things only more complicated
> because you have additional boilerplate and then you need to be extra
> careful about how these different drivers are ordered, and you need to
> take extra precautions when sharing things like clocks and register
> regions.

I just cleaned up this exact mess with VExpress drivers...

It's just a constant issue to deal with.

> > You could solve this without DT changes. You can bind on node names.
> > The driver probe can then check the parent compatible and return if
> > not matching. I'm not sure if you could get module auto loading to
> > work in that case. It would have to be based on the root compatible
> > (rather than the driver match table) and be able to load multiple
> > matching modules.
>
> That sounds like it would get very complicated for something this
> simple. Having a compatible string in /cpus seemed like the most logical
> option because it would basically just work out of the box and the same
> way we're used to from other devices.

That's also why I get the node per driver...


That said, I'm fine with adding the compatible. I hope I don't regret it.

Rob
