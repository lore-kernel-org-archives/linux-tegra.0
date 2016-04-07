From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Thu, 7 Apr 2016 15:02:56 +0530
Message-ID: <57062948.4050504@ti.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
 <5705047E.4050700@ti.com> <20160406172616.GB28843@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160406172616.GB28843-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wednesday 06 April 2016 10:56 PM, Thierry Reding wrote:
> On Wed, Apr 06, 2016 at 06:13:42PM +0530, Kishon Vijay Abraham I wrote:
>> On Friday 04 March 2016 09:49 PM, Thierry Reding wrote:
> [...]
>>> +struct tegra124_xusb_fuse_calibration {
>>> +	u32 hs_curr_level[3];
>>> +	u32 hs_iref_cap;
>>> +	u32 hs_term_range_adj;
>>> +	u32 hs_squelch_level;
>>> +};
>>
>> All these calibration data can come from dt and a generic PHY function to set
>> these data to registers.
> 
> This calibration data is actually read from fuses within the chip. As I
> understand it the process is that these values are characterized during
> chip development and written to the fuses at the fab (or perhaps they
> are characterized even as late as at the fab). There should be no need
> to read these from DT.
> 
>>> +static const char * const tegra124_ulpi_functions[] = {
>>> +	"snps",
>>> +	"xusb",
>>> +};
>>> +
>>> +static const struct tegra_xusb_lane_soc tegra124_ulpi_lanes[] = {
>>> +	TEGRA124_LANE("ulpi-0", 0x004, 12, 0x1, ulpi),
>>> +};
>>> +
>>> +static struct tegra_xusb_lane *
>>> +tegra124_ulpi_lane_probe(struct tegra_xusb_pad *pad, struct device_node *np,
>>> +			 unsigned int index)
>>> +{
>>> +	struct tegra_xusb_ulpi_lane *ulpi;
>>> +	int err;
>>> +
>>> +	ulpi = kzalloc(sizeof(*ulpi), GFP_KERNEL);
>>> +	if (!ulpi)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	INIT_LIST_HEAD(&ulpi->base.list);
>>> +	ulpi->base.soc = &pad->soc->lanes[index];
>>> +	ulpi->base.index = index;
>>> +	ulpi->base.pad = pad;
>>> +	ulpi->base.np = np;
>>> +
>>
>> ulpi PHY's can be found dynamically right? Should this use the ulpi
>> phy library?
> 
> I don't think that would work here. The registered accessed by this code
> are all very Tegra specific as far as I can tell. I doubt that any kind
> of generic library would work here.
> 
> Perhaps you can point me at the exact code you're thinking of. I only
> found drivers/phy/ulpi_phy.h and drivers/usb/common/ulpi.c in a quick
> search, neither of which seem to provide anything that would be useful
> in this context. The former contains a couple of small helpers that I
> don't think are appropriate here, whereas the latter seems to want the
> driver to implement a ULPI interface, something which the Tegra XUSB pad
> controller doesn't expose.

All right then.

FWIW:
Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> 
> Thierry
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
