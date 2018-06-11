From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 5/5] memory: tegra: Introduce Tegra20 EMC driver
Date: Mon, 11 Jun 2018 16:38:52 +0300
Message-ID: <2038303.qe2mJgr7in@dimapc>
References: <20180603223654.23324-1-digetx@gmail.com> <20180611113503.GC31977@ulmo> <20180611114133.GD31977@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611114133.GD31977@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 11 June 2018 14:41:33 MSK Thierry Reding wrote:
> On Mon, Jun 11, 2018 at 01:35:03PM +0200, Thierry Reding wrote:
> > On Wed, Jun 06, 2018 at 04:42:01PM +0300, Dmitry Osipenko wrote:
> > > On 06.06.2018 14:02, Thierry Reding wrote:
> > > > On Mon, Jun 04, 2018 at 01:36:54AM +0300, Dmitry Osipenko wrote:
> [...]
> 
> > > >> +	if (!child_count) {
> > > >> +		dev_err(emc->dev, "no memory timings in DT node\n");
> > > >> +		return -ENOENT;
> > > >> +	}
> > > >> +
> > > >> +	emc->timings = devm_kcalloc(emc->dev, child_count, 
sizeof(*timing),
> > > >> +				    GFP_KERNEL);
> > > >> +	if (!emc->timings)
> > > >> +		return -ENOMEM;
> > > >> +
> > > >> +	emc->num_timings = child_count;
> > > >> +	timing = emc->timings;
> > > >> +
> > > >> +	for_each_child_of_node(node, child) {
> > > >> +		err = load_one_timing_from_dt(emc, timing++, child);
> > > >> +		if (err) {
> > > >> +			of_node_put(child);
> > > >> +			return err;
> > > >> +		}
> > > >> +	}
> > > >> +
> > > >> +	sort(emc->timings, emc->num_timings, sizeof(*timing), 
cmp_timings,
> > > >> +	     NULL);
> > > >> +
> > > >> +	return 0;
> > > >> +}
> > > >> +
> > > >> +static struct device_node *
> > > >> +tegra_emc_find_node_by_ram_code(struct tegra_emc *emc, u32 ram_code)
> > > >> +{
> > > >> +	struct device_node *np;
> > > >> +	int err;
> > > >> +
> > > >> +	for_each_child_of_node(emc->dev->of_node, np) {
> > > >> +		u32 value;
> > > >> +
> > > >> +		err = of_property_read_u32(np, "nvidia,ram-code", &value);
> > > >> +		if (err || value != ram_code)
> > > >> +			continue;
> > > >> +
> > > >> +		return np;
> > > >> +	}
> > > >> +
> > > >> +	dev_info(emc->dev, "no memory timings for RAM code %u found in
> > > >> DT\n",
> > > >> +		 ram_code);
> > > > 
> > > > This seems like it should be dev_warn() or perhaps even dev_err()
> > > > given
> > > > that the result of it is the driver failing to probe. dev_info() may
> > > > go
> > > > unnoticed.
> > > 
> > > Absence of memory timings is a valid case, hence dev_info() suit well
> > > here.
> > > 
> > > I can't see anything wrong with returning a errno if driver has nothing
> > > to do and prefer to keep it because in that case managed resources
> > > would be free'd by the driver core, though returning '0' also would
> > > work.
> > 
> > I disagree. A driver failing to probe will show up as a kernel log entry
> > and is something that people will have to whitelist if they're filtering
> > for error messages in the boot log.
> > 
> > I think it's more user-friendly to just let the driver succeed the probe
> > in an expected case, even if that means there's really nothing to do. If
> > you're really concerned about the managed resources staying around, I
> > think you could probably get rid of them explicitly. By the looks of it
> > devres_release_all() isn't an exported symbol, so it can't be called
> > from driver code, but perhaps that's something that we can change.
> 
> Maybe an easier way to avoid keeping the managed resources around would
> be to move the check a little further up. That way, we can abort earlier
> if no EMC timings are available, before any resources are even
> allocated.
> 
> The tegra_emc_find_node_by_ram_code() function would need to take a
> struct device * instead of struct tegra_emc *, but otherwise it should
> work fine.

Good point, thank you!
