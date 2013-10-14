From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Mon, 14 Oct 2013 12:16:48 -0600
Message-ID: <525C3510.60802@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-27-git-send-email-treding@nvidia.com> <52587F17.7060104@wwwdotorg.org> <20131014135548.GB16302@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131014135548.GB16302-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/14/2013 07:55 AM, Thierry Reding wrote:
> On Fri, Oct 11, 2013 at 04:43:35PM -0600, Stephen Warren wrote:
>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>> This commit adds support for both DSI outputs found on Tegra. Only very
>>> minimal functionality is implemented, so advanced features like ganged
>>> mode won't work.
>>>
>>> Due to the lack of other test hardware, some sections of the driver are
>>> hardcoded to work with Dalmore.
>>
>>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>>
>>> +static int tegra_dsi_show_regs(struct seq_file *s, void *data)
>>> +{
>>> +	struct drm_info_node *node = s->private;
>>> +	struct tegra_dsi *dsi = node->info_ent->data;
>>> +
>>> +#define DUMP_REG(name)						\
>>> +	seq_printf(s, "%-32s %#05x %08lx\n", #name, name,	\
>>> +		   tegra_dsi_readl(dsi, name))
>>> +
>>> +	DUMP_REG(DSI_INCR_SYNCPT);
>>
>> Does it make sense to use an MMIO regmap instead? That way, you get all
>> the debugfs files for free...
> 
> As far as I know, regmap doesn't give you the symbolic names for the
> registers. I find that a rather useful feature because it allows to
> easily compare the registers to the ones in our downstream kernels.

True. However, we should really be writing user-space scripts to encode
that information. Such a script could be useful e.g. if reading the
information directly from /dev/mem or JTAG too, and bloating the kernel
with debug strings doesn't seem like a great idea.
