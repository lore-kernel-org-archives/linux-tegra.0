From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Thu, 16 Apr 2020 21:52:26 +0300
Message-ID: <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200416174112.GS4796-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

16.04.2020 20:41, Laurent Pinchart пишет:
...
>> +	if (output->bridge) {
>> +		err = drm_bridge_attach(&output->encoder, output->bridge,
>> +					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 
> Using DRM_BRIDGE_ATTACH_NO_CONNECTOR is definitely the way to go, but
> please be aware that it will require creating a connector and an encoder
> manually (which I think this driver already does), and using the bridge
> operations to implement the connector operations. I highly recommend
> using the DRM bridge connector helper for this purpose.

Okay, I missed that there is a DRM bridge connector helper. Thank you
very much for the suggestion, I'll switch to the bridge helper in v4.

>> +		if (err) {
>> +			dev_err(output->dev, "cannot connect bridge: %d\n",
>> +				err);
>> +			return err;
>> +		}
>> +	}
>> +
>>  	if (output->panel) {
> 
> May I also recommend switching to the DRM panel bridge helper ? It will
> simplify the code.

Could you please clarify what is the "DRM panel bridge helper"?

I think we won't need any additional helpers after switching to the
bridge connector helper, no?

...
>> +		np = of_graph_get_remote_node(rgb->output.bridge->of_node,
>> +					      panel_port, -1);
> 
> This shouldn't be needed, the LVDS codec bridge driver should already
> get the panel and handle it internally. You only need to handle panels
> in this driver when they're connected directly to the RGB input.

Indeed, it won't be needed if we will use the bridge connector helper.
Thank you very much for the clarifications!
