From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/6] of_graph: add of_graph_get_local_port()
Date: Tue, 16 Jun 2020 16:56:41 +0300
Message-ID: <8b7c6395-edd8-cecd-7004-e9f3f22d61f2@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-2-digetx@gmail.com>
 <20200616012111.GE1629@pendragon.ideasonboard.com>
 <20200616012513.GF1629@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616012513.GF1629-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

16.06.2020 04:25, Laurent Pinchart пишет:
> On Tue, Jun 16, 2020 at 04:21:12AM +0300, Laurent Pinchart wrote:
>> Hi Dmitry,
>>
>> Thank you for the patch.
>>
>> On Sun, Jun 14, 2020 at 08:22:29PM +0300, Dmitry Osipenko wrote:
>>> In some case, like a DRM display code for example, it's useful to silently
>>> check whether port node exists at all in a device-tree before proceeding
>>> with parsing the graph.
>>>
>>> This patch adds of_graph_get_local_port() which returns pointer to a local
>>> port node, or NULL if graph isn't specified in a device-tree for a given
>>> device node.
>>>
>>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Reviewed-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/of/property.c    | 32 +++++++++++++++++++++++---------
>>>  include/linux/of_graph.h |  7 +++++++
>>>  2 files changed, 30 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>>> index 1f2086f4e7ce..05c5f619b8bb 100644
>>> --- a/drivers/of/property.c
>>> +++ b/drivers/of/property.c
>>> @@ -608,15 +608,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>>>  	 * parent port node.
>>>  	 */
>>>  	if (!prev) {
>>> -		struct device_node *node;
>>> -
>>> -		node = of_get_child_by_name(parent, "ports");
>>> -		if (node)
>>> -			parent = node;
>>> -
>>> -		port = of_get_child_by_name(parent, "port");
>>> -		of_node_put(node);
>>> -
>>> +		port = of_graph_get_local_port(parent);
>>>  		if (!port) {
>>>  			pr_err("graph: no port node found in %pOF\n", parent);
>>>  			return NULL;
>>> @@ -765,6 +757,28 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
>>>  }
>>>  EXPORT_SYMBOL(of_graph_get_remote_port);
>>>  
>>> +/**
>>> + * of_graph_get_local_port() - get local port node
>>> + * @node: pointer to a local endpoint device_node
>>> + *
>>> + * Return: First local port node associated with local endpoint node linked
>>> + *	   to @node. Use of_node_put() on it when done.
>>> + */
>>> +struct device_node *of_graph_get_local_port(const struct device_node *node)
> 
> I forgot to mention that, given that there could be multiple 'port'
> nodes, this function would be better named
> of_graph_get_first_local_port(). 'first' here would refer to the nodes
> order in the device tree, which I believe may not match the port number.
> For instance, in the following case
> 
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		port@1 {
> 			reg = <1>;
> 		};
> 		port@0 {
> 			reg = <0>;
> 		};
> 	};
> 
> the function would I believe return port@1. It may be a good idea to
> explain this in the documentation.

Hello Laurent,

It's correct that the port@1 will be returned in yours example.

I'll improve the doc and the function's name in the next revision, thank
you for the suggestions!

> Depending on how you use this
> function, if your only use case is to test for the presence of port
> nodes, it may be best to return a bool and name it of_graph_has_port()
> or something similar.
> 
>>> +{
>>> +	struct device_node *ports, *port;
>>> +
>>> +	ports = of_get_child_by_name(node, "ports");
>>> +	if (ports)
>>> +		node = ports;
>>> +
>>> +	port = of_get_child_by_name(node, "port");
>>> +	of_node_put(ports);
>>> +
>>> +	return port;
>>
>> The implementation doesn't seem to match the documentation. If node is a
>> pointer to an endpoint, it should not have any ports child.

Right, I'll reword the doc in v8. This function doesn't differentiate
between start / end points. It's up to a user of this function to check
whether node is endpoint or something else if needed.

Thank you very much for the comments!
