From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V7 5/7] cpufreq: Register notifiers with the PM QoS
 framework
Date: Wed, 16 Oct 2019 13:57:42 +0530
Message-ID: <20191016082742.nttzuofes6uds4pu@vireshk-i7>
References: <5ad2624194baa2f53acc1f1e627eb7684c577a19.1562210705.git.viresh.kumar@linaro.org>
 <2c7a751a58adb4ce6f345dab9714b924504009b6.1562583394.git.viresh.kumar@linaro.org>
 <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
 <20191015114637.pcdbs2ctxl4xoxdo@vireshk-i7>
 <CAJZ5v0g3kRfa2WXy=xz3Mj15Pwb5tm1xg=uPODoifnv70O1ORA@mail.gmail.com>
 <CAJZ5v0hxsy3ZKFvtWULHAVog4=3rYQfd3-61A9dNaKeUbiDtrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hxsy3ZKFvtWULHAVog4=3rYQfd3-61A9dNaKeUbiDtrg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Rafael Wysocki <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 15-10-19, 23:50, Rafael J. Wysocki wrote:
> On Tue, Oct 15, 2019 at 5:53 PM Rafael J. Wysocki <rafael@kernel.org> wrote:

> > > - Update QoS framework with the knowledge of related CPUs, this has been pending
> > >   until now from my side. And this is the thing we really need to do. Eventually
> > >   we shall have only a single notifier list for all CPUs of a policy, at least
> > >   for MIN/MAX frequencies.
> >
> > - Move the PM QoS requests and notifiers to the new policy CPU on all
> > changes of that.  That is, when cpufreq_offline() nominates the new
> > "leader", all of the QoS stuff for the policy needs to go to this one.
> 
> Alas, that still will not work, because things like
> acpi_processor_ppc_init() only work accidentally for one-CPU policies.

I am not sure what problem you see here ? Can you please explain a bit more.

> Generally, adding such a PM QoS request to a non-policy CPU simply has
> no effect until it becomes a policy CPU which may be never.

I was thinking maybe we can read the constraints for all CPUs in the
policy->cpus mask in cpufreq_set_policy() and so this part of the problem will
just go away. The only part that would be left is to remove the QoS constraints
properly.

> It looks like using device PM QoS for cpufreq is a mistake in general
> and what is needed is a struct pm_qos_constraints member in struct
> cpufreq_policy and something like
> 
> struct freq_pm_qos_request {
>         enum freq_pm_qos_req_type type; /* min or max */
>         struct plist_node pnode;
>         struct cpufreq_policy *policy;
> };
> 
> Then, pm_qos_update_target() can be used for adding, updating and
> removing requests.

-- 
viresh
