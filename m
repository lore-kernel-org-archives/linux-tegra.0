From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 1/7] of_graph: add of_graph_presents()
Date: Tue, 30 Jun 2020 20:02:04 +0300
Message-ID: <1ef25775-1f37-25ce-f534-54cc995a5658@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-2-digetx@gmail.com> <20200629231211.GA3142766@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629231211.GA3142766@bogus>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.06.2020 02:12, Rob Herring пишет:
> On Thu, Jun 18, 2020 at 01:26:57AM +0300, Dmitry Osipenko wrote:
>> In some case, like a DRM display code for example, it's useful to silently
>> check whether port node exists at all in a device-tree before proceeding
>> with parsing of the graph.
>>
>> This patch adds of_graph_presents() that returns true if given device-tree
>> node contains OF graph port.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
>>  include/linux/of_graph.h |  6 +++++
>>  2 files changed, 49 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>> index 1f2086f4e7ce..b84ed6a7cf50 100644
>> --- a/drivers/of/property.c
>> +++ b/drivers/of/property.c
>> @@ -29,6 +29,48 @@
>>  
>>  #include "of_private.h"
>>  
>> +/**
>> + * of_graph_get_first_local_port() - get first local port node
>> + * @node: pointer to a local endpoint device_node
>> + *
>> + * Return: First local port node associated with local endpoint node linked
>> + *	   to @node. Use of_node_put() on it when done.
>> + */
>> +static struct device_node *
>> +of_graph_get_first_local_port(const struct device_node *node)
>> +{
>> +	struct device_node *ports, *port;
>> +
>> +	ports = of_get_child_by_name(node, "ports");
>> +	if (ports)
>> +		node = ports;
>> +
>> +	port = of_get_child_by_name(node, "port");
>> +	of_node_put(ports);
>> +
>> +	return port;
>> +}
>> +
>> +/**
>> + * of_graph_presents() - check graph's presence
>> + * @node: pointer to a device_node checked for the graph's presence
>> + *
>> + * Return: True if @node has a port or ports sub-node, false otherwise.
>> + */
>> +bool of_graph_presents(const struct device_node *node)
> 
> of_graph_is_present
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 

Thanks!

I'll address the comment and then factor out this and the
drm_of_find_panel_or_bridge() changes into a separate series in v9,
since the Tegra DRM patches could be applied separately by Thierry.
